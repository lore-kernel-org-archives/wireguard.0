Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9d0f5f8
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 18:21:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 420c40a1
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 18:21:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a5a9811
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 18:21:23 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c13so120776543lfg.0
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 10:23:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oejs+USiGJX2P0TgvnR6XRzV1HYZPrq=c-CjGzq59=NQ@mail.gmail.com>
References: <CAHmME9ogYTGFaNDt1CD0FxEHxDzVhNX=AN3_PH3t=0zREGgYPA@mail.gmail.com>
 <20161103004934.GA30775@gondor.apana.org.au>
 <CAHmME9oL-pOWWXXFhJz1vSm5ftnSfmYrquGbH0acapgEL=c4Ew@mail.gmail.com>
 <20161103.130852.1456848512897088071.davem@davemloft.net>
 <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
 <20161104173723.GB34176@google.com>
 <CAHmME9oejs+USiGJX2P0TgvnR6XRzV1HYZPrq=c-CjGzq59=NQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 19:23:05 +0100
Message-ID: <CAHmME9pDjyL+9HNs4PUgb3dtrH3=zt+YmAmWs+T2b6HnWD4wuw@mail.gmail.com>
To: Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset=UTF-8
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

On Mon, Nov 7, 2016 at 7:08 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
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

In fact, I'm not so sure this happens here. In the while loop, each
new walk.src.virt.addr will be aligned to BLOCK_SIZE or be aligned by
virtue of being at the start of a new page. In the subsequent if
block, walk.src.virt.addr will either be
some_aligned_address+BLOCK_SIZE, which will be aligned, or it will be
a start of a new page, which will be aligned.

So what did you have in mind exactly?

I don't think anybody is running code like:

for (size_t i = 0; i < len; i += 17)
    poly1305_update(&poly, &buffer[i], 17);

(And if so, those consumers should be fixed.)
