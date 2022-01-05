Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63953C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Jan 2022 00:17:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0a1ba487;
	Wed, 5 Jan 2022 00:14:57 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ff7a4b9f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Jan 2022 00:14:54 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1641341693; bh=62pljZmRd6NMnpHMPwgl99yyovGJnGDhsktjlFBjqOo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bL2V2p5xSb2BkXNp2vGERr9Zmb2mYnlK3t0vX17WrhVubBgdZgzsrbuaUs3b2D0Kq
 G0ZHJaorPz892dwOGzESeUD6A6Tjy6PSPZv5Phv/9D8sHuLBUntn8zzZkRMkXR4huy
 QheUsbayMK4kimQSf+hPOp2bMnKdA3zXGxfQhYBEQoGvApWxt2NMswJMf9ehhRrzSA
 YzkORZe8Yply5PxzgLJfzWgMjfm48/GSHlbpbj8UzZzxmjZ0yGwDHI2yIoZ5ncgXSI
 FmoKiwxe0atd3rylu+z4TEpg2papMaojEtrplctom4w4GHKOXwiEHrqW2Lo/ZyTkA1
 w6GmNY43wVapw==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, Netdev
 <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>
Subject: Re: [RFC] wiregard RX packet processing.
In-Reply-To: <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
References: <20211208173205.zajfvg6zvi4g5kln@linutronix.de>
 <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
Date: Wed, 05 Jan 2022 01:14:47 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87mtkbavig.fsf@toke.dk>
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

> Hi Sebastian,
>
> Seems like you've identified two things, the use of need_resched, and
> potentially surrounding napi_schedule in local_bh_{disable,enable}.
>
> Regarding need_resched, I pulled that out of other code that seemed to
> have the "same requirements", as vaguely conceived. It indeed might
> not be right. The intent is to have that worker running at maximum
> throughput for extended periods of time, but not preventing other
> threads from running elsewhere, so that, e.g., a user's machine
> doesn't have a jenky mouse when downloading a file.
>
> What are the effects of unconditionally calling cond_resched() without
> checking for if (need_resched())? Sounds like you're saying none at
> all?

I believe so: AFAIU, you use need_resched() if you need to do some kind
of teardown before the schedule point, like this example I was recently
looking at:

https://elixir.bootlin.com/linux/latest/source/net/bpf/test_run.c#L73

If you just need to maybe reschedule, you can just call cond_resched()
and it'll do what it says on the tin: do a schedule if needed, and
return immediately otherwise.

> Regarding napi_schedule, I actually wasn't aware that it's requirement
> to _only_ ever run from softirq was a strict one. When I switched to
> using napi_schedule in this way, throughput really jumped up
> significantly. Part of this indeed is from the batching, so that the
> napi callback can then handle more packets in one go later. But I
> assumed it was something inside of NAPI that was batching and
> scheduling it, rather than a mistake on my part to call this from a wq
> and not from a softirq.
>
> What, then, are the effects of surrounding that in
> local_bh_{disable,enable} as you've done in the patch? You mentioned
> one aspect is that it will "invoke wg_packet_rx_poll() where you see
> only one skb." It sounds like that'd be bad for performance, though,
> given that the design of napi is really geared toward batching.

Heh, I wrote a whole long explanation he about variable batch sizes
because you don't control when the NAPI is scheduled, etc... And then I
noticed the while loop is calling ptr_ring_consume_bh(), which means
that there's already a local_bh_disable/enable pair on every loop
invocation. So you already have this :)

Which of course raises the question of whether there's anything to gain
from *adding* batching to the worker? Something like:

#define BATCH_SIZE 8
void wg_packet_decrypt_worker(struct work_struct *work)
{
	struct crypt_queue *queue = container_of(work, struct multicore_worker,
						 work)->ptr;
	void *skbs[BATCH_SIZE];
	bool again;
	int i;

restart:
	local_bh_disable();
	ptr_ring_consume_batched(&queue->ring, skbs, BATCH_SIZE);

	for (i = 0; i < BATCH_SIZE; i++) {
		struct sk_buff *skb = skbs[i];
		enum packet_state state;

		if (!skb)
			break;

		state = likely(decrypt_packet(skb, PACKET_CB(skb)->keypair)) ?
				PACKET_STATE_CRYPTED : PACKET_STATE_DEAD;
		wg_queue_enqueue_per_peer_rx(skb, state);
	}
        
	again = !ptr_ring_empty(&queue->ring);
	local_bh_enable();

	if (again) {
		cond_resched();
		goto restart;
	}
}


Another thing that might be worth looking into is whether it makes sense
to enable threaded NAPI for Wireguard. See:
https://lore.kernel.org/r/20210208193410.3859094-1-weiwan@google.com

-Toke
