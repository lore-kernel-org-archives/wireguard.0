Return-Path: <SRS0=fgN8=HT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A4AC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Feb 2021 18:36:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A386464E2F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Feb 2021 18:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A386464E2F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 310fa1c5;
	Wed, 17 Feb 2021 18:36:40 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6091094
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Feb 2021 18:36:38 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1613586997; bh=C5c/43YodLqQWa3d8N76WRuJiBy23JlOi+c+S/WLP+k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vtn4XEgTwsMYkupx9/sAJAf5ehqOr5YgvabtxNSOH3MO/D6q8UoUMbcipPCRvZFRi
 tNn1J/7hS9QCDsi9uzoQbaJgoifKIOgrC1ZZ9zqR9il675rqOQXySzGAQDf8N2gIUA
 zGWKUrsVFL4m3RwAHM7KNNVqNJ9xAxmTp601UEYpC4tf0kI9oljVd/Sp2m7v7i5/CX
 v/VfOpg/eANGGBoOk4+9X/kQaHaHliYBbaOZaH/gIaiLGE1j1SRUliCQY1cpF9HP/L
 Y25iOTCgooWyypMBe4Mkirw+a0I4DGq1Q3gpZDAZj24H7vk3wdI6GTXt5QFGngQyFw
 JeT1eiqknTk7g==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
In-Reply-To: <20210208133816.45333-1-Jason@zx2c4.com>
References: <20210208133816.45333-1-Jason@zx2c4.com>
Date: Wed, 17 Feb 2021 19:36:35 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87czwymtho.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Having two ring buffers per-peer means that every peer results in two
> massive ring allocations. On an 8-core x86_64 machine, this commit
> reduces the per-peer allocation from 18,688 bytes to 1,856 bytes, which
> is an 90% reduction. Ninety percent! With some single-machine
> deployments approaching 400,000 peers, we're talking about a reduction
> from 7 gigs of memory down to 700 megs of memory.
>
> In order to get rid of these per-peer allocations, this commit switches
> to using a list-based queueing approach. Currently GSO fragments are
> chained together using the skb->next pointer, so we form the per-peer
> queue around the unused skb->prev pointer, which makes sense because the
> links are pointing backwards.

"which makes sense because the links are pointing backwards" - huh?

> Multiple cores can write into the queue at any given time, because its
> writes occur in the start_xmit path or in the udp_recv path. But reads
> happen in a single workqueue item per-peer, amounting to a
> multi-producer, single-consumer paradigm.
>
> The MPSC queue is implemented locklessly and never blocks. However, it
> is not linearizable (though it is serializable), with a very tight and
> unlikely race on writes, which, when hit (about 0.15% of the time on a
> fully loaded 16-core x86_64 system), causes the queue reader to
> terminate early. However, because every packet sent queues up the same
> workqueue item after it is fully added, the queue resumes again, and
> stopping early isn't actually a problem, since at that point the packet
> wouldn't have yet been added to the encryption queue. These properties
> allow us to avoid disabling interrupts or spinning.

Wow, so this was a fascinating rabbit hole into the concurrent algorithm
realm, thanks to Dmitry's link to his original posting of the algorithm.
Maybe referencing the origin of the algorithm would be nice for context
and posterity (as well as commenting it so the original properties are
not lost if the source should disappear)?

> Performance-wise, ordinarily list-based queues aren't preferable to
> ringbuffers, because of cache misses when following pointers around.
> However, we *already* have to follow the adjacent pointers when working
> through fragments, so there shouldn't actually be any change there. A
> potential downside is that dequeueing is a bit more complicated, but the
> ptr_ring structure used prior had a spinlock when dequeueing, so all and
> all the difference appears to be a wash.
>
> Actually, from profiling, the biggest performance hit, by far, of this
> commit winds up being atomic_add_unless(count, 1, max) and atomic_
> dec(count), which account for the majority of CPU time, according to
> perf. In that sense, the previous ring buffer was superior in that it
> could check if it was full by head==tail, which the list-based approach
> cannot do.

Are these performance measurements are based on micro-benchmarks of the
queueing structure, or overall wireguard performance? Do you see any
measurable difference in the overall performance (i.e., throughput
drop)? And what about relative to using one of the existing skb queueing
primitives in the kernel? Including some actual numbers would be nice to
justify adding yet-another skb queueing scheme to the kernel :)

