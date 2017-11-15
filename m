Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc2c2483
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 21:56:32 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b1f7d8e
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 21:56:32 +0000 (UTC)
Date: Wed, 15 Nov 2017 23:00:45 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: =?iso-8859-1?Q?Adri=E1n_Mih=E1lko?= <adriankoooo@gmail.com>
Subject: Re: Fix Debian install guide on wireguard.com/install
Message-ID: <20171115220045.GE27782@lud.polynome.dn42>
References: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
 <20171115110849.GA27782@lud.polynome.dn42>
 <9AD312F5-AB70-40F8-BAF9-64200037D125@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
In-Reply-To: <9AD312F5-AB70-40F8-BAF9-64200037D125@gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please keep the list in copy.

On 15-11-17, Adri=E1n Mih=E1lko wrote:
> Hi Baptiste,
>=20
> I am using Rapbian and Raspberry Pi 3, it is not compatible with this rep=
o?

As far as I know, Raspbian uses its own repositories.  I had a quick look
at the repository archive and they don't seem to package wireguard.

Installing wireguard from the official Debian armhf package might work,
but there could be compatibility issues.  The installation instructions
are valid for Debian, where the GPG key for unstable is already available.

Does wireguard work fine on your raspberrypi when you install it this way?

> $ cat /etc/issue
> Raspbian GNU/Linux 8 \n \l
>=20
> Best regards,
> Adrian
>=20
> > On 15 Nov 2017, at 12:08, Baptiste Jonglez <baptiste@bitsofnetworks.org=
> wrote:
> >=20
> > Hi Daniel, Adri=E1n,
> >=20
> > On 31-10-17, Adri=E1n Mih=E1lko wrote:
> >> There is a missing step in the Debian installation guide, you must imp=
ort
> >> GPG keys before you can add the new repo:
> >=20
> > Which version of Debian are you using?
> >=20
> > The installation instructions on https://www.wireguard.com/install/ <ht=
tps://www.wireguard.com/install/> are
> > tested on Jessie and Stretch, anything older (wheezy) will not work
> > because the kernel is too old.
> >=20
> > Jason, can you add a note on the installation page that says "Jessie or
> > later" somewhere?
> >=20
> > Baptiste
> >=20
> >> gpg --keyserver pgpkeys.mit.edu --recv-key  8B48AD6246925553
> >> gpg -a --export 8B48AD6246925553 | sudo apt-key add -
> >>=20
> >> and also the key 7638D0442B90D010
> >>=20
> >> gpg --keyserver pgpkeys.mit.edu --recv-key 7638D0442B90D010
> >> gpg -a --export 7638D0442B90D010 | sudo apt-key add -
> >>=20
> >> More about PGP and APT:
> >>=20
> >> http://ccm.net/faq/809-debian-apt-get-no-pubkey-gpg-error
> >>=20
> >> Regards,
> >> Adrian Mihalko
> >=20
> >> _______________________________________________
> >> WireGuard mailing list
> >> WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
> >> https://lists.zx2c4.com/mailman/listinfo/wireguard <https://lists.zx2c=
4.com/mailman/listinfo/wireguard>

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAloMuQgACgkQvgHsIqBO
LkZYRw//d0SpCNjNd61ijgebmnB1g/BQCjpcGjIDjXEuWTh9zv59EOlShlMND1bP
crwFyRqdsT47eyIBspto3Td8qxEkOpWL77pseAb25+k0FErgwE+9E9EbdEMf8szh
/YSmHJNNxl9ia6y7McGf6TXdrAXtLVHkUdyFW0ibFSCNcOoa0DliAzQF9QgB4/FA
cW9uCxd4k2gTHuO0h9yAZjNanbmfjkCWDgao7ytod0SeLtadgbPBk5G6c2zaC/Y+
YyVyfrIDLJFb95SCN3LuS98mCGoHv/jAv0ArrHq6a5WF42WJa0WxlSvtM8xCxG1D
JsPv+XQcAPIErEkzuKaruK4gURODzjCBGcvhhh38kT+AdfH6BL4+4GZAx2q71VSm
D/tEZXRJw8y21+T1w+e4BGTk1raqws0zfZbZJXAFjkVvLlzyHkSZ6NCdUxJRO4AK
NGpuKEPi8vUKr1mCwmwwscrcjgi9gzivpFIddQ6xVPkeGtLRIKhKyRcEuz3QAqVF
qnp7k0kJbKnTskRaabQp/SWmqnCJ9Q25U5ky29nZSz7UI701355NLjN3r4uLiSSs
ID7oTyTkHbc9jF0HmrbQaFW40hbffBmoJYofumXpn2E/COU8vYXGHOfgSZsDtHW7
aru984/vgdb36GxvyAF4gNrP2uxBnlRmsYXUqwTBf6REpzdHg1U=
=zK8D
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
