Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6CCC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 19:49:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C6364DF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 19:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C6364DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=labrat.space
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21f90fd5;
	Mon, 15 Mar 2021 19:49:28 +0000 (UTC)
Received: from mariecurie.labrat.space (mariecurie.labrat.space
 [116.203.185.229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 38f42e3d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 19:49:22 +0000 (UTC)
Received: from labrat.space (adsl-178-38-56-54.adslplus.ch [178.38.56.54])
 by mariecurie.labrat.space (Postfix) with ESMTPSA id C700E1AF1D27
 for <wireguard@lists.zx2c4.com>; Mon, 15 Mar 2021 20:48:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=labrat.space;
 s=201904; t=1615837697;
 bh=sOBim2qiA25rl5YhuwhH+pk91bsZBH8h3U2XuIQrJUM=; l=188;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:From:To:CC:Date:
 Subject:Content-Type:Content-Disposition:Reply-To:In-Reply-To:
 MIME-Version:Message-ID:References;
 b=JHapM0oJ5oEKR24BfHGjP/NMXTkrCxXecv5CGBj+cuE2RzBCav61XK2NrZmy1cRkE
 NlJmpiOU0iepKkx2kw++b7vXOFhxl0aK0aVZYuz1S+H8qqnDFr+8Zvrq78qgraQW23
 Q3t4C45S6AMscwBZmd+mKkUmHOi0P4vc2HixjpY8PZ7I9au11uwM8nESGIKNmKjITx
 pKlBn3ODZ8NOnjm9tFRXnL2cVzxKcRhDPUm4cikP/Bpq019OQ57EIqCDREu0JZKzl/
 LkQRvFw1MO7pw2AgMY13Vu+1mJWrO1Q9Ih0Oi4yL/Jhrkb/Hf3r2mtHodZ43xPS44R
 oMu9wdqOA3+Fg==
Date: Mon, 15 Mar 2021 20:49:19 +0100
From: Reto <reto@labrat.space>
To: wireguard@lists.zx2c4.com
Subject: Re: [ANNOUNCE] WireGuard for FreeBSD in development =?utf-8?Q?for?=
 =?utf-8?B?IDEzLnkg4oCT?= and a note of how we got here
Message-ID: <20210315194919.mj6cnnzcxhsoa7ae@feather.localdomain>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <YE9zWanlutKYTlKL@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE9zWanlutKYTlKL@zx2c4.com>
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

That's awesome!

Thanks a lot for your hard work and dedication on wireguard.
I really appreciate what you do including your willingness to work with non
Linux OSes.

Cheers,
Reto
