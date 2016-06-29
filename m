Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff1194fd
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 01:42:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c222145
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 01:42:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9879bb48
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 01:42:26 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id q132so23140175lfe.3
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2016 18:45:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGZ8ZG13p6bSvFm1D_m3_uSQ-5XDmMwJ-og8wU_Q8UjTtP-y6Q@mail.gmail.com>
References: <CAHmME9rWDZs5o0QSe-UE=0zB6-QBq0w_EVZ8S14bT-bxG-i0Pg@mail.gmail.com>
 <CAGZ8ZG13p6bSvFm1D_m3_uSQ-5XDmMwJ-og8wU_Q8UjTtP-y6Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jun 2016 03:45:02 +0200
Message-ID: <CAHmME9p5thSn6hviN-rektGUtm53WsOn+yhf_0MgFQjmKX=44Q@mail.gmail.com>
To: Trevor Perrin <trevp@trevp.net>
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

Hey Trevor!

On Wed, Jun 29, 2016 at 1:12 AM, Trevor Perrin <trevp@trevp.net> wrote:
>
> Very cool, that's a lot of good work, and nice docs.

Hooray! Glad you like it. Perhaps there's a place for it on the Noise homepage?

>
> Are you finding it easy(er) to justify HKDF, yet, instead of something
> more custom? :-)

Alas alas the seductive siren that is Mr Krawczyk... :P

>
>
> A few editorial things (https://www.wireguard.io/protocol/)

Did you see the paper by the way? It's a much bigger overview than the
/protocol/ page.
https://www.wireguard.io/papers/wireguard.pdf
Everyplace where I include Noise crypto or reference Noise, I cite
you. This time I got the URL correct :)

>
>  * You should link the Noise website (which has nicer PDF/HTML specs)
> instead of the Github source (the markdown was written for Pandoc
> instead of Github flavor, so has some glitches in Github view).

Sorry; this was left over from before the site existed. Fixed now.

>
>  * You could omit the first "initiator.key = HMAC" call in processing
> the initial message with PSK, as that key isn't used.
>
>  * You could omit the first two "responder.key = HMAC" calls in
> processing the response message, as that key isn't used.

Yea, that's true. But I wanted to keep the general flow consistent. It
helps reflect more clearly back to what's really happening within the
Noise-level mechanics.
