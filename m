Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4baa8414
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 21:13:28 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e161da4d
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 21:13:27 +0000 (UTC)
Received: from phare.polynome.dn42 ([172.23.184.97]
 helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1cQKvX-0002Ne-M1
 for wireguard@lists.zx2c4.com; Sun, 08 Jan 2017 22:22:55 +0100
Date: Sun, 8 Jan 2017 22:22:54 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Multiple Endpoints
Message-ID: <20170108212254.GA9445@tuxmachine.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <7ec50275-f586-763a-2f70-c68321ef9a17@higgsboson.tk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
In-Reply-To: <7ec50275-f586-763a-2f70-c68321ef9a17@higgsboson.tk>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2017 at 03:39:07PM +0100, J=F6rg Thalheim wrote:
> > I am also interested in multiple endpoints support, and I am preparing a
> > proposal that I will send soon.
> >
>=20
> Does your proposal also includes support for different address family? (s=
witch between ipv4/ipv6 and back)

Yes, this is my main use case.

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhyraYACgkQvgHsIqBO
LkZWlBAAskZ7j3Y0nzHbth4EvD7jFvwhjn74qB1WtltfEJov6VV+tZOijN09RT4B
jS8zVDdCenhCF7aQTUS0RV0RyK+0v0XsNOdhipTfQ7y4vv4r6xkH5p1wHh7Xz77i
Pg8g67kk4BF1OR2RhARftiQAQyvztdjZXRHwTgcKt/XB1U8OeXRcldipFN1i+NHq
caUnBY65LGgfAl5i4G9bCT0xr5tHQp+WGVJAdOck4d7zohBg4fd1qLz24MEYkH3R
WYiFkFxtirBNQjg46oIKPaFyheIIpJtPVybCb2rUCL9+KVRttYvNvRhG0jlOaCbc
ZDC+VzS8+pMyrc2DpGOyag0ohvsiLFFtLQVhgkM9+E+STakzfhfTPZgVuf1+9Vk0
5n8cvUsIBn+lLXNQz51ljVGlwiXYcPNosqya6f4fNGg1ETIi426E88K5nnPgs98Q
ZQE5qrjDQNdOmE2pQBHtV+1LjFE3C5l5MOHoQwoGS8tE5qlHKAbdu1gTOymdqoJG
VH8EbSx+BoKmxJ1i5UwjgoCcFhV+99KcIwLp6AbefDwhtT51aCXHnZCC8+3+VCOR
tgvxMvN1yPI2XPk7KOzExX8YtHGk+X2NFray/Y5Jc7aUhXlQaTXCkz46TEd58KIH
Zvatpb2PJByOfjbNuv3KElq4W+40DQxnQlKqk+5NJcaQNVoy4qM=
=5oWv
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
