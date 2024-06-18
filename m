Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18763C27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2024 16:48:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa778386;
	Tue, 18 Jun 2024 16:48:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40bfd62d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2024 16:48:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86154619D9;
 Tue, 18 Jun 2024 16:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFD3C3277B;
 Tue, 18 Jun 2024 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718729330;
 bh=VfDzdOd/PBJM9nA6j0ZKm8qJpomLK1rSxnmNGkn9m68=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=HrsVOBE2UZX8+X+ns3WoipKKPnQlrXf46/WVd5Z8R08kgkeXyQZpJ3xbNp53mW9mR
 heTRYbFX6QLq79sc4TX3gceaCliIC49fBjdslD9tSepbzuQXYzZj/oR4qg+oxqMyUR
 SCgHWoeY3y1GSVheT8IwuCrjcwTBFwfw/ymCcCO5j+RDeWy1MibPA2MpM/dmvBceqn
 Md4s8MgF8TnOTenuVi09xWbCE2J+QqwjQUEIo4ueSno6A8qEYdy9kKtKI9Xs5ZQFI+
 q4wO1JBGHQ9K5vJ3V09XPmAG/dclEEFW0Db1j3pHWmIKKjhVTZmif7rRNHjHUNgQzz
 SZsG2RVZhy0Qg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id B9F83CE05B6; Tue, 18 Jun 2024 09:48:49 -0700 (PDT)
Date: Tue, 18 Jun 2024 09:48:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
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
 kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
References: <Zmov7ZaL-54T9GiM@zx2c4.com> <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnFT1Czb8oRb0SE7@pc636>
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

On Tue, Jun 18, 2024 at 11:31:00AM +0200, Uladzislau Rezki wrote:
> > On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
> > >> +
> > >> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> > >> +
> > >> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> > > It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> > > wanted to avoid initially.
> > 
> > I wanted to avoid new API or flags for kfree_rcu() users and this would
> > be achieved. The barrier is used internally so I don't consider that an
> > API to avoid. How difficult is the implementation is another question,
> > depending on how the current batching works. Once (if) we have sheaves
> > proven to work and move kfree_rcu() fully into SLUB, the barrier might
> > also look different and hopefully easier. So maybe it's not worth to
> > invest too much into that barrier and just go for the potentially
> > longer, but easier to implement?
> > 
> Right. I agree here. If the cache is not empty, OK, we just defer the
> work, even we can use a big 21 seconds delay, after that we just "warn"
> if it is still not empty and leave it as it is, i.e. emit a warning and
> we are done.
> 
> Destroying the cache is not something that must happen right away. 

OK, I have to ask...

Suppose that the cache is created and destroyed by a module and
init/cleanup time, respectively.  Suppose that this module is rmmod'ed
then very quickly insmod'ed.

Do we need to fail the insmod if the kmem_cache has not yet been fully
cleaned up?  If not, do we have two versions of the same kmem_cache in
/proc during the overlap time?

							Thanx, Paul

> > > Since you do it asynchronous can we just repeat
> > > and wait until it a cache is furry freed?
> > 
> > The problem is we want to detect the cases when it's not fully freed
> > because there was an actual read. So at some point we'd need to stop the
> > repeats because we know there can no longer be any kfree_rcu()'s in
> > flight since the kmem_cache_destroy() was called.
> > 
> Agree. As noted above, we can go with 21 seconds(as an example) interval
> and just perform destroy(without repeating).
> 
> --
> Uladzislau Rezki
