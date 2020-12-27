Return-Path: <SRS0=8kJZ=F7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D777CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Dec 2020 21:43:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1D420882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Dec 2020 21:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF1D420882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a786f7e6;
	Sun, 27 Dec 2020 21:33:09 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net [2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b3cb131
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Dec 2020 21:33:08 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1ktddt-0007Ja-EO; Sun, 27 Dec 2020 21:31:57 +0000
Date: Sun, 27 Dec 2020 21:31:57 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: wireguard@meta-cti.com.br
Cc: wireguard@lists.zx2c4.com
Subject: Re: Issues using multiple interfaces between two servers
Message-ID: <20201227213157.GA27650@matrix-dream.net>
References: <59a75f976f451cf4709fde65d1e308c4.squirrel@www.meta-cti.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59a75f976f451cf4709fde65d1e308c4.squirrel@www.meta-cti.com.br>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello,

I can't say for sure, but I would guess your issue is the result
of transient network states/outages coupled with wireguard
automatic roaming and wildcard listening.

Wireguard listens on all addresses and performs automatic roaming,
neither of which can be disabled without external help (e.g. firewall).
If a valid packet happens to reach the other address it will
(probably) take over.

If you wish to prevent tunnel flapping and don't care about anything
else, it should be sufficient to set an INPUT firewall rule on
both sides, permitting communication
A1 <-> B1
A2 <-> B2
while dropping cross-communication (mis-paired IPs).

To be clear, the remote enpoint setting is treated as bootstrapping hint.
If you want to use wireguard and set a fixed remote enpoint (ip+port),
you can do so with a 1:1 tunnel, if you e.g. sacrifice a port number
and set a strict firewall. With 1:N tunnels, the only option I can
see is limiting to a set of endpoints, or a code changes in wireguard
sources.

Regards,
Ivan


On Tue, Dec 22, 2020 at 12:57:35PM -0300, wireguard@meta-cti.com.br wrote:
> Hello guys, I'm having problems with my wireguard setup and I don't know
> how to solve it. I have two computers running linux in remote locations.
> One, which I will call computer A, is in a data center where we advertise
> a block of IPs using BGP. The other computer is in a different location
> and has two links connecting to the internet and with different providers.
> I configured on computer A two wireguard tunnels with different keys and
> ports. On computer B I did the same and added two routing tables, one for
> each WAN interface and using the ip rule I created rules with destination
> on two different IPs of computer A so that they leave through different
> links.
> 
> As soon as I start the wireguard interfaces of both computers everything
> works normally and I can ping both addresses from both tunnels. Then I use
> the bird with OSPF and ECMP to take a subnet from the block that is
> advertised on computer A to computer B. Everything works normally.
> 
> When I execute the wg command on computers A and B, I can see both IPs of
> computer B's WAN interfaces in the tunnel's "peer" fields, one from each
> remote WAN.
> 
> After some time working, it can vary from minutes to a few hours, suddenly
> I see that both tunnels started to work on a single WAN interface of
> computers A and B. If at this moment I execute the wg command on computer
> A, I see that now the "peers" have the same address as only one of the WAN
> interfaces of computers A and B, even with the routing rule forcing
> packets to go out through different interfaces. Has anyone experienced a
> similar problem and knows how it can be solved?
> 
> When I run the traceroute command on both computers A and B with the
> destination address in the remote computer's WAN IPs, they actually come
> out through the correct interface.
