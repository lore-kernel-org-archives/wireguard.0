Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e76e44d
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 15:58:13 +0000 (UTC)
Date: Tue, 12 Jul 2016 17:58:58 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Quan Zhou <quanzhou822@gmail.com>
Message-ID: <20160712155857.GA1368@lud.polynome.dn42>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
In-Reply-To: <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
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


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2016 at 11:42:28PM +0800, Quan Zhou wrote:
> I'm trying to connect to [2600:3c01:..:1487]:41414 from [2400:6180:...:1]
>=20
> I have added the specific IPv6 /128 address to the AllowedIPs on one side,
> and
> on the other side I simply put ::0/0.
>=20
> The address I've set was:
>=20
> srv1 # ip addr add 10.240.51.2/24 dev wg0
> srv2 # ip addr add 10.240.65.2/24 dev wg0

I think you are confusing IP addresses used on the public Internet and IP
addresses used "inside" the wireguard VPN.  AllowedIPs refers to IP
addresses *inside* the VPN.

=46rom what I gathered, your hosts have public IPv6 addresses, and you are
using this to make the hosts communicate with each other over the public
Internet.  You are then trying to use IPv4 addresses inside the VPN.

If that is the case, then AllowedIPs should refer to the IPv4 addresses
(10.24.XX.XX in your example).

> I will deal with routing later, with OSPF or simply a static route. Right
> now the
> problem is:
>=20
> Jul 12 15:32:41 debian kernel: [1081190.595578] Invalid MAC of handshake,
> dropping packet from [2400:...:aec:1]:41414/0%0
>=20
> Having no idea about handshake, what should I do next.
>=20
> On Tue, Jul 12, 2016 at 5:05 PM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>=20
> > Hi Quan,
> >
> > WireGuard is a layer 3 tunnel device, so AllowedIPs should probably be
> > a different IP than endpoint unless you've set up some policy based
> > routing. Also, you'll need to configure the devices with ip-addr too
> > -- what were your commands there?
> >
> > Regards,
> > Jason
> >

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard


--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhRO8AAoJEL4B7CKgTi5G4RkP/39Fe1rx8YP4161WlAAmrCH7
g0IlUXqPHIslPWamFnOX4wJQunnI0rb12x02bwJSwLSpSufefSCXbTnpUftypa75
cCn5ND5DRkl8H7TPq0k32ULirtpdGLjwUU02FCEvIHPLns4e5bvW58fBPxXynIit
VbmGGku7nQ/w8KZ5uQnnfPSwxsI09DJvYf/FDvkTLXV8mvzo2Iq1jVHWmtP/4Aa7
2v66A9p5N1ZoVaQV/4mGyy53II1ZeN3DCXO/Atlz6VKhbp6uzeKh4L+EGl0J7q8q
EWg650GrfZRMsa2tFp8eVczI25X3bO9wxdxGg0VW8l8LLoMjrts3jshP4dPN8SYv
JldbFHU5DunFWTqcVh4GVF8HWpjQlG55TH1zgWiuQSphkFWatvoGkkRbRHqNMqMz
amYQIHIP7DT0qWBjBG/1erT5UDMlbV+etz37aT3Yn0B9Ecld93yyMTiiukP6cgyP
xv9rrX6Cy7ovlj/CNMFWwm79gmZT3P/AFkScPlrl5EKhzNtN8NCkScil+ygAshic
IlLAb+YxAgHe/7SXNZozW0jhbVArXrcI5+4vLn90DBwf9YmNj/EnhfqH51Ox9bnE
k5S4qMgEZDTWmIzxsUmqSvO4slDh220Auo/jlAzZbAqJM+XFfW7aTjHWah+8InwZ
wMANxe9zfpT5GwNcy6yP
=/KXg
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
