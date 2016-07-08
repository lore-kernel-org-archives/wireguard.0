Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 136de717
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:23:38 +0000 (UTC)
Date: Fri, 8 Jul 2016 19:23:55 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: jens <jens@viisauksena.de>
Message-ID: <20160708172355.GA22218@lud.polynome.dn42>
References: <3b339d53-2fa0-6ed6-575b-7239c91e6a36@viisauksena.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
In-Reply-To: <3b339d53-2fa0-6ed6-575b-7239c91e6a36@viisauksena.de>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] openwrt package - kernel >4.1 vs freifunk gluon
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Glad to see that you found the OpenWRT package.

Unfortunately, Wireguard uses the udptunnel infrastructure, so it would be
difficult to port to kernels <4.1.  See this previous discussion:

  https://lists.zx2c4.com/pipermail/wireguard/2016-July/000097.html

Baptiste

On Fri, Jul 08, 2016 at 06:39:38PM +0200, jens wrote:
> in Freifunk gluon there is actually the kernel 3.18.29 used,
> (Freifunk . in case you dont know is a loosly very bog free wifi
> community in germany with something around 35000 TP Link routers which
> connect to master servers with different technology (like fastd l2tp ..)
>=20
> if i want to build the package i got this obvious error ... kernel 4.1
> or higher needed.
>=20
> Now i am wondering if its better to wait for newer freifunk-gluon
> packages with latest kernel
>=20
> (which could be some time) or go hacky steps towards patching the kernel.
>=20
> in gluon are actually 120+- patches for the actual kernel, many of them
> would be obsolete then i think, but it seems like a heck of work todo
>=20
> any suggestion ?
> https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858/=
13?u=3Dfuzzle
> https://github.com/freifunk-gluon/gluon/issues/816

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard


--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXf+GnAAoJEL4B7CKgTi5GKCsP/1W+SdMSfPDMXkVJ1tcaxWaO
TMM8lqaCcBsRlneFzfALDgcgTRURVx+NPZTB9xwS208VsY2PGHG4slubcZsLoFoI
Fyg1MI/K8D2p8GHq8buPNyCGL2AtRzC2VjekhTdhKcJwXKn+WBPjVlS2jCBQwvI9
h9GC934VWvcp5yerTFuQyka4lpDeAkcMcBgzeRRL3VBQJYMb48QFE0dl4O86dVYB
I9tW+UwpvrpxZoW89wOD7vgPTI2NV7WvTLfQnIPIJMOjTdaK7oYIPPTVXj7z3/cp
KVYt3FoheIAnlY8x9NP0DIS+WDDHlyKruK8wtFYWGZASTs07pPtIbq1j90n5qM6P
QuEBDLwDYWAIDEwKyLGuzPAoC4BL6TMlXuwe2UeO40gW5AyMPMpXWtpoyWqIiai5
LdpyVAwbfjYdGWLB0XU+ZUy9rkZaClv89+P2BQkJRJRbnJPIsiavLZ0RknkY6O92
PyzDJu8Zhq74gTTQr4ZPFoGTZt22TV6LcpNlYJKU0VN26MIsSETgdsVT6dhcJuuy
jhzX/Lj0OU3jqB8K/DIHElhEtoM3dUKJFQwBE+KcTCUg2kTri8neOgKYZFexjDqZ
VYdRbl4c2GCFSc5jRv8bkmGqlaGElVrAWoSidqo13VKoD7b0WUIm10Me1V+n6MBk
wTtrBZWrokTuBbHVf2jR
=X1ed
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
