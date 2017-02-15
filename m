Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a5e4003
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 21:31:51 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31d2a2d6
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 21:31:51 +0000 (UTC)
Date: Wed, 15 Feb 2017 22:31:54 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
Message-ID: <20170215213153.GC16102@tuxmachine.polynome.dn42>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
In-Reply-To: <87o9y4n555.fsf@alice.fifthhorseman.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 10:50:14AM -0500, Daniel Kahn Gillmor wrote:
> on a similar system i'm using (stretch, with unstable available but
> pinned low), i see only packages from stretch being installed (aside
> from wireguard itself, clearly)
>=20
> 0 root@test:~# cat /etc/apt/sources.list.d/unstable.list=20
> deb http://ftp.us.debian.org/debian/ unstable main
> 0 root@test:~# cat /etc/apt/preferences.d/limit-unstable=20
> Package: *
> Pin: release a=3Dunstable
> Pin-Priority: 200

Thanks for the hint, it worked fine on my stretch system!  Here are the
packages that got pulled:

The following NEW packages will be installed:
  dkms linux-compiler-gcc-6-x86 linux-headers-4.9.0-1-amd64
  linux-headers-4.9.0-1-common linux-headers-amd64 linux-kbuild-4.9
  wireguard-dkms wireguard-tools


On jessie, it worked exactly the same with the 4.9 kernel from
jessie-backports:

# cat /etc/apt/sources.list
deb http://httpredir.debian.org/debian jessie main
deb http://httpredir.debian.org/debian jessie-backports main
deb http://httpredir.debian.org/debian unstable main
# cat /etc/apt/preferences.d/limit-unstable
Package: *
Pin: release a=3Dunstable
Pin-Priority: 200
# apt update
# apt install -t jessie-backports linux-image-amd64 linux-base
# reboot
# apt install wireguard-dkms wireguard-tools
# ./client.sh
# ping 192.168.4.1
PING 192.168.4.1 (192.168.4.1) 56(84) bytes of data.
64 bytes from 192.168.4.1: icmp_seq=3D1 ttl=3D64 time=3D15.1 ms

For the record, it also works fine with the 4.1.34.mptcp kernel from
multipath-tcp.org on jessie :)

Jason, can you write something up on the Wireguard website, since it's so
simple?

Baptiste

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlikyLwACgkQvgHsIqBO
LkaiKRAApzurKfCspjbrhP1pDFn1wh31qlcGTY4VqnHHGcqk1dCQcmQsbpwed9DY
tQVzJTyFovluPalclFwyi+4lGBXo3iYEWpHqh5TKSQmp2AuS0t2L782Wo+Sv0amJ
3DUgQpCEvenS7VVNZRvWqKIlfIHMwX4nBZtBJWRAMdOlKRXIb4DcVeloMCQu3RNL
Q82Y3dRxWT+FHVZ2deShAp5ABnbSNgd0HwnvFmgCV04dPZGZkzzCKD6M9pWJK3/K
7yqq8RNq0tem79qLlVeb4ZRmH7OQC+O/jtqR0gct3z1U2a5qLYdmQyznpSltcn1t
ULkEsRE7goMB9Libg50jvSBNcC9/k30lZMxXKMCc3mklwxCQ3G7Z35AOgy9SoG73
3VEFWgqQCwXBAjOntYRQygh1E+LFgsgLEx6H4SZ/BhdAWMDeRqVRiKT8syY1FP3w
w2jXObO5vVTCavVAFFrRm7tsYMQ+1mx3pVVvNUHL+C+FzjXp9XefSr/TBx+QHzVf
Vx9eye4ExBLJy4iXEGS72JrGdDCJGNMM3UeQQd0oRg1md4c081L1NYbTvO2jly0p
ROIn5KLjHl6ckStBCxNwqoUzqZRWAc24HiO1q4UDui1GdjptCKJnqfPHKSLrHp7A
l486K7xxu1BmZLoDN0GxG9UUmgEFRNcepM6ZGGCKUNL+T/6j8gE=
=V0AZ
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
