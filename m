Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 458461b6
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 07:36:24 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bf9d4a3
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 07:36:23 +0000 (UTC)
Date: Mon, 12 Feb 2018 08:42:55 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
Message-ID: <20180212074255.GB5305@tuxmachine.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
 <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
 <20180212073501.GA5305@tuxmachine.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
In-Reply-To: <20180212073501.GA5305@tuxmachine.localdomain>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12-02-18, Baptiste Jonglez wrote:
> Hi Jason,
>=20
> On 12-02-18, Jason A. Donenfeld wrote:
> > Secondly, I'm wondering if you tend to do, "anything strange". For
> > example -- are you setting up and taking down the device often in an
> > automated way? Or reconfiguring the interface (via wg(8), for example)
> > often in an automated way? Or is the sustained day-in-day-out workload
> > that leads to this graph simply forwarding and encrypting/decrypting
> > packets as usual? If it's the latter, does this device tend to encrypt
> > or decrypt more, or both equally?
>=20
> It's the latter "day-in-day-out" option: the system has a single wireguard
> interface, which is configured once at boot-time, and then used
> extensively to forward traffic.  It tends to encrypt more than it
> decrypts.

Actually, now that I talk about it, it's not 100% true: on this system,
there is a second wireguard interface that is not currently used (it's
provisionned to connect a future router that is not yet deployed).

The interesting part: this interface has a single peer which has no
endpoint but a persistent keepalive.  It looks like this:

    interface: wg-router2
      public key: XXXXXXXXXXXXXXXXXX
      private key: (hidden)
      listening port: 56008

    peer: YYYYYYYYYYY
      allowed ips: 0.0.0.0/0, ::/0
      persistent keepalive: every 25 seconds

Maybe wireguard allocates something to send the persistent keepalive, then
bails out because we don't know the endpoint of the peer?

I have taken this second interface down, but it has not released any
memory.  I am now leaving it up without the persistent keepalive, just in
case something interesting happens.

Baptiste

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlqBRX8ACgkQvgHsIqBO
LkYUOw//ev9Ug9I2YzYVz2he4AAZq801Z9VxkGkOoGuh9P+P6vJxg+rJX6EhDKOe
Qc6Uk+kxk2/U8e/0HHGshqxfoLuFR2ftu+OYX9J4AB2aJPZRi6XzGXrX1i/FOsfO
U207GefgAiN6bhEjE/qsyyhYvP1vJDha4FHhuErINtBVm7z0JVZNu/4elYza6hWu
mP+V3hZgw6RNSSlqKuliCOaQboRfuaqbJFN3gHcYbOoZbhYM2CFeqUxqRb1gkwIb
9mX2v4wrCYUdA4+A8omVawM1j4g3NKQy6Z2LyAipfvVX0SlywgKKSqZtvOGk3L1F
nJvDa9iSfjoYPjV+LFaRjgMyhlozHOn5TAo9qKJHLJFxe3DRi3pI9gK//2yP+xDo
ZEgt1hTr0HGNzPjrDnhVhfGBTFwUb4i1n2Qq2mGYmHkc3LnNjw9PTH08tM7cwu1V
FnbbOd57Ep3U90CzHiKxKgXow7SOFZZBYFDbE7yzeHDvkteXugWE1fc324LZI6fj
7Mb95J+Ura6eOIFa7F17N5TzP9a41eR3wo5ZItzLAOgXx92/nuglIUsygTYAgGzp
XNoNs98gTk5dNFffT5suOcGB+8P47aULrPISwOnX2TIpYtWFS3SbcAXZ67Jdx3Vk
BMd6nBGvBVXZzWflmLlFSgjA77Y38y0CpJ7aMDQcPE1Fl7kHf8Q=
=iBHX
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
