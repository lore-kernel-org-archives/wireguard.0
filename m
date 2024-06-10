Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A112C27C5F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Jun 2024 20:59:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac4a741a;
	Mon, 10 Jun 2024 20:59:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 91af510a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jun 2024 20:59:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7458FCE189B;
 Mon, 10 Jun 2024 20:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630D7C2BBFC;
 Mon, 10 Jun 2024 20:59:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cpT0ldoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1718053150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3HZtUU+Y3QR8/1rdZRdvvoYvPoLUFO5M0rso02kr/8=;
 b=cpT0ldoOcMMVc8Lu9sEv9JV4FT2gTFNNnFlTrxNiLJUPtVER7849+99XWSMC4dmFLxycci
 BCA83osgbke5yqf5HGbFJ6JH7hBD0GO5RNBDtny2uMzpTlaHxR7xeFWYSu8mdmTNMAopCL
 r2vKizCfZM+DSxqKGxM4HWQMRMdLxTs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9ebcf05
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 10 Jun 2024 20:59:09 +0000 (UTC)
Date: Mon, 10 Jun 2024 22:59:07 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, kernel-janitors@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH 01/14] wireguard: allowedips: replace call_rcu by
 kfree_rcu for simple kmem_cache_free callback
Message-ID: <ZmdpG7sVdPqikphi@zx2c4.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240609082726.32742-2-Julia.Lawall@inria.fr>
 <ZmW85kuO2Eje6gE9@zx2c4.com>
 <3f58c9a6-614f-4188-9a38-72c26fb42c8e@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f58c9a6-614f-4188-9a38-72c26fb42c8e@suse.cz>
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

Hi Vlastimil,

On Mon, Jun 10, 2024 at 10:38:08PM +0200, Vlastimil Babka wrote:
> On 6/9/24 4:32 PM, Jason A. Donenfeld wrote:
> > Hi Julia & Vlastimil,
> > 
> > On Sun, Jun 09, 2024 at 10:27:13AM +0200, Julia Lawall wrote:
> >> Since SLOB was removed, it is not necessary to use call_rcu
> >> when the callback only performs kmem_cache_free. Use
> >> kfree_rcu() directly.
> > 
> > Thanks, I applied this to the wireguard tree, and I'll send this out as
> > a fix for 6.10. Let me know if this is unfavorable to you and if you'd
> > like to take this somewhere yourself, in which case I'll give you my
> > ack.
> > 
> > Just a question, though, for Vlastimil -- I know that with the SLOB
> > removal, kfree() is now allowed on kmemcache'd objects. Do you plan to
> > do a blanket s/kmem_cache_free/kfree/g at some point, and then remove
> > kmem_cache_free all together?
> 
> Hmm, not really, but obligatory Cc for willy who'd love to have "one free()
> to rule them all" IIRC.
> 
> My current thinking is that kmem_cache_free() can save the kmem_cache
> lookup, or serve as a double check if debugging is enabled, and doesn't have
> much downside. If someone wants to not care about the kmem_cache pointer,
> they can use kfree(). Even convert their subsystem at will. But a mass
> conversion of everything would be rather lot of churn for not much of a
> benefit, IMHO.

Huh, interesting. I can see the practical sense in that, not causing
unnecessary churn and such.

At the same time, this doesn't appeal much to some sort of orderly part
of my mind. Either all kmalloc/kmem_cache memory is kfree()d as the rule
for what is best, or a kmalloc pairs with a kfree and a kmem_cache_alloc
pairs with a kmem_cache_free and that's the rule. And those can be
checked and enforced and so forth. But saying, "oh, well, they might
work a bit different, but whatever you want is basically fine; there's
no rhyme or reason" is somehow dissatisfying. Maybe the rule is
actually, "use kmem_cache_free if you can because it saves a pointer
lookup, but don't go out of your way to do that and certainly don't
bloat .text to make it happen," then maybe that makes sense? But I
dunno, I find myself wanting a rule and consistency. (Did you find it
annoying that in this paragraph, I used () on only one function mention
but not on the others? If so, maybe you're like me.) Maybe I should just
chill though. Anyway, only my 2¢, and my opinion here isn't worth much,
so please regard this as only a gut statement from a bystander.

Jason
