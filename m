Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297FFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Mar 2022 12:01:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 134c69c8;
	Sat, 19 Mar 2022 12:01:08 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f8a77a7f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 12:01:06 +0000 (UTC)
Date: Sat, 19 Mar 2022 13:01:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1647691266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89agWUDxMyONMhvbmRB+67ox1kUx/bLkXLhrOsubcxk=;
 b=Ye81CPBnQOKxDYNkTadSa1cq+6YRgkbKsXS8v/Btmduy4EYxUGpLULClH27TrSCLNJFGte
 63rU3MeHiV0GWQ1gCdaI/Pewt19G6QqlcS3DhWDqC3w6uvl2bzVCEw7vJMORdlLXKgMhiB
 kSW+T1NQA5n2zE+u/gRP6YiXUpxSsk4UdrQng3MPh21irZwX3OfNQrqzXhHcdrpwZqpO+G
 gPcmMCOe2GmF2c+dhrfYwybLZxkWYlL4AfOFujoHZ+8ckrM2FPDipDFP5ChhICABk3H+1I
 /QhftKHgImAHP90xm5sL/6ZA/bYy96fnhDfZuX+hFuhYxvLx9uaEeovA2p/SNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1647691266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89agWUDxMyONMhvbmRB+67ox1kUx/bLkXLhrOsubcxk=;
 b=HBvNqIIqd1zYhCLpxj4470xq/EMHVx7lDtey29N64WXJRicPxY/nqk8IW+dWh9PtO1iRzy
 4W792F8Rt4bHLTCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, wireguard@lists.zx2c4.com, kuba@kernel.org,
 Saeed Mahameed <saeed@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] net: remove lockdep asserts from ____napi_schedule()
Message-ID: <YjXGALddYuJeRlDk@linutronix.de>
References: <20220319004738.1068685-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319004738.1068685-1-Jason@zx2c4.com>
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

On 2022-03-18 18:47:38 [-0600], Jason A. Donenfeld wrote:
> This reverts commit fbd9a2ceba5c ("net: Add lockdep asserts to
> ____napi_schedule()."). While good in theory, in practice it causes
> issues with various drivers, and so it can be revisited earlier in the
> cycle where those drivers can be adjusted if needed.

Do you plan to address to address the wireguard warning?

> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -4277,9 +4277,6 @@ static inline void ____napi_schedule(struct softnet_data *sd,
>  {
>  	struct task_struct *thread;
>  
> -	lockdep_assert_softirq_will_run();
> -	lockdep_assert_irqs_disabled();

Could you please keep that lockdep_assert_irqs_disabled()? That is
needed regardless of the upper one.

Sebastian
