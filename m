Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61422C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:37:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 929FE21741
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fdYHvr6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 929FE21741
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7237b3d1;
	Sat, 8 Feb 2020 21:36:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 262ffaec
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:36:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe2fb227
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:36:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee63da6b
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=RyVGrdLFj5vPlQ591rEdn5FKco0=; b=fdYHvr
 6GLi7fd5+843eoW8ujtuUqUonaDk+LCv34VqhniSU2DGBU7QCXx2M5BlZpH1x6jN
 /q7uRSq6xzVtYl40vvNxSwFJ693QpEwG2sbuG+dD4Tq3l50vA13GWttg7pMNYCu9
 ipEh1Kms1SEPU+bTBc5A+TFyIze/Nh279Fjq4bVmLtYqWk3sBOyH5Z51wZHrEVBR
 QP0gUWs83aUYWOWSoHy8bEatWCQf4j4d2BEw5eA87tjSEIYKSjgbH5vScVEsPFNt
 OdBYYtajBnOQhzR4HTgCIq6SKFR+CPfv5HCBX63FsK5lRcy9d8msdxVGAdRTnoI4
 napQ5mZo53NV9qSw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7dbdfc1d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:36:15 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id i1so5595762oie.8
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:37:38 -0800 (PST)
X-Gm-Message-State: APjAAAX7DpLWZd6S0tW0bRHWMXFk7nacts472bKGsb0k9ZZzJ6xYzm5q
 ILurJ9PgWjGkwCxIUYGBTbRnZnV2uGxmBhqslEE=
X-Google-Smtp-Source: APXvYqzC12FlxDz96VsuM+1RneqDBWzq8GEO2CHLdRk0dUayB71mAXYpC/Ff0KVpNeXQr9FJ6ri9ZCcmuPFkxCHy68E=
X-Received: by 2002:aca:2109:: with SMTP id 9mr5945716oiz.119.1581197857629;
 Sat, 08 Feb 2020 13:37:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJFy1VX+ue2JskKZEjnOkMdC6sGVLU=fUSZ_BNOqD__SpZ5EYg@mail.gmail.com>
In-Reply-To: <CAJFy1VX+ue2JskKZEjnOkMdC6sGVLU=fUSZ_BNOqD__SpZ5EYg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 22:37:26 +0100
X-Gmail-Original-Message-ID: <CAHmME9rwuUDDRX1Z9w1ir56ZvYZB-AZcebqJX3BwyNd5wHUx7g@mail.gmail.com>
Message-ID: <CAHmME9rwuUDDRX1Z9w1ir56ZvYZB-AZcebqJX3BwyNd5wHUx7g@mail.gmail.com>
Subject: Re: Usability issue in MacOS
To: Yoni Leitersdorf <litelite@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Talk to Apple about that:

https://developer.apple.com/documentation/networkextension/personal_vpn/vpn_on_demand_rules

I'm hesitant to stray too far from the analogies that they set up,
even if this is geared toward developers, because inevitably people
start googling, and I'd rather them find what they're searching for.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
