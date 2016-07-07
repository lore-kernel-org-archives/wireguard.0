Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cd3ad24
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 15:25:14 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bLBB8-0006Zm-Cv
 for wireguard@lists.zx2c4.com; Thu, 07 Jul 2016 17:25:26 +0200
Date: Thu, 7 Jul 2016 17:25:24 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160707152524.GE18014@lud.polynome.dn42>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150621.GC18014@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
In-Reply-To: <20160707150621.GC18014@lud.polynome.dn42>
Subject: [WireGuard] Wireguard behind NAT (Was: Client changes endpoint port,
	why?)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 05:06:21PM +0200, Baptiste Jonglez wrote:
> On Thu, Jul 07, 2016 at 02:45:22PM +0000, Jan De Landtsheer wrote:
> > BTW, can a client run behind NAT ? (I assume not, as AFAICT both need to
> > listen on a port)
>=20
> Yes, you can run behind a NAT (well, maybe not if *both* peers are behind
> a NAT).  Wireguard uses its local "listening port" as source UDP port when
> sending packets, so this will create a mapping in a NAT or stateful
> firewall.

Well, thinking about it, you should be able to make wireguard work even if
both peers are behind a stateful firewall or NAT :)

You just have to specify endpoints on *both* peers to point at the public
IP address of the other peer.

For instance:

- Peer A listens on port 4444 and is behind a NAT with public IP address X
- Peer B listens on port 5555 and is behind a NAT with public IP address Y
- Peer A does this: wg set wg0 peer B endpoint Y:5555
- Peer B does this: wg set wg0 peer A endpoint X:4444

Once both peers have sent messages, this trick should create a mapping in
both NATs.

It might not work for NAT that also rewrite the source port, though
(I never understood the terminology, but this might be called a symmetric
NAT?).

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfnRfAAoJEL4B7CKgTi5GhXwP/AwFuNuqtnTzPk2u9qad6z5D
ssX20gDoJk1ORMWkmYC32xmhiy5cnkz0+0Woc37fxPAhpftGJVPrLD0WzKKdbW30
o9BmmsPg+aZLE7D7w1OOHW4d2WUqb2oJ+ATZ9cD72uF30+c2i+mJERXzciAt4z9/
C9MLumiHlIVAZ0WgBNfOXbzWU2yBC5ohApXTdo1E7ssRiuWci93yt3hg+PyjLbzT
BQVgXPypU1za43M2kcncsXzB46oq1+XEbH7g/jUpkdEZV373F6eyuxRd61eYEfnw
sBMJzJSHB4hb5lZOSZNzIIbfxnXtRksqq1Pvq83txNPZ/G2vsJYdq7zNf6n9ZZdm
KKrdVmCv8BtvFT/TtO1gxOoSHhh8dL1oMMPsGaJKf7yvVD/N066wQm4o/7HE6WxV
/lUqBcKgDKkHzgePwMBKEZcrJvGOD6d+b0pXFe42rB3HwzrI3MumZX1F5QvtJzcN
8OGqP4ur8soqWcmlG064eqadt2fa0QbFuZVk4HM/cHOSgXUMNZtaCQe21E4b3xMS
gnBuBKrN2G8aOwKsO+nKrGudXXcgp/3FiuieCnQ61NM5M1VgLBXHOdFjS7JokOmU
5FYF6R4KyUP4jiDQiMFHJ7uzWKpzU84F9mXlzpT1TmD4FsVe5HPfjUg5A6oJRovV
rdKE0zggMH3NDjv0W7ys
=Mq97
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
