Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748A8C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:28:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 272e2e2f;
	Wed, 20 Dec 2023 04:59:07 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 704d59f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2023 04:02:24 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54d0ae6cf20so7273501a12.0
 for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2023 20:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702353743; x=1702958543; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nCw+9/cy/EfrukSFN10boRopNhCjeFQCK/dsyB+ff94=;
 b=ncpTdeXyp6Ib+3jF0VQ4rUZ4TB59iIOmceASosOgbhex6gJ+4vvCiXHt608amrYUDr
 ofJV3zxwxXvspQVuiE9nv2AaCE5kH/kSi2tutZSML60V3VSteAwm/BqgrNereHTTlBZA
 832tz4mIUWSq8XLf+KMkCD/nT/GyHiV6syIlOWq49cGGfkDv9lOcI9+i0o6cTesLSCBo
 2DeVoJcUHJQPgxCoSVO+PYb8n83OVBE1xZQjYl/5NMRiWSgOUlTBA3MEKviHzr0e4IUL
 dkUw8AAGXUPADjRDn+jacA2cd4guaCuARKsT08ACQ7Jq2SJ8VRcnHU0D4XLH1Gji1atf
 XT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702353743; x=1702958543;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCw+9/cy/EfrukSFN10boRopNhCjeFQCK/dsyB+ff94=;
 b=cfIrVjFs4+yNvjv3Go+41nWF70OPhq4eMJnqJ3StVO7rQ77Vt4mFN7HwL/7SytW5OO
 h1s8MJNmHyf37gY+HSszF6iTXP6NTw4Fa+p0QwKV6pl4L/EIwNDG9oiiJIdWlgV5ncsY
 WBdwyA0aGuFi9Umb00isFh/rZkHs0wuQuTOkFRLBcMEnxMAptHLhnmrMjS9X1Bu4FgKg
 nOhxWUO4FYwPk/YLYmBSOz4sgTopvAp+u+LGBwLBCjLIayFTXOuIWOi4bZLPgqIfr3PB
 sgfegddCfbThKanWvh+QtzcTSxwdDw1umY9rIPMVPBn3wk4jPBnHQpz+s8Hmo+tCPIkv
 H2Ng==
X-Gm-Message-State: AOJu0YzoplWseat3N5ASdaGMcekihF8M/qJ7pqXrydrNtupoDoO6042T
 vGoHnc7Obmu5J0uVI09HPc/W0BG8dQBk+Bm899FYeg2A6BtRSA==
X-Google-Smtp-Source: AGHT+IFegdgLnbOrcSEnj3YA/8bX3Yu8RDIIl7O5d5z/CeaFhCYP47UY1FJf53Wo1GAbj60zxz0031w08snQy2ip62g=
X-Received: by 2002:a05:6402:5c3:b0:54a:f72d:38b3 with SMTP id
 n3-20020a05640205c300b0054af72d38b3mr3102099edx.0.1702353743043; Mon, 11 Dec
 2023 20:02:23 -0800 (PST)
MIME-Version: 1.0
From: Koen Lekkerkerker <koenlekkerkerker@gmail.com>
Date: Mon, 11 Dec 2023 20:02:11 -0800
Message-ID: <CA+GKKxRWf5pk7dAue9fDZD+LzC0yreFLPoZV8-g33QHTg8LddA@mail.gmail.com>
Subject: Any plans to extend apple support to tvOS (Apple TV)?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Hi all,

Since tvOS 17 (released Sep 2023), Apple has added SDK support to
create VPN tvOS apps (for Apple TV hardware). I was wondering if there
are plans to develop a Wireguard tvOS app. It should hopefully be able
to reuse most of the iOS app from the wireguard-apple repo... I'd
mainly expect some work on the GUI to make it usable on TV. I'm happy
to donate a little to support such plans.

Either way: Thanks for all the awesome work on Wireguard. I've been
happily using it for a couple of years now and it works great!

Best,
Koen
