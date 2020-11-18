Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923B8C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 14:15:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8303020855
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 14:15:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahFq/Wzt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8303020855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce21df2d;
	Wed, 18 Nov 2020 14:09:26 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 88905f21
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 11:54:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b17so1996185ljf.12
 for <wireguard@lists.zx2c4.com>; Wed, 18 Nov 2020 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z4xjyPRZi1fNy/bzStMsZgOyuyTPnIH35YW1Ljojumc=;
 b=ahFq/WztzHQppicddom4Sr0NBBtkItyw3pBGXe/l/mMyuJr69Yf819pCcUzBlw1Mzr
 KPhKFAg6MBowGu3Tgn15S6SrtEYS1ky7VSvHCvSqZfPSqwN5+/FWCE4YvWmNy3ueGQvA
 bXPb1LLN1UFDNxWMkS4zLU0jJGR3H/BuRghQB0ol/IbN52vkRxD3dhW9BVTWJH9ljSI6
 MdbBoLN+hAj/pj9cPkh8xbiJWO6roIRg1sn1bKCr6F6zzWsXi5M1AgmYWlgjih33Bnno
 B7TK2+Kj1rJhs8rKlfKvBTUNfca9rubIG7yjTC2BMup9636k/Xz2D4NpeRs2QnBxRU1h
 r2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z4xjyPRZi1fNy/bzStMsZgOyuyTPnIH35YW1Ljojumc=;
 b=nr2+4b1LPvul6yd/fFcMcn8CVDNOfRbpvD7KtAlgC9Keml9jNs8z/JDDuDOat2YOH0
 cDDDo9P2n/LgQsju4zMbjPLxlDhK7FRLiFJHsDiZK/VGHV/jXhWHyck/E7sTE9coRqUW
 KhpyR6mnU9k0X5q8Pgttec72SO4BtidAUvv1t8N2OakbHO/EkZdD1bbs4bdXlbTO5ebc
 +GkJ9+svv2HQNKZKlCsR/e2nEocqeTxms0cWyaom0U3Tvo/KYtahVmS5Znuy9yg/sMZG
 BfAk4B1Oi/zkCWID8Qi7p6qIssBkT781FeEOE4fx8DgPv14V4flSq02ULyM7NYVjjX0U
 WbKA==
X-Gm-Message-State: AOAM532v/dgvFnIXk1iUJ4g5V4dY2TSbvh9+uH5e7nkD5QZwD7V1dGgp
 WTfKmhapgxhOQ3zlKLh6r340pTgt6ZkjrWsz2+7nI3FqQmKg2g==
X-Google-Smtp-Source: ABdhPJwJySUJHtJlLc6djodbGck3rCuYqmh+wbpYdE5+d4cV1y7h0pChAwykrOZOfUqgQfbPsJsHJdIsW8CMNwkfYAU=
X-Received: by 2002:a2e:9109:: with SMTP id m9mr3688413ljg.123.1605700729497; 
 Wed, 18 Nov 2020 03:58:49 -0800 (PST)
MIME-Version: 1.0
From: Per Allansson <pallansson@gmail.com>
Date: Wed, 18 Nov 2020 12:58:38 +0100
Message-ID: <CA+RcpwUzB+bq15AWCBxg9c-rJw=39UsqLr2j9zDn8Eteip2+yA@mail.gmail.com>
Subject: Wintun devices and Wireshark/npcap
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Nov 2020 15:09:24 +0100
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

currently Wintun devices are not seen by Wireshark/npcap, which is a
bit annoying as it removes a simple way of debugging problems with
various protocols over VPNs that use Wintun.

There is an issue reported here (with some comments from me):

https://github.com/nmap/npcap/issues/173

Does anyone have any extra hints/info to provide to that ticket as to
how to add support for the Wintun devices?

Kind Regards,
