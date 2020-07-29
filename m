Return-Path: <SRS0=PVz2=BK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE7AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740AA206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 740AA206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 945bc6fc;
	Fri, 31 Jul 2020 13:51:29 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net [2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93dadd3f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 22:06:17 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1k0uOs-0000Dq-Vu; Wed, 29 Jul 2020 22:18:14 +0000
Date: Wed, 29 Jul 2020 22:18:14 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Rich Brown <richb.hanover@gmail.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 Gunnar Niels <gunnar.s.niels@gmail.com>, wireguard@lists.zx2c4.com
Subject: Re: Confused about AllowedIPs meaning?
Message-ID: <20200729221814.GA32170@matrix-dream.net>
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
 <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
 <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 31 Jul 2020 15:51:20 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Jul 28, 2020 at 05:33:43PM -0400, Rich Brown wrote:
> AllowedIPs is the set of addresses that your WireGuard peer will send across the tunnel to its peer. 

The definition is close, but not precise. Assuming things haven't
changed much:

  AllowedIPs specifies the set of addresses that your WireGuard
host will send across the tunnel to its peer, and accept from
the peer.

AllowedIPs is not a set of addresses, but of networks, wherein
the peer with most specific match wins - as in a routing table.
Also, beware negations might not do what you expect.


Routing should work like so:

When a linux system is sending a packet, it first consults
the system routing table to choose the appropriate device.
Then, if the outgoing device is a wireguard tunnel, it
consults the routing table of the WG device to choose a peer.
WG device's routing table is constructed from peers' AllowedIPs.
When a peer is selected, the packet is encapsulated and sent
to the peer's latest enpoint. Then the system routing table
is again consulted, and hopefully a different outgoing device
is selected.

Note that the routing table is in fact a tree where the most
specific match wins - both the system one and wireguard's.
Also note that overlapping networks are allowed (e.g. 0.0.0.0/0,
and 10.0.0.0/8), but identical networks in a single WG device
are not allowed as neither would be more specific. The system
routing table would throw an error on such attempts, but wireguard
silently discards the old route keeping only the last one,
so you need to be careful here.


Such is basic routing. In more complicated scenarios:
 - routing rules select the routing table
 - iptables/nftables can change addresses, select devices, even clone packets
 - namespaces can nearly create an isolated network host/partition
and you can also have xfrm encapsulation, maybe vdevs do something..
All of this is either before the packet enters wireguard device
(where wireguard routing is done), and/or after the packet is
encapsulated/decapsulated (encrypted/decrypted) and processed again.


When a packet is received, the system may also check the routing
table for the source/peer address, and if the source device
doesn't match the routing table entry, the packet would be discarded
- so called reverse path filtering.
Initial lookup of the encapsulated packet source in the system
routing table is governed by the rp_filter setting.
When a packet is processed by wireguard, the inner, decapsulated
source is unconditionally checked for in the device routing table
and packet discarded if peer doesn't match - i.e. the peer's allowed
IPs must match, and also be the single most specific match.
After wireguard decapsulation, the inner packet is again processes
by the system, possibly checking the ips.


Regards,
Ivan
