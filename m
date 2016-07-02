Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8057f77
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 13:17:19 +0000 (UTC)
Date: Sat, 2 Jul 2016 15:20:19 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: lede-dev@lists.infradead.org
Message-ID: <20160702132018.GH12181@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jRdC2OsRnuV8iIl8"
Cc: wireguard@lists.zx2c4.com
Subject: [WireGuard] Kernel symbol dependencies and KCONFIG usage for kernel
	packages
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--jRdC2OsRnuV8iIl8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am packaging a new kernel module (wireguard), the package is currently here [1].

However, I have some trouble understanding what KCONFIG does.  Wireguard
needs a few kernel options, so I thought that KCONFIG was the place to
declare such dependencies:

  https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Makefile#L90

However, it does not seem to enable these options.  The module compiles
fine, it installs fine [2], but then it fails to load at runtime:

Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.015838] wireguard: Unknown symbol udp_sock_create4 (err 0)
Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.022021] wireguard: Unknown symbol udp_tunnel6_xmit_skb (err 0)
Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.028767] wireguard: Unknown symbol udp_tunnel_sock_release (err 0)
Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.035570] wireguard: Unknown symbol setup_udp_tunnel_sock (err 0)
Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.042136] wireguard: Unknown symbol udp_sock_create6 (err 0)
Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.048297] wireguard: Unknown symbol udp_tunnel_xmit_skb (err 0)

It works when selecting the needed options manually in kernel_menuconfig,
but it's a huge pain.

Is there a way to get the needed kernel options automatically?  Maybe this
only happens for packages that are part of the core Lede distribution?

Thanks,
Baptiste

[1] https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Makefile
[2] http://paste.aliens-lyon.fr/CBI

--jRdC2OsRnuV8iIl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXd7+OAAoJEL4B7CKgTi5GlfEP/3cdNGV8UvqSSQbRfASjHLhT
jiX1/BlSxz17laPEAH8SPLfHqyJC8jFIuaCcAeVtJPO6upDMS8lBvAUZtM4Y2pwL
ef6oOQDe2Xa1+UirfSeyj3VKBZzW5VjJsv9jA4Cns+obmiBgKDIBqJsJkDrfT8b2
XzEZK7zVQbwGfItxLIYth6DETlvo6GYNcxlCXU7zFgn+wPIDZoaMDFnUDTD8q1hm
yFvC0OjCHfvP62rEN3lKEbP5NwdFck6GhaqVBVbUjWmbIYrPLnJJ+rRvCy0a3HyB
I/osSw1MiNgIlRxRd9zn3lf7XZA9QH7BapW2MaPBcpIMYnm+EuCJ/gKKHSiglLHd
2RyZakKFdsCr+F7S2WRXe40VrgIOk+61Ik0Q66At6o+DPcgOy5KzUGrV9LqqXtlZ
i4t43SQTmzOhe8SDksQbp+cHIPRwrzr0eO9564leM4v42c0ixkNBi7SsSf6Ovqc6
d0V/mKIaPbelMdW7/ylkhSjPmzrSent2QW3p6mbnQWz4koYmnGfYRoYyXi93lMkX
yJCCJZ+Qa8zqflIidT6GFBEmJytJqJQ/jC0vJgZ+v/N+fU3hOF08qHLgpV/r6Yn4
P/RVHzvpdekZfjoVm8IQLUViadY2vXjXn9RzYDLy4RCvxos/NNmnasxImQ7u15X/
vnxCSJLGoXWkKT8MSZyL
=XDHa
-----END PGP SIGNATURE-----

--jRdC2OsRnuV8iIl8--
