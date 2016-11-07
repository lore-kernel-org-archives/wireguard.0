Return-Path: ebiggers@google.com
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
 [209.85.192.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2907bac
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 18:25:05 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id i88so93842442pfk.2
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 10:26:50 -0800 (PST)
Return-Path: <ebiggers@google.com>
Date: Mon, 7 Nov 2016 10:26:46 -0800
From: Eric Biggers <ebiggers@google.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20161107182646.GA34388@google.com>
References: <CAHmME9ogYTGFaNDt1CD0FxEHxDzVhNX=AN3_PH3t=0zREGgYPA@mail.gmail.com>
 <20161103004934.GA30775@gondor.apana.org.au>
 <CAHmME9oL-pOWWXXFhJz1vSm5ftnSfmYrquGbH0acapgEL=c4Ew@mail.gmail.com>
 <20161103.130852.1456848512897088071.davem@davemloft.net>
 <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
 <20161104173723.GB34176@google.com>
 <CAHmME9oejs+USiGJX2P0TgvnR6XRzV1HYZPrq=c-CjGzq59=NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9oejs+USiGJX2P0TgvnR6XRzV1HYZPrq=c-CjGzq59=NQ@mail.gmail.com>
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

On Mon, Nov 07, 2016 at 07:08:22PM +0100, Jason A. Donenfeld wrote:
> Hmm... The general data flow that strikes me as most pertinent is
> something like:
> 
> struct sk_buff *skb = get_it_from_somewhere();
> skb = skb_share_check(skb, GFP_ATOMIC);
> num_frags = skb_cow_data(skb, ..., ...);
> struct scatterlist sg[num_frags];
> sg_init_table(sg, num_frags);
> skb_to_sgvec(skb, sg, ..., ...);
> blkcipher_walk_init(&walk, sg, sg, len);
> blkcipher_walk_virt_block(&desc, &walk, BLOCK_SIZE);
> while (walk.nbytes >= BLOCK_SIZE) {
>     size_t chunk_len = rounddown(walk.nbytes, BLOCK_SIZE);
>     poly1305_update(&poly1305_state, walk.src.virt.addr, chunk_len);
>     blkcipher_walk_done(&desc, &walk, walk.nbytes % BLOCK_SIZE);
> }
> if (walk.nbytes) {
>     poly1305_update(&poly1305_state, walk.src.virt.addr, walk.nbytes);
>     blkcipher_walk_done(&desc, &walk, 0);
> }
> 
> Is your suggestion that that in the final if block, walk.src.virt.addr
> might be unaligned? Like in the case of the last fragment being 67
> bytes long?

I was not referring to any users in particular, only what users could do.  As an
example, if you did crypto_shash_update() with 32, 15, then 17 bytes, and the
underlying algorithm is poly1305-generic, the last block would end up
misaligned.  This doesn't appear possible with your pseudocode because it only
passes in multiples of the block size until the very end.  However I don't see
it claimed anywhere that shash API users have to do that.

Eric
