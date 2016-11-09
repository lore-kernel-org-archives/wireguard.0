Return-Path: tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5b85bda
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 21:41:00 +0000 (UTC)
Date: Wed, 9 Nov 2016 22:40:24 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1611092227200.3501@nanos>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, linux-mm@kvack.org
Subject: Re: [WireGuard] Proposal: HAVE_SEPARATE_IRQ_STACK?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 9 Nov 2016, Jason A. Donenfeld wrote:
> But for the remaining platforms, such as MIPS, this is still a
> problem. In an effort to work around this in my code, rather than
> having to invoke kmalloc for what should be stack-based variables, I
> was thinking I'd just disable preemption for those functions that use
> a lot of stack, so that stack-hungry softirq handlers don't crush it.
> This is generally unsatisfactory, so I don't want to do this
> unconditionally. Instead, I'd like to do some cludge such as:
> 
>     #ifndef CONFIG_HAVE_SEPARATE_IRQ_STACK
>     preempt_disable();

That preempt_disable() prevents merily preemption as the name says, but it
wont prevent softirq handlers from running on return from interrupt. So
what's the point?

> However, for this to work, I actual need that config variable. Would
> you accept a patch that adds this config variable to the relavent
> platforms?

It might have been a good idea, to cc all relevant arch maintainers on
that ...

> If not, do you have a better solution for me (which doesn't
> involve using kmalloc or choosing a different crypto primitive)?

What's wrong with using kmalloc?

Thanks,

	tglx
