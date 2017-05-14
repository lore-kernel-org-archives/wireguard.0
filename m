Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e71a52f
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 08:34:01 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 815a8f52
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 08:34:01 +0000 (UTC)
Date: Sun, 14 May 2017 10:44:56 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Installation instructions for Debian
Message-ID: <20170514084456.GA7227@tuxmachine.polynome.dn42>
References: <20170513070534.GA22218@tuxmachine.polynome.dn42>
 <CAHmME9o=EGWOcTRVtVQVCoJXL6KueX8eM98GWBJUtzEE67tAhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2017 at 12:58:37AM +0200, Jason A. Donenfeld wrote:
> Hey Baptiste,
>=20
> Spectacular, thanks a bunch. I think I had asked about this same thing
> a while back, but somehow I got confused in the ensuing mailing list
> thread and eventually I forgot about it. So I'm glad you've brought
> this back up. I updated the install page with verbatim what you sent.

Thanks!

Note that the previous installation instructions (basically, just "sudo
apt install wireguard-tools wireguard-dkms") were valid for Debian sid.

The new installation instructions are only valid for Debian jessie and
Debian stretch (admittedly, probably the largest fraction of Debian
users).  But I still think you should reflect this in the instructions.

Debian wheezy is not supported (with its old 3.2 kernel), although it
could be possible to use wireguard with the wheezy-backports kernel
(3.16).  I don't think it's worth mentioning it anyway, Wheezy is
old-stable and will soon be old-old-stable.

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

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlkYGP8ACgkQvgHsIqBO
LkYJWw//QK1k8o/YgoG1bQ4rLh+xqrGnsWY7XeUy2oKnvXssaQQZ6o8a+TW7aYAZ
WC5L091Cje9xv0egoxFfnS7oOL41YCJpsC4VSnZKY5DIxVnxdIDV9VTPxZdmKGpQ
mRo098fMlDSVV94FZRpTfnNw3ijdl3OJsqGuo+R7QNXXCo+5cE1JgdEgPE40i2Nt
xGnpwwJ/ZMYV7GLagF/TvWfD1AEJptLIwrEwnH/NzCWCQMyMiLYnOb3ZLr9z+J2/
n0SkvZW75OXhC0MSC7GC4DqL+k4QNAj36JOnjbKG+Wz3ut7xPlj/qnwZz+keqlp8
cmkv4Lf8rlCbFEXhSikDGXgeZPxDYrfQOi7W6n9Ku41WbZJJ4y/pdR+zoSLhfhdb
TDy1CwfOBcPVnenmIirUofcY/Id5KgCpQ2Bt10agQLwkWTmKYvWyi16JfLk0jRiu
PLtRj2dLuiTk8me1tnc3koGurgzUfUbTA4opOMd1Wp9UzQrvgutWUu/NA4FzzxK7
2cajOlDS696FrdRkS7HwIsNBW1A02ke24YyP/dCfTca3AFURBr0dAT2Z7HsBZQMT
qz9OKcWzFobd/VQBnvTtQ8zzje4n3S0czyjrefmgIIlJF6/uZ+4adupDN27s2uLP
MohQiic++plt1frataCBJe076ztfKu8PbKwBZQ7/CBckisP76rk=
=I/L3
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
