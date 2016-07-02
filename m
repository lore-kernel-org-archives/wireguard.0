Return-Path: hauke@hauke-m.de
Received: from hauke-m.de (hauke-m.de [5.39.93.123])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19435fd1
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 13:45:38 +0000 (UTC)
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 lede-dev@lists.infradead.org
References: <20160702132018.GH12181@lud.polynome.dn42>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <7706182d-aa0e-9c7e-a550-b88b4857fdee@hauke-m.de>
Date: Sat, 2 Jul 2016 15:48:36 +0200
MIME-Version: 1.0
In-Reply-To: <20160702132018.GH12181@lud.polynome.dn42>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="p0KMUmO53K9mcD5N8B1oSn4s12CKKrmwQ"
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [LEDE-DEV] Kernel symbol dependencies and KCONFIG
 usage for kernel packages
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--p0KMUmO53K9mcD5N8B1oSn4s12CKKrmwQ
Content-Type: multipart/mixed; boundary="SrsickBxQPrjoBbthFxT3rFkapp4xMWT4"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 lede-dev@lists.infradead.org
Cc: wireguard@lists.zx2c4.com
Message-ID: <7706182d-aa0e-9c7e-a550-b88b4857fdee@hauke-m.de>
Subject: Re: [LEDE-DEV] Kernel symbol dependencies and KCONFIG usage for
 kernel packages
References: <20160702132018.GH12181@lud.polynome.dn42>
In-Reply-To: <20160702132018.GH12181@lud.polynome.dn42>

--SrsickBxQPrjoBbthFxT3rFkapp4xMWT4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/02/2016 03:20 PM, Baptiste Jonglez wrote:
> Hi,
>=20
> I am packaging a new kernel module (wireguard), the package is currentl=
y here [1].
>=20
> However, I have some trouble understanding what KCONFIG does.  Wireguar=
d
> needs a few kernel options, so I thought that KCONFIG was the place to
> declare such dependencies:
>=20
>   https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Make=
file#L90

> KCONFIG:=3DCONFIG_NET_UDP_TUNNEL CONFIG_IPV6 \
>          CONFIG_NETFILTER_XT_MATCH_HASHLIMIT

Instead of activating the kernel symbols you should add a dependency to
the packages which are building these models:

DEPENDS:=3D+kmod-udptunnel4 +kmod-udptunnel6 +kmod-ipt-hashlimit

> However, it does not seem to enable these options.  The module compiles=

> fine, it installs fine [2], but then it fails to load at runtime:
>=20
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.015838] wireguard: Un=
known symbol udp_sock_create4 (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.022021] wireguard: Un=
known symbol udp_tunnel6_xmit_skb (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.028767] wireguard: Un=
known symbol udp_tunnel_sock_release (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.035570] wireguard: Un=
known symbol setup_udp_tunnel_sock (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.042136] wireguard: Un=
known symbol udp_sock_create6 (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.048297] wireguard: Un=
known symbol udp_tunnel_xmit_skb (err 0)
>=20
> It works when selecting the needed options manually in kernel_menuconfi=
g,
> but it's a huge pain.

You should avoid make kernel_menuconfig

> Is there a way to get the needed kernel options automatically?  Maybe t=
his
> only happens for packages that are part of the core Lede distribution?
>=20
> Thanks,
> Baptiste
>=20
> [1] https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Ma=
kefile
> [2] http://paste.aliens-lyon.fr/CBI



--SrsickBxQPrjoBbthFxT3rFkapp4xMWT4--

--p0KMUmO53K9mcD5N8B1oSn4s12CKKrmwQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXd8Y3AAoJEIZ0px9YPRMyx48QAJPvwnHGukN7D3hEc4Cj61E1
h6oZFfMHzqvpeRpGdUE35DqmUlyJ08OtyioL16SirfaCIzdSVH8EkFwl21akONm1
uRnsoNeB9hfCk4xwtMtEjlukc80w1SKryvAR5MvuIcgWjadbwi9zsaWe1X4+DbW4
L+/umyy0xMRsFm2rBhQSortrjV0WXUs0oHgzmtYQQ7IRWuI0bQZ4GP1tfuTgNNeB
q+R7nVm39424TbDf5hPIc02P4zsGuPcTxJvbEjV0pP+iAtWsa2bh6KgiZ10xlvBc
azNwKOLqYxui0y6zKTDZzFheBzx0io9290DZRvafBm60GtjivARi3DSVA3/IbVwe
+QTl8go1KqOyJHpQ1B3guZxBuOiGTM7l1uXizyyB3lnCKJ+/O77DE7dQ6Z9hIAEa
/iBoXEiLSEGtjbbINaIeDN3VX08xvhq1rYdZOHOsodKLu2UcbhPPh7bgXAoRw/VY
cp18YbSCgFbBW6ZXR8xDTNnVjq0rB9n9Hd1xnh1W2IVH5JJUOkdD8w3GSxxNVE4y
QCDM8M0h/Kg5ZzvIHxeM/ZaaM66LHo7ZaZqLMgvUfKp8zAznVnYvP9jg6dySMBKC
Ygz/vUVC3jpCItGwkCvc1ZwfknZEAumUDdFmUq1MVJaIt18bQU4VKzLlJY2HI4XE
YWUWg+in43phfT3ZZbcq
=4iRc
-----END PGP SIGNATURE-----

--p0KMUmO53K9mcD5N8B1oSn4s12CKKrmwQ--
