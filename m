Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f9c743a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 22:34:46 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a6c51f6
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 22:34:46 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.home) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1cLHUr-0006iI-Gu
 for wireguard@lists.zx2c4.com; Sun, 25 Dec 2016 23:42:29 +0100
Date: Sun, 25 Dec 2016 23:42:25 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Introduction of XChaCha20Poly1305 (Was: [ANNOUNCE] Snapshot
 `0.0.20161223` Available)
Message-ID: <20161225224225.GA5081@lud.home>
References: <ffffffffac503169@frisell.zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
In-Reply-To: <ffffffffac503169@frisell.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 23, 2016 at 09:15:28PM +0100, Jason A. Donenfeld wrote:
>   * cookies: use xchacha20poly1305 instead of chacha20poly1305
>  =20
>   This is a big change. To simplify the security analysis, improve speed,=
 and
>   simplify the code, we now use XChaChaPoly1305 with a random 24-byte non=
ce,
>   instead of using a random 32-byte salt.

- Is this backwards compatible?

- Could you provide references describing XChaCha20Poly1305 and the
  differences with ChaCha20Poly1305?

- What part of the protocol does this change?  Is it just the initial key
  exchange?

Thanks,
Baptiste

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhgS00ACgkQvgHsIqBO
LkbSvhAAsskQvQ+1BIZ7RzuVJvxaZSXDsemXl56SOybKXobhIJcRuEV6rd4RBf+/
p8iE/yCHJ1AIrOygF/Pt682YPgTvsIN0WyqEw6zf1Be0YZ6ujAEv8eUs4azt6z1P
ouOHgMnzOnBjDI+cS1Kw6aVAIGT4VYHruKJ8bachDd+zO2EMLiHDPGK/BuG+o3UY
33R1DCDG/s/1KsjNKK0/mvxEj/EwshotGrVNTscK96jHmKsoXoROHEhk2lamSTNw
lLpUIWSMQFv71Ob9rbCHUBYKAHLHKRVuz4FWbjLZkDmERa0FL2AgrBZ54kwehIaX
VZLKrgE24I/Cf5YvA/C3s6wuH+y+FB7dVaxGXRgdQiFGRDmaCTUlROHrn4My4e4t
cdLDJWk0+tHUSN2BA1j/RlEPC6QFRiL6B5jKwHWdwu0LN23ZDImYTh2nuuQSasS2
v0A5Eo+LGMrjf+TzHGqMDHgmzvnDpF/x8tjOUQJQWM/XF3mPwlLPkJsK7gTlB9jp
T34IlWNgFWb8WJH10PGLNVbB5CycGpJPWqLtkWGRKWZtxA/5nm+RhrmcPKhictqJ
0Bt7FY2PTzk3ArOGvp05EkRzGHWF5kgm33dP9TsoDUhCQV413tGLi7RDz+bzkMX4
F8Rjb7g+8RZDqWvp8+4hw17JsPpNLQCzl6BzzobbKop8K0eqNdQ=
=MM+U
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
