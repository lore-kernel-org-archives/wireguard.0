Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D0EC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:53:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861CA2100A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="EEfDHt8w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 861CA2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72c77f84;
	Thu, 12 Nov 2020 08:48:37 +0000 (UTC)
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1506048
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Nov 2020 11:12:28 +0000 (UTC)
Date: Wed, 11 Nov 2020 11:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1605093375;
 bh=+V45OgK1jEdDg+lQKEB4wPlgUgU39Fgubrbf7FP5nrg=;
 h=Date:To:From:Reply-To:Subject:From;
 b=EEfDHt8wKpDOEa+xN3LgNRS52Ff4zYebo3Wivibm0vg1UQjegrbfcLflbLGEPQ7JB
 NanAqXTBmd/7tYnW1TaAWbTcQKHO1l3PXw4bVcm5EMPFFYW5VbgDOA/SFiSYmR4LPG
 En+nQXcldxgWN0z/B/bBTo6sREB5+qEWxOaGby90=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Ypnose <bowtieinwind@protonmail.com>
Subject: wg-quick alternate script
Message-ID: <o7WaaePpI-c-WuBN-owGA5HBT5N3ElMStukPxjKPVsf-UPadCGQ-ZR21aqPUeLMyw5m_1gi92fT3r8o6WTPml8ycdhETJ3aEvT13ee6eC5Q=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 12 Nov 2020 09:48:35 +0100
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
Reply-To: Ypnose <bowtieinwind@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Good morning,

First of all, I would like to thank you kindly for creating WireGuard. It
is a wonderful piece of software. My thanks go to Jason, but also to the
whole community involved in that project. People tend to forget this kind
of work is mostly done during our spare time, it is really important to
be reminded.

In the last past weeks, I had to connect to various untrusted networks,
some in my neighbourhood, some at work. By default, I'm in paranoid mode,
that's why I installed WireGuard. Even if I do most of my work on Linux,
my primary peer (which can be called the server here) is running on
OpenBSD 6.8. I like to see WireGuard directly in default system, so I can
use it without installing anything else. It's the same with Unbound. If
some OpenBSD folks are also reading this email, thanks a lot !

According to my needs, I decided to write another wg-quick(8) script
using ksh. Most of the work was done with mksh(1), but I'm pretty sure
it could work with pdksh(1) or even ksh88(1). I did it for three reasons :

- I would like to use WireGuard on my own Linux distribution[1]. bash(1)
is not included in the base system.
- wg-quick(8) needs "up" and "down" to setup and close the connection.
wg-kyc initiates the connection and waits for SIGINT or SIGTERM. When
it is triggered, the connection is closed. It mimics OpenVPN.
- My systems do not rely on bash(1), therefore I would like to also avoid
it for my VPN.

However, my tool has less features than wg-quick(8). It doesn't support
specific routing table (fwmark) or all *Up and *Down hooks. Those
settings are directly hard coded inside. It was also specifically written
for Linux. Thankfully, most of the OS commands can be easily modified.
Of course, I fully encourage people to modify it.

The sources are available online[2].

In any case, take care of yourself especially now, in these difficult
times.

Kind regards.
Ypnose

[1] https://framagit.org/Ypnose/solyste
[2] https://framagit.org/Ypnose/wg-kyc

PS: Donate to WireGuard !
