Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af492ddf
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:58:30 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bLCdO-0006eV-I9
 for wireguard@lists.zx2c4.com; Thu, 07 Jul 2016 18:58:42 +0200
Date: Thu, 7 Jul 2016 18:58:40 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160707165840.GG18014@lud.polynome.dn42>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
In-Reply-To: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
Subject: Re: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just a small note: this would not be useful just for NAT, but also for
stateful firewalls.  It is not uncommon to have a stateful firewall
directly on end hosts (I think Fedora does this by default?), and
keepalives would prevent the mapping there from expiring.

The same goes for IPv6: most home routers have a stateful firewall by
default, even though they don't do IPv6 NAT (hopefully).

On Thu, Jul 07, 2016 at 06:33:11PM +0200, Jason A. Donenfeld wrote:
> It seems evident that, like every other UDP protocol on the planet,
> WireGuard needs to support what I'm calling "persistent keepalives". I
> call it persistent to distinguish it from the encrypted ones which are
> opportunistic. There are several other important differences:
>=20
> a) The persistent keepalive does not need an active session and does
> not need to send any encrypted data. It simply is a UDP packet to the
> endpoint. The payload doesn't matter for the purpose of just keeping
> the NAT mapping alive.

Why not simply use the same technique as the opportunic keepalives, then?
(encrypted payload)

One small advantage over the "empty UDP packet" method is that it will
also refresh the "latest handshake" timer shown in wg (or whatever GUI
people will build on top of wireguard).  From a user perspective, it's
nice to know that the VPN is still alive.

> b) The persistent keepalive is optional. It is a configuration option
> in seconds. "0" means off. "60" means send once per minute. And so
> forth. By default it is off.
>=20
> So, now there are several things to decide:
>=20
> 1. What should the payload be? Should it be a single fixed byte? Or
> should it be a zero length UDP packet?

I wouldn't be surprised that some middleboxes drop zero-length UDP
packets, but I don't have any data...

> 2. What is an acceptable minimum interval? Every 5 seconds?
> 3. What is an acceptable maximum interval? 3600 seconds?
> 4. What is a good interval to show in documentation examples that will
> work for most people?

30 seconds?

> 5. Is there a good resource for real world NAT mapping timings found
> in the wild?
>=20
> After this feature is ironed out, I'll be pushing a new experimental
> snapshot. This is currently the most visible headache of WireGuard and
> I'd like to get it ironed out sooner rather than later.
>=20
> What are your thoughts?
>=20
> Thanks,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfoo7AAoJEL4B7CKgTi5GxRIQAKebIrzikqfzf/brVughlanY
vwSD0eLICKIJxC1p8vDJ5Bj2GCzKA6w95T5fvB4Sc+v1YJC8jMParJxM59HPiI7s
3tXdtnGhlRXxHhiAyhoYKi0h4BwGBaSdpvz3wbZsR++1T1CaHxfKYYmzQYJm5CSr
Ltw6BDPIbC5Vd3OEGJ4O9lMy8CVebIU2WoH3A/HVecoTGA6V6O3pE//yqUC4WdIr
0MzQYbqTNbtf7+FEG8OfDbTNa9ElSIh0Po+3RE/Xh4oVUdGOYNDQ9s7FzFkKxY0e
efoOvPQPkeCrkuX6GK2NrI1baknnRVh9DSNGiVFZ95XHOWGPc7r5a+s4WIauqcr3
Krg3xRjoy59ZZ32MvQb6+97akw8Wy5nKQgZLmkLnTc7tvWWDT/I47Bl23WEIDy/9
7lQFUn1bIk38VBw7BZwcPowGoJOQzRxfJyW4vftDhMR9ka4/oQLngplabz7ynPVu
sllr5YZEU56zQQWhrX7tGiLx6ErtpJfe50cmVcyihWrrPVgfKZYWhejKDWCStg0G
p4Rl5/Rmtx4JyRXWYwR73T9Y5+wXJXorncc90sULL3YyOggI9l6UH9FyRafXBNZ/
vmtQFx3+l7ck2xYF9YCq0W4rdF5CDz50PC8yALE63VOQHbFGv3jIVSNV0CDQMErb
iyr6SSWADf1VgKlF683t
=kAL9
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
