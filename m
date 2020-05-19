Return-Path: <SRS0=UEMD=7B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2E9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 May 2020 09:22:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0077E207C4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 May 2020 09:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0077E207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3411919;
	Tue, 19 May 2020 09:08:23 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a3c3b91a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 May 2020 09:08:21 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 4E5D04065F;
 Tue, 19 May 2020 09:22:40 +0000 (UTC)
Date: Tue, 19 May 2020 14:22:40 +0500
From: Roman Mamedov <rm@romanrm.net>
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard, allowed-ips, ipv6 and multicast
Message-ID: <20200519142240.5be610be@natsu>
In-Reply-To: <CADdae-gBznYaqgYwv9JPeGhMm86s4EZLABc-hKkTdMgUVpL-gA@mail.gmail.com>
References: <CADdae-gBznYaqgYwv9JPeGhMm86s4EZLABc-hKkTdMgUVpL-gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 19 May 2020 11:09:24 +0200
nicolas prochazka <prochazka.nicolas@gmail.com> wrote:

> Hello,
> I'm trying to use vxlan encapsulated into Wireguard tunnel, with a
> multicast group for announcement.
> Ex :
> ip -6 link add vxlan100 type vxlan id 100 dstport 4789  local
> `wg0Ip6_lock`  group ff05::100 dev wg0 ttl 5
> 
> All works very well when i set wg tunnel with ::/0  as allowed-ips,
> but if i'm trying to be more restrictive, as ff05::/32  for example,
> it does not work.
> Is a specific interaction between allowed-ips and multicast group in ipv6 ?

AFAIK multicast or broadcast do not work over WG at all. There's no special
handling for it, and no mechanism to duplicate the same packet and send it out
to several peers at once.

For VXLAN you have to rely on adding each peer's MAC and its underlying IP
explicitly via "bridge fdb append". To make it simpler you could use MACs and
IP(v6)s generated from peers' public keys, so there will be no need for any
centralized system of tracking and management for those. Or as I do, just
generate them from hashes of peers' human readable names.

-- 
With respect,
Roman
