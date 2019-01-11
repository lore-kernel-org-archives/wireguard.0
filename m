Return-Path: <SRS0=OwtD=PT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E756C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 05:27:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D72FE20872
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 05:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWhXudHl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D72FE20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c87bbded;
	Fri, 11 Jan 2019 05:23:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 083dd4a7
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 05:23:18 +0000 (UTC)
Received: from mail-it1-x136.google.com (mail-it1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 336785fb
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 05:23:18 +0000 (UTC)
Received: by mail-it1-x136.google.com with SMTP id h193so1454820ita.5
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jan 2019 21:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j0QiP5GfnjZUFDkS1GyZQrfNPQGuSzFXUZ05kg6njfM=;
 b=TWhXudHlh1HGd7TrvG7Aso/vJHM2RzoTXC7W1brmMXXOBU2y26QNb4cQ3Q+jJGyR2m
 HvplDqEz/dU5EdgFihwYzoiONIOuKPaS4td9qJEYg4SAXhRnRWtiC4IUnxjnC0QIb9dg
 MZsA8X5X/x2dLhEPOBM9QMnZzyVIEChaizyEsJO0N4DbOqRSCRJWo88/wBpe2xRD8+fD
 4WKoIN/GqsR7G4/2w4ugYw9Bsn0etanyOZ1D7XP6N9/NtCikeRI6JHYzDnWC3LzVfmzQ
 5OpfCf75mXvoqeeNJVsTpKg/yZUicFiMhmFs3ICimqclokNUBn8N1jknxu/E3JIMGUhe
 vVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j0QiP5GfnjZUFDkS1GyZQrfNPQGuSzFXUZ05kg6njfM=;
 b=YwONUmrO9ADZsoeycszY+1QUalTWXFK77J4nVJLKH7UFFIQQuFsHavwP2dSMg7vm/c
 ekalQe7GQd5nRauT0yCPT/trbIfRmmweluWMnLpG2D/7fRZPvovtMhKk69sjTlwqGrRw
 wk8EvebV+TFvoo9GT8NsdGHM7E/vuT2PHcLGSlDpw5cJ3EUGZX0d/oqIKyR6dd0QRJ0m
 CDWmtJuMVKH+/5FaNQjxgdVpvYKA6z6W0mgyaNqMZ0JeCRl/0uM9eHMU1RVNxzobG7hC
 Eoh6k50FXkF05CCWm3ssCpYGkDjn5qXvSgmFAl/axY4G770INmBY5/VuhPgL/8NAtPSl
 HZSw==
X-Gm-Message-State: AJcUukfBHGqTZG/0UQK/BemXq18CF8zXjIzCnxh/K2tFm6yga9iiGYDA
 xXrwHBMOTEeC9c/MBYmpg6ogHOXpXNJluFHJhhYwebjo+Gc=
X-Google-Smtp-Source: ALg8bN55xkjxET18bck62uEzPL+ipU39jtmjdTYWWnIasUZGh08NjsnvY2V/okOwqHJBl/NRm7XVK9dMe6izFkMUFcY=
X-Received: by 2002:a02:4958:: with SMTP id z85mr9723092jaa.6.1547184405929;
 Thu, 10 Jan 2019 21:26:45 -0800 (PST)
MIME-Version: 1.0
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Fri, 11 Jan 2019 00:26:06 -0500
Message-ID: <CAPRZce230SKkA+GJHarc9xomOkfF87-MDN+PXjmTMtXUMT9cUQ@mail.gmail.com>
Subject: ChaCha20Poly1305 is slow on ARM64
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
Content-Type: multipart/mixed; boundary="===============0113412701201020561=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0113412701201020561==
Content-Type: multipart/alternative; boundary="000000000000eae3e4057f27f06d"

--000000000000eae3e4057f27f06d
Content-Type: text/plain; charset="UTF-8"

There's a note from Jason at
   https://github.com/golang/go/issues/29440
   https://github.com/golang/go/issues/22809
with information about the slow performance of ChaCha20Poly1305
on 64-bit Arm systems using the Go standard libraries.

In an effort to get support to remedy this problem,
it would be super helpful to have access to any
of the following:

- copies of bug reports that reference the slow or
battery inefficient behavior on arm64 devices
- some estimate of the potential benefit of improved
performance, measured in some way that's
easy to understand (% longer battery life?
% faster?)

I'm not in a position to write the better code, but
perhaps I can help get it merged.

thanks

Ed

-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000eae3e4057f27f06d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">There&#=
39;s a note from Jason at<div>=C2=A0 =C2=A0<a href=3D"https://github.com/go=
lang/go/issues/29440">https://github.com/golang/go/issues/29440</a></div><d=
iv>=C2=A0 =C2=A0<a href=3D"https://github.com/golang/go/issues/22809">https=
://github.com/golang/go/issues/22809</a></div><div>with information about t=
he slow performance of=C2=A0ChaCha20Poly1305</div><div>on 64-bit Arm system=
s using the Go standard libraries.</div><div><br></div><div>In an effort to=
 get support to remedy this problem,</div><div>it would be super helpful to=
 have access to any</div><div>of the following:</div><div><br></div><div>- =
copies of bug reports that reference the slow or</div><div>battery ineffici=
ent behavior on arm64 devices</div><div>- some estimate of the potential be=
nefit of improved</div><div>performance, measured in some way that&#39;s</d=
iv><div>easy to understand (% longer battery life?</div><div>% faster?)</di=
v><div><br></div><div>I&#39;m not in a position to write the better code, b=
ut</div><div>perhaps I can help get it merged.</div><div><br></div><div>tha=
nks</div><div><br></div><div>Ed</div><div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><span>Edward Vielmetti=C2=A0<span id=3D"gma=
il-gc-number-2161" class=3D"gmail-gc-cs-link" title=3D"Call with Google Voi=
ce"><span id=3D"gmail-gc-number-2162" class=3D"gmail-gc-cs-link" title=3D"C=
all with Google Voice"><span id=3D"gmail-gc-number-2163" class=3D"gmail-gc-=
cs-link" title=3D"Call with Google Voice"><span id=3D"gc-number-2164" class=
=3D"gc-cs-link" title=3D"Call with Google Voice">+1 734 330 2465</span></sp=
an></span></span></span><div><a href=3D"mailto:edward.vielmetti@gmail.com" =
target=3D"_blank">edward.vielmetti@gmail.com</a></div><div><br></div></div>=
</div></div></div></div></div>

--000000000000eae3e4057f27f06d--

--===============0113412701201020561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0113412701201020561==--
