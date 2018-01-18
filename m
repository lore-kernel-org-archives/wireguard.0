Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c03ee7b
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:38:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1abbeeda
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:38:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23ccac22
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:29:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 010da899
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 15:29:51 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id v5so10095588oth.5
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 07:42:11 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jan 2018 16:42:10 +0100
Message-ID: <CAHmME9pWnFh4jN72hRo6kFzWTEQn4xF8AGNQUg8r3g_eAPBvdg@mail.gmail.com>
Subject: Formally Verified Cryptographic Primitive Implementations
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

Hi folks,

Writing crypto code is hard and sometimes scary. Especially on things
like elliptic curves and big number arithmetic, subtle but critical
bugs often sit around undetected for years. For this reason, I've been
working with some researchers at INRIA on using a formally verified
Curve25519 implementation inside WireGuard. This last week I had the
pleasure of talking with INRIA researchers and MIT researchers about
related efforts to automatically generate C implementations of
elliptic curve scalar multiplication from formal models. These models
produce proofs of correctness alongside machine-generated C. I've
taken these implementations and integrated them into WireGuard.

For 64-bit Curve25519 multiplication, we're using HACL* [1], which has
specifications written in F* [2] and passes them through KreMLin [3]
for C generation. You can read the INRIA researchers paper [4] for
more information. Not only is this formally verified, but it is also
faster than our previous implementation (agl's donna-64). Mozilla's
NSS is doing something similar with HACL*.

For 32-bit Curve25519 multiplication, we're using Fiat-Crypto [5],
which has specifications written in the abstract proof language Coq
[6], which also generates C code. These MIT researchers also have a
paper available [7]. This is faster than what we're using before
(agl's donna-32) and uses much less stack space, which means we no
longer need to kmalloc on platforms without separate irq stacks, which
is a nice boost. Google's BoringSSL is doing something similar with
Fiat-Crypto.

Note that not _all_ of our cryptographic primitives are verified.
We're starting with replacing these two C implementations with
formally verified ones. Over time, we'll gradually replace remaining
existing implementations with formally verified counterparts. But
certainly, as this research is state of the art and quite new, the
work here is in the evolutionary category.

Some speed results using my kbench9000 software [8] comparing the new
(top two lines) and old (bottom two lines), with turbo turned on:

Xeon E3-1505M v5 [9] -- 14nm Skylake Laptop
hacl64: 109783 cycles per call
fiat32: 232710 cycles per call
donna64: 121794 cycles per call
donna32: 411588 cycles per call

Core i5-5200U [10] -- 14 nm Broadwell Laptop
hacl64: 127001 cycles per call
fiat32: 253234 cycles per call
donna64: 137200 cycles per call
donna32: 438816 cycles per call

I've updated the WireGuard formal verification site [11] to contain
this information. In a few days I expect to update this again with
some further exciting results in the same formal verification genre.

Let me know if you have any questions.

Regards,
Jason

[1] https://github.com/mitls/hacl-star
[2] https://www.fstar-lang.org/
[3] https://github.com/FStarLang/kremlin
[4] https://eprint.iacr.org/2017/536.pdf
[5] https://github.com/mit-plv/fiat-crypto
[6] https://coq.inria.fr
[7] https://people.csail.mit.edu/jgross/personal-website/papers/2018-fiat-crypto-pldi-draft.pdf
[8] https://git.zx2c4.com/kbench9000/about/
[9] https://ark.intel.com/products/89608/Intel-Xeon-Processor-E3-1505M-v5-8M-Cache-2_80-GHz
[10] https://ark.intel.com/products/85212/Intel-Core-i5-5200U-Processor-3M-Cache-up-to-2_70-GHz
[11] https://www.wireguard.com/formal-verification/
