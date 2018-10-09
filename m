Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203A9C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:14:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CAC2077C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+8ys7NW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CAC2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dee31cac;
	Tue, 9 Oct 2018 09:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0000e0d2
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:13:37 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d38fa0f
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:13:37 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g32-v6so978353edg.13
 for <wireguard@lists.zx2c4.com>; Tue, 09 Oct 2018 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ajMeSz3ObzAiJyOIcgvUuxgTzrsSsWYMKCya4OPBAiU=;
 b=F+8ys7NW7V3uCuVpuPDoCZY0fdui2MisGNqpvLRfedhOOxxI0y9EOOv6C0fUa7jUOk
 fkTJnZNA6oLpR59Y6AAi4LdLdekg0wmRZ1NEqLe39mb4YgllSNrRHrHJHfMFPRw14HaX
 q0j9xBbY1XEYgKLGFLuIHFf5qC5VG37L4Io4JPGE5iVNAAF/g4XI0jbSAYxSNiiYRFT1
 mR0IZEeDJIH6bdqxq/m6Qt2xObBizQFsBvh+zLdBOSqu5WLNMLOdz5TFrqHs6aFEl3PY
 iJMKZJhCwmiH/CryjWv7rHJcPl1pDzXT4nBLe/d2guwzRW2mI/qvWolsH+merGq+sBLL
 4N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ajMeSz3ObzAiJyOIcgvUuxgTzrsSsWYMKCya4OPBAiU=;
 b=Qub9onfdsij4IyfhIM1BXuAY30Tzj2BAObP7d2PjpFONRGXGrQ5f5cZyrvRe6PF8rR
 1Xz05QKasfPa0skJsi6zx9S3syV5YAApEK8aljFsLuCnUJbBlEtWwvRuQUsq4LUdLT/K
 1yyoKMH4ZABVpbH1uUMK5ypYCJaDVL4Ie3untuc9SY8GpYsfKZhiQfejs8tsKL9D/cwm
 ZXwSDkkwKYP+QAtxweNzDf+V5IDr8BvDTNtaLN+u5I92Nm9CRmlPBNBfdfozizD1jYwu
 /9+B5yRSyRgkaCkcfclEojb/gyOrx/H6l2JZWXgjh42146ab0G4qLbejRqsZtzjHiX2V
 6ESg==
X-Gm-Message-State: ABuFfoieBJA5HaHcoATmy8NIeBOaLETrrV431P51bRkPPgzeiAhpyWa8
 F+e9zpk2E7sulPYdTq6xyyGi6IwMriCDwIy6osSVgg==
X-Google-Smtp-Source: ACcGV61sTJM8225So5DPjn0Ba9E/7is/kPWjsFaiDhGoWxKQIqhRhHFGt4iPKgDn+LYpq9acHXzyBGzXc5u1+J3m6hg=
X-Received: by 2002:a50:8a96:: with SMTP id
 j22-v6mr34437952edj.189.1539076468154; 
 Tue, 09 Oct 2018 02:14:28 -0700 (PDT)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 9 Oct 2018 11:14:17 +0200
Message-ID: <CADdae-jYmx4Um14LK0S0Ay+14CjM8qvh-jmBMFCtXFqWMzCr4A@mail.gmail.com>
Subject: about wireguard-go
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3680278024893052935=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3680278024893052935==
Content-Type: multipart/alternative; boundary="0000000000002aa7f70577c82a24"

--0000000000002aa7f70577c82a24
Content-Type: text/plain; charset="UTF-8"

Hello,
We need to compile wireguard-go on linux, because we are using a closed
linux, under we cannot compile module,
how can we do ? make on wireguard-go tells us that is not recommend on linux

Regards,
Nicolas Prochazka

--0000000000002aa7f70577c82a24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, <br></div><div>We need to compile wireguard-go=
 on linux, because we are using a closed linux, under we cannot compile mod=
ule, <br></div><div>how can we do ? make on wireguard-go tells us that is n=
ot recommend on linux</div><div><br></div><div>Regards, <br></div><div>Nico=
las Prochazka<br></div></div>

--0000000000002aa7f70577c82a24--

--===============3680278024893052935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3680278024893052935==--
