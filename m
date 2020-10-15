Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803E6C43457
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B2B20848
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gctca7jz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B2B20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e787a94f;
	Fri, 16 Oct 2020 13:16:57 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eaab3ff1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Oct 2020 16:10:40 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v19so3623745edx.9
 for <wireguard@lists.zx2c4.com>; Thu, 15 Oct 2020 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aEVXxLMn68VW/gUT4NyD/rx2RvMKThgTQBVwLs4EFzQ=;
 b=gctca7jzGtrNjwdCn8z97H15tDmLeyRJAh2fae0kErKRNASSHnzE3zouPJJ3W9q93C
 jxykcmm0oJJHUCCjwER+udGzlU90LZoFc2id+od+CdKOquMgTmvqquhMCOE/wS21xcqj
 WFvJxsL6VEq0bUb/RE64NZurWqxrVyDkU4uR/xXbLxPV5BBZ580v1jZ25BMLrNh+Mp7d
 VKWAE6XYgQuaqzDIwJDNxRwAaBLHx2zdAh8RDNlXfsfu+oW7PLKlya1ubzBgPZJxStsz
 bvgyaqCymF5evMF+L1n7fCp4613bUrxe+f9UMEoPjzr8Rj2V8IlvUoktibm9Qpm1A1Co
 NGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aEVXxLMn68VW/gUT4NyD/rx2RvMKThgTQBVwLs4EFzQ=;
 b=pJQb93WFjexbkSKZSakWa1IB9Cx1PptmP/ZhxwfbO10zOyUc4nDwCgv0LXhu1GLEQ8
 zDqpYVNAxj94Jd2w/SzaAlFhaf6lQV68dNkBVaN6gTuRvuw5bKGqEH2vs7VHam3fL3Ok
 KOq3fzNez5MqvcSEZiWe56pM0MWDDlRiItsykgNejtLau0sDAJD+2QS7PQbDk501o5iR
 bORW4GBuL3OodJO0fpIJ1A/pVSbU3neQYe76li15QPrHLtEPLg/QAburj07AuhD2Nl3w
 AWswgE6cepUB1MWvGBCaF5EPVGDLTObU/J0duE4XZ3WXmc/yo8iqtomydc0/l9cKZKJz
 VrbQ==
X-Gm-Message-State: AOAM530DCuA8MifnUvFraAF/VeL8N9IiXIYRzGTGHmUy8hw1hbYPu9cP
 6BKceTDghislWsF2lwQSTvTV573qVKIu0lObHuDUStgnLEbS9TiS
X-Google-Smtp-Source: ABdhPJxrMqLYX0wMBklfUtvA58DZhOHxvg0NVTvikDWKHt+LF1h60JOLMndCXLTjAQ17w7Yscki3mpLK2r8VzETaerE=
X-Received: by 2002:a50:fb13:: with SMTP id d19mr5206977edq.215.1602778259459; 
 Thu, 15 Oct 2020 09:10:59 -0700 (PDT)
MIME-Version: 1.0
From: Dashamir Hoxha <dashohoxha@gmail.com>
Date: Thu, 15 Oct 2020 18:10:48 +0200
Message-ID: <CAMucfLyo8QvkLVj1N0_A3aMJYmghLbb_f=jkerGKyKx1s=ARNg@mail.gmail.com>
Subject: Using WG in a docker container
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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

I am using WG in a client-server mode, as described here:
https://gitlab.com/docker-scripts/wireguard/-/blob/master/docs/wg-usecases.md

I am installing the server in a docker container, which keeps the host clean
and makes the installation of WireGuard simple:
https://gitlab.com/docker-scripts/wireguard

I wonder whether this has any implications on the performance of the connection.
I believe it is not affected, since the docker container does not have a kernel
of its own but uses the kernel of the host. But you never know.

Has anybody tried to use WG inside a docker container before?

Regards,
Dashamir
