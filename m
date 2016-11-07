Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f629d1b7
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:25:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79e00dd5
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:25:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19887ffd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:25:03 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id t196so109721870lff.3
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 02:26:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7365258.20161107095446@vodka.home.kg>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
 <7365258.20161107095446@vodka.home.kg>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 11:26:43 +0100
Message-ID: <CAHmME9rm1dYZGsOZ1bfZnzZt2LXohgM=7oFmLrH6=faJPJd8cQ@mail.gmail.com>
To: k@vodka.home.kg
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey k,

Excellent work!

My MIPS VM is still alive. :)

On Mon, Nov 7, 2016 at 7:54 AM,  <k@vodka.home.kg> wrote:
> After 10 hours of testing it crashed but another way.
> I did mistake. It did not shutdown arm<>mips connection. It was almost
> idle but still on.

Do you mean to indicate that this crash is the result of the same
issue as before? Or of a different one?

> <4>[56173.377275] Unhandled kernel unaligned access[#1]:
> <4>[56173.377970] [<80241948>] add_interrupt_randomness+0xa8/0x208

Either memory corruption resulted in add_interrupt_randomness getting
a bad pointer from irq_randomness, which was unaligned, or there's
more sinister misgivings in Linux itself... Let's just assume the
former, rather than the latter.

Jason
