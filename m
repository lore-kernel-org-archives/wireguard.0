Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8DAC27C6E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 14:23:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f35f3772;
	Thu, 13 Jun 2024 14:17:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1c96bff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 14:17:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB4D2CE235F;
 Thu, 13 Jun 2024 14:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DC4C2BBFC;
 Thu, 13 Jun 2024 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718288260;
 bh=cY+0iwxjfi/10UJxN+zolp0hxf4e2REnIO+nP7ilZd8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q809wP6KZ6dZ2KKSNToRWIFGS+TU6NU5CCFFg8KWmjJdi9aaszmfpaIVjMuKfhLBq
 UJN5SEQEE8k67Ilrcup/14dWJNiWzw0Gq+kTmnOl3cxHd/hbJzGBv+df0UJzjBy5rb
 ZUDfjc8O2vhrMLxae6+zOsoY3P2BzyKzw8yVcyNwWMpzV3fPJ6TSsnQvWxZdGFCxDT
 3B33zlCsYWklU7myIP2EJ3nyLUoXLsT69r0HpVC2VQfvEe7SoXPLmc6THf+m1HnZiR
 lCoP/WG4vm/wiMYunXqBSRWXb9Hw5BHuRVJlFTqnizqyGgcBHJWG9D5e2NvdeRzYGl
 RfuQc0M2cv//A==
Date: Thu, 13 Jun 2024 07:17:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Julia Lawall
 <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org, Neil Brown
 <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo
 <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 linux-nfs@vger.kernel.org, linux-can@vger.kernel.org, Lai Jiangshan
 <jiangshanlai@gmail.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <20240613071738.0655ff4f@kernel.org>
In-Reply-To: <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com> <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
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

On Wed, 12 Jun 2024 20:38:02 -0700 Paul E. McKenney wrote:
> o	Make rcu_barrier() wait for kfree_rcu() objects.  (This is
> 	surprisingly complex and will wait unnecessarily in some cases.
> 	However, it does preserve current code.)

Not sure how much mental capacity for API variations we expect from
people using caches, but I feel like this would score the highest
on Rusty's API scale. I'd even venture an opinion that it's less
confusing to require cache users to have their own (trivial) callbacks
than add API variants we can't error check even at runtime...
