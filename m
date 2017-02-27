Return-Path: pageexec@freemail.hu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id faf8618b
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 23:34:57 +0000 (UTC)
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffbe7aeb
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 23:34:57 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Feb 2017 00:36:19 +0100
MIME-Version: 1.0
Subject: Re: kernel warning with 0.0.20170223: entered softirq 3 NET_RX
 net_rx_action+0x0/0x760 with preempt_count 00000101, exited with
Message-ID: <58B4B7F3.6576.1579035@pageexec.freemail.hu>
In-reply-to: <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
References: <5e4ad220-6009-7ec9-95eb-ddccb994bb9e@gmail.com>,
 <CAApVa_kyD=KZYN3ABZU5yZGExNhC-34ryF+JZAPZ0JAKgmdJLw@mail.gmail.com>,
 <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Cc: Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: pageexec@freemail.hu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 27 Feb 2017 at 4:22, Jason A. Donenfeld wrote:

> void __used pax_check_alloca(unsigned long size)
> {
>  ...
>        case STACK_TYPE_IRQ:
>                stack_left = sp & (IRQ_STACK_SIZE - 1);
>                put_cpu();
>                break;
>  ...
> }
> 
> Do you see the bug? Looks like somebody snuck in a "put_cpu()" there,
> where it really does not belong. "put_cpu()" basically just jiggers
> the preempt_count. I can confirm that removing the erroneous call to
> "put_cpu()" fixes the bug.
> 
> So, either this is by design, and there's some odd subtlety I'm
> missing, or this is a bug that should be fixed in grsec/PaX.

as spender explained it, it's a bug. what happened was that 4.9 introduced
get_stack_info that i then made use of in pax_check_alloca (instead of keeping
my own stack classifier). this old code of mine had to lock the cpu which is
why i had get/put_cpu calls in there and i managed to forget about one of the
latter.

> In the case of the latter, I believe this introduces a security
> vulnerability, since it opens up a whole host of interesting race
> conditions that can be exploited.

now this is the interesting part, isn't it ;). first, the conditions needed to
trigger the bug are that you need an amd64 config with STACKLEAK and PREEMPT
enabled. second, you need functions with big enough stack frames (including
controllable dynamically sized local variables) that get instrumented by STACKLEAK
and executed in IRQ context (on a IRQ stack). once you have these conditions
under control, you can overdecrement the preempt count on a given CPU each time
such a function is executed. note that if this happens under __do_softirq then
the overdecrement will be fixed up (and get logged), so you probably need another
path for abuse. what i don't know (and have no time to figure out) is how many
of these functions there are and how you get something useful out of abusing them.

thanks & cheers,
 PaX Team
