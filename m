Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428FCC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 01:24:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89BA920855
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 01:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="r6V2wVX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89BA920855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8f7793d;
	Mon, 18 Feb 2019 01:15:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38d312f5
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 14:40:28 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50de575c
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 14:40:28 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id s5so24185360oth.7
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 06:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=UC3LMf4b9aQ2I2SKf1kv6xL+A//0TB7KfjCFNEKDozc=;
 b=r6V2wVX8qxSiNVRp6FC245fpS9sNNjmXWeJTyr+jbeglKodHY2buzbunL4aUP1Ws/v
 UL81GSB3lak2Yc1l5umRhHvlb78UmDtS39CZRNIikEgTm9vmqmI7MozZDOmsleiOAWLE
 g94SORLKqSgrPDaJ5bQKHlC4IEVdnRIuiG5Oh8jNUSInmp07Tuk5zJlBGRrOEAErXxOo
 DFLYG136Q+ElzC0mfNtRnliCqyhKS3ujHcB6LF22rQrNM3g/QzX6H9b/iT4jLIeMK8WG
 LgqeUnFybifWpRl9klStCMdPmjLp8BhLP25G3XdSH79IrfBeiVfVvl5qNM1Es5q5QboE
 Ct9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UC3LMf4b9aQ2I2SKf1kv6xL+A//0TB7KfjCFNEKDozc=;
 b=J/weDsQVSxaRE8+HYNdgoorKO+DOO6G7O0ZNZAcOPzTF7qty1B03DIQHMgEqP9QqpK
 Kfifc0PJ4mv01CdfFdjliCi1alDA2Eef2E9q1Hx97XNNoFEoX5jXH/0MGmX/kfadGjIY
 WQ7fww8agArAcclRaAWFgT6rBiHoJ7K86lKMQXB9spSNO20lOIit0jTdRBNEg9+eABDh
 uTVwkgees/RCVMtpk0M9ltyhLvyE0c1cgFZPs1j48hsciHQicVbQwKkk/XjCNc5pIuw5
 HZJ7ZvXBgzll2lX31kK9nQjtsJGQiUVogpNfwysRV0BgmL+GgL2F2FhUPpOwISaWLgQR
 m2Zg==
X-Gm-Message-State: AHQUAuZXSlRdYqybgRfeDfzDVUIfqYxMNE/73DdoEeH79WrVaDicPF3O
 jxLRn5pU5zLSQ6qSsr5o/uPMCH5+rAtNPxn8G3VJ0sfmcD4=
X-Google-Smtp-Source: AHgI3IaE1G/XCcwMZyD2Tri9wXNk3AJLpa3BigBslWR5mf/+lLecaA/1g+pmo3/dq+wtSy+b6m7YoLHjPLJmP185/dQ=
X-Received: by 2002:a05:6830:116:: with SMTP id
 i22mr6635186otp.280.1550414924991; 
 Sun, 17 Feb 2019 06:48:44 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Sun, 17 Feb 2019 09:48:34 -0500
Message-ID: <CAO_nJAYduCg0dRtBqKXvTAnntxVWuwV+6R1FWnOavKCBOaZnWg@mail.gmail.com>
Subject: Current version of iOS client in App Store and github tags seems
 mismatched
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 WireGuard Team <team@wireguard.com>
X-Mailman-Approved-At: Mon, 18 Feb 2019 02:15:23 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I am seeing version 1.0.2 of the WireGuard app in the App Store (date
from 1 mo ago) but I see at least 3 newer tagged versions on github.
I'm wondering if something is wrong pushing newer code to the App
Store.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
