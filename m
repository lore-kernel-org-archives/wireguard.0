Return-Path: <SRS0=oMkR=L6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADD9C07E96
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Jul 2021 20:08:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8EF561C3A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Jul 2021 20:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8EF561C3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87984a36;
	Tue, 6 Jul 2021 20:08:15 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be8f15a6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 20:08:13 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id v13so12678999ple.9
 for <wireguard@lists.zx2c4.com>; Tue, 06 Jul 2021 13:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lMN3MQJLKCorLucmy568pguDrUtvXcGIzJPmZNgyV7o=;
 b=urLfznJd1sBFyuBP7tYRVDaLoTvBbTZkwPUxRrs5IcKv0D+jezN4QxueLy70N83d3V
 yzfnM09E1MiTppKefYve2dO9bxj2S0JFN1etT2nuS/bo67OuHms0BEwlabULmS4o0IGR
 199pz7Qm4KKjrpW0WOHLzqxsflQkL5EgPcBhLoxH4/Haq2HbSApJfjWPucOnxa93hC7Q
 zEi4/TiBt3nqq6McouepFeUc8HMPXIFhgS06uPDPeGyDcSOL9qpyo4UcQAsNvjm/O3s1
 Hjgmlm0OvLCuknhQKaMvBzMmfr98fprRZ3rZiN95iGmhy9mD1/gnmG9V5lBGKkzxDAzo
 I4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lMN3MQJLKCorLucmy568pguDrUtvXcGIzJPmZNgyV7o=;
 b=crHBu1rHhYdjoZXFIf72A/2FT0YGARHyDdfb4KmvCk5esHHTi57U5MaEZKbgjgzKEU
 dglvfXd+DE9XFb79/+u5A0qLVR3k92B/2jzfT9IP9jyGKlaJ9RzCumIab8iodC0+++yb
 hytRoi+fKMHDsKFFJeghKsoOB94PTLmWxp0vlgi1gZ9JAuWTZshrZXANL698XPN5QJE0
 s1v+lhnrXS5Edixk8yrJg+mrFsbkJ+4V4VDv2dV3eNjbCTxAEm5BF+WMUOa5GlKGwxLg
 Z2DodvIoD+3BUIvN2uSmBY3f4PhSPVI/nM/UzbGh323yaQN53AC+RpyLRZA/4wxLSNd+
 MKBg==
X-Gm-Message-State: AOAM533X0ahwB6FuxM4kOiFFVpyjSgTHTVt07FjackMJQl8YoZ/WTC9B
 eukxIM3V0lFsl/qTz6SLL0jVFytT0xyoT8zpgURTQOJ9QjpYNA==
X-Google-Smtp-Source: ABdhPJygCD0uEtxHzwKh9m5PpGe17/7NIfFz3vOVUODEGFv4Q6lFy/Da06u+Vq3FMe3Mgy0JONq1Ad+9kR4DTh8YDrw=
X-Received: by 2002:a17:902:768c:b029:128:b109:d0d8 with SMTP id
 m12-20020a170902768cb0290128b109d0d8mr18284957pll.19.1625602091616; Tue, 06
 Jul 2021 13:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <0102017a7a9e0329-2cf98ec6-3874-4f0e-80f0-663792b43e3b-000000@eu-west-1.amazonses.com>
In-Reply-To: <0102017a7a9e0329-2cf98ec6-3874-4f0e-80f0-663792b43e3b-000000@eu-west-1.amazonses.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 6 Jul 2021 17:08:00 -0300
Message-ID: <CAJq09z5fhE=Rj_wTs5x1zYSu3e0+tU-huymEVV5Y6Bfyu_7fJw@mail.gmail.com>
Subject: Re: passing-through TOS/DSCP marking
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I see talented people spending resources trying to go around a
wireguard design decision. I understand that wireguard try to keep it
as safe as possible and as simple as possible. However, passing some
traffic information to the encrypted packet is a requirement for some
setups. Wouldn't it be better to have it provided by wireguard but
disabled by default? If the change don't kill a kitty, it will not
harm the security as users are already doing the same but through a
much harder way.

My 2 cents.

---
     Luiz Angelo Daros de Luca
            luizluca@gmail.com
