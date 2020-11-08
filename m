Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC041C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:22:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F65A206A1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcEcXRoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F65A206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5493e89a;
	Mon, 9 Nov 2020 22:41:06 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7eb3c84e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Nov 2020 08:57:45 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t9so2166783edq.8
 for <wireguard@lists.zx2c4.com>; Sun, 08 Nov 2020 01:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QwglXnkflnhwgUs+wDUCafpqpTM5qZoTmSsX52M+GH0=;
 b=gcEcXRojzxY01ICV2AmJoz9ZzCUm20SNYO7DGWg7YGfl9ZY5u2muLs2KjcALsBDMRj
 ty34Syoad52/SUalkyLk9M7faHS8+t1DZOnLIH6ClNocIuUxSoVfbETHzilBswnhDai3
 qemfd8BKXzBGqGwCLIyZ9f0p6aU5LuMCbf/BQDQqeidr0EBlqD/4+CZbPRPtQ1g6o3pR
 709eIxwOC2RTyjEUD6j7ojvXVRxRAOFfdmb5UlBivl7K38tXwfP2JtPb37O1kvGU9hY1
 t9R2KgFqB7h+oSBROTjDq6HMmg87IAEOyCxA9J1QduaPlyzL2/T3zbtUfAGdKHCoCKfu
 pmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QwglXnkflnhwgUs+wDUCafpqpTM5qZoTmSsX52M+GH0=;
 b=Qwas6ZY+f2LM5ZeEwOxEKrPbt7HMFgdkYAlXAH2Wfcwgj683cRg9ovojZYFMseAkkr
 yplG0fDLIK4ALpLUdtF2mr61f+fWSuUfICzpChTtToWAf99NCJTwpLx+q89dYAX96bgv
 cyeWYreytpiGzSVZVeo3GoHBxWVBhqgqUc9pp3RB0QOSLEzfnSbOwPUBEzbxkRwigquh
 HuMGviRskH6zV1DeIvncyo38K3s+tSF8XUmULx5sDidmmr7iR45dRg7IFqMkkfC8BM9U
 6ofEpM6eNld9aVgYLqEcO+FfFrb9CuPNyPlbb4G2Jqrr3E5tx0OuB11DXb1e7DD6cKyC
 B9kg==
X-Gm-Message-State: AOAM532g+73qxBD07G8KwoxA01vD5+PbMVnI2R03KG/RT6F9NEzy7epf
 RlFduJvJ42CeKmkkaOiLz8XxjuFkgu6i3vktlH4VeB8ZL2Ffc+Ym
X-Google-Smtp-Source: ABdhPJy/qv6cDT+sloIc0aFp6vVaNtGLqsdfb9zTtY46pBfgjiyqsv7n0djHFyYZU32bY45g7f5toDNv/7y7Sp67GBY=
X-Received: by 2002:aa7:d615:: with SMTP id c21mr10101773edr.23.1604826068193; 
 Sun, 08 Nov 2020 01:01:08 -0800 (PST)
MIME-Version: 1.0
From: Dashamir Hoxha <dashohoxha@gmail.com>
Date: Sun, 8 Nov 2020 10:00:57 +0100
Message-ID: <CAMucfLx86y6z0b7+ozV2ptGAp_r0nYbfEGsPbZjxwCuC9VVkZg@mail.gmail.com>
Subject: Distributed Computer Lab
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:41:02 +0100
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

This is another case/example of using WireGuard:
https://www.researchgate.net/publication/345485273_Distributed_Computer_Lab

"With COVID-19 pandemic, most of the schools and universities around
the world have to do the teaching from home. In such conditions, being
able to devise a virtual computer lab, where each student (with his
laptop) participates remotely from home, might be quite useful. In
this article we will see how to set it up with Epoptes, WireGuard VPN,
and a VPS on the cloud."

I hope this will be interesting or useful.

Regards,
Dashamir
