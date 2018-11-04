Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21ABC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:00:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F48D2081B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yln2tuav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F48D2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745e2afb;
	Sun, 4 Nov 2018 17:55:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3cc4f65
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:55:50 +0000 (UTC)
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4264d199
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:55:50 +0000 (UTC)
Received: by mail-it1-x134.google.com with SMTP id m15so9555855itl.4
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 09:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KI1EbIA5oqO1W+wh3KWrxUIwCHwD/8GpS3EB9XTjdkU=;
 b=Yln2tuavIqhB+d5FP7ZvCOCuoIFfycXS+Ms5dp1A5I7GLw+unyf2q9DJOl73Mj4+Jl
 hRIaPYvT1q2Zu+Umvv8NmanO7CuK5yP3waw4mJf8vurFZ+KeZu49AepL+FeKN7TYwYCJ
 UxPb40SQttjH9nn8kMyuctqi2nXzmQbBX3sgy53e8KsNQ2pvYSfNbtueQ4HHudOrjlp+
 nGrRoEeRd/Bnn3M/UQf5JcT6nNCnqFHCH3Uw9+L7EAOmhta2O3DlHRlfm6jgOswN6kMS
 m2bD4WuYsvcGxMzqVKcdXrBiBKrE/sTpftwNEPjwXU4S142p9+cNUHckbKO5Crc/aLL9
 RbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KI1EbIA5oqO1W+wh3KWrxUIwCHwD/8GpS3EB9XTjdkU=;
 b=EikXg/JtcOHj4rjjeRtCYEDBH7M8ttuIn9OCx1wCzvAk9i9TZjJfVdGzjEEPoR3aKk
 gDhUpQUgFVsL6OqvUGvjxAo8C8h9v1WpvCJtAb2Dfcl+ljP8aqTQcPJJCBAc9SzI6Iwy
 SSJ5wW8fned2gqGWm+jEqKCG68slBbTIyJqXV/Kr4YMYEyTD/NLu7LJStZoNlHd4oLcx
 tj4/0Zd/fqMvKoPMHwfYzIOgCT66W9/l6druOehiEqjpbKHN52QSZM1RXJPTRlzYpy0p
 WsMDF2w6eQGujHeeED26zCSW0U4sDidiENhrTSuJEOcZrKqL5sshKsItKuw2tmORWk1n
 gj/g==
X-Gm-Message-State: AGRZ1gK4cF9gF204sQna9Bg3mghJHsWI2XzOwEyYOWH6aM3K7Cwa7dmj
 yiKFEJpvQi0QdBftgbsoFFHmwys2siBxp65Fpmr1+Q==
X-Google-Smtp-Source: AJdET5eJQE8lhbvG/zBa/QEdioSh8sIvEDTNrZlwAChVMonLjFReBOit0J3N7puhUL+77lRa8o1nxLsU4O5cn2uvaPY=
X-Received: by 2002:a24:1b81:: with SMTP id
 123-v6mr4369512its.163.1541354396088; 
 Sun, 04 Nov 2018 09:59:56 -0800 (PST)
MIME-Version: 1.0
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Sun, 4 Nov 2018 12:59:16 -0500
Message-ID: <CAPRZce0d+mEUKy=XdDbVSsC+n5jTUGTsTXOmTYvTWXw5=Twweg@mail.gmail.com>
Subject: Wireguard for Android vs Google Play Store
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7246866377039914358=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7246866377039914358==
Content-Type: multipart/alternative; boundary="000000000000407de70579da8927"

--000000000000407de70579da8927
Content-Type: text/plain; charset="UTF-8"

I have been having problems on my Android phone (Moto G4)
with the Google Play Store. New apps refuse to download,
and existing apps refuse to update.

I had an early version of Wireguard installed on this phone.

I caught an offhand comment from someone on this list who
was having a similar problem, so in an act of "just try things
out to see what might fix things", I uninstalled Wireguard.
Now the Google Play Store works just fine.

Sorry, not enough detail to debug this yet, but when I get
a few months worth of app updates installed (!) I'll let you know
when I reinstall Wireguard whether it breaks things or not.
Suggestions for debugging tools welcomed.

whew, thought I needed a new phone,

Ed

-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000407de70579da8927
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have been having problems on my Android phone (Moto G4)<=
div>with the Google Play Store. New apps refuse to download,</div><div>and =
existing apps refuse to update.=C2=A0</div><div><br></div><div>I had an ear=
ly version of Wireguard installed on this phone.</div><div><br></div><div>I=
 caught an offhand comment from someone on this list who</div><div>was havi=
ng a similar problem, so in an act of &quot;just try things</div><div>out t=
o see what might fix things&quot;, I uninstalled Wireguard.=C2=A0</div><div=
>Now the Google Play Store works just fine.</div><div><br></div><div>Sorry,=
 not enough detail to debug this yet, but when I get</div><div>a few months=
 worth of app updates installed (!) I&#39;ll=C2=A0let you know</div><div>wh=
en I reinstall Wireguard whether it breaks things=C2=A0or not.</div><div>Su=
ggestions for debugging tools welcomed.</div><div><br></div><div>whew, thou=
ght I needed a new phone,</div><div><br></div><div>Ed<br clear=3D"all"><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><span>Edward Vielmetti=C2=A0<span id=3D"gc-number-237"=
 class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 734 330 2465</spa=
n></span><div><a href=3D"mailto:edward.vielmetti@gmail.com" target=3D"_blan=
k">edward.vielmetti@gmail.com</a></div><div><br></div></div></div></div>

--000000000000407de70579da8927--

--===============7246866377039914358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7246866377039914358==--
