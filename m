Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0b201db
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2017 18:44:36 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d9cf801
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2017 18:44:36 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Sascha Grunert <saschagrunert@icloud.com>,
 Michael Gerlach <n3ph@terminal21.de>
Subject: Re: Rust Version
In-Reply-To: <94F76D79-1813-49E1-AA25-0CE27B3A460D@icloud.com>
References: <3937BCFE-F4EB-4E95-A46E-A87ECA8D9414@icloud.com>
 <20170215182515.GA9852@c3po>
 <94F76D79-1813-49E1-AA25-0CE27B3A460D@icloud.com>
Date: Wed, 15 Feb 2017 16:40:05 -0500
Message-ID: <87bmu3jfpm.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 2017-02-15 13:29:55 -0500, Sascha Grunert wrote:

> The DPI could do a simple classification of the stream which could
> others use within network blocking scenarios. The content should be
> safe, but with obfuscation or maybe tor support it would be even
> =E2=80=9EWhisle blower safe=E2=80=9C.

Hm, Tor is TCP-only, and WireGuard uses UDP.  These systems aren't going
to mix well.

WireGuard cannot and will not obscure the source or destination
addresses of the packets that flow over it.

   --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlikyrUACgkQFJitxsGS
Mjc1ug/+JkadgV6slMJm2PgmsJVGi2/d4o8ZaBN6fmU2X5rVLEqnIcCspRZIF7qX
lJPoCF97+o1AUcXpo1BiqUL6jwwcOyI2eS1cZL5zEkEmzBMeOzNwA43QVy7VL0Q1
/Lg3HtnFDEenIf5drjBuKr8MO0koYTGTkmshgHcj8Qol7hUdaq2d3PRSCtKBf+ju
39kTW26lDzDKgvW1RpMcvmaColXve5yDV0yuaBfS6Ti+cytW2NXDq2NR5k7UBzxl
C+iI90HjQP0yTv/l7HAnXr03fn1soykaZpAuT8WH5hjAvT3MdjubiQeShYQPlmc5
yYTYM4cHUGOCoX++U3Hefe4z+Rw625hHqkclGYoVPlR+jlsS9lzSVJcdx5rh1bCz
Tecgpp1thX7i0XSEjyLF2ramC3s+TX4ULaF0D6l9qgJNV5hBbzyqzZoUf1C8Twvg
rvbwayFT7B2YyVleiEF815AKRdl7MyNbos+8SpWl+ipqu9cB4fEHFaThoGZOkWlc
2a5wKEAZ5kbC56ZnZ9VC0ZH93QwyCJ7rGS4B+YxKx/ZYfnxaOUKWVEJtzoChp1FI
Qrm7NNDVlpcWxGNrINND1AAnsxDlBcGMbT5n5EfxUaGaaNv/oUJ7WC4//yY1o1I9
MWjNutvVArJQY5xMgT/abEF88TEazU9jm/5rS13a16srSlcET4w=
=R1BI
-----END PGP SIGNATURE-----
--=-=-=--
