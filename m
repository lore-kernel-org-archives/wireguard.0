Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 604806cb
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 12:41:17 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afde40ef
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 12:41:17 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Installation instructions for Debian
In-Reply-To: <20170514084456.GA7227@tuxmachine.polynome.dn42>
References: <20170513070534.GA22218@tuxmachine.polynome.dn42>
 <CAHmME9o=EGWOcTRVtVQVCoJXL6KueX8eM98GWBJUtzEE67tAhw@mail.gmail.com>
 <20170514084456.GA7227@tuxmachine.polynome.dn42>
Date: Sun, 14 May 2017 08:52:12 -0400
Message-ID: <87wp9jfvnn.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Sun 2017-05-14 10:44:56 +0200, Baptiste Jonglez wrote:
> Note that the previous installation instructions (basically, just "sudo
> apt install wireguard-tools wireguard-dkms") were valid for Debian sid.
>
> The new installation instructions are only valid for Debian jessie and
> Debian stretch (admittedly, probably the largest fraction of Debian
> users).  But I still think you should reflect this in the instructions.
>
> Debian wheezy is not supported (with its old 3.2 kernel), although it
> could be possible to use wireguard with the wheezy-backports kernel
> (3.16).  I don't think it's worth mentioning it anyway, Wheezy is
> old-stable and will soon be old-old-stable.

As the debian maintainer for wireguard, I agree with Baptiste on all
these points, and on his earlier recommendations.  Thanks, Baptiste, for
the clear and concise documentation.

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlkYUv0ACgkQFJitxsGS
MjdxAQ/9Hccu2ra3+XQlDVs5kPL9K21wjyOaI8l2MxjzzSC2DjWk7iiWXfTnByHv
HA4+mBlr7k0OdBAf0YxRyP4BM3YD58jCFdfBcfNnHLZ6ThYvWBLYTxfxOqXkDYBq
StUAqiIk49JA+qO8z9/R4L1B8GmaPIoLkGWyZNxW8vNRrd6faZzGR0CtE9gUyWad
d+GvkcasjaTE/rRFWVRyKXLTyvPQVEK2ZeSDOCgNojvooOGDp/wBNw6t7IuW2ouJ
HqufOy3YVzlJX7lekTwHE8JdB4/YbYEuPZpuVG2kCfhpukPrwGh91tZrgSXUHLvR
xgZsnR21hNgUtneKoyvR2jopT3ifPcmaPuGLlkWRPDRHizRkua1N/v+QIQ8iQJsl
3YNv4YQHP9BDpvhQ8cNynNGeXWzGwfH2QHjILM9kj/DRBT/j9czG0XdU5qUuF7Zz
8HccaGFkg+4i/InLQQn1BRf0Mo5N0p1q5N3tr4JDWpMDsHwBOQRJgww+DOQxIb/N
mJ8ArFRY9OBzNAC5K/9MCwu/lUPfmt4jIcjveB635l6FY+Y9LvIuQOYrrOQZ0xe0
/LT9bL0g0rX0ncZ14PNuqegQXtdEoP+io3mRNBEkW3sNYQTslxyIJQGYPWiKEz3K
gGt8ScRWlbs3ms8SAaeb+MNDX2KUlflObh0ERbvI+JzOlSYv6bs=
=rioH
-----END PGP SIGNATURE-----
--=-=-=--
