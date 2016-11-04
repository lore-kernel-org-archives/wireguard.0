Return-Path: ebiggers@google.com
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
 [209.85.192.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 427b5b80
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 17:36:05 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 189so55286199pfz.3
 for <wireguard@lists.zx2c4.com>; Fri, 04 Nov 2016 10:37:28 -0700 (PDT)
Return-Path: <ebiggers@google.com>
Date: Fri, 4 Nov 2016 10:37:23 -0700
From: Eric Biggers <ebiggers@google.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20161104173723.GB34176@google.com>
References: <CAHmME9ogYTGFaNDt1CD0FxEHxDzVhNX=AN3_PH3t=0zREGgYPA@mail.gmail.com>
 <20161103004934.GA30775@gondor.apana.org.au>
 <CAHmME9oL-pOWWXXFhJz1vSm5ftnSfmYrquGbH0acapgEL=c4Ew@mail.gmail.com>
 <20161103.130852.1456848512897088071.davem@davemloft.net>
 <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Martin Willi <martin@strongswan.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, David Miller <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] poly1305: generic C can be faster on chips
 with slow unaligned access
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 03, 2016 at 11:20:08PM +0100, Jason A. Donenfeld wrote:
> Hi David,
> 
> On Thu, Nov 3, 2016 at 6:08 PM, David Miller <davem@davemloft.net> wrote:
> > In any event no piece of code should be doing 32-bit word reads from
> > addresses like "x + 3" without, at a very minimum, going through the
> > kernel unaligned access handlers.
> 
> Excellent point. In otherwords,
> 
>     ctx->r[0] = (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
>     ctx->r[1] = (le32_to_cpuvp(key +  3) >> 2) & 0x3ffff03;
>     ctx->r[2] = (le32_to_cpuvp(key +  6) >> 4) & 0x3ffc0ff;
>     ctx->r[3] = (le32_to_cpuvp(key +  9) >> 6) & 0x3f03fff;
>     ctx->r[4] = (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;
> 
> should change to:
> 
>     ctx->r[0] = (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
>     ctx->r[1] = (get_unaligned_le32(key +  3) >> 2) & 0x3ffff03;
>     ctx->r[2] = (get_unaligned_le32(key +  6) >> 4) & 0x3ffc0ff;
>     ctx->r[3] = (get_unaligned_le32(key +  9) >> 6) & 0x3f03fff;
>     ctx->r[4] = (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;
> 

I agree, and the current code is wrong; but do note that this proposal is
correct for poly1305_setrkey() but not for poly1305_setskey() and
poly1305_blocks().  In the latter two cases, 4-byte alignment of the source
buffer is *not* guaranteed.  Although crypto_poly1305_update() will be called
with a 4-byte aligned buffer due to the alignmask set on poly1305_alg, the
algorithm operates on 16-byte blocks and therefore has to buffer partial blocks.
If some number of bytes that is not 0 mod 4 is buffered, then the buffer will
fall out of alignment on the next update call.  Hence, get_unaligned_le32() is
actually needed on all the loads, since the buffer will, in general, be of
unknown alignment.

Note: some other shash algorithms have this problem too and do not handle it
correctly.  It seems to be a common mistake.

Eric
