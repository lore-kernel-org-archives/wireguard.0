Return-Path: n3ph@terminal21.de
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.31.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb6194c8
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 00:37:13 +0000 (UTC)
Date: Tue, 5 Jul 2016 02:40:06 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160705004006.GA9791@c3po>
References: <20160704225300.GC9424@c3po>
 <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
 <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
 <CAHmME9ruAPJsRjvsm_+iPUBzD+z85N+4pdw25KhM9FpG0ygMCA@mail.gmail.com>
 <20160705000658.GA6619@c3po>
 <CAHmME9r8cNHAnuqMuP93YAhe77VUy=sX5NVS4kB+5U7tpF59Sg@mail.gmail.com>
 <20160705001908.GA9395@c3po>
 <CAHmME9qPEpQ9YDzc-zd7iaTcuYMtpJS0b8HLEb8hYHXX0H3APw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
In-Reply-To: <CAHmME9qPEpQ9YDzc-zd7iaTcuYMtpJS0b8HLEb8hYHXX0H3APw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jens Viisauksena <viisauksena@posteo.de>
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jason,

it really seems like i simply forgot to recompile the module... Now with
CONFIG_MODVERSION enabled and recompiled ebuild the module is loading
fine..=20

Sorry for the noise..=20

best regards,


n3ph


On Tue, Jul 05, 2016 at 02:20:36AM +0200, Jason A. Donenfeld wrote:
> Hey Michael,
>=20
> Hooray! Glad to hear it works now.
>=20
> Jason

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXewHmAAoJEE1l5S41evqarusH/iGWm1rBBRCfEsMY1llsvX2u
ij8bV0wD2g0m9z6jodVdpgop7h8Lbw6i4JT2D61AgtfS/6xya8ewbguZszXlhN4M
+dmj9hePCWRNgrjhi6dqvDwi24DT4quudAYHd3jTe2StY88MOxv18pULNrHNAV4b
AMqh3j1JJYflJKWkBcsty2SJat12Jzl8IHFA/kO4os1cnWyJ+iGNGMBZK/M+IaAH
YjY7xyn5b2NRlDtfnkMSyxLAsySvkpwZ/mtZl69jF5TwOESWCqlioh8fyaqneAoA
1HGp1pInFtiiGHXG0jF92G3y0AmJOSibCakuZPBfL8M7oSeOz+Fd/2T6fPTT7M4=
=58dE
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
