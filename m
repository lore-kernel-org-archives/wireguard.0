Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b191ddd
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Feb 2018 13:11:22 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afe77d76
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Feb 2018 13:11:22 +0000 (UTC)
Date: Tue, 13 Feb 2018 14:17:59 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
Message-ID: <20180213131758.GA5242@lud.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
 <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
 <20180212073501.GA5305@tuxmachine.localdomain>
 <20180212074255.GB5305@tuxmachine.localdomain>
 <CAHmME9pvBg3OHLwun3uqdoCqmQBxxmwh1y2jxWUcdOKyZynNsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
In-Reply-To: <CAHmME9pvBg3OHLwun3uqdoCqmQBxxmwh1y2jxWUcdOKyZynNsA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12-02-18, Jason A. Donenfeld wrote:
> Hey Baptiste,
>=20
> On Mon, Feb 12, 2018 at 8:42 AM, Baptiste Jonglez
> <baptiste@bitsofnetworks.org> wrote:
> > Actually, now that I talk about it, it's not 100% true: on this system,
> > there is a second wireguard interface that is not currently used (it's
> > provisionned to connect a future router that is not yet deployed).
> >
> > The interesting part: this interface has a single peer which has no
> > endpoint but a persistent keepalive.

It seems to be a valid hypothesis: after I disabled persistent keepalives
on this interface (delete interface, remove persistent keepalive from
configuration, create interface again), memory usage has stopped growing:

  https://files.polyno.me/tmp/memory-leak-wireguard-annotated.png

> That's a super useful observation! I'm guessing this will fix it:
> https://git.zx2c4.com/WireGuard/commit/?id=3Dc5c22fb9bad1807a612b6055e004=
9d68f4600605

Nice, thanks!  I'm looking forward to testing the next release then.

> I'm still analyzing everything to find other places where I might have
> missed something, but hopefully the above does it.

Baptiste

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlqC5X4ACgkQvgHsIqBO
LkaDuQ/8D5NgYfzs1K3Y5S+3oNnLqTFjgsYq8zOgfd+AKmSQ2V9HwS7Ba9dI+r89
5ptE5rVjhVBrF6armIo9lJP0WVHI+Huc9nKQpjesdhHZrS8TjYjf/A229me3eRfj
0pmpFCm771zxqwu9SZCiGZwGVJPHW+DKOMnzY6RVCawoNoPiliIFe870esDFiNj4
F9vMhy7JFORG3DZmkDgHTXajIDsbKr8dAShtiiHVSGoorYk6fQcT62X8NN/dmDMg
85pjxY1g0GqhwUTaaZ3q70y8+ioCkbzSuM1E3PkTlJKXbeMUOoJO0wgwi5qYInn3
UO8TdifC9D/3x0zmvBn4OS6q9jXvJJX7u66f6Je14DQVCmBTNMMxjwTmoxXSYU2A
DsB/ziUJ4pHCanXjBx58TtOuiHC0qt25oMlBSVzdNFyAT4LQOLy45hkPjldzqZYs
CIcWLtE/BIepAoN78N2eAGmE9GTVM+DrKJPp4LKifbgiZxtDrEJ+dxuq4wbl71or
N9G2+8jqzk3o20e490W2LPszF+/hZQZ3RLURS1XqpBhPI4K/01VXFqls89q1+PRc
agy1lFrJ5TH48ms0IbzpKIzIjUTxDNh/lB+dICHF+C4L9vPWilM1UXrTFpVfAIO+
7Fg5v627FhpVy5okRWeDJKmhecbUQv/DOkACaPFezKi0POybUJw=
=OekX
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
