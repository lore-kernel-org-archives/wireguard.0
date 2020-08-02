Return-Path: <SRS0=TUfp=BM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83311C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Aug 2020 04:32:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5B4207DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Aug 2020 04:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0AFlXva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5B4207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3ce566a;
	Sun, 2 Aug 2020 04:07:47 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ea74e69
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Aug 2020 04:07:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i19so18810982lfj.8
 for <wireguard@lists.zx2c4.com>; Sat, 01 Aug 2020 21:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FDWescp1HA7XIKJTvxw8hpgXTcWzBZwShF640C3QNDw=;
 b=l0AFlXvabeexq6I1BV/iqrL0+85YQ7vLhC1kTtG+V7pwapfsg/zE9n7dfiBs7EtnF0
 KOEg9OJoiLfPhB+uWeB2o9XHlxcRdENHtTWTzA51JU4lWVVti1cEV2Z5jmmSIQhEDjlo
 luXLETOjXg1QV0hHskE9wFzQOt2EHuUaIy8w3yaXfSPPbsGuwaQy2iJy7AGTF5OZkzeF
 os+xQuJniAjx0LV7HGuQFrt5T6BEiTo95rOmH1VD1Rbq7Fzhq5gATK/3Pbb4oNyj4kKl
 0B83lFNf5+nSP2G9WELZvKpf1QbYdWNkP7e04kJYVoxC0yJTwKLAwareqqKDkO6cHsDf
 TyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FDWescp1HA7XIKJTvxw8hpgXTcWzBZwShF640C3QNDw=;
 b=LKdNHxaHjLyr87snk5VxOKQDNYtkKmEe/N/VTnEOWAIObobi1wy27AjHu9/xfg+Fsd
 8M25gWaYK6hBMMXzoKubwFgYqgItvtrZd+2zfAU++jpONhUPkf0fgyg0+g73G/vsAHmJ
 cGISmw6ATNCObfLGbwrzodLPpaadwZakFtiU5aT8koPSAiiOW1qMlvuUcq3Udfza03QT
 feENOOfyVmMO1IIlSS3hNTCnOMGKur2G7/FdvNd1nTYwBlaTADA2N6jL6e+fDY+oT8D6
 /DAi8MyZaTRirdX7ZwZDzVa92qWti/KPgNh5xvFIz28JQUaorOEC1BTRHvN1hJEmBt0H
 gpZg==
X-Gm-Message-State: AOAM531oi5KBQcZuy1oNobdhvOz7Aa9dcRvWdEIRGzw9wd5fmW7RElTC
 HVEn2tAgDnLSg8QnjfonPG1Lvrz8LUzRxVJ5RfdqqDRq
X-Google-Smtp-Source: ABdhPJwuESp5MikDFB3sCKT9K/BV4gy14ZVBxsLPTpheB2L7JVASwzPbHn5pzwyRNNpBAzlYY1zs6WhHMrLsM92/Cv0=
X-Received: by 2002:a19:4f11:: with SMTP id d17mr5503864lfb.48.1596342704974; 
 Sat, 01 Aug 2020 21:31:44 -0700 (PDT)
MIME-Version: 1.0
From: Reid Rankin <reidrankin@gmail.com>
Date: Sun, 2 Aug 2020 00:31:08 -0400
Message-ID: <CAMaqUZ2UxEC+Fz4a=dp7R=6Ca=+TRH_u1cqhEEH0q1PA6hLvBg@mail.gmail.com>
Subject: wg-lla
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

A while ago, I included a link to a Gist containing `wg-lla.sh`, a
utility for calculating and assigning IPv6 Link-Local Addresses to
WireGuard peers based on a hash of their public key, which was based
on a shell-script implementation of Blake2s. At the time it was
intended as a proof-of-concept sort of thing, but I've had some
interested parties contact me about using it -- since I neglected to
stick on a license.

So I've rectified that error, and promoted it to a proper repo. Now
people can hopefully find it, as well as raise issues and make PRs.
Hope it's useful!

https://github.com/reidrankin/wg-lla

--Reid
