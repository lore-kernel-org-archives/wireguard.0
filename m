Return-Path: baptiste@bitsofnetworks.org
Date: Fri, 1 Jul 2016 11:37:51 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: tiernan@tiernanotoole.net
Message-ID: <20160701093751.GA28109@lud.polynome.dn42>
References: <34EBEFA02A9AAB1F.1117239f-f3e4-4320-907d-9a9edbb083c6@mail.outlook.com>
 <CAHmME9rL4jdWQV66hGOSbY5yymVXatq67bMjEJwVBFTxNRB-uA@mail.gmail.com>
 <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
 <CAHmME9oa+k0h9s62ts5DpqqWiSnf6zQRfCZyeOCXNsObOHyVDA@mail.gmail.com>
 <FE551DD9-28B0-4B3D-89F3-EB0F142AB48B@tiernanotoole.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
In-Reply-To: <FE551DD9-28B0-4B3D-89F3-EB0F142AB48B@tiernanotoole.net>
Cc: WireGuard@lists.zx2c4.com
Subject: Re: [WireGuard] Single client connecting to server multiple times
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 10:15:14AM +0100, tiernan@tiernanotoole.net wrote:
> So, I tried installing it, and managed to get it to work, but have not
> managed to get much performance increases from it, compared to
> OpenVPN... Are there tweaks that need to be made? On both machines, I am
> listening on a dedicated port, and on the local machine it has its local
> ip set to the public IP of the given Network adapter (both public
> IPs). The upstream server uses the same IP, but listens on different
> ports...

> I seem to be maxing out (using iperf) at about 1mb/s, but if I move to
> OpenVPN, I am getting a lot more (10-20 in some cases, other times over
> 300... the link is a 360/36mb cable modem).

That seems really, really low, given your hardware.  Are you testing with
wireguard + the quagga load-balancing magic on top, or are you just
testing each wireguard tunnel separately as a first step?

> Cpu info is at http://termbin.com/0z24
> Version is at http://termbin.com/yux0
>=20
> There is no config or config.gz in my proc folder... Which seems weird...=
 Will send on the others now.

On Debian, the kernel config is available at /boot/config-$(uname -r)

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdjnqAAoJEL4B7CKgTi5Gg50P/1BMHhscBA/44rUHZMlo5IyI
/KX4FT85GltbdR5HfQa/ghzeKtzHHgNkOq1WzwIBaUC6s3OmbTIhw9KYnopIu4HA
Zx5cyJZDvye24iuJyFxWHhb7oElCv5gU0gUObQV6i92+Km/VGwtan4B1Lzn69pGg
TxwXv5gZbaQmOTUBalWo0CanCZIciJIqsEk61NHZI9TYN819RX/wbQgAsyt+NAGf
WVgyENAyizYceTPOoikFnk+EuWBc8r4pBfWDU0xVXdQwarrsMn8N6+QidZaRcO3F
4z7Xt+eBRTfbWynqwa1t1tbwAFdeGj4WM4IGJ4sXAZTRmAMh8UhmZKBli96to3kT
5OECIBEk5PBGipdcE+Vj6DYNAP4QmQdAKLTF8wnkbn169/ahZ8z0U43p99/bc33p
gtsLGhAqpFmpmHsQx6zS4BVvXVyf7VMJC8yyaZJVtMCuwhQjihaSmRbV1z8Jy/Bx
wws/ddZ5SC5T1s4a8+eBqTnsOVljKNs0DUXmutN2GJQIs6Groc67U1koqBepHhrK
sE8DcXiYDMbZyG4Mu6ZJU0BC6U3CvL3o64B0O1I85nvmNFtlqORwXe4MuBWd3V72
a3uGza149edmzJmfQdtZ/Z570YgCgAnUlYpw0MoyqyaxJF+ELi0KYbW4u6SyTsJH
OB5y/TZk+DVluTQ4hveg
=ojqT
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
