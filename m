Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1355fb83
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 22:18:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 249d699c
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 22:18:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba2583f3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 22:18:53 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b81so50672305lfe.1
 for <wireguard@lists.zx2c4.com>; Thu, 03 Nov 2016 15:20:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161103.130852.1456848512897088071.davem@davemloft.net>
References: <CAHmME9ogYTGFaNDt1CD0FxEHxDzVhNX=AN3_PH3t=0zREGgYPA@mail.gmail.com>
 <20161103004934.GA30775@gondor.apana.org.au>
 <CAHmME9oL-pOWWXXFhJz1vSm5ftnSfmYrquGbH0acapgEL=c4Ew@mail.gmail.com>
 <20161103.130852.1456848512897088071.davem@davemloft.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 3 Nov 2016 23:20:08 +0100
Message-ID: <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Content-Type: text/plain; charset=UTF-8
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Martin Willi <martin@strongswan.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org,
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

Hi David,

On Thu, Nov 3, 2016 at 6:08 PM, David Miller <davem@davemloft.net> wrote:
> In any event no piece of code should be doing 32-bit word reads from
> addresses like "x + 3" without, at a very minimum, going through the
> kernel unaligned access handlers.

Excellent point. In otherwords,

    ctx->r[0] =3D (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
    ctx->r[1] =3D (le32_to_cpuvp(key +  3) >> 2) & 0x3ffff03;
    ctx->r[2] =3D (le32_to_cpuvp(key +  6) >> 4) & 0x3ffc0ff;
    ctx->r[3] =3D (le32_to_cpuvp(key +  9) >> 6) & 0x3f03fff;
    ctx->r[4] =3D (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;

should change to:

    ctx->r[0] =3D (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
    ctx->r[1] =3D (get_unaligned_le32(key +  3) >> 2) & 0x3ffff03;
    ctx->r[2] =3D (get_unaligned_le32(key +  6) >> 4) & 0x3ffc0ff;
    ctx->r[3] =3D (get_unaligned_le32(key +  9) >> 6) & 0x3f03fff;
    ctx->r[4] =3D (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;

> We know explicitly that these offsets will not be 32-bit aligned, so
> it is required that we use the helpers, or alternatively do things to
> avoid these unaligned accesses such as using temporary storage when
> the HAVE_EFFICIENT_UNALIGNED_ACCESS kconfig value is not set.

So the question is: is the clever avoidance of unaligned accesses of
the original patch faster or slower than changing the unaligned
accesses to use the helper function?

I've put a little test harness together for playing with this:

    $ git clone git://git.zx2c4.com/polybench
    $ cd polybench
    $ make run

To test with one method, do as normal. To test with the other, remove
"#define USE_FIRST_METHOD" from the source code.

@Ren=C3=A9: do you think you could retest on your MIPS32r2 hardware and
report back which is faster?

And if anybody else has other hardware and would like to try, this
could be nice.

Regards,
Jason
