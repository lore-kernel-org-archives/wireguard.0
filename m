Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d5aae21
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 22:10:23 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e464031
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 22:10:23 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Bruno Wolff III <bruno@wolff.to>,
 Stefan Tatschner <rumpelsepp@sevenbyte.org>
Subject: Re: WireGuard Upstreaming Roadmap (November 2017)
In-Reply-To: <20171207133759.GA395@wolff.to>
References: <20171111044854.GA7956@zx2c4.com>
 <CAB=oiXZYChYMzqK4cufNy+Gr-QHK7jE=h8-9+zQMx67_xsLVoQ@mail.gmail.com>
 <20171207133759.GA395@wolff.to>
Date: Thu, 07 Dec 2017 16:57:58 -0500
Message-ID: <878tee2obd.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu 2017-12-07 07:37:59 -0600, Bruno Wolff III wrote:
> On Thu, Dec 07, 2017 at 11:22:04 +0100,
>   Stefan Tatschner <rumpelsepp@sevenbyte.org> wrote:
>>
>>Assuming I am right according the crypto agility, what's the upgrade
>>path if any of the involved cryptographic algorithms will be declared
>>insecure/broken? From my point of view wireguard tries to stay as
>>simple as possible and in general that's a good idea. I am just a bit
>>worrying about the possible lack of a clear upgrade path once
>>wireguard is mainlined.
>
> Having alternate crypto paths is also a weakness. There have been lots of=
=20
> downgrade attacks against systems that incorporate agility.

this is clearly true, but it doesn't answer the question that Stefan was
asking.

As i understand it, for the current form of wireguard, the only way to
resolve the sort of problem described will be to create a "wireguard2"
which uses new, better primitives.  and it will probably need to listen
on a different port than "traditional wireguard" if you have any intent
on supporting both variants at the same time on the same host.

As upgrade paths go, this isn't too terrible, but it's not exactly
pretty either.  it'd be great to hear if folks have better ideas.

   --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlopuWYACgkQFJitxsGS
MjegJhAAlKalZEsFSWxDxYhasN66Ur8kCuXjJgwuccGxsJcWY81EwyFRIPGt6y+b
uuVsA+vhGOif6Vp20bnoAMZSV5D7uLzf7/d82e+09pOM9++Q9mKl2xOlj4hCtyXP
/BCPaIvsbc7LP4Oq2+2BE/0hJiOFAhlwlAsl6zIOnklbX+mq0m0zp7yx8LriKVB4
X6WCvvDHh2Jm+KEbfpvCFJe89P4krzG7SduisuqSZXA71gjMrGLjLZIi+UScH5mq
BKnlRTAlUwW18vnwXwMMHu4usqchulF/d65ipkOX1pg98j7rbnxB2+jYHtfTVvNC
h/t67HLCumYTl7daiFRvz/VlIPiz/mZ+urWaAKriD2yBt42R/K/adaviiOpgUgmg
j8CzUdQNp2Up5mkCx3khPrJpd1Bsh4G7sr9G4jJvAAzXck8DKHMNs1p/6jr6wP+/
9ZPAJUmaQHdoqk6Bfg/vj0mil2DD1+ONIqPjSFrCxnaGM1unmxypMvee0UWOE+G8
YpPegwpgqBojvtEjaIGZIKubM9SKq6CeqqCrRbSs8Sbfxf8YPl62+zV/BdrAixbi
rO3mRC4rdtSnegzMCVwi9tYbQbi5WLNWOoZBvPsUtnOArxTMngskfHMIkO68nCrk
8p6iJilJ76/P/IhVaz1Se/fHEP0zsb12A+OanzLEQAzYuvXkf60=
=hffh
-----END PGP SIGNATURE-----
--=-=-=--
