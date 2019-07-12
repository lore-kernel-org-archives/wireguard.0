Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F90EC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6B12184E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5dK5OZq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC6B12184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3da9ca9;
	Wed, 17 Jul 2019 20:39:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44cea696
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jul 2019 04:02:36 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc635d78
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jul 2019 04:02:36 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id r4so5418163qkm.13
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jul 2019 21:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ypa31xJVm8qIr45J/PmvOCGbOW/Hfy9i1S5/KX7geOE=;
 b=L5dK5OZqu9sbilpau/taeaeSHaJ9ETVll9hVJfgH3XmGxyOLu8qvrONLFaTrD8Wo6r
 7eulUXTCqi5d9nkakx0FjVJ9TLv4nObcqI3U3tzOcwzbqWkZaAaKx2rwcKGrlikKNxui
 2SByb9BuirrEVMvriAc9XgvSA2ia3/l3VSx4PYERposlzFHfiUvJeeFLqPg2Tj0J1ey4
 KnRCHHdt5Nip34zXMdrblpuGK3Rek6a95AtaqhP8gkUW9u4rGVh20eoFfAH0803e0xEe
 8CLgLkBOUn0xKVILj7UTrp3eCHSFgB+D20qPmRQzrE/hva8q1waRe8+d3pJu1tytBc2B
 BYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ypa31xJVm8qIr45J/PmvOCGbOW/Hfy9i1S5/KX7geOE=;
 b=VgUcFme8X8QszJOXCHKIRRaIPnVxaQAmI+III3z3oJzJv4xspov8RCVwxFk5ABmBbT
 ucWBIdvFyOUFi+PBAD4G1+r9F38kB7z5+aESZehlfFPliUiGyZSG9CfBgTXGMFdIRv7r
 Gva5Y4RyvrpCI5iQd9h6ov+OOcC1Px+Fh4dygzxzrWOcMMW/M6o+HtaWl5pCoFEP23AZ
 JyvKrk5FtZRDMHMVr1YtZGLQKVVujOOHwSPGzbpb8fBx1w6EsqfRcNZsuhOYisq95pqS
 kH2rRtl6xUbEg8p74oaloycLHIAwkVFy7wZnTWZGCkmA4a1ycbrH4hZCnDRDLJXKvADC
 1qAg==
X-Gm-Message-State: APjAAAV9VkfWredvkMut4ZXU9tQ4L1nYEH43WpA0vgRVBvYi3XLMaD6p
 VsjdnB0FX6sJ0fdNi+hOVtun2A982F4fFdVpd+TfXKJDFwg=
X-Google-Smtp-Source: APXvYqy7bsS5SLQPH/mWVFIoemM8ILg6rL0VUZ06M8Nmj7kzI809Z41DMy0PH3LVGhZz9UeTeedqKvDrmkD/jI97KoQ=
X-Received: by 2002:a05:620a:1598:: with SMTP id
 d24mr4613737qkk.348.1562904155021; 
 Thu, 11 Jul 2019 21:02:35 -0700 (PDT)
MIME-Version: 1.0
From: Alexey Ivanov <alexey.ivanes@gmail.com>
Date: Fri, 12 Jul 2019 07:02:24 +0300
Message-ID: <CAJcUPC4W67nNOMWDW27m_fnNNYMvrkXr5Zi1AGNn_6miJ1=iPg@mail.gmail.com>
Subject: Wireguard for Windows tray menu problem
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:39:51 +0200
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
Content-Type: multipart/mixed; boundary="===============4635595436901470438=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4635595436901470438==
Content-Type: multipart/alternative; boundary="000000000000fa66a7058d73fa74"

--000000000000fa66a7058d73fa74
Content-Type: text/plain; charset="UTF-8"

Hello.

Here is a bug when wireguard's gui tray menu opened.
Sometimes when menu created behind taskbar (known windows bug) you can't
open Windows Start menu by pressing WIN button or click on Start.

Steps to reproduce:
1. Press WIN
2. Right-click Wireguard tray icon
3. Press WIN again, 50/50 Windows start won't open.
4. Click Windows Start it won't open, but it should.

Also wireguard's menu when its created behind taskbar won't even close
itself when you click somewhere else on desktop, only way to close it now
its select any menu item like "about" or exit.

--000000000000fa66a7058d73fa74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello.</div><div><br></div><div>Here is a bug when wi=
reguard&#39;s gui tray menu opened.</div><div>Sometimes when menu created b=
ehind taskbar (known windows bug) you can&#39;t open Windows Start menu by =
pressing WIN button or click on Start.<br></div><div><br></div><div>Steps t=
o reproduce: <br></div><div>1. Press WIN</div><div>2. Right-click Wireguard=
 tray icon</div><div>3. Press WIN again, 50/50 Windows start won&#39;t open=
.<br></div><div>4. Click Windows Start it won&#39;t open, but it should.<br=
></div><div><br></div><div>Also wireguard&#39;s menu when its created behin=
d taskbar won&#39;t even close itself when you click somewhere else on desk=
top, only way to close it now its select any menu item like &quot;about&quo=
t; or exit.<br></div></div>

--000000000000fa66a7058d73fa74--

--===============4635595436901470438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4635595436901470438==--
