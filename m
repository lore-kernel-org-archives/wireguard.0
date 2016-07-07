Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5efaf71f
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 15:06:13 +0000 (UTC)
Date: Thu, 7 Jul 2016 17:06:21 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Jan De Landtsheer <jan@incubaid.com>
Message-ID: <20160707150621.GC18014@lud.polynome.dn42>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
In-Reply-To: <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 02:45:22PM +0000, Jan De Landtsheer wrote:
> On Thu, Jul 7, 2016 at 3:13 PM Baptiste Jonglez <baptiste@bitsofnetworks.=
org>
> wrote:
>=20
> > On Thu, Jul 07, 2016 at 12:53:24PM +0000, Jan De Landtsheer wrote:
> > >   - about changing ports:
> > > hmmm. can't really say...
> > > What I noticed: I could ping yesterday, without doing anything, I
> > couldn't
> > > this morning. that's when I saw the difference.
> > > I had something like it yesterday, and thinking I did something wrong=
, I
> > > set it in stone in a config file. applied it, had my ping, kept the
> > > terminal session on the server open (had also an openvpn to the remot=
e).
> > > This morning, from the remote , there was no ping. Verified why. And
> > then I
> > > sent this mail ;-)
> >
> > Could there be a NAT or stateful firewall on your network, messing up t=
he
> > UDP source port of packets received from the server?
> >
>=20
> nope, Start with basics, use pub ip to pub ip

Hmm, that's really strange then.  Any weird firewall rules on any of the
hosts?

> BTW, can a client run behind NAT ? (I assume not, as AFAICT both need to
> listen on a port)

Yes, you can run behind a NAT (well, maybe not if *both* peers are behind
a NAT).  Wireguard uses its local "listening port" as source UDP port when
sending packets, so this will create a mapping in a NAT or stateful
firewall.

Baptiste

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfm/tAAoJEL4B7CKgTi5G2TsP/3isCJDJf6mIS0aTs+jVDwyW
5dEdYxRkr96HGN9vQ9y+C9afTaSzh55njlZU+4yK5kSJMow2qS87xNtNSd17Fd4u
AcwPcgWU8r2L10opoT0LYHT8EIdoNWbzkGfvsdXBTfIsihoQc34YXSLSi4uPD8/v
qmo3cX91R5DiWRgPqqrynec9Ubyf159RFkHUSwv84XYyBjtTbZqlpoqsoMEky+V/
imT9oeEPb76uOZo5kAaec/IcK1gkqqvQGz35SO8nwb/mWj3vgI2IO0k5j+fLY069
JdLFt1cw49yt8pFCn43KHrdnMNm7nPqy2Tr2jbqK2GfMowXHdaAl+1Z5PnbNP1L8
D/k+Jqi0L3GckwGuKC2zlj2U7Fy3aQkeEyv7wFeI7WfXdgd0KHOV2zX7aVp7AQmC
BREdoWyfiP2qvUYNNFdo6Qo0p1beb+jMrkm2fzpkjWHkYjvCpOSiMw6aZ2RcM3Im
H1zQvED5MGOz9QIrbVahPH7n4Us4DGWT27HjAdqJN4S3fXa7h+YdiZJuf9IlQqHO
AeZU1EoC5wLjkATCMeaEI8UOyQR5NZWftoa9SI+uHUov3D1DbmjA/CLPhp8u7IiX
zj7C/Y0ftmHrcbILdXKMNgd/nOoV2FnlzOFOTZOaM4v6cxv/5gKoThEAFm+Glax4
Nl4fGmNrOoJlkTYG0clY
=tViZ
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
