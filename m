Return-Path: tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f141bea
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 09:03:44 +0000 (UTC)
Date: Thu, 10 Nov 2016 10:03:11 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1611100959040.3501@nanos>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
 <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
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

On Thu, 10 Nov 2016, Jason A. Donenfeld wrote:

> Hey Thomas,
> 
> On Wed, Nov 9, 2016 at 10:40 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> > That preempt_disable() prevents merily preemption as the name says, but it
> > wont prevent softirq handlers from running on return from interrupt. So
> > what's the point?
> 
> Oh, interesting. Okay, then in that case the proposed define wouldn't
> be useful for my purposes.

If you want to go with that config, then you need
local_bh_disable()/enable() to fend softirqs off, which disables also
preemption.

> What clever tricks do I have at my disposal, then?

Make MIPS use interrupt stacks.
 
> >> If not, do you have a better solution for me (which doesn't
> >> involve using kmalloc or choosing a different crypto primitive)?
> >
> > What's wrong with using kmalloc?
> 
> It's cumbersome and potentially slow. This is crypto code, where speed
> matters a lot. Avoiding allocations is usually the lowest hanging
> fruit among optimizations. To give you some idea, here's a somewhat
> horrible solution using kmalloc I hacked together: [1]. I'm not to
> happy with what it looks like, code-wise, and there's around a 16%
> slowdown, which isn't nice either.

Does the slowdown come from the kmalloc overhead or mostly from the less
efficient code?

If it's mainly kmalloc, then you can preallocate the buffer once for the
kthread you're running in and be done with it. If it's the code, then bad
luck.

Thanks,

	tglx
