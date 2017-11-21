Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b8593a9
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:57:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9621fe4
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:57:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5077ea41
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:57:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 71a70bd1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:57:05 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id b54so10036722otd.8
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 02:02:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171121094032.Horde.sBBE8SerNxaWD9b3BswUV6c@www.vdorst.com>
References: <20171121092516.Horde.-KEs7jQ3bs1TXDF4g98Y3gQ@www.vdorst.com>
 <20171121094032.Horde.sBBE8SerNxaWD9b3BswUV6c@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 11:02:02 +0100
Message-ID: <CAHmME9poJnG1DnxBEu3NLRQ3gYRsnBkGT=p0y1ugiOdm=0y4eg@mail.gmail.com>
Subject: Re: ARM multitheaded?
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Ren=C3=A9,

There are a few bottlenecks in the existing queuing code:

- transmission of packets is limited to one core, even if encryption
is multicore, to avoid out of order packets.
- packet queues use a ring buffer with two spinlocks, which cause
contention on systems with copious amounts of CPUs (not your case).
- CPU autoscaling - sometimes using all the cores isn't useful if that
lowers the clockrate or if there are few packets, but we don't have an
auto scale-up/scale-down algorithm right now. instead we blast out to
all cores always.
- CPU locality - cores might be created on one core and encrypted on
another. not much we can do about this with a multicore algorithm,
unless there are "hints" or dual per-cpu and per-device queues with
scheduling between them, which is complicated and would need lots of
thought.
- the transmission core is also used as an encryption core. in some
environments this is a benefit, in others a detriment.
- there's a slightly expensive bitmask operation to determine which
CPU should be used for the next packet.
- other challenging puzzles from queue-theory land.

I've CCd Samuel and Toke in case they want to jump in on this thread
and complain some about other aspects of the multicore algorithm. It's
certainly much better than it was during padata-era, but there's still
a lot to be done. The implementation lives here:

>From these lines on down, best read from bottom to top.
https://git.zx2c4.com/WireGuard/tree/src/send.c#n185
https://git.zx2c4.com/WireGuard/tree/src/receive.c#n281
Utility functions:
https://git.zx2c4.com/WireGuard/tree/src/queueing.c
https://git.zx2c4.com/WireGuard/tree/src/queueing.h

Let me know if you have further ideas for improving performance.

Jason
