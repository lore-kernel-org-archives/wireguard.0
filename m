Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31a79067
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 21:52:19 +0000 (UTC)
Date: Tue, 12 Jul 2016 23:53:04 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Message-ID: <20160712215303.GA4315@lud.polynome.dn42>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
In-Reply-To: <87bn22sj4t.fsf@alice.fifthhorseman.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2016 at 10:20:50PM +0200, Daniel Kahn Gillmor wrote:
> On Tue 2016-07-12 19:55:50 +0200, Jason A. Donenfeld wrote:
> > Endpoint is a good name.
> > AllowedIPs is a horrible name. But I'm not sure what else to call it.
> > I'm open to all suggestions.
>=20
> AllowedTunnelledIPs ?
> TunnelledCIDRs ?

VPNSubnets ?
PeerVPNSubnets ?
InternalIPs ?

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhWa7AAoJEL4B7CKgTi5GrKEP/3yf3ClDGPHsTotXoKwotM8Y
06xMCUoddICJwYgkipDyldBP4japybpAfCsd9P6jFDFu7k63KeIvH2HBNJhKMpL7
AE0iLI9rSdv6EcQFTMLrEu+k0rjEBZkgRm1O4ARQ1Fslo8pXPZEDZr1mpbdY3Jvx
cj6ZdO5bBJHgDIunrmNWV8N05rnpn9F22rUf5saNI510E+/nZX9C1MN4Y+jvv4KO
YAKPwGdWx5lTSIAQtz+40lN8rF8kkpjbw9fJlgWkuE91LPvqskMDAB9RRZay03eJ
hfpD70Bns3tpBcJaqxDNnCBz6vFhaIuOz/6wt8TqLYIKhakbMznpMA0eY8e4ryci
Gtux0Sf+eWCm/uZch0CAiKf0ks0ebakgYC4+fbWzYbABgl8D2/Up229TZwqKQzQ2
8bcP8F7b7YjLeR9IHBOtVB2ZZDN6DXU7xrsEyt6FmKmbQs2g6kFdFEv5aIzLBjk6
NHLIJZowetT1AT4h89OGzVh8BT9YGnTEi66rJKEq+jxIHiiyAei0ztlU3dKVRT0j
6qlcTHBdlWfxJXSH4QoW/hOZO8Me4KMXHksOCfLkXxEAPdUVGQIPiD3IV4GrkgSR
uvr62wKrBJ7V2YZWG+wr6NosLZ8tU3LmEm5ggRX7lAq/v0GVtkKHSl2+JY1+7Nv7
htspfBgqT0Dtu9Dv5tHW
=zWMK
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
