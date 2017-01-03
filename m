Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fb2c347
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 14:07:13 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 179670be
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 14:07:13 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, rektide <rektide@voodoowarez.com>
Subject: Re: Compression support- zstd, &c
In-Reply-To: <CAHmME9ps=8bc74tnmKMnitH_wRBLXoioQc+XC_qvqk8Pv6WgBA@mail.gmail.com>
References: <20161230060941.u4bwzdmforghluhz@pdebuildx-amd64.voodoowarez.com>
 <CAHmME9ps=8bc74tnmKMnitH_wRBLXoioQc+XC_qvqk8Pv6WgBA@mail.gmail.com>
Date: Tue, 03 Jan 2017 04:11:52 -0500
Message-ID: <87o9zomrs7.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri 2016-12-30 21:34:56 -0500, Jason A. Donenfeld wrote:
> That's an interesting idea. The first concern that immediately comes
> to mind is data leakage and CRIME-like compression attacks. We'd have
> to tread very carefully in order to do this right. Is there a
> particular implementation strategy for this you have in mind?
> Historically adding compression to crypto protocols has been quite
> risky.

This is my concern as well.  We've only recently managed to get
compression ripped out of TLS, and i'd really like to avoid it finding
its way back into other network security protocols.  The right place to
do compression is at the application layer, where it's at least possible
to distinguish between attacker-supplied traffic and user-sensitive
secrets.

Please do *not* add compressoin into wireguard itself!

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7bLnT1b88rZyl7c1JOz/Wv9oNwoFAlhratgACgkQJOz/Wv9o
NwoUiQ/+KLtSr9saWaMPYKqPDRUOKOfZN0VbWTYWsi/WhMdJeP2MwrMxAYaIWIo0
JA/qfwP7YUXA5OgcMq8zh4xN+Ff8ecR2JE0OXM+0Mj3p3JXMDym85aRwZ8WbSgmo
jZZpZ82bcxwqHi2Z5NJbze3T2w3QTSn11AVtckDssMvacePaQqQmyw2r78nFacQb
abaRQVy4gxvcfifYntcoVQcD2MpbzoD60V8qHOjZAKPAVWj4nRH8HUAqlefIXrBn
izPnzvZETnUEn8VhT7kW4Snb11WvqIMk7dNuefXSsGyL2mngluJ1kFRvW5KTCU6W
0Gz+IudJs4jrav0sUX6pU4h9JbsU7xsAW3xQyFL7hBTtGUdKSj7X3FLuI8o33P2n
tLj94dAMT9O9GJF1lFEDQnZMnAWP+vZmsagmDwVybAiXxtMMON1Uczxsox2eTomE
xb4WTJKiNkOairNfcnbVtkV08ElIEThSwnpGavrR0r+tpIjh7M9kza4m627Eumhx
9w5/1iQAOhe8XSxYVkpHcSrO8tLebdlL6anom30tkzhGH7olJRYAmo9+8eNC0FX4
H8e5dRFpy54KFu7R3bcnhXPkcdD2/I6aflhraDqNPSKOrz3DTJ04AKvBqyXb3eY1
/DW8DTFXxJxW3BY4lojr4xwFjrmBe0WEqoDQOcxSf78++VTV2SM=
=Dtw3
-----END PGP SIGNATURE-----
--=-=-=--
