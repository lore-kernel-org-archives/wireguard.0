Return-Path: <SRS0=rxz1=SO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442FAC10F0E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Apr 2019 17:00:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830E52082E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Apr 2019 17:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="V/WVxkAQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830E52082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c56a7b0;
	Fri, 12 Apr 2019 17:00:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16524725
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 17:00:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d410754d
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1555088398;
 bh=AaY7R4P/caiGHpiG4cksEJPRJVxf/deWIIlj6ndVQAI=;
 h=X-UI-Sender-Class:From:Date:Subject:To;
 b=V/WVxkAQQ7L9S8ie5kXrHuOv0HOQ3CGl/5EOKM7DsFcV/DANflpLA7S99ciZ71mJa
 nmFNrfRkWs9jdAK5cwiVLodLjJqiLsPwCI7RaFLOTOcZc4kjj+gCy5MDDUGrBFGZbV
 vBAyEFcTjUcaQoEE4Qhmnxd0l5sfQ0/HloFXLqj4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.20] ([62.47.183.173]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MEsXW-1h4bXo3H0E-00G0fN; Fri, 12
 Apr 2019 18:59:58 +0200
From: Robert Walli <rwalli@gmx.net>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Fri, 12 Apr 2019 18:59:56 +0200
Subject: compile error on WireGuard Kernel/ROM Integration
Message-Id: <068214E5-B780-4A6C-AE79-BD772177EBCB@gmx.net>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.8)
X-Provags-ID: V03:K1:oxNeCyG7qTWdwF32Bt28SHZIBbVPC//7yfoscyx4ZewR/FjSyEi
 Rai3HS4LCnly9JtScE/l/j1+WilJlGF1cyVP8BjihvbNMxlpWpCDp7jsVIHP+AOp48Q2SOZ
 aToi5rh63cIS/hewo+rEGw5YY2Ak8egVu9cleJlFAikUYiLbnIwPjyZFoyhNFdESEvQpVlP
 zsJ8ap6xPVuBR9Ew9Ch3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FWFSpTX1PMw=:33+4Ol9FYYkBafWmStv7tF
 O4jlrXnVr5z/mzYSNmVJ3p0kWXxa+6rRwM1o03lRwJt1LCC5t9elh8Nh5iRhm6go1dftcvEG2
 vuAW1C00woMaS4sWyvbZ8/+ClDMdTTiR7lRyPV/UbJnsovFLudihy+r/M4/YcUG34W96oL0b2
 pr8Hg1+DXo3lfDn9WLmPEmj8gm+BzwWlE6Ybko+hhFfHjt8dYAXN5RLuUuityM7Jb36gTPjgc
 ktwDuvlH5npiY2JZbFQ9fiX9aitoSQoWKOzLyY/YN5V3g6egb0tJW60kjArGFvivDWmyadPzs
 6cWCYu3giddNJcnmyrhQRBNYv8z/mR2nmXOoWJ1Dv4S58428hz3yWkGzCVR9nk1VotIx9UFmk
 K+hkgGFYg8oXP/8cUkB3QxshtbbEoGnkT1ucB9VKpC3FGJuNDxkX0Qb7KI2OyCVi+Xg7Qj3h/
 PaalgN3oPOd66IrDnu02JkF/P+jzWaEGHTmu7lIfa//zQry1eScCoLG6v7Hy5b5KuFjbIueQ8
 PMhY4orCWeCrrrXdAPX1C3rjK99gK0/CFRb1gFgkqXYegzYBf/pBnegQA+BpB37aWXVrMCcKs
 MX575ZBxDmfFQmbrj1EIm8YnFp30RHqlIxwqUbgPma8g/+jHrkgS9KusJjgJi+c16/gpkaaS0
 XUnOauMdxHOo0ceOHqai7e3iYmen0TKVaE5lPlHZjCXxDoSMc1LKczx0hDaVdUoerZIVsVW4i
 fKRHdNHEFAbmxIKgDAIFktMAlbVbeJJPz/fKDkikU343RYURlapGd/JB5Ofv0f2DpnESDs/+w
 UeFunaAAyDgMa6r5B/F+9tCxN6ZPif+eeuTRTLXceMMXLk6Fn8mYEjKmJDb+ROfXppqq8Y5g6
 uqxOsdhYHDYzFJqL96q323TtMar/3rB0vqHADIg23N409b4KjNnSbeHOCiYuLyrzCjx28zPfC
 1TuOhAGS7uQ==
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

Hello!

I got an error compiling wireguard for android 9 kernel 3.10.108 for trlte:
---
net/wireguard/compat/udp_tunnel/udp_tunnel.c:87:26: warning: assignment from incompatible pointer type
error, forbidden warning: udp_tunnel.c:87
---
tried with rom- and kernel integration as described on: https://forum.xda-developers.com/android/development/wireguard-rom-integration-t3711635
with LineageOS and Resurrection Remix OS.

any suggestions how to solve this problem?

Robert
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
