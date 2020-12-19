Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A989EC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 15:32:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B587B2072C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 15:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B587B2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=essd.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39177d3a;
	Sat, 19 Dec 2020 15:23:48 +0000 (UTC)
Received: from pmg02-out1.zxcs.nl (pmg02-out1.zxcs.nl [185.104.30.241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e16047cd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 15:23:44 +0000 (UTC)
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg02.zxcs.nl (ZXCS) with ESMTP id 7965582E3E;
 Sat, 19 Dec 2020 16:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=essd.nl;
 s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JmyguPdg9QDChl3PFA1q8SXI2atA5jF8AP9cUlNOGTs=; b=X2N40WXi3yIdxWwiDCU+Qt7CEV
 GQXFrLDnpxaVMjxU+qR/Sm0deg6TAKgkbovE5FO2r9tTGnjTywjaZlwSbVjrQ2U6IKsNVElKngx/n
 Nak6HcecKRdi/WKLo+NH1cUSzVNgGqIkk63gEyeRqO9y2NmFyUnm/0OfvvY8HOYLTzb+0E4oI+ZZR
 FxZXyft+KTElT12tOnbiXpMcsoqQzsa0J/TalRyfQ4KswHNejHeEHCzh3PuXr4YrF0pkUqhHth+gX
 zdj/4mHeQnFdKjEMWuJitw3ki+xu/szmYgagdO38b+O0j8GtKljIvp3JtFYFa6j6boGyUQaWJGxs8
 GWwoZI9A==;
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 19 Dec 2020 16:32:29 +0100
From: Erik Schuitema <erik@essd.nl>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: "BUG: scheduling while atomic" on 5.4 kernels with PREEMPT_RT
In-Reply-To: <CAHmME9qmYATYk2oV0T3OmnE4J1uTy49p09gyuRHdrGNZHKsejg@mail.gmail.com>
References: <90c10d21558d31825a56aac48692b080@essd.nl>
 <CAHmME9qmYATYk2oV0T3OmnE4J1uTy49p09gyuRHdrGNZHKsejg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <9c5569cf88048c3ceb343340e68d7564@essd.nl>
X-Sender: erik@essd.nl
X-AuthUser: erik@essd.nl
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

Jason A. Donenfeld schreef op 2020-12-19 13:15:

> Hi Erik,
> 
> Thanks for the report. I've fixed this here:
> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=8dcc75dbbe0a7b82c7c9a9388a49d1e32723d8a9
> This will be part of the next wireguard-linux-compat snapshot release.
> 
> Jason

Thanks for the quick fix!
 From your patch, I see that SIMD must be completely disabled for 5.4 
PREEMPT_RT kernels.
Is this any different for kernels >=5.6?

Best regards,
Erik

