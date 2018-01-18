Return-Path: mdt@emdete.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce8c8458
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:41:12 +0000 (UTC)
Received: from emdete.de (total-communication.vfnet.de [80.84.1.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea334a4d
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:41:12 +0000 (UTC)
Date: Thu, 18 Jan 2018 15:44:38 +0100
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: Defaultroutepiercing
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <1516279577.16nr5x0y18.astroid@morple.none>
 <CAHmME9oiqr7dN+riRgJ0jXxxwuXB0U9ot94GsoM7KUWGbEE-0Q@mail.gmail.com>
 <1516283661.uwaeedz44a.astroid@morple.none>
 <CAHmME9oh74ca=PZFe2oK9rvqBZW15Ntmz=e-rnxMYqhG9k8ZAg@mail.gmail.com>
In-Reply-To: <CAHmME9oh74ca=PZFe2oK9rvqBZW15Ntmz=e-rnxMYqhG9k8ZAg@mail.gmail.com>
Message-Id: <1516285609.s6ykysz631.astroid@morple.none>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-qDFi4t3i5zzNpSMzMNyJ"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-qDFi4t3i5zzNpSMzMNyJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Quotation from Jason A. Donenfeld at Januar 18, 2018 15:20:
> On Thu, Jan 18, 2018 at 3:11 PM, M. Dietrich <mdt@emdete.de> wrote:
>> why is "tun." prepended?
> To hack around incompetence on the part of Debian. They order entries
> based on the device prefix.

that is what i wanted to work around with my script. it just
checks if the given nameserver is current and applies it. i
found my script called even when in a vpn for the outer
network - that nameserver should never applied.

my check is if the interface is the one of the default route.
only in that case the nameserver will be applied.

> If you have something custom going on, use PostUp/PostDown or
> PreUp/PreDown to call your custom script, instead of using DNS=3D.

ok. probably the most pragmatic thing to do.

>> the command is issued before the routing is configured.
>> shouldnt the DNS configuration be applied after routing
>> changes?
> I can reason about it in both directions. What's your intuition lead
> you to the _after_ choice?

the defaultroutecheck will fail anyway with your suggestion so
it's not that important anyore. i just thought it's the
natural flow as you need a route to use dns (and i still would
prefere to use DNS=3D instead of PreUp ;) ).

M. Dietrich
=

--=-qDFi4t3i5zzNpSMzMNyJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8ECycNYHT6atlYQywVmjQWUJtykFAlpgstYACgkQwVmjQWUJ
tylhiQ/+NCWm2myZfIIeNih+8BxHJ37tqR2nnJa+459UizlqlRlB7fyKzgnd+Xd4
tjU+MWjenW/H6m88yGA0nhY/9DK4trLZD4SqEnevoKrS4Swbv6GMpw1bYnJYsfeO
a6CANa97U13Wp3w8bHGMJlfiWpvqF5FoIANIhkEAFzz6qt536fb26jXJgf+VgDwy
cUyRtbbHIgVAPC8FY0OGzXPBxFB3UuccQHyqYbZ28TGfrhMg1grVcNnl7p485As8
6mMimcXT7wZkv+d0S/3gwWrepODpC+8S6AM3RdPjIscCaoPJR/FpHxMVvosoujND
6ODWJf/pMful08x/XDKYeaXVYdHyCBfUiUoNBEF5pBIdrBhFnPlFQLxLY0mFgqEB
s2L5FC6tQPhvG04qnHlZKp7YshqjmZMVFAEqyCqGK6W0Pv8XL6ckwyaOU2/NuGiY
LO7O6HWkMzC6JHR8KiDAYmiACj3Hh7iw2OWGICT01nI0e5Xne9XrfhopFpAn2vH/
/zXNX/qCgL91zBlBaK8NM8/cb+E36OQpdzPXaewRoGH1mWjx0AZYwi2YgqfEGWtY
uAkNdvg7pW02mJveQcG8rpSxOs0toydUyN5f9HxYCvAuPNI+Q+3sdp2+GsyDExRo
ZEY/Ayh5dzoRoiLAxUFCY5FAvayuZOQGkFmtwE2CC5X4xyDfM0I=
=k2jN
-----END PGP SIGNATURE-----

--=-qDFi4t3i5zzNpSMzMNyJ--
