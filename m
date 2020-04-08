Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B63C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:13:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128A32072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8ttIBF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128A32072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e0022e3;
	Tue, 14 Apr 2020 08:03:42 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1038f213
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Apr 2020 20:31:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c7so10481592edl.2
 for <wireguard@lists.zx2c4.com>; Wed, 08 Apr 2020 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5cTnO4eyYdFtKMe8aBd19ptQMyV/sUeyHTSPOQp3Zik=;
 b=Y8ttIBF/qWny246eMHhRQLuF5uHC6Wu32EEcxq8GWU/FyF8/nrfeaOA1iFxm5ufVPU
 7IxZ5wt0OftcEfJR1k7aA2NnuMU+o21f/Y7MhI8wV+lkj5ztj9xu6eT3YBBE/kHYFe8C
 SbxrWiniSvWxjW0nCI4hUCByQ4AE3nDMcdS+lwqX5YNkQVPjksI5OKNUAibayU+dERa9
 iWK3k6aO7TwwkAWS+g6oaWeV2V/yyIjDTlZEfdxoMJH8SX7q+IY/Q/ycx2NF51sd7DO3
 fizsEq1S5PhKgb3zICB677PBPVFLRFkhGK+Uqx/WeyQS8zR20lKckFboi8UKnWtDvabu
 dQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5cTnO4eyYdFtKMe8aBd19ptQMyV/sUeyHTSPOQp3Zik=;
 b=cMB4Id/50CfH7O8kFx1RNhJDKPkdaUtNlQ6nHmeARjwh1z6ruobdwFUXm0/+T4peHT
 M4k8LUHo50pL+4vKz9AWLpiD4Q1Ovvei9iYm8dQx7qCNgmBZF9u2Q7lktmuYBwkv05DJ
 wIrB4uBt1p5aUT4RKZmPuuzCVwCWu9O1sXkJEob7oFxxlPTURB2Ezo2OCQJ356pK4hIa
 G7xuTOcqVizLgxnPqfo3GiwBN8FGNhrBU5EQMSRsIQ9t0MF9tiwYIAB/yqJ/yzVJU2UM
 t9HHs17BtZZke7qJ8D5JZSQ7S8v6vyTyXGHjxQO5cXNvLNYyBdzkh7hDQ2ECBm5UrApy
 EYSw==
X-Gm-Message-State: AGi0PuYoRErhdfIqBc+BBV9U/qFX+CDwx8Dbf2tVHOhn1xMh9MbVJBmM
 y+4c63CdWkCDYCTV8b4INn/H0zgDJ0WE1hG23sWm2XvRSoU=
X-Google-Smtp-Source: APiQypJo3cDIcdch2OxNEaNLjnyfDVpf14PMuekNpqBkRr1FS0mFTewdkQUfHuJN84W5b79g7LQGFhBbJ0GROzrmGmA=
X-Received: by 2002:a17:906:2db2:: with SMTP id
 g18mr8459951eji.235.1586378440319; 
 Wed, 08 Apr 2020 13:40:40 -0700 (PDT)
MIME-Version: 1.0
From: Jayakumar S <jayakumar82.s@gmail.com>
Date: Wed, 8 Apr 2020 16:40:29 -0400
Message-ID: <CAECTAb_TW53o9Xb=F+gkamVH2aqG1iQKCiQkiO0JjTtVEE=isA@mail.gmail.com>
Subject: Wireguard Windows Implementation
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:03:41 +0200
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

Hi Guys,

Thank you so much for explaining the internals of Wireguard
implementation in Linux kernel. The sequence explained in the slide
(page 11) helps a lot to understand the flow in the following
document.

https://www.wireguard.com/talks/fosdem2017-slides.pdf

Likewise, do you have any document for Windows implementation. I know
there will be a lot of differences between Windows & Linux
implementation. By any chance if you have CryptoRouting flow in
Windows it could be very useful. Basically, I want to understand the
flow between user space module, NDIS miniport driver.

Thanks,
Jay
