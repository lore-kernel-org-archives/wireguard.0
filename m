Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC6FC432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 09:39:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB012082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB012082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 390d0ff1;
	Wed, 25 Sep 2019 09:39:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bacd439
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 09:39:36 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab3525a7
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 09:39:36 +0000 (UTC)
Received: from localhost (unknown [65.39.69.237])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 76B5A15492860;
 Wed, 25 Sep 2019 02:39:34 -0700 (PDT)
Date: Wed, 25 Sep 2019 11:39:28 +0200 (CEST)
Message-Id: <20190925.113928.2046484827308019751.davem@davemloft.net>
To: Jason@zx2c4.com
Subject: Re: WireGuard to port to existing Crypto API
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
References: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 25 Sep 2019 02:39:35 -0700 (PDT)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Sep 2019 10:29:45 +0200

> His viewpoint has recently solidified: in order to go upstream,
> WireGuard must port to the existing crypto API, and handle the Zinc
> project separately.

I didn't say "must" anything, I suggested this as a more smoothe
and efficient way forward.

I'm also a bit disappointed that you felt the need to so quickly
make such an explosive posting to the mailing list when we've
just spoken about this amongst ourselves only 20 minutes ago.

Please proceed in a more smoothe and considerate manner for all
parties involved.

Thank you.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
