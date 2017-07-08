Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a79b7b5
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 13:56:13 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c27fe63
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 13:56:12 +0000 (UTC)
Date: Sat, 8 Jul 2017 16:14:02 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Installation instructions for Debian
Message-ID: <20170708141402.GA13268@tuxmachine.polynome.dn42>
References: <20170513070534.GA22218@tuxmachine.polynome.dn42>
 <CAHmME9o=EGWOcTRVtVQVCoJXL6KueX8eM98GWBJUtzEE67tAhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
In-Reply-To: <CAHmME9o=EGWOcTRVtVQVCoJXL6KueX8eM98GWBJUtzEE67tAhw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

I think there is a small mistake in the installation instruction for
Debian, sorry about that: the "Pin-Priority" should be set to 150 instead
of 200.

Long explanation: on jessie, the jessie-backports repository also has a
priority of 200.  After enabling unstable with the same priority, APT will
propose to upgrade all packages from jessie-backports to unstable, which
is probably not wanted nor expected.

Daniel, does that all make sense?

Baptiste

On Sun, May 14, 2017 at 12:58:37AM +0200, Jason A. Donenfeld wrote:
> Hey Baptiste,
>=20
> Spectacular, thanks a bunch. I think I had asked about this same thing
> a while back, but somehow I got confused in the ensuing mailing list
> thread and eventually I forgot about it. So I'm glad you've brought
> this back up. I updated the install page with verbatim what you sent.
>=20
> Jason
>=20
> On Sat, May 13, 2017 at 9:05 AM, Baptiste Jonglez
> <baptiste@bitsofnetworks.org> wrote:
> > Hi Jason,
> >
> > Could you update the installation instructions for Debian [1]?
> >
> > Based on the discussion from a few months ago, and given that Wireguard
> > now supports Jessie's 3.16 kernel, these instructions should be added:
> >
> >     For Debian jessie or stretch:
> >     # echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt=
/sources.list.d/unstable-wireguard.list
> >     # cat <<EOF > /etc/apt/preferences.d/limit-unstable
> >     Package: *
> >     Pin: release a=3Dunstable
> >     Pin-Priority: 200
> >     EOF
> >     # apt update
> >     # apt install wireguard-dkms wireguard-tools
> >
> > I have verified that the resulting setup is functional (with 0.0.201704=
21-2 on jessie).
> >
> > Thanks,
> > Baptiste
> >
> > [1] https://www.wireguard.io/install/

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAllg6KEACgkQvgHsIqBO
Lkaytg//U+7yL5jKI+m+MO1iX/PEzZpzDfUAUAcXdIi3FI6xw9P9nR84sJ36M4fk
1XatTkRmzQhvi8a3kw0hpcJDC0DSqVvs1NuDiZVTeqLAamcQRMRcsV5Rb+w6FEHX
oORJvkNauo6EKo/+w4An7wN7TjnRsrcsEVXST/16UJJyseUUZL+XDd0hF8N3C2CR
+wTroUF3Mn4jhhGUUXiY7Xkl6mXhyfbn2C9792rNLdnP48rQv8fRZS4fWRHh39D7
/w08domEnJdihE2jopnhIgeFKDaDhx5PZOubXYmjHcUDuygshRwVonCtJrAlq8Ok
Qd4GLSnuRLBj3UcBNoltBV+VoAmSnApy3fC6qTYIGap5M//BhXYxkBVfSkDe7KmF
eHpA2EACONOuRhHm/9jnN3sikn/JAYNKNhvae1aFNY0y/vUD51lctY5oY3Ud+el4
OawFsYvgH7jH89hD27vKeDy2gM72GArp2MlvDVXOL7tz5Wq1HyB8t0uNSU/QFLfX
T66tsTWGcMI8Veu5v/LOsFyZmTUKCPwwb7vhRDskIsx+rCG4qErpDQ9NLDANFMo6
68BN4vwl/vcMGgzyVfYUcrZwgCbK+FiFIo2mUjkbXSqghU7qhK9OuaZqfNiXWcAz
FOfiIpWYPo2cd+DzTl2CWwxkhwhdZeHPk0PvJQIJ4LFacJJhQD8=
=9YOX
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
