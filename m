Return-Path: kevin@darbyshire-bryant.me.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9ec1117
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 May 2018 23:29:24 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0061.outbound.protection.outlook.com [104.47.2.61])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 115e81c9
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 May 2018 23:29:23 +0000 (UTC)
From: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: wg-quick domain search directive option
Date: Sun, 20 May 2018 23:30:14 +0000
Message-ID: <95E05D91-028D-47CC-9B82-A43772A39827@darbyshire-bryant.me.uk>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_6E6FD91C-EE51-46F2-AF10-F777DDE10C7F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Apple-Mail=_6E6FD91C-EE51-46F2-AF10-F777DDE10C7F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Jason et al,

Thank you so much for the recent hard work on the Mac OS port under =
homebrew, I=E2=80=99m back on air again with wireguard :-)

It occurs to me that a parameter in similar vein to =E2=80=98DNS=3D=E2=80=98=
 for the domain search list would be a useful feature.  We can specify =
to use the DNS server at the remote end of the WG link, but there =
isn=E2=80=99t an obvious way (to me) of overriding the domain search =
list, so you=E2=80=99re still not quite =E2=80=98like you=E2=80=99re =
there at the remote network=E2=80=99 since short lookups e.g. =
=E2=80=98router=E2=80=99 or =E2=80=98fileserver=E2=80=99 don=E2=80=99t =
know to try =E2=80=98router.mylocal.domain=E2=80=99

Thanks once again!

Cheers,

Kevin D-B

012C ACB2 28C6 C53E 9775  9123 B3A2 389B 9DE2 334A


--Apple-Mail=_6E6FD91C-EE51-46F2-AF10-F777DDE10C7F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEASyssijGxT6XdZEjs6I4m53iM0oFAlsCBQUACgkQs6I4m53i
M0qTOw//ZsjEzdZgHBZq3nkUIM3Ydyi3SXFAejdkWRjsGqNYOtCI6VEfHB4kFaE0
f0LGLJMQEgRh7VdtiT0tzLi9bey8EsjAyown4AiQ+OW8KV7SVjbX0bZmfBGuQ5hT
QHemaALv8DW3uRE75INOLzaqnaxTK+87S6x5hGrJeMUrdjSGtqhwRn/W2Zqpcan1
wIS6jm4hVfUBvD5ROsxAeSC2zW97hoyTLnbEuSTr/bbhi8hhnzDh7vEo7j0MLiKe
ILk/vgRqvKmTeDi3eBv3FNNXk9YE6OcxqyDnN8jzQx3fQL7b1izQm4KaPHaymhy1
cclCBjjQaEwhQ8+QzEozPLK0lWgiP4Sgq0ca3Z96dzi2KavgC6CkxWEBMqtD3Uks
QQcjrU5m70pYyp3eB7d3/4a/DYg6Y5bvTOvyUPVroxr2LJQV2Zv2adJSNE2y3pAS
n7lUYih6Cf0Ux27SVWo9hFd5LAfLo2S6Urq0Spi+1JBN0CD7uDPxwWuBzQrYSSvk
7R8DK5hwA9v8zgawaor8elC0NmFeydxfGjHPEFDnmWLnSYpc9MgI9tyg2Plb+kHn
oplh3VzcwfvcijPGZKz/dFcXBqsxZbaAArKov2rUzkBD/7qeWPAUgGnsSRV7gNv0
B4beHiwsHNNDFKN1CCFSy5I5gxa2K/E97YccDB3sLjvaTJqN5rg=
=XK3k
-----END PGP SIGNATURE-----

--Apple-Mail=_6E6FD91C-EE51-46F2-AF10-F777DDE10C7F--
