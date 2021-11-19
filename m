Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EB1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 07:16:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC7861AFB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 07:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FC7861AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e74c07de;
	Fri, 19 Nov 2021 07:14:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8f292501
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 07:13:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4544D601FF;
 Fri, 19 Nov 2021 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637306037;
 bh=oXquU0vYIQI79u0XR5EKWK0pqpE8CqaQRwwcry35rEs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FS2GsfFqtWKg9jqfFnPLzR+PJwLja2YLxE6MpEVJpXfeItZeqejPQ209hcvntD0K+
 gKu9dJXCf4qr+kPzOXk7r0ReELrP7WJ7h6LF6vyk6FZ9STFwm4yqSgDO0MEanitie7
 wUbpDbLaxG99eEtprcdJAcTYWiBVqBjmxBYxU5j93mi4bTCjv/BgCxRynwG/IoOgDE
 yOWAaPF920hhrGyycgppGuQ9TXf9msr53YHSIg7oBQPVdLA9+8vG3nVl1MXLfJgBLQ
 g6haxjq5EwgmKvNVN6tNW1etHFqUZLEOrcfbIk7bmDf6BPr7lX4Aulf0DXz5NatYlA
 vkxb7pUgHUKjA==
Date: Thu, 18 Nov 2021 23:13:55 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Gustavo A . R . Silva"
 <gustavoars@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jonathan
 Lemon <jonathan.lemon@gmail.com>, Alexander Lobakin <alobakin@pm.me>, Jakub
 Sitnicki <jakub@cloudflare.com>, Marco Elver <elver@google.com>, Willem de
 Bruijn <willemb@google.com>, Eric Dumazet <edumazet@google.com>, Cong Wang
 <cong.wang@bytedance.com>, Paolo Abeni <pabeni@redhat.com>, Talal Ahmad
 <talalahmad@google.com>, Kevin Hao <haokexin@gmail.com>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Vasily Averin <vvs@virtuozzo.com>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] skbuff: Switch structure bounds to struct_group()
Message-ID: <20211118231355.7a39d22f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211118183615.1281978-1-keescook@chromium.org>
References: <20211118183615.1281978-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 18 Nov 2021 10:36:15 -0800 Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Replace the existing empty member position markers "headers_start" and
> "headers_end" with a struct_group(). This will allow memcpy() and sizeof()
> to more easily reason about sizes, and improve readability.
> 
> "pahole" shows no size nor member offset changes to struct sk_buff.
> "objdump -d" shows no object code changes (outside of WARNs affected by
> source line number changes).

This adds ~27k of these warnings to W=1 gcc builds:

include/linux/skbuff.h:851:1: warning: directive in macro's argument list
