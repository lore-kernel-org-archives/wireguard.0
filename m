Return-Path: n3ph@terminal21.de
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.31.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac883be9
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 15:19:57 +0000 (UTC)
Received: from [185.66.194.30] (helo=c3po)
 by smtprelay02.ispgateway.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84)
 (envelope-from <n3ph@terminal21.de>) id 1bqMFT-0007Pg-GG
 for wireguard@lists.zx2c4.com; Sat, 01 Oct 2016 17:30:47 +0200
Date: Sat, 1 Oct 2016 17:29:29 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: wireguard@lists.zx2c4.com
Message-ID: <20161001152928.GB30922@c3po>
References: <78C73E3D-A28C-4F99-B549-66BFE3A26A1C@danrl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
In-Reply-To: <78C73E3D-A28C-4F99-B549-66BFE3A26A1C@danrl.com>
Subject: Re: [WireGuard] AllowedIPs vs. TunnelIPs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We also already done our wireguard deployment via ansible.

=46rom my personal point of view AllowedIPs is completly fine - I do not
see any missunderstanding.. I would prefer to keep AllowedIPs -
especially because our module is done ;)

But yes, it would be good to announce potential option renaming in a
bigger style as people already use configuration deployment - Mind the
gap!


best regards,


n3ph

On Sat, Oct 01, 2016 at 04:26:01PM +0200, Dan L=C3=BCdtke wrote:
> Any news on the AllowedIPs bikeshedding? What have you decided, Jason?
> --> https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg00068.html
>=20
> Asking because I am working on an ansible module Would like to use the mo=
st recent name for the parameter name.
>=20
> - Dan
>=20
> PS: Good to see so much progress in the go-wireguard repo, Nathan! Thank =
you for your effort!
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX79ZYAAoJEE1l5S41evqa7twH/0F/VoHRH9hslGNyu9CB8ptw
krkFz7wgkSR+QopA/izD6KTtbesEOOdLvSOeiAMZYkqNPDzERh3rGG4AFEDnLkDg
cPHBWAoTRucDJaBX1aisw9E/iT4MCf2VQXcJ1N3QYqS//O/Dy8iSrymcTKM9MYsg
le4eI8gEA/hEvqbdHUmaWR5KEcnERZaQYyOHlQ8XUl475CIMWAVDlhtk+xxNpg19
AsPXL9K3uZlR4kCqxcA8Y4yhowp2V57VUVbRVey9mQsuVibzId4Y1oFEo5vMLuDx
9xbGWnuTbjZ1vbS8uS4IwNXIcOZB6Lb1i1GBCCWkggjeV0Yi55BdlhW9U26gqWY=
=VQAH
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
