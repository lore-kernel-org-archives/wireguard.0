Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2246EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jan 2022 15:40:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id eb14db66;
	Tue, 11 Jan 2022 15:40:34 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 23943ae6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jan 2022 15:40:33 +0000 (UTC)
Date: Tue, 11 Jan 2022 16:40:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1641915632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4ebBWdFE+8C08nd/CIkn3LPDWYDafN44xwshvth2ug=;
 b=pFhf3vkZBl8xak2CU81OWunOoJ3n9/VStlFca8yvtRqN0+qACzO4/dVn5hQckoislgGSa8
 QMZCiogKWqaohAoGIfDH8UPqXu3ROdOOWZM5XK1zwYOhSIw5bq0f9TsVrWtbVFeAhfTj8U
 1XPoKitKqGsKXlOprbUVFEX5AYr/bcx07n+oZCPEd0U784ZzenqnUXkFEaRRuDpAYCN1JM
 bFjrmyrZ3yTFJCNGpIh3V1kD/1da60NiANo3U5cjpRYPn9gyGXaRIz0drt69I81iOJ63Rw
 y+LP2x2Yiuy7quHJHRqeu2o5GaaLZvOYqIljBefwdqWPTVw+np2ypR+eNp+RuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1641915632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4ebBWdFE+8C08nd/CIkn3LPDWYDafN44xwshvth2ug=;
 b=CtAAAny1PpTBIrLssPLVTa7o7uc+pONqP0L4nJCkpIWaiiLl4ERmAI66ruxUUmQ36PGH8P
 vzJBpRCLhozTofDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC] wiregard RX packet processing.
Message-ID: <Yd2k7yCGCQXfibk3@linutronix.de>
References: <20211208173205.zajfvg6zvi4g5kln@linutronix.de>
 <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
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

On 2021-12-20 18:29:49 [+0100], Jason A. Donenfeld wrote:
> Hi Sebastian,
>=20
> Seems like you've identified two things, the use of need_resched, and
> potentially surrounding napi_schedule in local_bh_{disable,enable}.
>=20
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

I stand to be corrected but "if need_resched() cond_resched())" is not
something one should do. If you hold a lock and need to drop it first
and und you don't want to drop the lock if there is no need for
scheduling then there is cond_resched_lock() for instance. If you need
to do something more complex (say set a marker if you drop the lock)
then okay _but_ in this case you do more than just the "if =E2=80=A6" from
above.

cond_resched() gets optimized away on a preemptible kernel. The side
effect is that you have always a branch (to cond_resched()) including a
possible RCU section (urgently needed quiescent state).

> Regarding napi_schedule, I actually wasn't aware that it's requirement
> to _only_ ever run from softirq was a strict one. When I switched to
> using napi_schedule in this way, throughput really jumped up
> significantly. Part of this indeed is from the batching, so that the
> napi callback can then handle more packets in one go later. But I
> assumed it was something inside of NAPI that was batching and
> scheduling it, rather than a mistake on my part to call this from a wq
> and not from a softirq.

There is no strict requirement to do napi_schedule() from hard-IRQ but
it makes sense actually. So napi_schedule() invokes
__raise_softirq_irqoff() which only ors a bit in the softirq state.
Nothing else. The only reason that the softirq is invoked in a
deterministic way is that irq_exit() has this "if
(local_softirq_pending()) invoke_softirq()" check before returing (to
interrupted user/ kernel code).

So if you use it in a worker (for instance) the NAPI call is delayed
until the next IRQ (due to irq_exit() part) or a random
local_bh_enable() user.

> What, then, are the effects of surrounding that in
> local_bh_{disable,enable} as you've done in the patch? You mentioned
> one aspect is that it will "invoke wg_packet_rx_poll() where you see
> only one skb." It sounds like that'd be bad for performance, though,
> given that the design of napi is really geared toward batching.

As Toke H=C3=B8iland-J=C3=B8rgensen wrote in the previous reply, I missed t=
he BH
disable/ enable in ptr_ring_consume_bh(). So what happens is that
ptr_ring_consume_bh() gives you one skb, you do
wg_queue_enqueue_per_peer_rx() which raises NAPI then the following
ptr_ring_consume_bh() (that local_bh_enable() to be exact) invokes the
NAPI callback (I guess wg_packet_rx_poll() but as I wrote earlier, I
didn't figure out how the skbs move from here to the other queue for
that callback).

So there is probably no batching assuming that one skb is processed in
the NAPI callback.

> Jason

Sebastian
