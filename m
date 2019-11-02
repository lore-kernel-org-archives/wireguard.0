Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CB5C43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:21:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B63520722
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbEbp0f2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B63520722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9559e9f3;
	Wed, 27 Nov 2019 09:21:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46ff6bd8
 for <wireguard@lists.zx2c4.com>; Sat, 2 Nov 2019 21:46:39 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39d93042
 for <wireguard@lists.zx2c4.com>; Sat, 2 Nov 2019 21:46:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id n21so48559ljg.12
 for <wireguard@lists.zx2c4.com>; Sat, 02 Nov 2019 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0uGGk/EfSsT1FYCn1Yy6BqrRGA63ALYochUtCqvMtas=;
 b=KbEbp0f2mvl7pOPQJNVafb+jh3I7I6DJ+7ksbhLtWSgPPN3ienfRnDo4sp+2R/xhWH
 jtFlsstZlp8dgYUNJCMSZXxvy6fXnsg77UdefquL/FhilS8/EYwhtMH8OFqdcUepZShK
 mGe3vN3Pene8edpGkwm2Q+JdZ62lhLYCL61/hHpkUP6CccJGCH9053JQBc0SZ82DZHJQ
 1B8mhaozZxAAgYlLyS1oan0uhPoVoAgwr6P3Qy5Eo9XEPkkY3y9zQRzsUGbH541P7LKH
 yjGMKAUfrScKaxMTt2L/unLD/QMGgV9mEO5hG92V4r6FsvuYC2uDf5MupN0FSOjX3SKp
 jMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0uGGk/EfSsT1FYCn1Yy6BqrRGA63ALYochUtCqvMtas=;
 b=cLIkcHnyKn8OTqRSisXY3I1sSjpqnis3MtjOv5JDnTqdb/WMpTTeypS6kiGxl5AsFm
 mdl0d+unGq3mHLpiFJ9++YY3u9RaNhnh4Ywkm3rUrwc9r8moXD9p/zuKZgKE/JBge9GQ
 rDAX+W0IsiZFyikMgQMzlG+eMFvMJqvj/cPohNn717w/d1wThTgWVaJn1qV7veMQi17p
 BKMDl1KW9pQTZEtz/2vpMucnfunVogBHCdGP5HmUkF5P3ZhteINM20xCcqvN8fKZDwwe
 mWKXKvYi1lzU30VZ0ic7pyNCE3KTheJhTJSEMQp5928wsI5PXf2+Tusk/GNPxTqUznn0
 8RBQ==
X-Gm-Message-State: APjAAAVmUtR23V1h+Hbo61S+yhdtL0g5Jdwpm0Bwvm+59OYuNJ/hC+me
 kvwtFtvaP4ZK7uFYhEr1hjSjQZtAWm2Xonh765yXpext
X-Google-Smtp-Source: APXvYqxSrO3h0C3+2q9WZ+kNrRHa38+dY7nriAs2JMzdcUF50ysKconezaAkSeNDQsLy6RKq0Pogd+9kAgAF/sdUYwg=
X-Received: by 2002:a2e:9686:: with SMTP id q6mr12961451lji.72.1572731197128; 
 Sat, 02 Nov 2019 14:46:37 -0700 (PDT)
MIME-Version: 1.0
From: Tobi <tobias.rieder@gmail.com>
Date: Sat, 2 Nov 2019 22:46:25 +0100
Message-ID: <CA+TCO99NZDQG0z+POz2mmKwpC+O78V-jO4PJsa6H-3sZZ_fW8w@mail.gmail.com>
Subject: Wireguard full tunnel and Play Store traffic
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:21:19 +0100
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
Content-Type: multipart/mixed; boundary="===============0512188536379963978=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0512188536379963978==
Content-Type: multipart/alternative; boundary="0000000000005506440596640430"

--0000000000005506440596640430
Content-Type: text/plain; charset="UTF-8"

Dear all,

I set up Wireguard on a Raspberry Pi 3b and on my Android 9 phone with LOS.
I'm using the latest Wireguard App v0.0.20191018 from Play Store.

Full tunnel connection works fine and I didn't exclude an app within wg
options. I can see upload and download traffic on my Raspberry Pi from all
apps but not from Play Store. When I browse in Play Store and read
description of apps traffic is shown. But not when I download something.
After that I checked with tcpdump on Raspberry side. Shortly after
initiating a download there is a little bit traffic but while downloading
apps with 100 MByte or more no traffic is going through my tunnel.

Did someone have such a strange behaviour before and knows how to fix that?
Besides that how can I troubleshoot that?

Best regards
Tobias

--0000000000005506440596640430
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear all,</div><div><br></div><div>I set up Wireguard=
 on a Raspberry Pi 3b and on my Android 9 phone with LOS. I&#39;m using the=
 latest Wireguard App=20
v0.0.20191018 from Play Store.</div><div><br></div><div>Full tunnel connect=
ion works fine and I didn&#39;t exclude an app within wg options. I can see=
 upload and download traffic on my Raspberry Pi from all apps but not from =
Play Store. When I browse in Play Store and read description of apps traffi=
c is shown. But not when I download something. After that I checked with tc=
pdump on Raspberry side. Shortly after initiating a download there is a lit=
tle bit traffic but while downloading apps with 100 MByte or more no traffi=
c is going through my tunnel. <br></div><div><br></div><div>Did someone hav=
e such a strange behaviour before and knows how to fix that?</div><div>Besi=
des that how can I troubleshoot that?<br><br></div><div>Best regards</div><=
div>Tobias<br></div></div>

--0000000000005506440596640430--

--===============0512188536379963978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0512188536379963978==--
