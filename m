Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b8863fb
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Oct 2017 12:14:19 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51409eb6
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Oct 2017 12:14:18 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Geo Kozey <geokozey@mailfence.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
In-Reply-To: <801971811.33026.1509279684633@ichabod.co-bxl>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
 <87ineze3x2.fsf@fifthhorseman.net>
 <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
 <801971811.33026.1509279684633@ichabod.co-bxl>
Date: Mon, 30 Oct 2017 12:58:48 +0100
Message-ID: <87po94deyv.fsf@fifthhorseman.net>
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

On Sun 2017-10-29 13:21:24 +0100, Geo Kozey wrote:
> FYI you can already change DNS through resolvconf from non-root
> daemons with correct file permissions or ACLs

resolvconf has plugins on the consumer side as well.  while you might be
able to guarantee that you have the correct file permissions or ACLs on
/etc/resolv.conf, you probably can't make a guarantee that all of the
plugins are going to work with that arrangement.

That said, i'd love to see this kind of proposal standardized and
documented.  Are there any systems that ship with correct file
permissions or ACLs?

> but that's off-topic.

It was off-topic until wg-quick started messing around with the local
system's DNS resolution.  Now it's on-topic :/

             --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAln3E/gACgkQFJitxsGS
Mjdllw//SVrhfsokb9/7+eczuYQrm7DRFLMjLqSerof/XK9Aoc3PTEgyr1baEb2I
X9WblboTZzkFS4yGyIllm7cVMVd4ITz2a3ybxSBBroAcB3vctKfqCIJT9KBibwhV
41y6E+DZdgAXt1Qcd2Nr5oBeB/2HXi8oEZoftQ+VhAseYD/WMEQe+LZASB35aW4O
iEYxD/7tLXrFAESVKRY0QaB5J3v/U6m1gaJ5W+VvwqI2iIrCJYA3vHNz5Bnb1IQO
vdS4DDIO3u8epZX2XlZGyZzGmIvT244e6c/fvDnHv1B1LdkTFVXOpJ8XsQx3RWb9
+SLDd5Z988y+DMXxdBIdO3FR+BMe3D8N03NTAwmQEBJ4KRZST8n/vaiuzh5aqvPj
icgU1iXZv2Ii52/aDFUDkzEk+TUsQbajAT4E8BYJDoBLkSH1YUW99inSophcif9Q
S9Q7xhmT2S7HYj9syIEUAv/x4o7xXRQGjhuYO2/Vsspu34wlW84tx/RekJOOf6KJ
BZMmzmGDvF/tBASQJTXIPrxEI3clrdMQ0/nmqJXeSH6m3TaXlNiXumqIaBP4qnvg
PvzUqfnrnn6O0n2vMz3Zcs++nAr2/zfr2QRkDnldO0itAkJd38uCEyNMp+Nb+TAU
9ST11NtsHgW6Clm0gOGbF025XOHg8RuWTtSf29sNkZNycdCaTL8=
=rj0g
-----END PGP SIGNATURE-----
--=-=-=--
