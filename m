Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8918456f
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:48:33 +0000 (UTC)
Date: Wed, 6 Jul 2016 17:48:35 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Norman Shulman <norman.shulman@n-dimension.com>
Message-ID: <20160706154834.GH2040@lud.polynome.dn42>
References: <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
 <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
 <CAHmME9pFhJoW+kFmJE7-acmb2q4=EqN+U+dJQ8GDEvBzN_=dRg@mail.gmail.com>
 <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0XhtP95kHFp3KGBe"
In-Reply-To: <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--0XhtP95kHFp3KGBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2016 at 11:31:28AM -0400, Norman Shulman wrote:
> Ethernet networks don't scale; that's why we have IP networks.

Wireguard does not use Ethernet at all, it operates purely at layer 3 (IP).

IP over Ethernet would use a reactive scheme (ARP, Neighbour Discovery) to
discover the mapping between IP addresses and link-layer addresses.  This
is part of the reason why Ethernet does not scale well.

Wireguard, on the other hand, does the equivalent mapping statically, via
the AllowedIPs directive.  The mapping is also slightly different:

- with Ethernet, you map from IP address to MAC address (using ARP or ND)

- Wireguard maps from IP address to public key (using AllowedIP, so this
  is completely static).  A public key is then mapped to the IP address
  and UDP port of the peer on the Internet, using the last known endpoint
  of the peer.  This makes this second mapping mostly dynamic, even though
  it falls back to a static "Endpoint" configuration for bootstrap.

Does that make things clearer for you?

> So in general a client needs one address for each server? Rather limiting
> for clients on small subnets, especially considering the case of n clients
> on a subnet, each connecting to m different servers.
>=20
>=20
>=20
>=20
> On Tue, Jul 5, 2016 at 3:11 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
>=20
> > On Tue, Jul 5, 2016 at 9:09 PM, Norman Shulman
> > <norman.shulman@n-dimension.com> wrote:
> > > How is this enforced?
> > Receiving, line 238 here:
> > https://git.zx2c4.com/WireGuard/tree/src/receive.c#n238
> > Sending, line 112 here:
> > https://git.zx2c4.com/WireGuard/tree/src/device.c#n112
> >
> > > How does this scale?
> > The same way in which an ethernet network scales? One ethernet device
> > can have multiple IPs, but separate (unbonded) ethernet devices
> > generally do not share IPs.
> >

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard


--0XhtP95kHFp3KGBe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfShOAAoJEL4B7CKgTi5GiYEP/2Uq/rfpWlocGV/ou4cQBi5R
oeLx/X192hW2cPkakCZI8VBE2JyNONojSO5ayfS9/jx5RAxsODA/ReEvY/iSAThh
oouR1Ck3NajaP1sh0glR9fs3noQ00Iid2uP4EIZlFxGhdIWSBqhyFhMbFHH6qpcL
5kKOpISJJdcoKoByXSSkW90Lq+z77/ELDk1hTgWvuwczTiAFaGghb6s5ztawoDKV
tuFjhfDmNEO6epLoDW9PYg634le77U985PUc24g4wiPOUbBXTt1DXaESZPRHLk0z
0CdIXs5KCIu36cHixlICi8uUHVANqcC6TTXt3x5F+f8if1WB9nE3XXhIhxVLurnr
2MCUVPx0ZhBXXXWgJuZKdpiDHU5+jFy0ZAHUlF0o2/Tiqwqog4gIrXNdbnE4r7wW
Q12qkPmEF5lb8u5uPgbmyAnQJ4oO+K8rR4S9ULpgZxdvMkZDGdj6UQ+zY4+OCVMu
76xLS7Pf5wRGY7sJFBXYnYhEfqX7MUY7FV5uI/oiSSVRP6MPSMaMIsvtpci+0Fwp
h4kfhy9LX59ADKqzKFcwKiyXwO11+glBrLED68uzEsJkVVCEGgUhrmY7goUJwGk2
WJGLwBofBk/Awp6jmSytRO3s44iiMraGekoqsGfbjZJ6tfQMHYGXP5RlKfc/p/gs
A/rBFZvcMMh7FrUBjq4a
=PFfa
-----END PGP SIGNATURE-----

--0XhtP95kHFp3KGBe--
