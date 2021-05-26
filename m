Return-Path: <SRS0=w0hv=KV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5825DC47082
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 16:06:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F795610CE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 16:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F795610CE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68a6adcb;
	Wed, 26 May 2021 16:06:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8b91d0a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622045209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iqu/7DOqgCicoqwS285zS/QoNzzkv1/2QiS3Qlv4tpg=;
 b=UluxpPJ/MkVmXCqjQ5DKNflzmCUmasLZKckszDtGGJrmeu4uUTUGHwuFmbH4JRi4E0JoNd
 x2IOT5nfXvjnla4lGoTJ3Sazv70A2reqb5Ysh9/k7fDnTDbEdqxH0WV2G93Bj565DejVg1
 VrtpsC89eO6XQG8yEVBW/Ye9c2OqV3Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e9e63445
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 16:06:49 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id r8so2757098ybb.9
 for <wireguard@lists.zx2c4.com>; Wed, 26 May 2021 09:06:49 -0700 (PDT)
X-Gm-Message-State: AOAM533VE8DLSZSN2YvojnepaFlnyjRkw94Qfvr7c/FRq9GFWD1K4HPQ
 IBj0gL0BlmptJ5uw3Wl5s16YJOplQqxd9d+soOs=
X-Google-Smtp-Source: ABdhPJxtHIySthlo2YJGqg3e6Lk1JAeJ/aHUlPZrvwPwoWSYkudvlII8yB9ouu0VlZNGQsnEUdQs55hbX43hdENOuRY=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr50469279ybp.279.1622045208763; 
 Wed, 26 May 2021 09:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <Vi69GDdtlT6JOff7GBHQU7rUExHN6badu-eM7C611Xa91MM_S8tGkmt4OVpjDSLSH2Kag1jS8VUlCIXdXjiMI6uKHot-v2KGXTBi8oK-CC8=@postermail.com>
 <CAHmME9rT5HgrC5wP-V5sLkz_qwkRFPdEJKhPTEaXr-L6Qq697w@mail.gmail.com>
 <bLrNvJdSf_UdV1e-d8nQ_4dNnzP0I7DhX2NPIFkVs93k7herY4-36gEJDPhcST5F_Z-A2F0aTPxU-Di4p9R3FgynPsVH-4jAtR2lfTZnRJs=@postermail.com>
 <CAHmME9p1Kp5zsh-QX0VDD70q--_QtoXOiuBxWC-h9uTpq=_TFw@mail.gmail.com>
In-Reply-To: <CAHmME9p1Kp5zsh-QX0VDD70q--_QtoXOiuBxWC-h9uTpq=_TFw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 May 2021 18:06:38 +0200
X-Gmail-Original-Message-ID: <CAHmME9rbTxxCO_geLHD1=WP7yXb1auo0Pc9wtRBrGnzaoY4cnA@mail.gmail.com>
Message-ID: <CAHmME9rbTxxCO_geLHD1=WP7yXb1auo0Pc9wtRBrGnzaoY4cnA@mail.gmail.com>
Subject: Re: wireguard-android: tunnel not working after reboot
To: lists.zx2c4.com.486782@postermail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Harsh Shandilya <me@msfjarvis.dev>
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

Kind of terrible (for the reasons mentioned within), but:
https://git.zx2c4.com/wireguard-android/commit/?id=d139fd0c5cabe2db496e78477fdf57142ce97a36
