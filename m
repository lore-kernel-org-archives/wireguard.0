Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E9EC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jun 2024 14:32:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9afce11b;
	Sun, 9 Jun 2024 14:32:22 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6497323e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jun 2024 14:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9CC81CE0121;
 Sun,  9 Jun 2024 14:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166C0C2BD10;
 Sun,  9 Jun 2024 14:32:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="C8YNtAKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1717943530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OGc4ydJ4eusmUomyVU3xWXMC6r5K28VTQsQGs5He7n4=;
 b=C8YNtAKo6799q3e2teULRncHewZjDG0PKWBml2ejuraEwPqTBCR0yckV5DJavzJ+nyu39/
 p5Y8SEhy3MfwXFtokJDEaF5FFt7M7tNjrCxDKO5ZMoCGZV3dWJxOCcWWyoxcBduKRF7+kR
 EBoEJdoiM9FQ0K01sCrsLnMnVZ/d3AQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 979f40c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 9 Jun 2024 14:32:09 +0000 (UTC)
Date: Sun, 9 Jun 2024 16:32:06 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 01/14] wireguard: allowedips: replace call_rcu by
 kfree_rcu for simple kmem_cache_free callback
Message-ID: <ZmW85kuO2Eje6gE9@zx2c4.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240609082726.32742-2-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240609082726.32742-2-Julia.Lawall@inria.fr>
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

Hi Julia & Vlastimil,

On Sun, Jun 09, 2024 at 10:27:13AM +0200, Julia Lawall wrote:
> Since SLOB was removed, it is not necessary to use call_rcu
> when the callback only performs kmem_cache_free. Use
> kfree_rcu() directly.

Thanks, I applied this to the wireguard tree, and I'll send this out as
a fix for 6.10. Let me know if this is unfavorable to you and if you'd
like to take this somewhere yourself, in which case I'll give you my
ack.

Just a question, though, for Vlastimil -- I know that with the SLOB
removal, kfree() is now allowed on kmemcache'd objects. Do you plan to
do a blanket s/kmem_cache_free/kfree/g at some point, and then remove
kmem_cache_free all together?

Jason
