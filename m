Return-Path: <SRS0=PVHX=M2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D16C4320A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 14:55:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2BB60F58
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 14:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB2BB60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6aa2d1c7;
	Tue, 3 Aug 2021 14:53:45 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 98672918
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Aug 2021 05:06:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id yk17so26761488ejb.11
 for <wireguard@lists.zx2c4.com>; Mon, 02 Aug 2021 22:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KOd4ugb8DnCfN+Q3ckIFT+cNAVaRS15hk9hCLyD+Ggw=;
 b=V4Ntos2m/PT7/ip1E+0RsEQrfBVxZ5eUj4W3I1AbZgbg/b0cniprBagwEqUY0btrxF
 vYTWPooT0feoy26I0A5Alne5fUcl5RZx/SLT8++M6hH506sLcFRnBCzPICnmhtZoXrgY
 ndIpO8H0wdeLenVYA/KZ4qi3QG52b63UpYWHnkSeKOLdJDblpqxEM2BFb1U2ZlssFXDA
 e7glFnMzB4iftiR0G4fvvxUCG6UVhqy82Ls0IbAfYXFG8SDG2W5TngIpcfElHIkC3bgg
 5Z7iIdM9MyLzenJctC4NoxLnY7lfp1WsPtjVqDBQrb+iJWa1zp8MJnkUkb1dUrxX8pk9
 3YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KOd4ugb8DnCfN+Q3ckIFT+cNAVaRS15hk9hCLyD+Ggw=;
 b=uTxTbYDCKxO28+ge8QeWDMpXiEdSgc7Dwi9TRDWpdPoP1jTgvaZFXQIWKAeNk3c5kP
 ZWwzMW8MFVFYAciKjjdQwgElagj+pV7y3DSt/Nq/qFhUm8O0ukBbrYJAEFxHquXZq0zU
 smKJo2AZvZFuB46SyO5Z439cDePxuzXX/IlzhVD82QXAcM9S37N9oe4YvlBbZGwQ2H5w
 S3wglX+YU9lOL4EuNJmo5RQw6NgQdkN2K/y/PG2OorEyZ3ItaiKvAXvoCQYtg5jL2HEJ
 nY1BiMiK2Rhe1hv8yGqHBfv84J9qCYkWRuI7oEaKQeLxjXBMIpwzsjVYWBYGezteYv03
 AWXQ==
X-Gm-Message-State: AOAM531qchl89tEKg7/azqDFqqAhreAOugR3fgTjVSkQj8+gMmMSVvTo
 XgTJUFdR8Rj43ofaMnl64WVXRypOIaGrB2WqgD4fB8FeXqRF5wQh
X-Google-Smtp-Source: ABdhPJz4i52/rhKaz7S4IP1iLpxy8wzOq+XSh74YIEbtY3O4Mxlx+gM6d6+rWFRxApepIu0LSOqfkFHNSv/2tQjHnRE=
X-Received: by 2002:a17:906:da0c:: with SMTP id
 fi12mr18576369ejb.540.1627967205818; 
 Mon, 02 Aug 2021 22:06:45 -0700 (PDT)
MIME-Version: 1.0
From: Hiroshi Shirosaki <h.shirosaki@gmail.com>
Date: Tue, 3 Aug 2021 14:06:34 +0900
Message-ID: <CAOWZXk1JwVVVZdRfDk9JX8tQdDnp3zbqrGL4mjCN39UuN7oJGg@mail.gmail.com>
Subject: Blue Screen errors with WireGuardNT using two peers
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 03 Aug 2021 14:53:44 +0000
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

Hi,

I tried to use WireGuard 0.4.0 with ExperimentalKernelDriver on.
When I use only one peer, it seems to work fine.
When I used another peer to ssh at the same time, Windows 10 became
blue screen and rebooted.
Windows 10 Pro 21H1.
Is using multiple peers at the same time not supported?

Thanks,
Hiroshi Shirosaki
