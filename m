Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE918C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 04:01:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702AE2184C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 04:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5Z7ODGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702AE2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69fba1f2;
	Thu, 24 Jan 2019 03:56:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67cd47e0
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 07:57:27 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca038282
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 07:57:27 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id q8so5537191qke.1
 for <wireguard@lists.zx2c4.com>; Thu, 17 Jan 2019 00:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=10My75Y59h8QIdMRmxQOLqDmeH6rmcLFo9NVCjXrTI8=;
 b=W5Z7ODGC7ZQho3ygjtEo/YswI8NBYfLSEpj/g6tOnRRx08B90Rkbb74egMl4K0DoyN
 irZ2dSlmaJ+2JYUnpycE0dgIwltI8G16t1ctWCw3IwROk3KCdO78DnXLWz4QyKW2yUrH
 CPxxOb383XlqzwBlmw77rDTVRNiwAMVvjfXIRjmVFuG/y00rKaZ9j2XkK0w7h81eMNng
 f0uaYx3OmtyfsV+kz/VMBp00V+Og2+QaHCcorR6l82s3n89MHRMglkUh9MdFfIjwxDAJ
 Ixs88m1Ih0bdm742KI7NQOg6gxvoWv9IhDtTUOl41bl/65fvvSCCXKOuQYdDOcPN9I04
 Galw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=10My75Y59h8QIdMRmxQOLqDmeH6rmcLFo9NVCjXrTI8=;
 b=eJNJVSam06185Ecubas5Um0ZqAkVnAYPN+1lutrMRLu/g0k1zlSLUPT3NW5s3bfTbA
 J7p4LfWXzDi/VecrHdvvTvEm5OO2yXwBDv2y9z7mTL1FEjUNkaprhILYniuXaafx+G/s
 uywOykqv6PLNwyhwnZvCczXPHvNABIcmF0n5IOKcjHHZr/nNhV2a0nraNACfD32Zs/2v
 PnARIEEyfAtuE4A8nqpIHHTTGpuvHdELLzase9wnX4xBtZc93f6KHMKtlhLFHV+5WB3s
 Fld6rCMmMBj1ewkdYisw7RohF8pxjKeY+iLGIuJnIQLt6qTkzIHL4qlDObOOVr/v656A
 lQYg==
X-Gm-Message-State: AJcUuke8pjh9+MRE/j1goQL6dBQIKKpS5MIzFX5lUwZX84gfuU2u/2lX
 P/a+g0U0E/pmJ6yHnT+bN6zfIs1Mj+r6nlJtbvZ+Yw==
X-Google-Smtp-Source: ALg8bN5HjuOTln3wy1uL0oHdjTIf4bVuYJmvspINA0Wi/7hrVbz/ZVBvNmDd837q4Bp9LC83GYzUqtVEniY22x8uY58=
X-Received: by 2002:ae9:eb94:: with SMTP id b142mr9832664qkg.227.1547712103173; 
 Thu, 17 Jan 2019 00:01:43 -0800 (PST)
MIME-Version: 1.0
From: Felix Green <itaylorswift365@gmail.com>
Date: Thu, 17 Jan 2019 16:01:32 +0800
Message-ID: <CAFTQ+t-pvm9_Z+mZNgNbterG6XnotpRa6tBogn73LYfT2UE5ug@mail.gmail.com>
Subject: =?UTF-8?Q?Can=E2=80=99t_use_WireGuard_app_on_my_iPhone?=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Thu, 24 Jan 2019 04:56:29 +0100
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
Content-Type: multipart/mixed; boundary="===============2935853609769685553=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2935853609769685553==
Content-Type: multipart/alternative; boundary="0000000000001fd506057fa2ced6"

--0000000000001fd506057fa2ced6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99ve been using WireGuard on my Linux device for a year, and things=
 work
pretty well. Sometimes I need to use WireGuard on my iOS device, however,
with the same config file it just can=E2=80=99t connect on my iPhone. The l=
og file
shows that =E2=80=9C*peer(8Zu4=E2=80=A6jy0g) - Failed to send handshake ini=
tiation write
udp4 0.0.0.0:53244->server ip :port : sendto: no route to host*=E2=80=9D. T=
his
should be the problem, and WireGuard app doesn=E2=80=99t ask for system net=
work
permission while connecting. So the iOS itself may block WireGuard packets
from being sent out. (This problem just happens on my iPhone and everything
is okay on my iPad cause iPad iOS(WiFi version) doesn=E2=80=99t have networ=
k
permission policy.) Is there any solution for it?

--0000000000001fd506057fa2ced6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99ve been using WireGuard on my Linux device for =
a year, and things work pretty well. Sometimes I need to use WireGuard on m=
y iOS device, however, with the same config file it just can=E2=80=99t conn=
ect on my iPhone. The log file shows that =E2=80=9C<span style=3D"font-size=
:12pt;font-family:Helvetica"><b>peer(8Zu4=E2=80=A6jy0g) - Failed to send ha=
ndshake initiation write udp4 0.0.0.0:53244-&gt;server ip :port : sendto: n=
o route to host</b>=E2=80=9D. This should be the problem, and WireGuard app=
 doesn=E2=80=99t ask for system network permission while connecting. So the=
 iOS itself may block WireGuard packets from being sent out. (This problem =
just happens on my iPhone and everything is okay on my iPad cause iPad iOS(=
WiFi version) doesn=E2=80=99t have network permission policy.) Is there any=
 solution for it?</span></div>

--0000000000001fd506057fa2ced6--

--===============2935853609769685553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2935853609769685553==--
