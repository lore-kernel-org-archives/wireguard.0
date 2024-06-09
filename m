Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0051FC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jun 2024 14:40:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81a8fdc0;
	Sun, 9 Jun 2024 14:36:19 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2b9f1149
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jun 2024 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=qCa9AGh+fq/1VReLn9hghMXIAlqi9wewi4dObNvl2UE=;
 b=h6kIxiZW/dd5uSxCiMQ/CALnhPG8doWfxvHov7Bfnq8f9kW3czxcYGrS
 mEPMuHLltMD3xw+m4HWBjt3QCCDle7/X0SuZWD3hD1jy/dg91fiWfINpK
 jqi1Ts2BPOeiqQUZONpCbJQGgZrL+vyhNq+VNaR8jMW4r5Xi9iJrgXLJY s=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,225,1712613600"; d="scan'208";a="169717092"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:36:16 +0200
Date: Sun, 9 Jun 2024 16:36:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Julia Lawall <Julia.Lawall@inria.fr>, kernel-janitors@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Paul E . McKenney" <paulmck@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu
 for simple kmem_cache_free callback
In-Reply-To: <ZmW85kuO2Eje6gE9@zx2c4.com>
Message-ID: <alpine.DEB.2.22.394.2406091636010.3474@hadrien>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240609082726.32742-2-Julia.Lawall@inria.fr> <ZmW85kuO2Eje6gE9@zx2c4.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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



On Sun, 9 Jun 2024, Jason A. Donenfeld wrote:

> Hi Julia & Vlastimil,
>
> On Sun, Jun 09, 2024 at 10:27:13AM +0200, Julia Lawall wrote:
> > Since SLOB was removed, it is not necessary to use call_rcu
> > when the callback only performs kmem_cache_free. Use
> > kfree_rcu() directly.
>
> Thanks, I applied this to the wireguard tree, and I'll send this out as
> a fix for 6.10. Let me know if this is unfavorable to you and if you'd
> like to take this somewhere yourself, in which case I'll give you my
> ack.

Please push it onward.

julia

>
> Just a question, though, for Vlastimil -- I know that with the SLOB
> removal, kfree() is now allowed on kmemcache'd objects. Do you plan to
> do a blanket s/kmem_cache_free/kfree/g at some point, and then remove
> kmem_cache_free all together?
>
> Jason
>
