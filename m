Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F94C2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:17:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A35206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1Ggt+h/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A35206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ca680ea;
	Mon, 6 Apr 2020 06:08:04 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e8df15b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 06:08:02 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f20so13375354ljm.0
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 23:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bT7qLAMbrNci0bl3SgVak527lv0xHD0+zFLUtTyRxTg=;
 b=R1Ggt+h/B7ZFoDqGfp8JT1I2yeA8emraHY/StA2xHW8DpLvR3VmIqcoFTkM/w1vk1r
 B6LaBK06D6+mKtbKjTu948zk3OE42Fev76p38+Ki4X3f9OabGM7vjNL/QoMkmnxPKb2w
 YGcdnfS2D0110U53z06Ae5nMvQjUCmKW7JEM3BFVOxhD/bvo9xwq05dS+Xoddy20k3xn
 XkTh+tV6rdfTjeCZd3w+NFNC9sMeAEP+0l1BEsKiFKnXj1ifvTdzu2+L78d9QYf/cGt3
 oBneXCXiJEDQdl+rX/kPNi4eBjMBqi4A4yvYry1nwblcWn93QMvVNYhpyAfOhdTAvy2s
 MXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bT7qLAMbrNci0bl3SgVak527lv0xHD0+zFLUtTyRxTg=;
 b=ffkU04iCGM9iQ0zAMfSEg56XpyE8kI7Sr9rsDJOxBsJlnjb2e38zMRW7OjBCxu8ef6
 ferCkiedByxtkZ25FLoI6DUcbEwEyHx5Otbre6P4OnSdRLkbZE2tnMzYZDy7X/TJcYfV
 qsKG2w1kll/XsQJdRnhvUvK2UoxTTRZHdWrIK7sAst9xBcTvmLhRSRhArlP/0QSvROL6
 wohscF8DYJcTVLqnWCl10j8Ke6Jl8ozYXO6DBi+1bbi6XbFASnK8V3hvyFzLywF1Jk38
 7obrYK/MHkBd3rpp4tErTGDiR9LC7Mw3w/TndMocMsNV2SS7Cv1dg7yW831+i3ZJE/aZ
 necA==
X-Gm-Message-State: AGi0PuZcMp+e5DCWIE08SXfhYpdNpWzs7tiM08F1VT0E9ebZTztlgI87
 eSvg0tB1k2w1QLxXlPx9rC3zc9O0a3MKqTu80zYuO7Uah56qaA==
X-Google-Smtp-Source: APiQypI1V5fjHzc3gSI0otBTkzyAtyUyjehtj4jdftP4vWSg9HU9VXlPEswtwaml9E1Zk/rsQLV03DxcmxAOq5JBcMQ=
X-Received: by 2002:a2e:8699:: with SMTP id l25mr11432726lji.156.1586153806442; 
 Sun, 05 Apr 2020 23:16:46 -0700 (PDT)
MIME-Version: 1.0
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Mon, 6 Apr 2020 08:16:11 +0200
Message-ID: <CABtXGiDykFrPtVPsn8QOfr2WayPOU_hn+_VpgmJy9Ap3+LOTfw@mail.gmail.com>
Subject: Android app user (not test on iOS)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

I had to edit some existing configs in my android UI. Namely, to
change the DNS entries.

Updated with new IPs hit save and all looked good.

Going back to the config screen the old IP was still present.

Had to kill the app via the android task manager, reload, and then the
new value is visually present and also being used.
