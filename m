Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AB3C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 00:14:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ACF420874
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 00:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="j2vU09LR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ACF420874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8006d609;
	Tue, 18 Dec 2018 00:14:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc2c47a7
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 00:14:16 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d031e03d
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 00:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=9NbQTClx1nkDqq2W7jZ1zWATaZDpUkjzdm1vIsPoO58=; b=j2vU09LReSwCFUVoN32VpNQWI9
 H4yUjuU3kEEAF6URajxuSB3GDzyNTVcL7XbUHUiZbGzExBGnw4GgN4aSmnU1NPwPxvhii3GpWm9rQ
 IPKBApfavKtaHb8NQ8JhPSHdwLkKe56Sk7wn3uqIhRdD8mMkrg8D4hNgwKbRDau3s1WIWcNheKHup
 F1gBkQLfYm+LFJbx2cXezDUWP94fhN7DBB7GPIFSD9MFcytYeuIdeRlQJjBuVumm0aaqO9F5FVvTt
 3jDr7GJWXA3ntsJNxrWI8629y1ioWcDyGhWWs+R9ZBCU9s45XNojoV6Pkj9gRcQW2JBwtn+feMZpe
 oceIEbu/ZYkUp4Vs8zn/rL5+TLFg7D9Gvmw0Y+C8rAynO6/Ku6QJDocbfFR9jJfYErtlbXOv4OfzB
 i3Yx+HF58/F27adaWyFGvVcZDaPoO9XyM9DFY8/qB0Wfu3D825nejS37Q1XjgbQ7GP+52af7QpY7D
 CjIurXFqV9hMBKFsE/p+zcXcZKoB1Q02cYdYjRGkhE+QhuxFn176n0lOOArYoyFm2J/Q64GCD1ywU
 RPtCdmFc6CDpLH/AnGCzrQnpj8+Z4+SEp7y6whrIOgSAj8IeqWYJp/tbOjnjEngva52YKtqabYAv8
 IZIYps7qWhoJ+06pRkcaJBrtV3mdaPQoiOzq2KQ70=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gZ31v-0000Ft-CY
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Tue, 18 Dec 2018 01:14:37 +0100
Subject: DHT suggestion (was: Both peers behind NAT?)
To: wireguard@lists.zx2c4.com
References: <3472fb49-19a8-4dfc-7e45-7efb2a5f431a@bartschnet.de>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <ec1c95c3-fb40-8b60-a890-ea3d6fff316e@bartschnet.de>
Date: Tue, 18 Dec 2018 01:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <3472fb49-19a8-4dfc-7e45-7efb2a5f431a@bartschnet.de>
Content-Language: de-DE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I suggest to extend the roaming messages after the following scheme:

<public key>:<64-bit linux timestamp>:<128-bit current IPv4|IPv6 address>:<16-bit current UDP port>:<signature>

When peerA gets a new address or port it sends a roaming message to directly connected peers B, C, D
which store the roaming packet of peerA in their DHT table. When peerE which is connected to peerB and peerC wants to contact peerA
it sends a query to the other peers (B, C). If they can't reply with a current roaming package, they forward the query to peerD.
PeerE receives roaming packages for peerA from other peers, validates the signature and uses the IP address and UDP port
of the most current received roaming message to contact peerA.

This way users/admins/operators only need to know the public key of peering partners and do not have to know IP addresses or UDP ports
or fiddle around with annoying DynDNS configurations or DynDNS-services.

Best regards,

Renne


Am 29.11.18 um 09:00 schrieb Rene 'Renne' Bartsch, B.Sc. Informatics:
> Hi,
> 
> I'm new to the list, so a "Hello" to all! :-)
> 
> Are there any plans to implement a DHT-based solution for IP-address/port provisioning like https://github.com/manuels/wireguard-p2p?
> In case of static IP-addresses configuration is also simplified as you don't have to fiddle around with IP-addresses.
> If peers announce their subnets via DHT, it would allow to set up overlay networks easily.
> 
> Regards,
> 
> Renne
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
