Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9a2a97a
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 23:32:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68c49ccc
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 23:32:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2a0c4db0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 23:32:55 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id c13so176509081lfg.0
 for <wireguard@lists.zx2c4.com>; Wed, 09 Nov 2016 15:34:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1611092227200.3501@nanos>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Nov 2016 00:34:54 +0100
Message-ID: <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=UTF-8
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

Hey Thomas,

On Wed, Nov 9, 2016 at 10:40 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> That preempt_disable() prevents merily preemption as the name says, but it
> wont prevent softirq handlers from running on return from interrupt. So
> what's the point?

Oh, interesting. Okay, then in that case the proposed define wouldn't
be useful for my purposes. What clever tricks do I have at my
disposal, then?

>> If not, do you have a better solution for me (which doesn't
>> involve using kmalloc or choosing a different crypto primitive)?
>
> What's wrong with using kmalloc?

It's cumbersome and potentially slow. This is crypto code, where speed
matters a lot. Avoiding allocations is usually the lowest hanging
fruit among optimizations. To give you some idea, here's a somewhat
horrible solution using kmalloc I hacked together: [1]. I'm not to
happy with what it looks like, code-wise, and there's around a 16%
slowdown, which isn't nice either.

[1] https://git.zx2c4.com/WireGuard/commit/?h=jd/curve25519-kmalloc
