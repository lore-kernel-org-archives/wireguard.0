Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3640b457
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 06:59:50 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8ccfa6b
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 06:59:50 +0000 (UTC)
Date: Sat, 13 May 2017 09:10:40 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Jason@zx2c4.com
Subject: Rebasing Wireguard's master branch
Message-ID: <20170513071040.GC22218@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

Could you please stop rebasing the master branch of the git repository?
It's really annoying (and possibly confusing) to obtain merge conflicts
while simply pulling the latest changes.

If you want to rebase, please use feature branches or something similar.

Thanks,
Baptiste

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlkWsXAACgkQvgHsIqBO
LkZbSA/8DSC2O6YiM/FxschP6etYedc/WTalhGmDpDdPumOnT06a0zgFfSxZ8TLL
NTzLZGdoA7E+3M+lO1rcwbAtTI3t5NNDTulexklYIVSLKIKjguNBaHM9DzZjkp6T
+3jvqS4OihuL/hXh1n5lCdDMJqGCkMzSPH2yBKJ0ufNpFYw6UFr+g+XV2fo5fFsY
rnswm2I3b2AONiIoJczYqgYVIj2jkW4tCokSnH5PFfotAay8ZzxkPZPJ3mGEbCnX
fa2+hh9pi5X8r439drVlucX2uR1lIucfBJTm7YLLECooWGUP012oUwm0Z6V1g6CV
Y+unjmyZxY6QTmp60ZH6zSxS5Q7Svv0niDpRbxmjbDs+VHCNP67c9g5nKgK+UQmU
tLzktu5Yep8BGykFMlru508OrIEg0w6kSWvlG7g55WtO9VozW/+Rtr7jvK4cpyP+
KlskFAx/cWlK/nbd3FTgKrI1RR/waBzO5SQ7shw36V5K66H730PpBt51OoXdqUIB
sKbvt0sS9+gKXeAensQ1zhgWiCaV88NSHLDvhWPpYxdHBbQbyuu3SCG36jDw+OJ0
uFjomHGLCkLYnDKAHFb+G1W86d5bKTiY41gUfbCabanKwwrF78f2SF6OCbdjDwtu
2C8Q7F86BU7vhiTsXFXqMzji4HzXWrDxkbmY2NNwRvC7Y3MxdGk=
=KVm1
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
