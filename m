Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c465d5df
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 15:56:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72db603e
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 15:56:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03acb4f1
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 15:56:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d55b50ea
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 15:56:53 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id n16so6486424oig.3
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 08:01:46 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Nov 2017 17:01:45 +0100
Message-ID: <CAHmME9qdGwrGHi9Tr9594tv=MRztw7HnZ1GvsKTq3wFDwa1rQQ@mail.gmail.com>
Subject: new accelerated primitives - testing needed
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

Samuel Neves and I have just finished the first probably buggy round
of porting a bunch of accelerated primitives into the WireGuard
codebase. This was a pretty big effort. We've got things running now
on: x86_64, SSSE, AVX, AVX2, AVX512, ARMv4, ARMv5, ARMv6, ARMv7,
ARMv8, ARMv7+NEON, ARMv8+NEON. During the first few limited
benchmarks, things are looking positive.

I've got access to a bunch of Intel hardware for testing, but while
I've got a few different ARM boards, the large diversity of the ARM
ecosystem presents a challenge.

Some of you seem to have all sorts of little computers with weirdly
configured kernels and cores, which often find useful WireGuard bugs.
If some of you are up for finding some potential mayhem, would you run
the master branch of WireGuard (built with `make debug`, preferably),
and let me know if things explode?

At the very least, this usually gets things rolling:

$ git clone https://git.zx2c4.com/WireGuard /tmp/wg && make -C
/tmp/wg/src insert && dmesg | tail -n 15

Jason
