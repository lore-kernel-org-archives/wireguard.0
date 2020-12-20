Return-Path: <SRS0=uYrD=F2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F0CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Dec 2020 15:34:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99D723105
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Dec 2020 15:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99D723105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b593cf7e;
	Tue, 22 Dec 2020 15:25:01 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 111db590
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 19:12:55 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v126so2612736qkd.11
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 11:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=DP1hhlO4POtAHEDO8Z40GnTEulacV5nYEMloexJEDxo=;
 b=dGBVVWGcKyEneyg4M3NyR1RjxMu9VmHyjwfLrsVTUpwDbNL4u6HvueApZPqLolkGLU
 LctVOK/XTut/3Mc1YDxkNMyAB6cNDCBIpIEo741EnmVrAl6q8p8iZ09TxPtDgqP0pRgG
 USoSLuzUiTggglbphUv2gJ2lOyHtqzsS1JR9JDRQDxbU/ZZQTosOSZBWpaPpNTn1DUSo
 LQBwlkEOVBgTGKNJd+qwqBmG9f1EYFIcoPjtIT1Vt1fmnhqBUlYXq4ws35anr5JKC9qj
 oHlv+M0SvdIGRPtkDrykUGI/hOZj3gqjo16iyXwYdgoCD5dZ2sK9rN29BP9aLS6FxpIA
 ELpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=DP1hhlO4POtAHEDO8Z40GnTEulacV5nYEMloexJEDxo=;
 b=ZEx6v9+LM93eI2yhcVaKRAubcY58Gm0b6sLFlW/gojDoW6OK+if6Sa/JETWfrFjMKV
 qSOB3pM1Itk/6YBK9OHd4aDcSAyVcVBcFYf/Qm22vVmk0/kxvAgZvqoZWeXpD9jpI+qn
 vsv4r6yb5m6+ov3mrvGFnPtvlAUu0CA8WAA1wO4hUM06ogPhNslcWabWjq1ho0kzhqI1
 H96tyBJQp3p2Jz5Wh+W9UP6iPp2DPVa0+jzZvZwdwon2ac2U5iDR3n49jjKxwWOA+BqB
 3B9wSQJFS3GwoMZR0H/hO90K6r7/R/8v24Sj4ThPNyo1Cj0uiuJUdIPZlEX2yKeCvnrb
 h/Jg==
X-Gm-Message-State: AOAM533Xub6cHPngJ4ccvH63B520BM0R13w/9IiaFIb2LO5o9Q8LguXz
 zgyqt982sAO29DhPANLwZ6lwlmtfPO0=
X-Google-Smtp-Source: ABdhPJy7jNC83+v52TMl73dVLfd+0lwDHDl7RvG5e+K0fg4vKPrqm4QhptelD4Bp4mSNA1jNDXZBhQ==
X-Received: by 2002:a05:620a:22a5:: with SMTP id
 p5mr14688754qkh.69.1608492111233; 
 Sun, 20 Dec 2020 11:21:51 -0800 (PST)
Received: from p51.localdomain
 (bras-base-mtrlpq4706w-grc-15-174-88-167-102.dsl.bell.ca. [174.88.167.102])
 by smtp.gmail.com with ESMTPSA id f5sm3488707qto.67.2020.12.20.11.21.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 11:21:50 -0800 (PST)
Received: by p51.localdomain (Postfix, from userid 1000)
 id C13701EB8001; Sun, 20 Dec 2020 14:21:49 -0500 (EST)
Date: Sun, 20 Dec 2020 14:21:49 -0500
From: jrun <darwinskernel@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: wg trunk (TM) traffic isolation: VRF vs netns
Message-ID: <20201220192149.bojbghrxm6g3yq7q@p51>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 22 Dec 2020 16:24:59 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


hello,

my use case is, if possible, is to provide vpn to friends and family and also
peering with other wg nodes (work etc). this obviously needs traffic isolation
and i have though about it for a while but don't have definitive answer.

1. on way i thought of doing is to have a point-to-point (dedicated wg interface
for each user) solution.

2. the other is to group interfaces based on the category of users (think friends
vs family vs even work).

they both probably need writing up something for set-up and tear-down each of
interfaces which should be fine but both would need a way of isolating traffic;
either between indivitual user's interface or between group interfaces. there is
also the question of ACL'ing the site-to-site traffic for each group and/or
user.

for this i've looked into VRF and netns; this has been brought up before
here and other place but i don't seem to be able to read the conclusion:
https://lists.zx2c4.com/pipermail/wireguard/2017-September/001706.html

from outside it looks like cumulus devs like their VRF, and wireguard devs lean
recommend using netns

https://www.wireguard.com/netns/

that^ link is not a solution for me but i can think of ways to use netns for
my case.


thoughts?

- jrun