I say this also because the actual queueing of the packets has never
really shown up on any performance radar in the qdisc and mac80211
layers, which both use traditional spinlock-protected queueing
structures. Now Wireguard does have a somewhat unusual structure with
the MPSC pattern, so it may of course be different here. But quantifying
that would be good; also for figuring out if this algorithm might be
useful in other areas as well (and don't get me wrong, I'm fascinated by
it!).

> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Hoping to get some feedback here from people running massive deployments
> and running into ram issues, as well as Dmitry on the queueing semantics
> (the mpsc queue is his design), before I send this to Dave for merging.
> These changes are quite invasive, so I don't want to get anything wrong.
>
>  drivers/net/wireguard/device.c   | 12 ++---
>  drivers/net/wireguard/device.h   | 15 +++---
>  drivers/net/wireguard/peer.c     | 29 ++++-------
>  drivers/net/wireguard/peer.h     |  4 +-
>  drivers/net/wireguard/queueing.c | 82 +++++++++++++++++++++++++-------
>  drivers/net/wireguard/queueing.h | 45 +++++++++++++-----
>  drivers/net/wireguard/receive.c  | 16 +++----
>  drivers/net/wireguard/send.c     | 31 +++++-------
>  8 files changed, 141 insertions(+), 93 deletions(-)
>
> diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
> index cd51a2afa28e..d744199823b3 100644
> --- a/drivers/net/wireguard/device.c
> +++ b/drivers/net/wireguard/device.c
> @@ -234,8 +234,8 @@ static void wg_destruct(struct net_device *dev)
>  	destroy_workqueue(wg->handshake_receive_wq);
>  	destroy_workqueue(wg->handshake_send_wq);
>  	destroy_workqueue(wg->packet_crypt_wq);
> -	wg_packet_queue_free(&wg->decrypt_queue, true);
> -	wg_packet_queue_free(&wg->encrypt_queue, true);
> +	wg_packet_queue_free(&wg->decrypt_queue);
> +	wg_packet_queue_free(&wg->encrypt_queue);
>  	rcu_barrier(); /* Wait for all the peers to be actually freed. */
>  	wg_ratelimiter_uninit();
>  	memzero_explicit(&wg->static_identity, sizeof(wg->static_identity));
> @@ -337,12 +337,12 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
>  		goto err_destroy_handshake_send;
>  
>  	ret = wg_packet_queue_init(&wg->encrypt_queue, wg_packet_encrypt_worker,
> -				   true, MAX_QUEUED_PACKETS);
> +				   MAX_QUEUED_PACKETS);
>  	if (ret < 0)
>  		goto err_destroy_packet_crypt;
>  
>  	ret = wg_packet_queue_init(&wg->decrypt_queue, wg_packet_decrypt_worker,
> -				   true, MAX_QUEUED_PACKETS);
> +				   MAX_QUEUED_PACKETS);
>  	if (ret < 0)
>  		goto err_free_encrypt_queue;
>  
> @@ -367,9 +367,9 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
>  err_uninit_ratelimiter:
>  	wg_ratelimiter_uninit();
>  err_free_decrypt_queue:
> -	wg_packet_queue_free(&wg->decrypt_queue, true);
> +	wg_packet_queue_free(&wg->decrypt_queue);
>  err_free_encrypt_queue:
> -	wg_packet_queue_free(&wg->encrypt_queue, true);
> +	wg_packet_queue_free(&wg->encrypt_queue);
>  err_destroy_packet_crypt:
>  	destroy_workqueue(wg->packet_crypt_wq);
>  err_destroy_handshake_send:
> diff --git a/drivers/net/wireguard/device.h b/drivers/net/wireguard/device.h
> index 4d0144e16947..cb919f2ad1f8 100644
> --- a/drivers/net/wireguard/device.h
> +++ b/drivers/net/wireguard/device.h
> @@ -27,13 +27,14 @@ struct multicore_worker {
>  
>  struct crypt_queue {
>  	struct ptr_ring ring;
> -	union {
> -		struct {
> -			struct multicore_worker __percpu *worker;
> -			int last_cpu;
> -		};
> -		struct work_struct work;
> -	};
> +	struct multicore_worker __percpu *worker;
> +	int last_cpu;
> +};
> +
> +struct prev_queue {
> +	struct sk_buff *head, *tail, *peeked;
> +	struct { struct sk_buff *next, *prev; } empty;
> +	atomic_t count;
>  };
>  
>  struct wg_device {
> diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
> index b3b6370e6b95..1969fc22d47e 100644
> --- a/drivers/net/wireguard/peer.c
> +++ b/drivers/net/wireguard/peer.c
> @@ -32,27 +32,22 @@ struct wg_peer *wg_peer_create(struct wg_device *wg,
>  	peer = kzalloc(sizeof(*peer), GFP_KERNEL);
>  	if (unlikely(!peer))
>  		return ERR_PTR(ret);
> -	peer->device = wg;
> +	if (dst_cache_init(&peer->endpoint_cache, GFP_KERNEL))
> +		goto err;
>  
> +	peer->device = wg;
>  	wg_noise_handshake_init(&peer->handshake, &wg->static_identity,
>  				public_key, preshared_key, peer);
> -	if (dst_cache_init(&peer->endpoint_cache, GFP_KERNEL))
> -		goto err_1;
> -	if (wg_packet_queue_init(&peer->tx_queue, wg_packet_tx_worker, false,
> -				 MAX_QUEUED_PACKETS))
> -		goto err_2;
> -	if (wg_packet_queue_init(&peer->rx_queue, NULL, false,
> -				 MAX_QUEUED_PACKETS))
> -		goto err_3;
> -
>  	peer->internal_id = atomic64_inc_return(&peer_counter);
>  	peer->serial_work_cpu = nr_cpumask_bits;
>  	wg_cookie_init(&peer->latest_cookie);
>  	wg_timers_init(peer);
>  	wg_cookie_checker_precompute_peer_keys(peer);
>  	spin_lock_init(&peer->keypairs.keypair_update_lock);
> -	INIT_WORK(&peer->transmit_handshake_work,
> -		  wg_packet_handshake_send_worker);
> +	INIT_WORK(&peer->transmit_handshake_work, wg_packet_handshake_send_worker);
> +	INIT_WORK(&peer->transmit_packet_work, wg_packet_tx_worker);

It's not quite clear to me why changing the queue primitives requires
adding another work queue?

> +	wg_prev_queue_init(&peer->tx_queue);
> +	wg_prev_queue_init(&peer->rx_queue);
>  	rwlock_init(&peer->endpoint_lock);
>  	kref_init(&peer->refcount);
>  	skb_queue_head_init(&peer->staged_packet_queue);
> @@ -68,11 +63,7 @@ struct wg_peer *wg_peer_create(struct wg_device *wg,
>  	pr_debug("%s: Peer %llu created\n", wg->dev->name, peer->internal_id);
>  	return peer;
>  
> -err_3:
> -	wg_packet_queue_free(&peer->tx_queue, false);
> -err_2:
> -	dst_cache_destroy(&peer->endpoint_cache);
> -err_1:
> +err:
>  	kfree(peer);
>  	return ERR_PTR(ret);
>  }
> @@ -197,8 +188,8 @@ static void rcu_release(struct rcu_head *rcu)
>  	struct wg_peer *peer = container_of(rcu, struct wg_peer, rcu);
>  
>  	dst_cache_destroy(&peer->endpoint_cache);
> -	wg_packet_queue_free(&peer->rx_queue, false);
> -	wg_packet_queue_free(&peer->tx_queue, false);
> +	WARN_ON(wg_prev_queue_dequeue(&peer->tx_queue) || peer->tx_queue.peeked);
> +	WARN_ON(wg_prev_queue_dequeue(&peer->rx_queue) || peer->rx_queue.peeked);
>  
>  	/* The final zeroing takes care of clearing any remaining handshake key
>  	 * material and other potentially sensitive information.
> diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
> index aaff8de6e34b..8d53b687a1d1 100644
> --- a/drivers/net/wireguard/peer.h
> +++ b/drivers/net/wireguard/peer.h
> @@ -36,7 +36,7 @@ struct endpoint {
>  
>  struct wg_peer {
>  	struct wg_device *device;
> -	struct crypt_queue tx_queue, rx_queue;
> +	struct prev_queue tx_queue, rx_queue;
>  	struct sk_buff_head staged_packet_queue;
>  	int serial_work_cpu;
>  	bool is_dead;
> @@ -46,7 +46,7 @@ struct wg_peer {
>  	rwlock_t endpoint_lock;
>  	struct noise_handshake handshake;
>  	atomic64_t last_sent_handshake;
> -	struct work_struct transmit_handshake_work, clear_peer_work;
> +	struct work_struct transmit_handshake_work, clear_peer_work, transmit_packet_work;
>  	struct cookie latest_cookie;
>  	struct hlist_node pubkey_hash;
>  	u64 rx_bytes, tx_bytes;
> diff --git a/drivers/net/wireguard/queueing.c b/drivers/net/wireguard/queueing.c
> index 71b8e80b58e1..a72380ce97dd 100644
> --- a/drivers/net/wireguard/queueing.c
> +++ b/drivers/net/wireguard/queueing.c
> @@ -9,8 +9,7 @@ struct multicore_worker __percpu *
>  wg_packet_percpu_multicore_worker_alloc(work_func_t function, void *ptr)
>  {
>  	int cpu;
> -	struct multicore_worker __percpu *worker =
> -		alloc_percpu(struct multicore_worker);
> +	struct multicore_worker __percpu *worker = alloc_percpu(struct multicore_worker);
>  
>  	if (!worker)
>  		return NULL;
> @@ -23,7 +22,7 @@ wg_packet_percpu_multicore_worker_alloc(work_func_t function, void *ptr)
>  }
>  
>  int wg_packet_queue_init(struct crypt_queue *queue, work_func_t function,
> -			 bool multicore, unsigned int len)
> +			 unsigned int len)
>  {
>  	int ret;
>  
> @@ -31,25 +30,74 @@ int wg_packet_queue_init(struct crypt_queue *queue, work_func_t function,
>  	ret = ptr_ring_init(&queue->ring, len, GFP_KERNEL);
>  	if (ret)
>  		return ret;
> -	if (function) {
> -		if (multicore) {
> -			queue->worker = wg_packet_percpu_multicore_worker_alloc(
> -				function, queue);
> -			if (!queue->worker) {
> -				ptr_ring_cleanup(&queue->ring, NULL);
> -				return -ENOMEM;
> -			}
> -		} else {
> -			INIT_WORK(&queue->work, function);
> -		}
> +	queue->worker = wg_packet_percpu_multicore_worker_alloc(function, queue);
> +	if (!queue->worker) {
> +		ptr_ring_cleanup(&queue->ring, NULL);
> +		return -ENOMEM;
>  	}
>  	return 0;
>  }
>  
> -void wg_packet_queue_free(struct crypt_queue *queue, bool multicore)
> +void wg_packet_queue_free(struct crypt_queue *queue)
>  {
> -	if (multicore)
> -		free_percpu(queue->worker);
> +	free_percpu(queue->worker);
>  	WARN_ON(!__ptr_ring_empty(&queue->ring));
>  	ptr_ring_cleanup(&queue->ring, NULL);
>  }
> +

It would be nice to add a comment block here explaining the algorithm,
with a link to the original implementation and the same reasoning as you
have in the commit message. And some of the explanation from the
original thread would be nice. But if you do copy that, please for the
love of $DEITY, expand the acronyms - it took me half an hour of
extremely frustrating Googling to figure out what PDR means! :D

(I finally found out that it means "Partial copy-on-write Deferred
Reclamation" in another of Dmitry's replies here:
https://community.intel.com/t5/Intel-Moderncode-for-Parallel/Non-blocking-data-structures-vs-garbage-collection/td-p/847215 )

> +#define NEXT(skb) ((skb)->prev)

In particular, please explain this oxymoronic define :)

> +#define STUB(queue) ((struct sk_buff *)&queue->empty)
> +
> +void wg_prev_queue_init(struct prev_queue *queue)
> +{
> +	NEXT(STUB(queue)) = NULL;
> +	queue->head = queue->tail = STUB(queue);
> +	queue->peeked = NULL;
> +	atomic_set(&queue->count, 0);
> +}
> +
> +static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb)
> +{
> +	WRITE_ONCE(NEXT(skb), NULL);
> +	smp_wmb();
> +	WRITE_ONCE(NEXT(xchg_relaxed(&queue->head, skb)), skb);

While this is nice and compact it's also really hard to read. It's also
hiding the "race condition" between the xchg() and setting the next ptr.
So why not split it between two lines and make the race explicit with a
comment?

> +}
> +
> +bool wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb)
> +{
> +	if (!atomic_add_unless(&queue->count, 1, MAX_QUEUED_PACKETS))
> +		return false;
> +	__wg_prev_queue_enqueue(queue, skb);
> +	return true;
> +}
> +
> +struct sk_buff *wg_prev_queue_dequeue(struct prev_queue *queue)
> +{
> +	struct sk_buff *tail = queue->tail, *next = smp_load_acquire(&NEXT(tail));
> +
> +	if (tail == STUB(queue)) {
> +		if (!next)
> +			return NULL;
> +		queue->tail = next;
> +		tail = next;
> +		next = smp_load_acquire(&NEXT(next));
> +	}
> +	if (next) {
> +		queue->tail = next;
> +		atomic_dec(&queue->count);
> +		return tail;
> +	}
> +	if (tail != READ_ONCE(queue->head))
> +		return NULL;
> +	__wg_prev_queue_enqueue(queue, STUB(queue));
> +	next = smp_load_acquire(&NEXT(tail));
> +	if (next) {
> +		queue->tail = next;
> +		atomic_dec(&queue->count);
> +		return tail;
> +	}
> +	return NULL;
> +}

I don't see anywhere that you're clearing the next pointer (or prev, as
it were). Which means you'll likely end up passing packets up or down
the stack with that pointer still set, right? See this commit for a
previous instance where something like this has lead to issues:

22f6bbb7bcfc ("net: use skb_list_del_init() to remove from RX sublists")

> +#undef NEXT
> +#undef STUB
> diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> index dfb674e03076..4ef2944a68bc 100644
> --- a/drivers/net/wireguard/queueing.h
> +++ b/drivers/net/wireguard/queueing.h
> @@ -17,12 +17,13 @@ struct wg_device;
>  struct wg_peer;
>  struct multicore_worker;
>  struct crypt_queue;
> +struct prev_queue;
>  struct sk_buff;
>  
>  /* queueing.c APIs: */
>  int wg_packet_queue_init(struct crypt_queue *queue, work_func_t function,
> -			 bool multicore, unsigned int len);
> -void wg_packet_queue_free(struct crypt_queue *queue, bool multicore);
> +			 unsigned int len);
> +void wg_packet_queue_free(struct crypt_queue *queue);
>  struct multicore_worker __percpu *
>  wg_packet_percpu_multicore_worker_alloc(work_func_t function, void *ptr);
>  
> @@ -135,8 +136,31 @@ static inline int wg_cpumask_next_online(int *next)
>  	return cpu;
>  }
>  
> +void wg_prev_queue_init(struct prev_queue *queue);
> +
> +/* Multi producer */
> +bool wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb);
> +
> +/* Single consumer */
> +struct sk_buff *wg_prev_queue_dequeue(struct prev_queue *queue);
> +
> +/* Single consumer */
> +static inline struct sk_buff *wg_prev_queue_peek(struct prev_queue *queue)
> +{
> +	if (queue->peeked)
> +		return queue->peeked;
> +	queue->peeked = wg_prev_queue_dequeue(queue);
> +	return queue->peeked;
> +}
> +
> +/* Single consumer */
> +static inline void wg_prev_queue_drop_peeked(struct prev_queue *queue)
> +{
> +	queue->peeked = NULL;
> +}
> +
>  static inline int wg_queue_enqueue_per_device_and_peer(
> -	struct crypt_queue *device_queue, struct crypt_queue *peer_queue,
> +	struct crypt_queue *device_queue, struct prev_queue *peer_queue,
>  	struct sk_buff *skb, struct workqueue_struct *wq, int *next_cpu)
>  {
>  	int cpu;
> @@ -145,8 +169,9 @@ static inline int wg_queue_enqueue_per_device_and_peer(
>  	/* We first queue this up for the peer ingestion, but the consumer
>  	 * will wait for the state to change to CRYPTED or DEAD before.
>  	 */
> -	if (unlikely(ptr_ring_produce_bh(&peer_queue->ring, skb)))
> +	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
>  		return -ENOSPC;
> +
>  	/* Then we queue it up in the device queue, which consumes the
>  	 * packet as soon as it can.
>  	 */
> @@ -157,9 +182,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
>  	return 0;
>  }
>  
> -static inline void wg_queue_enqueue_per_peer(struct crypt_queue *queue,
> -					     struct sk_buff *skb,
> -					     enum packet_state state)
> +static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet_state state)
>  {
>  	/* We take a reference, because as soon as we call atomic_set, the
>  	 * peer can be freed from below us.
> @@ -167,14 +190,12 @@ static inline void wg_queue_enqueue_per_peer(struct crypt_queue *queue,
>  	struct wg_peer *peer = wg_peer_get(PACKET_PEER(skb));
>  
>  	atomic_set_release(&PACKET_CB(skb)->state, state);
> -	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu,
> -					       peer->internal_id),
> -		      peer->device->packet_crypt_wq, &queue->work);
> +	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> +		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
>  	wg_peer_put(peer);
>  }
>  
> -static inline void wg_queue_enqueue_per_peer_napi(struct sk_buff *skb,
> -						  enum packet_state state)
> +static inline void wg_queue_enqueue_per_peer_rx(struct sk_buff *skb, enum packet_state state)
>  {
>  	/* We take a reference, because as soon as we call atomic_set, the
>  	 * peer can be freed from below us.
> diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> index 2c9551ea6dc7..7dc84bcca261 100644
> --- a/drivers/net/wireguard/receive.c
> +++ b/drivers/net/wireguard/receive.c
> @@ -444,7 +444,6 @@ static void wg_packet_consume_data_done(struct wg_peer *peer,
>  int wg_packet_rx_poll(struct napi_struct *napi, int budget)
>  {
>  	struct wg_peer *peer = container_of(napi, struct wg_peer, napi);
> -	struct crypt_queue *queue = &peer->rx_queue;
>  	struct noise_keypair *keypair;
>  	struct endpoint endpoint;
>  	enum packet_state state;
> @@ -455,11 +454,10 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
>  	if (unlikely(budget <= 0))
>  		return 0;
>  
> -	while ((skb = __ptr_ring_peek(&queue->ring)) != NULL &&
> +	while ((skb = wg_prev_queue_peek(&peer->rx_queue)) != NULL &&
>  	       (state = atomic_read_acquire(&PACKET_CB(skb)->state)) !=
>  		       PACKET_STATE_UNCRYPTED) {
> -		__ptr_ring_discard_one(&queue->ring);
> -		peer = PACKET_PEER(skb);
> +		wg_prev_queue_drop_peeked(&peer->rx_queue);
>  		keypair = PACKET_CB(skb)->keypair;
>  		free = true;
>  
> @@ -508,7 +506,7 @@ void wg_packet_decrypt_worker(struct work_struct *work)
>  		enum packet_state state =
>  			likely(decrypt_packet(skb, PACKET_CB(skb)->keypair)) ?
>  				PACKET_STATE_CRYPTED : PACKET_STATE_DEAD;
> -		wg_queue_enqueue_per_peer_napi(skb, state);
> +		wg_queue_enqueue_per_peer_rx(skb, state);
>  		if (need_resched())
>  			cond_resched();
>  	}
> @@ -531,12 +529,10 @@ static void wg_packet_consume_data(struct wg_device *wg, struct sk_buff *skb)
>  	if (unlikely(READ_ONCE(peer->is_dead)))
>  		goto err;
>  
> -	ret = wg_queue_enqueue_per_device_and_peer(&wg->decrypt_queue,
> -						   &peer->rx_queue, skb,
> -						   wg->packet_crypt_wq,
> -						   &wg->decrypt_queue.last_cpu);
> +	ret = wg_queue_enqueue_per_device_and_peer(&wg->decrypt_queue, &peer->rx_queue, skb,
> +						   wg->packet_crypt_wq, &wg->decrypt_queue.last_cpu);
>  	if (unlikely(ret == -EPIPE))
> -		wg_queue_enqueue_per_peer_napi(skb, PACKET_STATE_DEAD);
> +		wg_queue_enqueue_per_peer_rx(skb, PACKET_STATE_DEAD);
>  	if (likely(!ret || ret == -EPIPE)) {
>  		rcu_read_unlock_bh();
>  		return;
> diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
> index f74b9341ab0f..5368f7c35b4b 100644
> --- a/drivers/net/wireguard/send.c
> +++ b/drivers/net/wireguard/send.c
> @@ -239,8 +239,7 @@ void wg_packet_send_keepalive(struct wg_peer *peer)
>  	wg_packet_send_staged_packets(peer);
>  }
>  
> -static void wg_packet_create_data_done(struct sk_buff *first,
> -				       struct wg_peer *peer)
> +static void wg_packet_create_data_done(struct wg_peer *peer, struct sk_buff *first)
>  {
>  	struct sk_buff *skb, *next;
>  	bool is_keepalive, data_sent = false;
> @@ -262,22 +261,19 @@ static void wg_packet_create_data_done(struct sk_buff *first,
>  
>  void wg_packet_tx_worker(struct work_struct *work)
>  {
> -	struct crypt_queue *queue = container_of(work, struct crypt_queue,
> -						 work);
> +	struct wg_peer *peer = container_of(work, struct wg_peer, transmit_packet_work);
>  	struct noise_keypair *keypair;
>  	enum packet_state state;
>  	struct sk_buff *first;
> -	struct wg_peer *peer;
>  
> -	while ((first = __ptr_ring_peek(&queue->ring)) != NULL &&
> +	while ((first = wg_prev_queue_peek(&peer->tx_queue)) != NULL &&
>  	       (state = atomic_read_acquire(&PACKET_CB(first)->state)) !=
>  		       PACKET_STATE_UNCRYPTED) {
> -		__ptr_ring_discard_one(&queue->ring);
> -		peer = PACKET_PEER(first);
> +		wg_prev_queue_drop_peeked(&peer->tx_queue);
>  		keypair = PACKET_CB(first)->keypair;
>  
>  		if (likely(state == PACKET_STATE_CRYPTED))
> -			wg_packet_create_data_done(first, peer);
> +			wg_packet_create_data_done(peer, first);
>  		else
>  			kfree_skb_list(first);
>  
> @@ -306,16 +302,14 @@ void wg_packet_encrypt_worker(struct work_struct *work)
>  				break;
>  			}
>  		}
> -		wg_queue_enqueue_per_peer(&PACKET_PEER(first)->tx_queue, first,
> -					  state);
> +		wg_queue_enqueue_per_peer_tx(first, state);
>  		if (need_resched())
>  			cond_resched();
>  	}
>  }
>  
> -static void wg_packet_create_data(struct sk_buff *first)
> +static void wg_packet_create_data(struct wg_peer *peer, struct sk_buff *first)
>  {
> -	struct wg_peer *peer = PACKET_PEER(first);
>  	struct wg_device *wg = peer->device;
>  	int ret = -EINVAL;
>  
> @@ -323,13 +317,10 @@ static void wg_packet_create_data(struct sk_buff *first)
>  	if (unlikely(READ_ONCE(peer->is_dead)))
>  		goto err;
>  
> -	ret = wg_queue_enqueue_per_device_and_peer(&wg->encrypt_queue,
> -						   &peer->tx_queue, first,
> -						   wg->packet_crypt_wq,
> -						   &wg->encrypt_queue.last_cpu);
> +	ret = wg_queue_enqueue_per_device_and_peer(&wg->encrypt_queue, &peer->tx_queue, first,
> +						   wg->packet_crypt_wq, &wg->encrypt_queue.last_cpu);
>  	if (unlikely(ret == -EPIPE))
> -		wg_queue_enqueue_per_peer(&peer->tx_queue, first,
> -					  PACKET_STATE_DEAD);
> +		wg_queue_enqueue_per_peer_tx(first, PACKET_STATE_DEAD);
>  err:
>  	rcu_read_unlock_bh();
>  	if (likely(!ret || ret == -EPIPE))
> @@ -393,7 +384,7 @@ void wg_packet_send_staged_packets(struct wg_peer *peer)
>  	packets.prev->next = NULL;
>  	wg_peer_get(keypair->entry.peer);
>  	PACKET_CB(packets.next)->keypair = keypair;
> -	wg_packet_create_data(packets.next);
> +	wg_packet_create_data(peer, packets.next);
>  	return;
>  
>  out_invalid:
> -- 
> 2.30.0
