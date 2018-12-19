Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C1EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:46:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B8F218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZouuqUb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B8F218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d7314c1;
	Wed, 2 Jan 2019 18:44:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44486563
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Dec 2018 14:14:57 +0000 (UTC)
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54f1a983
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Dec 2018 14:14:57 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id h128so4516560vkg.11
 for <wireguard@lists.zx2c4.com>; Wed, 19 Dec 2018 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A8lbaRuCf1awx/aRsvwQgXUEGinGt7zhg2b6yfdli5U=;
 b=qZouuqUbuu9jH+0jGUaUDQmYOhgNXhUpKKlB/CHpBXE+p16iiRndA5xICjQ/C8Ls88
 wzDRnFnh/lfR9TXBQ6K+08Mpegwy5lluASU0egCHpz8+dcn4PZpUgF/2u2F9XjDO8pF0
 osj6wnJZTsSaspxQWLQv1YDyoto4bolcTX48/uZTfLNqr3YVJLiBHaN6Q1q7o37RAysj
 XoL5tnGAw3ffmQGHRG7pUoTaLFMpgDiDbqbeIYMHnovSW9BHW3hdiVmR1xRGKz6GTmy1
 odP3b3tyYoO69/YhlOJtxgVYLegZsLVyzO0ga5/cgCrkFzYm3ieOsbTHMruw1rcBDoNh
 ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A8lbaRuCf1awx/aRsvwQgXUEGinGt7zhg2b6yfdli5U=;
 b=EZGkDn9gfHgneK6rhtcw8AgJ4paNu5SM+HViCLQg5FXCaFvnODkH6AfXNsyQjWsMnJ
 7/PSIPJQUZlcQpMkMoIPib6Bq2L1gtkx2SJibqFZUvcxppBtQPnh+n7lawWrAQjo0N/G
 HAS+L2+J0aYK/UHfc7UXEf6WldUnTbegY4hcQ5YvVD6bQdaOnfaMyjiWiUSxJaTMURgT
 Fa+3fyuQYWKUEf+pbZ7RIdZfnkcOlxjO5Vzpj3AvqPr82XX9mOjbgOkqoy6NC5ruxlms
 UKRUCPcVDiaNRC8hOXHv1OKDG0I+n9DzK+f1mcTy2Gnx6HjsRF7dsW8YJutuHRqHOOaf
 rEUQ==
X-Gm-Message-State: AA+aEWY1h8iRgM8+zNVSY7DxKXdIATAvfOW7287zo0bGKNIzLvknfkE2
 VDJ3ElmdQpoJsf0xBeaEzaD7n21CDQ4yCuQWBbw78RP2
X-Google-Smtp-Source: AFSGD/U5yOiJj/qoA26UFVQPlh5gYcQwhsBdqjz2gBDjxHHnNInAgDurQrr2F2omA1/4vDcy0bmgUXxcjmCGHwYV3v0=
X-Received: by 2002:a1f:82c2:: with SMTP id e185mr9408334vkd.22.1545228931224; 
 Wed, 19 Dec 2018 06:15:31 -0800 (PST)
MIME-Version: 1.0
From: Subin Abid <subinabid@gmail.com>
Date: Wed, 19 Dec 2018 19:45:18 +0530
Message-ID: <CAOAvjy2V3WBFOtKp6dKztFh3gYHwW4=sfnz_ZxtRvDM=9fwQpw@mail.gmail.com>
Subject: Google Chromecast
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:44:09 +0100
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
Content-Type: multipart/mixed; boundary="===============4506288160534350230=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4506288160534350230==
Content-Type: multipart/alternative; boundary="0000000000008ad82c057d60a536"

--0000000000008ad82c057d60a536
Content-Type: text/plain; charset="UTF-8"

Hello,

Android device (using Home app) cannot connect to chromecast while the
device is connected to VPN. Is anyone else facing this problem?

-- 
Subin Abid

--0000000000008ad82c057d60a536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hello,</div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,helvetica,sans-serif">Android device (using Home =
app) cannot connect to chromecast while the device is connected to VPN. Is =
anyone else facing this problem?</div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr">Subin Abid=C2=A0<div><br></div></div></div></div>

--0000000000008ad82c057d60a536--

--===============4506288160534350230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4506288160534350230==--
