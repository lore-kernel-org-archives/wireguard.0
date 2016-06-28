Return-Path: trevp@trevp.net
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
 [209.85.214.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c3e744a
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 23:09:39 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id c3so2112645obc.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2016 16:12:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rWDZs5o0QSe-UE=0zB6-QBq0w_EVZ8S14bT-bxG-i0Pg@mail.gmail.com>
References: <CAHmME9rWDZs5o0QSe-UE=0zB6-QBq0w_EVZ8S14bT-bxG-i0Pg@mail.gmail.com>
From: Trevor Perrin <trevp@trevp.net>
Date: Tue, 28 Jun 2016 16:12:13 -0700
Message-ID: <CAGZ8ZG13p6bSvFm1D_m3_uSQ-5XDmMwJ-og8wU_Q8UjTtP-y6Q@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: noise <noise@moderncrypto.org>, wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [noise] [ANNOUNCE] WireGuard Launched!
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jun 28, 2016 at 7:46 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> At long last, the WireGuard project is launched! It's been a very long
> road, but at this point I feel confident enough in the general design
> and protocol that it's time to open this up for more widespread
> testing and feedback.

Very cool, that's a lot of good work, and nice docs.

Are you finding it easy(er) to justify HKDF, yet, instead of something
more custom? :-)


A few editorial things (https://www.wireguard.io/protocol/)

 * You should link the Noise website (which has nicer PDF/HTML specs)
instead of the Github source (the markdown was written for Pandoc
instead of Github flavor, so has some glitches in Github view).

 * You could omit the first "initiator.key = HMAC" call in processing
the initial message with PSK, as that key isn't used.

 * You could omit the first two "responder.key = HMAC" calls in
processing the response message, as that key isn't used.


Trevor
