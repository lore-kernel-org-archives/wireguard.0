Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19496f13
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 19:39:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9661011e
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 19:39:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9108315c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 19:39:43 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id t196so122792738lff.3
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 11:41:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161107192505.GB34388@google.com>
References: <CAHmME9ogYTGFaNDt1CD0FxEHxDzVhNX=AN3_PH3t=0zREGgYPA@mail.gmail.com>
 <20161103004934.GA30775@gondor.apana.org.au>
 <CAHmME9oL-pOWWXXFhJz1vSm5ftnSfmYrquGbH0acapgEL=c4Ew@mail.gmail.com>
 <20161103.130852.1456848512897088071.davem@davemloft.net>
 <CAHmME9pm4DHuBsE+hoFxnm1B5OWAZ+OyKXzeKDxHtisZpw4ebg@mail.gmail.com>
 <20161104173723.GB34176@google.com>
 <CAHmME9oejs+USiGJX2P0TgvnR6XRzV1HYZPrq=c-CjGzq59=NQ@mail.gmail.com>
 <20161107182646.GA34388@google.com>
 <CAHmME9rzBST8Lqapzykwf2rUyxLXuyOF0wX+Sy259Qtx9a4YSg@mail.gmail.com>
 <20161107192505.GB34388@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 20:41:26 +0100
Message-ID: <CAHmME9prw9b6=s25zUCQqWk+M8JEtJALEvZxa-HavWdpuicV0A@mail.gmail.com>
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

On Mon, Nov 7, 2016 at 8:25 PM, Eric Biggers <ebiggers@google.com> wrote:
> No it does *not* buffer all incoming blocks, which is why the source pointer can
> fall out of alignment.  Yes, I actually tested this.  In fact this situation is
> even hit, in both possible places, in the self-tests.

Urgh! v3 coming right up...
