Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18123b8d
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 21:25:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 060e870c
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 21:25:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b6a61949
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 21:25:15 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id c13so174560130lfg.0
 for <wireguard@lists.zx2c4.com>; Wed, 09 Nov 2016 13:27:16 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 9 Nov 2016 22:27:13 +0100
Message-ID: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org,
 linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] Proposal: HAVE_SEPARATE_IRQ_STACK?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

I do some ECC crypto in a kthread. A fast 32bit implementation usually
uses around 2k - 3k bytes of stack. Since kernel threads get 8k, I
figured this would be okay. And for the most part, it is. However,
everything falls apart on architectures like MIPS, which do not use a
separate irq stack.

>From what I can tell, on MIPS, the irq handler uses whichever stack
was in current at the time of interruption. At the end of the irq
handler, softirqs trigger if preemption hasn't been disabled. When the
softirq handler runs, it will still use the same interrupted stack. So
let's take some pathological case of huge softirq stack usage: wifi
driver inside of l2tp inside of gre inside of ppp. Now, my ECC crypto
is humming along happily in its kthread, when all of the sudden, a
wifi packet arrives, triggering the interrupt. Or, perhaps instead,
TCP sends an ack packet on softirq, using my kthread's stack. The
interrupt is serviced, and at the end of it, softirq is serviced,
using my kthread's stack, which was already half full. When this
softirq is serviced, it goes through our 4 layers of network device
drivers. Since we started with a half full stack, we very quickly blow
it up, and everything explodes, and users write angry mailing list
posts.

It seems to me x86, ARM, SPARC, SH, ParisC, PPC, Metag, and UML all
concluded that letting the interrupt handler use current's stack was a
terrible idea, and instead have a per-cpu irq stack that gets used
when the handler is service. Whew!

But for the remaining platforms, such as MIPS, this is still a
problem. In an effort to work around this in my code, rather than
having to invoke kmalloc for what should be stack-based variables, I
was thinking I'd just disable preemption for those functions that use
a lot of stack, so that stack-hungry softirq handlers don't crush it.
This is generally unsatisfactory, so I don't want to do this
unconditionally. Instead, I'd like to do some cludge such as:

    #ifndef CONFIG_HAVE_SEPARATE_IRQ_STACK
    preempt_disable();
    #endif

    some_func_that_uses_lots_of_stack();

    #ifndef CONFIG_HAVE_SEPARATE_IRQ_STACK
    preempt_enable();
    #endif

However, for this to work, I actual need that config variable. Would
you accept a patch that adds this config variable to the relavent
platforms? If not, do you have a better solution for me (which doesn't
involve using kmalloc or choosing a different crypto primitive)?

Thanks,
Jason
