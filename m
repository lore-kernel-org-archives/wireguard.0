Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66662C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jul 2022 13:21:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id df0ad8e7;
	Tue, 5 Jul 2022 13:21:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8815dacf
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2022 13:21:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B77E16134B;
 Tue,  5 Jul 2022 13:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026C5C341C7;
 Tue,  5 Jul 2022 13:21:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="exJSyJP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657027297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bTCbFyvLD181ceTl81n4Rvx4O+hydwDMRZXrAGsIYRE=;
 b=exJSyJP4ISXCOZvWNpBvhPPTL/CtxyD27N/3kS4hzlC0JATuugA2oZNG/y4KZSMGL5rwRz
 odfuFRwk8d8WD9c5ca/stYOc5TsaM0lhwPHX1YskNNE8ii11z+6exHtXdj3bbNxqsI7S+d
 EzIs6hn3WmyDOa3ft4qCIs3Vh1IKfL4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75734888
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 5 Jul 2022 13:21:37 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:21:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Vlad Dronov <vdronov@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wireguard: Kconfig: select CRYPTO_CHACHA_S390
Message-ID: <YsQ63c3mkxKRC4v0@zx2c4.com>
References: <20220704191535.76006-1-vdronov@redhat.com>
 <YsOKj/GE2Mb2UsYa@zx2c4.com> <YsOY/eWq7gRjXJK1@zx2c4.com>
 <CAMusb+RLB6-oz10yp9Cdigt0TeJ_85M30bH8snZaeM2CyvUiYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMusb+RLB6-oz10yp9Cdigt0TeJ_85M30bH8snZaeM2CyvUiYA@mail.gmail.com>
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

Hi Vlad,

On Tue, Jul 05, 2022 at 02:07:40PM +0200, Vlad Dronov wrote:
> Whoa, that's... funny. Honestly, I was always wondering why CRYPTO_CHACHA_S390
> and friends live in drivers/crypto/Kconfig. Now I know why.

Well... now you know that somebody else thought it was strange too. But
not quite why. At least I don't know why, other than assuming it was
a simple human mistake. But maybe the s390 developers will have an
interesting explanation or something. Herbert CC'd them into that
thread, so I look forward to seeing their response (if any).

Jason
