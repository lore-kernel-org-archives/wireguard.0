Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6af94c2f
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 08:35:46 +0000 (UTC)
Date: Mon, 7 Nov 2016 09:37:24 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20161107083724.GA13777@tuxmachine.polynome.dn42>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
In-Reply-To: <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 03:06:02AM +0100, Jason A. Donenfeld wrote:
> Not a lot of participation from the LEDE package maintainer

Well, I only saw one mail from the reporter, so it's difficult to
understand your discussion.

I haven't run-tested wireguard on an actual router in a while, so there
could indeed be some recently-introduced problem at runtime (possibly
endianness-related).

> so I just ordered a TL-WR841N for =E2=82=AC10, which should arrive on Tue=
sday,
> and then I'll try to reproduce on actual hardware, and in general keep
> things rolling well on this platform.

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYID0/AAoJEL4B7CKgTi5G6FIQAJ7ECMCfs6W/Z/Iu2CyaQXG4
2IynlX25FEn0qf0kmWWiQyDLXm+gDkAtua0TAQurHvza7Egy12WXS/gXEHb+zPdf
EWNuow/T9FejNN+5KaPWfG1h9Ellfzjfpx1eAwVDJIEl8pha614QHxelnIX362yO
zkNciC5Cj/jb3Fz8miYzdC65oGSAW2M4uWkk9kRp4lRTDJpgWdorcAQPs66YLRk9
f9oFx9glneQ1+GsQ0a+4EuP6jRgPOr2S+BFz6e86juUa9dRr22dCDmQvUJyc/+BN
n2kP/LUS7x+fZUu6ZcVnsMaqzWl+TIhtCm1XqnsULoTTmj4On84caBF7RElFOfMJ
jIbvn2HhzJudBKw3Ww8iHDY7bdrv2qYw5RUithE636cKvKsGMsjSbXk9wRk52Dh4
2PsAxkQmRRKmWMD9vj9ACMw8a0w0KJpEcFHudShJ0FWgxyt1xoln57+wYwDX2JTA
xyMYtdF6C4IjlmVLXb59+3GAwaeT0ssey+T4klTs37/K5NP9UnNmQ4Bwa0KTxiEX
hW7RV3uUaqvcQlFRvEVHl70N1/pIC/MZGL2ybyNlX892187ecWkAYKapInjRQbY6
wEuHWPBlYxhjawxgusdT/zH9N+R8ZsVJJapmpqko15aAKQWtR3dgc3UqCIIE3zyM
Orrb+66owuXImTyHUBWD
=Fpi1
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
