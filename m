Return-Path: Steffen.Klassert@secunet.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5e7e518
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2017 08:35:57 +0000 (UTC)
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cba6ff6e
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2017 08:35:56 +0000 (UTC)
Date: Thu, 23 Mar 2017 09:40:26 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: race condition in kernel/padata.c
Message-ID: <20170323084026.GA32453@secunet.com>
References: <CAHmME9oLWiprOyZXo7zvGm7xq+1Kchw9ybLS_TM-9xDyHF0mxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <CAHmME9oLWiprOyZXo7zvGm7xq+1Kchw9ybLS_TM-9xDyHF0mxQ@mail.gmail.com>
Cc: Netdev <netdev@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Mar 23, 2017 at 12:03:43AM +0100, Jason A. Donenfeld wrote:
> Hey Steffen,
> 
> WireGuard makes really heavy use of padata, feeding it units of work
> from different cores in different contexts all at the same time. For
> the most part, everything has been fine, but one particular user has
> consistently run into mysterious bugs. He's using a rather old dual
> core CPU, which have a tendency to bring out race conditions
> sometimes. After struggling with getting a good backtrace, we finally
> managed to extract this from list debugging:
> 
> [87487.298728] WARNING: CPU: 1 PID: 882 at lib/list_debug.c:33
> __list_add+0xae/0x130
> [87487.301868] list_add corruption. prev->next should be next
> (ffffb17abfc043d0), but was ffff8dba70872c80. (prev=ffff8dba70872b00).
> [87487.339011]  [<ffffffff9a53d075>] dump_stack+0x68/0xa3
> [87487.342198]  [<ffffffff99e119a1>] ? console_unlock+0x281/0x6d0
> [87487.345364]  [<ffffffff99d6b91f>] __warn+0xff/0x140
> [87487.348513]  [<ffffffff99d6b9aa>] warn_slowpath_fmt+0x4a/0x50
> [87487.351659]  [<ffffffff9a58b5de>] __list_add+0xae/0x130
> [87487.354772]  [<ffffffff9add5094>] ? _raw_spin_lock+0x64/0x70
> [87487.357915]  [<ffffffff99eefd66>] padata_reorder+0x1e6/0x420
> [87487.361084]  [<ffffffff99ef0055>] padata_do_serial+0xa5/0x120
> 
> padata_reorder calls list_add_tail with the list to which its adding
> locked, which seems correct:
> 
> spin_lock(&squeue->serial.lock);
> list_add_tail(&padata->list, &squeue->serial.list);
> spin_unlock(&squeue->serial.lock);
> 
> This therefore leaves only place where such inconsistency could occur:
> if padata->list is added at the same time on two different threads.
> This pdata pointer comes from the function call to
> padata_get_next(pd), which has in it the following block:
> 
> next_queue = per_cpu_ptr(pd->pqueue, cpu);
> padata = NULL;
> reorder = &next_queue->reorder;
> if (!list_empty(&reorder->list)) {
>        padata = list_entry(reorder->list.next,
>                            struct padata_priv, list);
>        spin_lock(&reorder->lock);
>        list_del_init(&padata->list);
>        atomic_dec(&pd->reorder_objects);
>        spin_unlock(&reorder->lock);
> 
>        pd->processed++;
> 
>        goto out;
> }
> out:
> return padata;
> 
> I strongly suspect that the problem here is that two threads can race
> on reorder list. Even though the deletion is locked, call to
> list_entry is not locked, which means it's feasible that two threads
> pick up the same padata object and subsequently call list_add_tail on
> them at the same time. The fix would thus be to hoist that lock
> outside of that block.

Yes, looks like we should lock the whole list handling block here.

Thanks!
