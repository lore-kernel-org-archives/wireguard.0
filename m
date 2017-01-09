Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41a0edd6
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 09:17:22 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c2376a1
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 09:17:22 +0000 (UTC)
Date: Mon, 9 Jan 2017 10:26:51 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
Message-ID: <20170109092651.GA13131@tuxmachine.polynome.dn42>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
 <9129c738-3c36-ebf7-5ce0-c8efbc570835@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
In-Reply-To: <9129c738-3c36-ebf7-5ce0-c8efbc570835@sholland.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2017 at 08:37:55PM -0600, Samuel Holland wrote:
> Hello,
>=20
> On 01/08/17 16:49, Jason A. Donenfeld wrote:
> >However, this doesn't shine any light on the hardest problem: how to
> >update the list of addresses in a memory-bounded fashion. Right now,
> >if you receive an encrypted packet, the endpoint of that peer is
> >updated to the src address of that packet. With multi-endpoint,
> >which endpoint is updated? Is it simply appended to an ever-growing
> >list of recent endpoints? How to keep this clean and manageable?
>=20
> I think there should be a distinction between endpoint addresses
> provided in explicit configuration and those discovered through roaming.
> Presumably, users put those addresses in the configuration file because
> they expect them to be relatively stable. So I think those endpoints
> should always be remembered.

I agree, it's not a hard problem.  Always keep explicitely configured
addresses, and keep at most X addresses discovered through roaming (where
X does not need to be much more than 1, 2 or 3).

> As a separate point, I have a use case that I haven't seen discussed
> yet. I have a WireGuard peer at Site A with a public IP. I have two
> peers, a desktop and a laptop, at Site B, both behind NAT. Both of them
> are configured with the machine at Site A as their only peer. Often I
> take the laptop offsite, and then traffic between the desktop and laptop
> goes through Site A. Good. However, when I have them on the same local
> network, I'd like them to communicate directly (avoiding the round trip
> to Site A).
>=20
> The problem is that, if I add the desktop and laptop as peers to each
> other, they stop sending traffic through Site A at all. Thus, when they
> are _not_ on the same network (so behind two different NATs, as opposed
> to no NAT) they cannot communicate at all.

See the "## Local and scope-dependent addressing" point in my first email,
which unfortunately Jason forgot to quote.  Unless I'm mistaken, this is
exactly the use-case you describe here.

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhzV1MACgkQvgHsIqBO
LkYduhAAn6Db0wmony1UZLky5Z/PBVKp34NNVY24nb1EcS7QIn1w/kjaOdwY9TnH
wl+lEGUJGQeC2kya/t+C9T6UMV94FfD2OxoqzWpIGMKxgkN26FSjXcTV/EyvgMU5
VXQiRlDRlaps1jz8Q2GOL8Y2C7lQh135sE/OXOLK5DF3s+kjCw4vOqIamVf38Geo
3nRTYjnYxuqG20BWs8ldJFM0H7eNgm0mu6USgYu0+V+5e9cCn2kKGg/kBA0BlJmu
gVy8/kPoD+y321g/LZDQiZ5wd5lW+1OALrjfJRvovwkITj07tVP3YT1B1QMb9ybk
M0aqlBAYqpkBEfXC0hci4Mux5cQM5wQikCBGv6geQFZi89fuLkwWiDsdjBWmmKpS
jyZG4rG8Jb2eozobjXXydIznZN6VV2oBW0+gWBYyaSJdn8Ux5wINy64wP2eYtET9
5ljsSs29Apdn47w4ceBlBpWQAL8MeRGoecwzUbfqMfY+QwinNrjPXQd7re0xY6oR
mdtt3EyPm9cHA5Owvv81DKha2F34fAhY8bwn1qzcApsuRniIJWcgjS8jhThCa4xX
4g4g2D8yZPEAQGg8QJiQjAMM4ROCazhFtNEe9EpePW4uDuuZdqsM09/6q/uMfAxo
q2FP/oJlwimD2w4dUskNO8O42iEus5CnrczunqycBx/T6ggSEM0=
=NN/V
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
