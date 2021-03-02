Return-Path: <SRS0=MYpk=IB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B8EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 08:15:59 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB2F64EAE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 08:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB2F64EAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49003808;
	Wed, 3 Mar 2021 08:15:56 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7ff58ba1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Mar 2021 23:43:55 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id v12so20697638ott.10
 for <wireguard@lists.zx2c4.com>; Tue, 02 Mar 2021 15:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9FiQf05IFvkUE1jSpzUnID4bFZbVW6qKuI3EWwfUq4k=;
 b=sc1BdmEvq3HUaiJNt7FJ8RZQEaTz5M1immjWZUyeXh9oqiqjSq3AVzwKJyH45Qgkor
 SIOh6Tg+70rDNdNIDdMUoj7Doz0wzS5wqd27+73BXokTbibsbEj030UyfxqtZajNJPWx
 rzQbeyhBLO+WGinbWyF+S45CDDZLSU/n1GG/cDuJIfTGhLd0ysAJpQzJ8AuYZfuvQQBB
 Qhg5HqrLZ2m7JMB4MEjUczW48GOM831unB6lc2ucX/k0us2wmB5yXJ/hLhsgAGKr6iuu
 q/rrMXv26wfup32AAI8XiLFiaWQTfBogroDlvgkBlrOq1dPAJlRatVWIoEkoopv+/YeM
 7vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9FiQf05IFvkUE1jSpzUnID4bFZbVW6qKuI3EWwfUq4k=;
 b=QfLhOzj/2CYF0je6lsPL5qCsG5lD9Ji8qbHRk67k24drOQZCdyDC5lVGrAntTtzDzU
 lMWnW3wvUJFM3TAAcAlFdnE4kOev66hxBE7HXIrwbFCtgxlN9edduvc9yVGxODNqD5eL
 7t7AWii1+Su/nX6TJl0ZOjbrEXe5aqKvF6coeFGClVvkR7xzM6zdjjYhHJNK+bup/jHi
 wZBmnP/koqowItF8otsOxENXiaZhQe5CKxfyG0wVzEfjltnM+c97GdlYlSCsesXyhJlY
 LNl9NNJysJV7gAbvHmFQJCha5quDg8MA09Uip7ePak0TaDvngUGKo/8f0QiZLpUK0OPc
 Y0vg==
X-Gm-Message-State: AOAM532XqlqWb5RInJj5PAgTXpX4ZISLXJELOxCM3sp1I5QsSFeAYrUt
 WIp8N3gAZC8nJBjfd8N4oT1QgC7Vl7nS8Vhvq57a7DhjdXdcNg==
X-Google-Smtp-Source: ABdhPJxx2Ga46W+PKwuDbTKT9YVwm922QSRdGM304HQzuIWQJSEdpegjLoKfBiGSsl8I67tbhSCVp4qVsvM54ylB1Bc=
X-Received: by 2002:a9d:3449:: with SMTP id v67mr19036940otb.222.1614728634230; 
 Tue, 02 Mar 2021 15:43:54 -0800 (PST)
MIME-Version: 1.0
From: Alexander Joss <alexmjoss2413@gmail.com>
Date: Tue, 2 Mar 2021 15:43:43 -0800
Message-ID: <CABqpv33QNdT17hZWfuYzc_rGmKgDfbf6iR0JAnp66BXvmfUknA@mail.gmail.com>
Subject: Recommended workaround for resolvconf bug
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 03 Mar 2021 08:15:49 +0000
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

Hello list,

I recently moved into a new place and ran into the following issue:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=939904

Any recommendations for workarounds? I tried to create a symlink like
suggested in that thread which seemed to not work and also not exactly
happy about installing another package.

Also, I have no idea why I had no issues with the previous ISP. I no
longer have the old configuration, but I think they were pretty much
identical and didn't have any DNS field setup. Any ideas on why this
became a problem?

Alex
