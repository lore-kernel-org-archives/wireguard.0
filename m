Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0E8C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Jan 2019 08:13:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9099920663
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Jan 2019 08:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="actl2jiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9099920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08cc795d;
	Mon, 14 Jan 2019 08:09:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7f74690
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Jan 2019 05:47:31 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 571f690f
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Jan 2019 05:47:30 +0000 (UTC)
Received: from cotinga.riseup.net (cotinga-pn.riseup.net [10.0.1.164])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id 5B7CD1A03ED;
 Sun, 13 Jan 2019 21:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1547445082; bh=HlH8vmPt4rc/IqwL45ctbzBBvPz5dbYCs4haOM0vssI=;
 h=To:From:Subject:Date:From;
 b=actl2jiq2ne8+PeBssBm9xOr8MRxoy2rFqHuvo8Qs7yBJduDmNXtWz7KG5zh/RFam
 XYKPZcQSurW9G6DMnO/RDM4IMzl/yYX1W8l44ecjAVnsJ0IjSZ5AWzb4xZOwZWl/Oj
 WMx7HpIXKJPp84XsYbfmLwd7MbycD0rT2VbiZZLU=
X-Riseup-User-ID: 4E53502AD9A1776907831034DE11AEB9B59301B270838D992CB7827AA23C2DFF
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by cotinga.riseup.net with ESMTPSA id 8EF544380E;
 Sun, 13 Jan 2019 21:51:21 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: dllud <dllud@riseup.net>
Subject: Support ip6tables-like network masks for allowed-ips besides CIDR
Openpgp: preference=signencrypt
Autocrypt: addr=dllud@riseup.net; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ce1ca341-e913-ed02-5909-1699d0efdc30@riseup.net>
Date: Mon, 14 Jan 2019 05:51:20 +0000
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Jan 2019 09:09:56 +0100
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

Hi everyone,

Would it be possible for wireguard to support ip6tables-like network
masks [1] for the allowed-ips besides CIDR masks?
With CIDR we are limited to variable suffixes. While with network masks
we could have variable prefixes, suffixes or any combination.

[1] https://linux.die.net/man/8/ip6tables

-------------------------------

Use case (why does it matter to me): I have a client-server setup where
I would like to allow the client peers to choose any IPv6 they wish as
long as they honor a given suffix. Collision are avoided by having an
unique suffix for each client. With CIDR I can only make clients honor a
prefix.

The long story
On my home network I reserved two IPv6 subnets for Wireguard clients:
- a private one, eg. fdaa:aaaa:aaaa:aabb::/64 (never changes);
- a public one, eg. 2001:aaaa:aaaa:aabb::/64 which is a subnet of the
subnet attributed by my ISP (the positions marked with aa's change
regularly according to the dynamic assigning done by my ISP).

Attributing public IPv6 addresses to the wireguard clients allows them
to reach the Internet through the tunnel with no need for NAT.

Currently, there seems to be no way of dynamically attributing IPs to
clients. (Or is there some kind of DHCPv6 over Wireguard?) Thus, to keep
my Cryptokey Routing Table working properly I have to update it on both
server and clients whenever my ISP attributes me a different subnet
(power outages, router restarts, etc.).
This is easy on the clients, which connect and disconnect regularly. I
just need a small script to connect to the wireguard server, that gets
the current public subnet (from Dynamic DNS) before setting the public
IPv6 for tunnel interface.
Things are nastier on the server side though, which is an OpenWrt
router. I would need a cron/procd job hammering OpenWrt config files
whenever a change is detected.
Network masks would be a much cleaner solution on this setup and
probably many others.

Note: I trust all my client peers (which are just me, on other computers
outside my home network).

-------------------------------

Thanks for building wireguard and specially for publishing it as
open-source. You have a great piece of software here. Much appreciated.

Regards!

--
dllud
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
