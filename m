Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3877C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jun 2024 23:04:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7b4f567;
	Wed, 12 Jun 2024 23:04:26 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42299628
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2024 23:04:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83765CE235E;
 Wed, 12 Jun 2024 23:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77F8C116B1;
 Wed, 12 Jun 2024 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718233459;
 bh=r4XcvG9Zjydzkd1AmkZAP2xPiok2w/W0tDdIGWsKLlE=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ajo5INMFOIdUK8bTKJSOMTORqSBUVoTQMoTueScDlw6P7fEKN6L6KudGm8A/f9DV2
 vac6aDF6zFHvqVhLnecDeXpTWqKjsgyaGlyYA4jn+sYSI8iPlTZA780P5FZZ2QLokd
 TW2/efoa0ILfQDom5zYPZYttH0Zay//A6W3sEm47ScK9OEZvoBo/K4BvF3RIs/Le4w
 ckCQrAXr3PM4+Pd067rXKPEm+1PxdYqAXhlaQm4dv5OxvWFhB3hvQnXvNmk7dvAr7L
 /vanj8BKtPfnTrKefLFEyaIqF22+2EqJuMoTh97FTwq7ijzvQEu32ydoZbQcPLyXRl
 tC6o2QGNB+peQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 6C26FCE0DEA; Wed, 12 Jun 2024 16:04:19 -0700 (PDT)
Date: Wed, 12 Jun 2024 16:04:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
 bridge@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <fc3fb837-6f3c-4955-899d-1be002d17d70@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
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
Reply-To: paulmck@kernel.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Jun 12, 2024 at 04:52:57PM -0600, Jens Axboe wrote:
> On 6/12/24 4:37 PM, Paul E. McKenney wrote:
> > [PATCH 09/14] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > 	I don't see a kmem_cache_destroy(), but then again, I also don't
> > 	see the kmem_cache_create().  Unless someone can see what I am
> > 	not seeing, let's wait.
> 
> It's in that same file:
> 
> blk_ioc_init()
> 
> the cache itself never goes away, as the ioc code is not unloadable. So
> I think the change there should be fine.

Thank you, Jens!  (And to Jakub for motivating me to go look.)

So to update the scorecared, 05/14, 09/14, 11/14 and 12/14 are OK and
can go ahead.

							Thanx, Paul
