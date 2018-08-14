Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62381676
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Aug 2018 10:18:02 +0000 (UTC)
Received: from mails.bitsofnetworks.org (mails.bitsofnetworks.org
 [IPv6:2001:912:1800:ff::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4885a5b8
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Aug 2018 10:18:01 +0000 (UTC)
Received: from [2001:912:1800::518] (helo=tuxmachine.localdomain)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1fpWaF-0002ug-0u
 for wireguard@lists.zx2c4.com; Tue, 14 Aug 2018 12:29:51 +0200
Date: Tue, 14 Aug 2018 12:29:49 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Fragmentation on UDP layer possible?
Message-ID: <20180814102949.GB9786@tuxmachine.localdomain>
References: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
 <20180813000611.3296fa66@natsu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
In-Reply-To: <20180813000611.3296fa66@natsu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 13-08-18, Roman Mamedov wrote:
> On Mon, 13 Aug 2018 02:53:44 +1000
> StarBrilliant <coder@poorlab.com> wrote:
>=20
> > I know Wireguard can already do IP layer fragmentation. (Just set
> > tunnel MTU >=3D 1441 then fragmentation will be turned on)
>=20
> Is that really expected to work? I tried setting MTU 9000 on both ends of=
 a WG
> tunnel, but large packets still do not seem to come through properly. Did=
 you
> try using it like that in any kind of environment (aside from that one
> restrictive network)?

Yes, it works: we use that to enforce a 1500 MTU on the wg interface, it
avoids a lot of headache.  Wireguard may end up sending UDP packets larger
than the MTU, which the kernel fragments at the IP layer.  The kernel of
the remote endpoint then reassembles these packets before giving them to
wireguard.

That being said, if you have a nasty firewall or middlebox in the (public)
path between your endpoints, it might indeed drop fragmented IP packets,
breaking this use-case.

Baptiste

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAltyrxgACgkQvgHsIqBO
LkYq8w/+Oa/fv1l1h9MZydRKtwHCkIxA8QvRfiHMROGqgE1q7uPtNMFbYWgRT7K0
6ANcC/2Gpri4FDAoM5frOWbs2K6zcNvFGc7+TqFKE2AkbBssB0hRe3UH6vx2skG/
hn8ACLMkFw3M+Laj9B5KXLrKj/EoRdHJ1sw4HcVSKSYykoW8Qxt96VuVBpybgXKh
DpmYedh2BFflwOhwPFS5Cip+E6ZdeJgqawsLp9XG0uYEMwA4FiyO+I07WgLcqkEf
PD97tmcblGpj4t0GOOmri7u0jsNJ/fAyUBCsptcKqRDGKfxLRECN/NmkVtJcR2BO
o3eeoW8Tfr8iV2JExagt6nMpAvjckL40a/nb/Go0TC0BO3wjKHo+TnpDB3p4O/Hv
Ntn5x3KiesLVhq4Ue8eV0aMRYH+uwFfa3SKjMszEhHHQfAhR/oJgdrKnLU4tSRQU
9XI5tQVD2xs+aMA0k7L0BhXHKMi1k9cwx/CfPA/WwfrMc7ndfEMjFvMGN4mGOqhZ
Vvr0/PkX80ziTTJsFv+ppEyWFFSe64wI9/7+D3qWdzy0YoXUbm0s54mI2GQD9I5G
Y3wwOKopYnKBWouf1R1I3mmUZ3IJUdeXZWk9nXL2RgR9nUlfv4FjeIgXISfcI6at
LpQ3020ot7LjKPdY7G2Eb73L9OwadEuwhJ2hFlyFS9d2ykPaAMc=
=FLAM
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
