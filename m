Return-Path: ebiggers@google.com
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
 [209.85.192.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee701e3f
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 19:23:23 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id d2so94999466pfd.0
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 11:25:09 -0800 (PST)
Return-Path: <ebiggers@google.com>
Date: Mon, 7 Nov 2016 11:25:05 -0800
From: Eric Biggers <ebiggers@google.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20161107192505.GB34388@google.com>
References: <CAHmME9ogYTGFaNDt1CD0FxEHxDzVhNX=AN3_PH3t=0zREGgYPA@mail.gmail.com>
 <20161103004934.GA30775@gondor.apana.org.au>
 <CAHmME9oL-pOWWXXFhJz1vSm5ftnSfmYrquGbH0acapgEL=c4Ew@mail.gmail.com>
 <20161103.130852.1456848512897088071.davem@davemloft.net>
 <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
 <20161104173723.GB34176@google.com>
 <CAHmME9oejs+USiGJX2P0TgvnR6XRzV1HYZPrq=c-CjGzq59=NQ@mail.gmail.com>
 <20161107182646.GA34388@google.com>
 <CAHmME9rzBST8Lqapzykwf2rUyxLXuyOF0wX+Sy259Qtx9a4YSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9rzBST8Lqapzykwf2rUyxLXuyOF0wX+Sy259Qtx9a4YSg@mail.gmail.com>
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

On Mon, Nov 07, 2016 at 08:02:35PM +0100, Jason A. Donenfeld wrote:
> On Mon, Nov 7, 2016 at 7:26 PM, Eric Biggers <ebiggers@google.com> wrote:
> >
> > I was not referring to any users in particular, only what users could do.  As an
> > example, if you did crypto_shash_update() with 32, 15, then 17 bytes, and the
> > underlying algorithm is poly1305-generic, the last block would end up
> > misaligned.  This doesn't appear possible with your pseudocode because it only
> > passes in multiples of the block size until the very end.  However I don't see
> > it claimed anywhere that shash API users have to do that.
> 
> Actually it appears that crypto/poly1305_generic.c already buffers
> incoming blocks to a buffer that definitely looks aligned, to prevent
> this condition!
> 

No it does *not* buffer all incoming blocks, which is why the source pointer can
fall out of alignment.  Yes, I actually tested this.  In fact this situation is
even hit, in both possible places, in the self-tests.

Eric
