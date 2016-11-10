Return-Path: tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c3320b7
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 13:01:06 +0000 (UTC)
Date: Thu, 10 Nov 2016 14:00:33 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1611101351260.3501@nanos>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
 <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
 <alpine.DEB.2.20.1611100959040.3501@nanos>
 <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
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
> On Thu, Nov 10, 2016 at 10:03 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> > Does the slowdown come from the kmalloc overhead or mostly from the less
> > efficient code?
> >
> > If it's mainly kmalloc, then you can preallocate the buffer once for the
> > kthread you're running in and be done with it. If it's the code, then bad
> > luck.
> 
> I fear both. GCC can optimize stack variables in ways that it cannot
> optimize various memory reads and writes.

The question is how much of it is code and how much of it is the kmalloc.
 
> Strangely, the solution that appeals to me most at the moment is to
> kmalloc (or vmalloc?) a new stack, copy over thread_info, and fiddle
> with the stack registers. I don't see any APIs, however, for a
> platform independent way of doing this. And maybe this is a horrible
> idea. But at least it'd allow me to keep my stack-based code the
> same...

Do not even think about going there. That's going to be a major
mess.

As a short time workaround you can increase THREAD_SIZE_ORDER for now and
then fix it proper with switching to seperate irq stacks.

Thanks,

	tglx
