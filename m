Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fac32a00
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Jul 2016 17:20:34 +0000 (UTC)
Date: Sun, 10 Jul 2016 19:21:05 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160710172105.GD5844@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
 <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
In-Reply-To: <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2016 at 04:54:46PM +0200, Jason A. Donenfeld wrote:
> I don't have a MIPS toolchain on this computer to test this at the
> moment, but maybe this will shave off a little bit from the .ko...
>=20
> strip $(nm --defined-only wireguard.ko | grep -Ev '(^0+ | __)' | cut
> -d ' ' -f 3 | xargs -n 1 echo -N) wireguard.ko

Doesn't seem very effective: http://paste.aliens-lyon.fr/HDg

The size of the module has not changed.

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXgoP9AAoJEL4B7CKgTi5Gc1QP/1+LDbd+rGIGYEvtn2tzUM6R
3xiqmDBAEELSM8DXg0kLfHs/pwgKIcUPEKdiolvUTLYW1wvQcHSECGlGH2CiOFXr
eQnvvWDNCIG2vUNCCVKSnN3Thn2n0IncVcsL8X605kveinsCVTBlHM7I545YR8ic
DqMCP6VHces8kxE2mSFz+pSSlh/civ4V35uYF2xV2ZF5ZxC9xbH3tk2dRKvgjiYn
fJ3zGHSckiu5/ylaMS9LNaa8OAmh6W3OwVzpzy4gkbl2bUol8/fsd3NTS+K1cyV7
Deq8n221LbI0dJkGDOLpmtJ55RNPQsyKsoSjxf7kq4a8uueddgR4Lp1rSNaVRqDu
5gJ6hf3Ancni5fKYrArT/cC5loPBs6X03PIZuv0tEA0yZkYfDHuAy/psfQAs/2Vg
Qz55FxRhHs7vc5fBA31KhKKTpTl7gOPglk+Lkf9pupdI2iXANIhqG5oeazj6RzP3
k5xHGPSD0bXFF/5U3Aq/acktTrdIyIhSREoi+5UEPYHeVzeDtzu0rUw+JLZaKiqw
kxXMKq/JzGaZWocFn1rm1cBcI/mX/AYHPUBSpPbKZGMVahRbaUXqVc4ReBu7WnTq
PGHphbIbg8WQ98+OsLdL7brtRXMTwDuBcX9v6zi0UPAFRwMGvqlAW1pyQtG4UZkx
tYLbuVyOjNl0Av4U+80Z
=gztt
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
