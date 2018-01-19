Return-Path: greg@kroah.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 113bf794
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 08:26:24 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 259a084b
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 08:26:24 +0000 (UTC)
Date: Fri, 19 Jan 2018 09:29:57 +0100
From: Greg KH <greg@kroah.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Formally Verified Cryptographic Primitive Implementations
Message-ID: <20180119082957.GB14517@kroah.com>
References: <CAHmME9pWnFh4jN72hRo6kFzWTEQn4xF8AGNQUg8r3g_eAPBvdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9pWnFh4jN72hRo6kFzWTEQn4xF8AGNQUg8r3g_eAPBvdg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jan 18, 2018 at 04:42:10PM +0100, Jason A. Donenfeld wrote:
> Hi folks,
> 
> Writing crypto code is hard and sometimes scary. Especially on things
> like elliptic curves and big number arithmetic, subtle but critical
> bugs often sit around undetected for years. For this reason, I've been
> working with some researchers at INRIA on using a formally verified
> Curve25519 implementation inside WireGuard. This last week I had the
> pleasure of talking with INRIA researchers and MIT researchers about
> related efforts to automatically generate C implementations of
> elliptic curve scalar multiplication from formal models. These models
> produce proofs of correctness alongside machine-generated C. I've
> taken these implementations and integrated them into WireGuard.
> 
> For 64-bit Curve25519 multiplication, we're using HACL* [1], which has
> specifications written in F* [2] and passes them through KreMLin [3]
> for C generation. You can read the INRIA researchers paper [4] for
> more information. Not only is this formally verified, but it is also
> faster than our previous implementation (agl's donna-64). Mozilla's
> NSS is doing something similar with HACL*.
> 
> For 32-bit Curve25519 multiplication, we're using Fiat-Crypto [5],
> which has specifications written in the abstract proof language Coq
> [6], which also generates C code. These MIT researchers also have a
> paper available [7]. This is faster than what we're using before
> (agl's donna-32) and uses much less stack space, which means we no
> longer need to kmalloc on platforms without separate irq stacks, which
> is a nice boost. Google's BoringSSL is doing something similar with
> Fiat-Crypto.
> 
> Note that not _all_ of our cryptographic primitives are verified.
> We're starting with replacing these two C implementations with
> formally verified ones. Over time, we'll gradually replace remaining
> existing implementations with formally verified counterparts. But
> certainly, as this research is state of the art and quite new, the
> work here is in the evolutionary category.
> 
> Some speed results using my kbench9000 software [8] comparing the new
> (top two lines) and old (bottom two lines), with turbo turned on:
> 
> Xeon E3-1505M v5 [9] -- 14nm Skylake Laptop
> hacl64: 109783 cycles per call
> fiat32: 232710 cycles per call
> donna64: 121794 cycles per call
> donna32: 411588 cycles per call
> 
> Core i5-5200U [10] -- 14 nm Broadwell Laptop
> hacl64: 127001 cycles per call
> fiat32: 253234 cycles per call
> donna64: 137200 cycles per call
> donna32: 438816 cycles per call
> 
> I've updated the WireGuard formal verification site [11] to contain
> this information. In a few days I expect to update this again with
> some further exciting results in the same formal verification genre.
> 
> Let me know if you have any questions.

No questions, just a general, "Wow, this is great work!"

It's wonderful to see this happen, thanks so much for pushing this
forward.

greg k-h
