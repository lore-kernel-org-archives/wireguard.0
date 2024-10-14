Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CF4D10F41
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:18:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89ac0f40;
	Mon, 18 Nov 2024 01:38:34 +0000 (UTC)
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org
 [2001:780:45:1d:225:90ff:fe52:c662])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc946b15
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Oct 2024 11:26:06 +0000 (UTC)
Received: from [78.30.37.63] (port=43780 helo=gnumonks.org)
 by ganesha.gnumonks.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pablo@gnumonks.org>)
 id 1t0JD8-006HZk-B0; Mon, 14 Oct 2024 13:26:04 +0200
Date: Mon, 14 Oct 2024 13:26:01 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 vbabka@suse.cz, paulmck@kernel.org, Tom Talpey <tom@talpey.com>,
 Dai Ngo <Dai.Ngo@oracle.com>,
 Olga Kornievskaia <okorniev@redhat.com>, Neil Brown <neilb@suse.de>,
 linux-can@vger.kernel.org, bridge@lists.linux.dev,
 b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-block@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [PATCH 00/17] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zwz_yU8PnqU9Ngg5@calendula>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
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

On Sun, Oct 13, 2024 at 10:16:47PM +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.

Applied and squashed into single patch for netfilter these patches:

[17/17] netfilter: xt_hashlimit: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
[16/17] netfilter: expect: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
[15/17] netfilter: nf_conncount: replace call_rcu by kfree_rcu for simple kmem_cache_free callback

this update is now flying to net-next.

Thanks
