Return-Path: n3ph@terminal21.de
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.31.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c237022
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 15:00:22 +0000 (UTC)
Received: from [185.66.194.30] (helo=c3po)
 by smtprelay03.ispgateway.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84)
 (envelope-from <n3ph@terminal21.de>) id 1bSQMQ-0007mp-2G
 for wireguard@lists.zx2c4.com; Wed, 27 Jul 2016 17:03:02 +0200
Date: Wed, 27 Jul 2016 17:02:22 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: wireguard@lists.zx2c4.com
Message-ID: <20160727150219.fdyg2smhmffmfxxl@c3po>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bhqaaee76sgooc2i"
In-Reply-To: <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--bhqaaee76sgooc2i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hey Jason!


It was too late for me yesterday night so i wasn't able to write something =
on
this.=20

I know we have to reproduce this once again - i was not prepared to face
something like this so we had no tools installed to check memsuage.=20

Let us run this test well-prepared again and we may come up with more
details..=20


best regrads,


n3ph



On Wed, Jul 27, 2016 at 01:05:18PM +0200, Jason A. Donenfeld wrote:
> On Wed, Jul 27, 2016 at 12:26 PM, Jens Viisauksena <jens@viisauksena.de> =
wrote:
> > It should however not lead to netifd outofmemory, load of 2.6 and the
> > oomkiller berserking around at all... even if its not directly wg fault.
>=20
> One thing to try would be removing these lines from src/socket.c:
>=20
> socket.c
> 386:    sk_clear_memalloc(sock);
> 394:    sk_set_memalloc(sock->sk);
>=20
> I'd be interested to learn if that fixes things.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--bhqaaee76sgooc2i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXmMz7AAoJEE1l5S41evqawqIIAIKfuwKM6zPkQO7JVwkep+8J
kjl13QWxZntH+CCyB2NG42cc+n1CT1fZlfQCI/0iJ1kZs6zRM3MWzUaNNnI0BL/r
eADX/t7UXLAck+XfvaEGKqOqTqCsI9LtxXAU1K5dM7hTuuiHa9j+n7tV+5U1iakb
O9CXo7Q1HEfsjFDhhxecSehj4dARKH0/gKHxhxZyukJbUrgL4LjHpduaUMlLdGhV
TKx71e3oh2Qwdn/ovGRr3gSx5ba9uIY37peAciS7SUAOBdKp2HaYjWdgZbulmwG0
QhMGh6fVa+eRtbOgTa5+de4YMaN63RYGpsc7ls7JgigGSxpDZ+hbhhFWRCWj4Ls=
=YFr8
-----END PGP SIGNATURE-----

--bhqaaee76sgooc2i--
