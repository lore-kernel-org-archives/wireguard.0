Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D123FC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BB32080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="nyIfqkuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BB32080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 126a0d7a;
	Sun, 25 Aug 2019 15:41:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d38647d6
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Aug 2019 13:50:44 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85a2582c
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Aug 2019 13:50:44 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 551601FD75
 for <wireguard@lists.zx2c4.com>; Sat, 17 Aug 2019 15:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1566049843; bh=xuSH2KpiBYE9JT8mV7PLsYJwgl7rfZb87wjfzcs4bmA=;
 h=From:To:Subject:Date:From;
 b=nyIfqkuceZV6Xh7PR1inKmbHZ9b9rin+RXhC0oCkUs13mMbjM7iCVcnRvxoI1qRiJ
 mfe8ge4xDEidRtIH4kw/RSORTnNWgCU+hXBinj7qA6s0N2wt7NcgYmsKcKMBcuYVcd
 5yaYRSo6FJmjEsWHgd+5qiGDHo8SzsZZqKf9atiI=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id 433FC1A01027; Sat, 17 Aug 2019 15:50:43 +0200 (CEST)
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Support of multiple endpoints to support IPv6/IPv4 protocol change
Date: Sat, 17 Aug 2019 15:50:43 +0200
Message-ID: <87h86fq4ss.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:41:26 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Hello,

TL;DR
How difficult is it to add support for multiple endpoints in wireguard?

My problem is that sometimes we need to connect to the VPN server
via IPv4, sometimes via IPv6 and the other protocol won't work anymore.


Long story:
We are a cloud provider offering free IPv6 VPNs with VMs, to enable
customers to have IPv6 anywhere. In some situations customers are
confused, because their network doesn't work anymore while wireguard is
active or the tunnel doesn't work in some networks. I will describe some
situations that we experienced and how we work around it at the moment.


Story 1: using VPN in VPN
Some of our customers have an IPv6 tunnel to provide a /48 to their
network. They usually use a couple of /64s to separate their internal
networks. Some of these customers also have a VPN to their end device
(like a notebook) with another /48 routed to it. In this situation, they
are unable to reach the VPN server or local clients if they don't
explicitly change their configuration to reach the VPN server via IPv4
instead of IPv6:

With a standard config, the DNS name of the tunnel endpoint in
in wg0.conf, not fixed to IPv4/IPv6, we had the following report:

In this case if the notebook connects via IPv6 to the VPN server,
it effectively connects to the VPN server through the VPN. We had
reports that in this situation the notebook can either not establish the
VPN tunnel or is unable to reach local devices

Workaround from some customers: hard code the IPv4 address as an endpoint

Story 2: Change from IPv4 only to IPv6 only networks

We have reports from clients that the VPN is not established again, if
they switch from an IPv4 only network to an IPv6 only network and vice
versa. I assume this is due to wireguard resolving the address at
startup and never re-resolving and/or not storing all DNS results (A and
AAAA answers).

Workaround from some customers: restart wireguard when changing
underlying protocol network


Story 3: Combination of above
Some of our clients hard coded the IPv4 address of the tunnel endpoint
in their wg0.conf to avoid the problem from story 1. However this breaks
their Internet when switching to IPv6 only networks. In this case the
endpoint is fixed to IPv4, but they don't have any IPv4 connectivity.

Workaround from some customers: reconfigure wireguard to use hardcoded
IPv6 or IPv4 only endpoint.


--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
