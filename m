Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF95C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:17:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61DDF20989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61DDF20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reves.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9626cd04;
	Thu, 6 Dec 2018 23:06:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 133760df
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Nov 2018 10:03:18 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2862463
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Nov 2018 10:03:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id F01F442D5D
 for <wireguard@lists.zx2c4.com>; Tue, 27 Nov 2018 11:10:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id EQTgMz7gTJQJ for <wireguard@lists.zx2c4.com>;
 Tue, 27 Nov 2018 11:10:15 +0100 (CET)
Date: Tue, 27 Nov 2018 11:10:14 +0100 (CET)
From: mbox@reves.xyz
To: wireguard@lists.zx2c4.com
Message-ID: <506707105.6917.1543313415105@office.mailbox.org>
In-Reply-To: <mailman.1.1542970801.29082.wireguard@lists.zx2c4.com>
References: <mailman.1.1542970801.29082.wireguard@lists.zx2c4.com>
Subject: Re:[BUG] iOS client (0.0.20181104) sometimes kills WiFi
 connections/switches to LTE (John)
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:06:42 +0100
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

I can confirm the same issue using an iPhone 8 Plus on iOS (12.1 build 16B92). I have seen it happens when the phone goes from wifi to cellular network and then it no longer connects to the VPN through wifi. I am using the following version:

iOS client version 0.0.20181104 (4)
Go Backend version 0.0.20181018
Connecting to the Mullvad wireguard VPN servers. 

I can also confirm that a reboot solves the problem. I have also noticed that when it goes from wifi to cellular the vpn connection seems to persist but the phone has actually no internet connectivity.

Best regards.


> Date: Thu, 22 Nov 2018 12:47:13 -0500
> From: John <graysky@archlinux.us>
> To: wireguard@lists.zx2c4.com
> Subject: [BUG] iOS client (0.0.20181104) sometimes kills WiFi
> 	connections/switches to LTE
> Message-ID:
> 	<CAO_nJAYGman8=av2iLjnxaEMVLaH=H+392iZ6YrcxLNxTK+hkg@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
> 
> Summary: Running on an iPhone 7 (iPhone9,1) on iOS 12.1, I sometimes
> experience a loss of WiFi connectivity when I connect to my WG
> profile.  It is not happen 100% of the time.  When it does happen, a
> reboot of the phone fixes it.  Is this a known bug/have others
> experienced this?
> 
> iOS client version 0.0.20181104 (4)
> Go Backend version 0.0.20181018
> 
> Server is running on Linux, kernel version 3.16.60 using the
> 0.0.20181119 snapshot.  Hardware is an ODROID-C2 if that matters.
> 
> 
> ------------------------------
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
