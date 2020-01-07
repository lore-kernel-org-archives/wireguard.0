Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98014C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:05:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F1A20721
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQCIkFuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F1A20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b34f88de;
	Thu, 9 Jan 2020 06:02:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f00c74a3
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2020 06:43:15 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79467b4d
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2020 06:43:15 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id w47so44543468qtk.4
 for <wireguard@lists.zx2c4.com>; Mon, 06 Jan 2020 22:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mHLwWkdEcrteI/TUKzE3Xdk5wQSaDGQ3kip8cje+QQo=;
 b=OQCIkFuuJq8NUW5IYOsUO9UPorlbeKxhh9E7fd2B10wPoVrCGYnvaTyj+6z1VfKYPR
 k70G9k3IyqMtnVMVjysZwA9/7hHgoBWazD04l8hhdnOu/HyDAg2VOSnlGdZuslBpgCvW
 dhwed+YdOPVs2+cZAoN/0aHOFYnI6ru+9b2DYVQSv7HnG6+u+sTh/b9ejbb+danvPSMt
 alo1+Xfyb+ISza4EVUDmxhlr/3jvu19erEtCU9bJBVJCvlzQ5RaszUuzuRhYjTSF6lQ7
 an0V9mlTelFaKwdBDuMnXTgEm9X/o2wDee63boqh2nUulNRUyrAHiOdY+kwRBncDY8ec
 gpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mHLwWkdEcrteI/TUKzE3Xdk5wQSaDGQ3kip8cje+QQo=;
 b=MshnvMrvrD8Qm1Je9Tsr9fvqXrnUemzyBZOyQmkpkohnob5Pb5ct89wvywpyhsZeAT
 5L4L/SRUUsr1CVj5wTRdTa79UOaAYp7lqkdahH48xp0wjLTipbag05XZKcvu3tfGQ6kd
 ALr0zJDweUiBz05nlaK2yFcMGzFq6irrNbZpqdzhGR5/1S5aY8DdtbrGn9lVnKdCq15u
 aFNnAuH3Fx9Ha9Ft4TMF3L/4OtNsy7WRdYDTFu3libtvyZH1zdXDENxWMnh6KcoL4BO4
 3ThKg59Ds3eEokB5ohk9PJZdz3JiF6FZcmNDqq/0RMHw9hwhRlxMmk3ARx2+ExI0eK3s
 /10w==
X-Gm-Message-State: APjAAAVDczUBXPm485tAj9X8gwfS7Jms8LBuWHbgK8WtyoNVrovliuhX
 96wOzuHmbp73LS9N01EhS0YvvLsqPxfXw6cVcpiuwS9g
X-Google-Smtp-Source: APXvYqyh00PWQyRI1tstlBj7CYWeHwKTRd6+WH/Hwf0j3HHWOTqr3L0EKJx2GyGy4Aryp3rLFa3dEqif8OE2sWT8O3I=
X-Received: by 2002:ac8:4447:: with SMTP id m7mr79114190qtn.100.1578379394175; 
 Mon, 06 Jan 2020 22:43:14 -0800 (PST)
MIME-Version: 1.0
From: Arpit Gupta <g.arpit@gmail.com>
Date: Mon, 6 Jan 2020 22:43:03 -0800
Message-ID: <CAGCGytL4bbuvHnPt1scJ1QAWSFw_zx3RGQQAdbC0d8D+rjiJ4A@mail.gmail.com>
Subject: Android: Cannot toggle the quick setting tile on a locked screen
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 07:02:19 +0100
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
Content-Type: multipart/mixed; boundary="===============9048379074069445455=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9048379074069445455==
Content-Type: multipart/alternative; boundary="0000000000001c57ee059b87172b"

--0000000000001c57ee059b87172b
Content-Type: text/plain; charset="UTF-8"

Hi

I can't say for sure when this behavior changed where I cannot toggle quick
setting option for WireGuard when the phone is locked.

I know this was working in December so not sure if the December update for
Android changed something or if this was an explicit change in the Android
app.

Wanted to see if any one else is seeing similar behavior and if there is
anything that can be done about it?

I was using Tasker to automate toggling the quick setting when ever I was
not connected to a specific WiFi network. That automation no longer works
because I need to unlock the phone before that setting can be toggled.


--
Arpit

--0000000000001c57ee059b87172b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi<div dir=3D"auto"><br></div><div dir=3D"auto">I can&#39=
;t say for sure when this behavior changed where I cannot toggle quick sett=
ing option for WireGuard when the phone is locked.=C2=A0</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I know this was working in December so not=
 sure if the December update for Android changed something or if this was a=
n explicit change in the Android app.=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Wanted to see if any one else is seeing similar behavio=
r and if there is anything that can be done=C2=A0about it?</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I was using Tasker to automate toggling =
the quick setting when ever I was not connected to a specific WiFi network.=
 That automation no longer works because I need to unlock the phone before =
that setting can be toggled.</div><div dir=3D"auto"><br><div data-smartmail=
=3D"gmail_signature" dir=3D"auto"><br>--<br>Arpit</div></div></div>

--0000000000001c57ee059b87172b--

--===============9048379074069445455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9048379074069445455==--
