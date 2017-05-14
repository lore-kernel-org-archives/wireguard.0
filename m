Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6440fe3c
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 09:44:56 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1adce5ae
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 09:44:56 +0000 (UTC)
Date: Sun, 14 May 2017 11:55:52 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Performance of Wireguard on Infiniband 40G
Message-ID: <20170514095552.GB7227@tuxmachine.polynome.dn42>
References: <20170513073721.GD22218@tuxmachine.polynome.dn42>
 <CAHmME9pgLtP4z-vvuHxH4ST2f6ZeHhKZXM8FnyrRnxojYDsGGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
In-Reply-To: <CAHmME9pgLtP4z-vvuHxH4ST2f6ZeHhKZXM8FnyrRnxojYDsGGQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2017 at 12:52:11AM +0200, Jason A. Donenfeld wrote:
> One small and unfortunate thought just occurred to me: the backporting
> to really old kernels I'm pretty sure is way less efficient than newer
> kernels on the RX, due to some missing core fast-path APIs in the old
> kernels. In particular, I had to wrap the UDP layer with some nasty
> hacks to get packets out, whereas newer kernels have an elegant API
> for that which integrates in the right place. Just a thought... I
> haven't actually done concrete measurements though.

Good idea, I have redone the same setup with kernel 4.9.18 from
jessie-backports.

TL;DR: when switching from kernel 3.16 to 4.9, wireguard has a 50%
performance gain in the most favourable case (large MTU).  Also, iperf
seems generally faster than iperf3, most likely because iperf3 has no
multi-threading.


The full results, still over Infiniand 40G, are:

- unidirectional iperf[1 thread] with 1420 MTU: 2.1 Gbit/s
  (instead of 1.6 Gbit/s with kernel 3.16)

- bidirectional iperf[1 thread] with 1420 MTU: 780 Mbit/s + 1.0 Gbit/s
  (instead of 700 Mbit/s + 800 Mbit/s with kernel 3.16)

- unidirectional iperf[8 threads] with 65450 MTU: 11.4 Gbit/s
  (instead of 7.6 Gbit/s with kernel 3.16)

Without wireguard, as a baseline:

- unidirectional iperf[8 threads] with 65450 MTU: 23.3 Gbit/s
  (instead of 21.7 Gbit/s with kernel 3.16)

So, the new kernel definitely improved performance: by 7% for iperf, and
by up to 50% for wireguard + iperf.

> > - iperf 2.0.5
>=20
> iperf2 has the -b bidirectional mode which is nice, but it seems like
> most people are using iperf3 now. Out of curiosity, is there a reason
> for preferring iperf2, beyond the -b switch?

As I said, it was just a quick test (to see if it worked fine with
Jessie's 3.16 kernel).  Iperf was already installed but Iperf3 was not.

It turns out that iperf3 is slower in this setup, most likely because
iperf is multi-threaded but iperf3 is not.  For the baseline test (without
wireguard):

- iperf[1 thread]:   13.7 Gbit/s
- iperf[8 threads]:  23.4 Gbit/s
- iperf3[1 stream]:  16.8 Gbit/s=20
- iperf3[8 streams]: 13.6 Gbit/s

This was with iperf 2.0.5 and iperf3 3.0.7 (jessie).

Just to be sure, with more recent versions (iperf 2.0.9, iperf3 3.1.3):

- iperf[1 thread]:   13.6 Gbit/s
- iperf[8 threads]:  23.3 Gbit/s
- iperf3[1 stream]:  16.8 Gbit/s=20
- iperf3[8 streams]: 13.6 Gbit/s

So, the behaviour is the same: iperf is faster than iperf3 thanks to
multi-threading.

I also tested through wireguard:

- unidirectional iperf3[1 stream] with 65450 MTU: 6.47 Gbit/s
  (instead of 6.42 Gbit/s with iperf[1 thread])

- unidirectional iperf3[8 streams] with 65450 MTU: 10.9 Gbit/s
  (instead of 11.4 Gbit/s with iperf[8 threads])

> > - Xeon E5520 @2.27GHz (2 CPUs, 4 cores each)
> > - Mellanox ConnectX IB 4X QDR MT26428
>=20
> *drools* That's some awesome hardware!

Well, it's not my hardware :)  But it's not exactly new, it dates back
=66rom 2009.

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlkYKaAACgkQvgHsIqBO
LkZTuA/9Es2vkAvixPXk4qHxt3tDfckyW6D5d6id51vq2hI4yaqzxEl+gQXkCAbB
0uTdTcMY55KCaaraxLYtHxzh6qrIEZQInFmCiFy7dmB36pUsBMSPZG6O+9wmsATl
iKEReedxrCxaYGk25ZW4rmELU/f6Pelz2P75Q7vpst6a02WRGfZb7nFQ9lGyjKVy
lRUQkRoigBoDH+Gi7SSPWNiq2BOqjkVGp2p10XvxhubMJKCpJoKfSTrK1/G/TjWP
sVhKZHwLZfuZSToVmo14Zn3d64brUGijOSUiOOQeGGpsgmfuISvuRBEyQJXKZKMg
+QQEwo2L+L2UiN79v1tsZ4tYFbnCx6zWOsLib1NE3imh1NF/se6Bp8Rr02mxRokW
oSTguo1JjiVHpas9z2olcR6T6y19zTndkaHXMOt5fBdI3ShuVmUC25IRghYFUr+4
m1IVAtwcPrH9uJUPkVbGY4K0TwRsQztBXD0pD3sXEqvVlQJV8iBHPY7533ENYizv
xw5sU3KSm1pBmCFyWz88cIeJJipLU/keqzUhkhP4fPJST3PjYAWVp+qFEE0r9top
9T4KXFCkBjZBueC5oez5cDrdYyEV2uW6rEnTiQK1k7M1wrIoO+cMdtLqNfR1OyNg
MpBHDoc8FD+MJyxZ3HXLEAm/Pu96zmOWpJKitndsrxjUVW3HCr4=
=hKbC
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
