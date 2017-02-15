Return-Path: n3ph@terminal21.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe938ac8
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 18:25:57 +0000 (UTC)
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.31.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad7e153d
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 18:25:57 +0000 (UTC)
Received: from [84.174.229.13] (helo=c3po)
 by smtprelay04.ispgateway.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84)
 (envelope-from <n3ph@terminal21.de>) id 1ce4HD-00027o-0n
 for wireguard@lists.zx2c4.com; Wed, 15 Feb 2017 19:26:03 +0100
Date: Wed, 15 Feb 2017 19:25:15 +0100
From: Michael Gerlach <n3ph@terminal21.de>
To: wireguard@lists.zx2c4.com
Subject: Re: Rust Version
Message-ID: <20170215182515.GA9852@c3po>
References: <3937BCFE-F4EB-4E95-A46E-A87ECA8D9414@icloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
In-Reply-To: <3937BCFE-F4EB-4E95-A46E-A87ECA8D9414@icloud.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sascha,

correct me if I am wrong - I am wondering what DPI should do with a
crypto-stream and what "obfuscating" could improve at this point?

Best regards,


n3ph

On Wed, Feb 15, 2017 at 06:47:36PM +0100, Sascha Grunert wrote:
> Hey WireGuard developers,
>=20
> I just wanted to know what the current status of the cross platform versi=
on of wireguard is and would vote for a Rust implementation.
>=20
> I am willing to support the development since I have network programming =
background and know Rust.
>=20
> Further it would be cool to add obfuscation support to the protocol to ma=
ke it Deep Packet Inspection (DPI) safe.=20
>=20
> Best regards,
> Sascha
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCAAGBQJYpJz/AAoJEE1l5S41evqakEMIAJnEckyviXeCthVErn8ZixuP
HEikwpy7UNYCD+eSZpBj1bay3+nxkm6zW5BQANcwgjVgCgc5txDFAW7auyKLTNkT
7UgcDVaGb//GYYm4HVKqWmph4HAF5xYrflhVzxIuVihdzy22pgxWE9gC5q/+hyWC
KruQXRP1EnPBw5ZECvGSfYksmLaPoNMb9EX+Fza9N6Ce48fG6dRcnm14wKnztDSr
IZw4yDJ+HbpsQN1Lgu6MMIszVdxVb6FlVJIfo0e+4DJ8vHY1ze1Mt60IJJ8ThhvY
I+2SEDAr+3LLIEYY7v9vpc5cCu9AUyZh/fNNsuIubhMf3FG/mOy/yJVYJKMckgk=
=u1EL
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
