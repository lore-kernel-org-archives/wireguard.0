Return-Path: <SRS0=qC6o=R6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C598C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Mar 2019 16:08:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF16206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Mar 2019 16:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8LH5Dck"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF16206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7faf461;
	Wed, 27 Mar 2019 16:07:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c996fee
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 16:06:59 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 145dff6e
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 16:06:59 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id w30so19456046qta.8
 for <wireguard@lists.zx2c4.com>; Wed, 27 Mar 2019 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gJzXWgUFlk9cNu3Jz80Kw56RhL0yCdTuwMRxcXFccyo=;
 b=I8LH5Dckh9CO49AjJg1lJtsCws7XSLbdZtlwsc0EEQit0VUtbQ6NMdZ5erzT628P0U
 5FDYui3HTN3tyxRFPFnqamhy2eqC/15Sndkp/oc0SR0IGGk6cs7vOD6oF3Bht1Od2BBh
 tqPkc69mdEPStgjGhx6A9QNQdo3Jq4ejRWXgEwdtniiM6RJUki9/DLbCiPlfcOp2GMd9
 a8+iOSQQDCPAbbBM9Ywl3UZk6XY5ks4pKnCPh93L1L9NmI10bX9gcQpLYGvl5daWNp+w
 GasaK7VgeMY/IB+FMnrs6wxTqqVs73goIboKyuG1GicV5ZfhkMJ5uZs3u8RWwmeUEN3B
 YucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gJzXWgUFlk9cNu3Jz80Kw56RhL0yCdTuwMRxcXFccyo=;
 b=gZXNho5l7B2vMUBllH/s3POoTQ+XYlGnCbnAaBv/k8Qri9hEE6P789weFutmtRDPJL
 QXClt5F92NBDuPZ0KsFe5HQqLE8jpFbZS/3V8IfNlj+HOQLd4Dt1xbWulr+2LCi9aKHG
 Jgf+xCR74LDHhXb3WGS7xYufFcPdihDu1Gee0RPW+U68M2NxTmn4RKxPBZCD8Fj4PTRi
 KONwPbbXEbOIHVOKuPRyFPMsensoKK+0vOPBP5EbaQGVIblkiDqs4jxxJ6OB/n7ayl9R
 uzbR8LXRSyE7+Bv47qpg1XdrEtG7F6JuDWfWU/nOqVdYST7/UpuPBGTX2Mg4X4XcG6/C
 8G1Q==
X-Gm-Message-State: APjAAAV73hfQ0qcH3u5ReGoCmqY4X6fICMwWqpDUd8/Egz11vQp+/0EE
 VXmUqLeDWX26PculL9l+I7gHDM2REeIRUiAkBTFnzNTE
X-Google-Smtp-Source: APXvYqxiExoE4U9rOWHE8Oxw7doDMQL+lHDyPme1Y8Kaj6DGsjPvbSWo4euQxm+9JPnQIinv/ptTHWpZwqBUFYh5w8Q=
X-Received: by 2002:ac8:3294:: with SMTP id z20mr30710809qta.371.1553702891479; 
 Wed, 27 Mar 2019 09:08:11 -0700 (PDT)
MIME-Version: 1.0
From: Arpit Gupta <g.arpit@gmail.com>
Date: Wed, 27 Mar 2019 09:08:00 -0700
Message-ID: <CAGCGytK=5D=f_Cf9a-h1ukjTOD-eMNf5nV5OgfYfOufYEom0tw@mail.gmail.com>
Subject: any plans to bring the on demand feature to Android app?
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
Content-Type: multipart/mixed; boundary="===============5375538617851406401=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5375538617851406401==
Content-Type: multipart/alternative; boundary="000000000000eee659058515a40b"

--000000000000eee659058515a40b
Content-Type: text/plain; charset="UTF-8"

I am using this awesome feature on the Mac os app to enable wireguard
tunnel on unknown wifi networks and was curious if there are plans to add
this feature to Android app?

Currently using Tasker to achieve the same on Android but native support
would be awesome.


--
Arpit

--000000000000eee659058515a40b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am using this awesome feature on the Mac os app to enab=
le wireguard tunnel on unknown wifi networks and was curious if there are p=
lans to add this feature to Android app?<div dir=3D"auto"><br></div><div di=
r=3D"auto">Currently using Tasker to achieve the same on Android but native=
 support would be awesome.<br><br><div data-smartmail=3D"gmail_signature" d=
ir=3D"auto"><br>--<br>Arpit</div></div></div>

--000000000000eee659058515a40b--

--===============5375538617851406401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5375538617851406401==--
