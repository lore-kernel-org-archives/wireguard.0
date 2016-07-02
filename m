Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ee70119
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 10:40:45 +0000 (UTC)
Date: Sat, 2 Jul 2016 12:43:45 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: lede-dev@lists.infradead.org
Message-ID: <20160702104345.GE12181@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160702102754.GD12181@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ey/N+yb7u/X9mFhi"
In-Reply-To: <20160702102754.GD12181@lud.polynome.dn42>
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


--ey/N+yb7u/X9mFhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am packaging a new kernel module (wireguard), it is currently at [1].

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

--ey/N+yb7u/X9mFhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXd5rcAAoJEL4B7CKgTi5GpEoQAIweOwSrJ0+kqacpsg2TNHzU
orYKqcu0xWj1Cf5vtgkrLWjD3Op+IFv3cgsKgc9WUEkWNIcqrbn5ezjcQ9p9LoBr
RYVmbNOyjk+/RgYhXcOzfbEovJ1l2njG8CXGNh72YYf1GodkdEHPNqvxSgYW7pYa
yWhOvrrNz0U9QzTNCPKgFvhzXr+JdLRLnxdydIDMC2KBXCpSg904vcEFAWDVt2lX
oN8l2wsZ50MkiFZBMTliAsKTSauGJ9E92GKZanDmAOibrXStlqEg5eU04hun3ReV
A84EyFcEvp6OT7P8T+bUFhjqnOfDHjdCTvblD8HmLSvJ2/rU82f6zZKMH4Ofte9X
+TPlyuwu4SWUQVUib6k2qLfcZEBPL9c8qHGGRBNWudAyanLqlP2DLAf4kPmJE+jp
3rb4jKKtDCCN9KuhX3NSweqjjUTUZvXEs3v04FfqQU3mQEhOtSWiZvsvG4vmlHk6
wghNxDQP9d5YbD1SVIlSfG54nyH1mw/hMAKIPvPoXvhuNMPZVn0v1vvDUKeE4JFK
Qoi+hdKQ94umzbdKB43BAuPW3ENsD2z7XF7WQmM7uAJAoVF81tjQFYSCGQf/Z9+v
/0fdHZVhI/xsYQfa2fIppZv30j1y7BLJ55W+ojts0EqkKNTOrpP90b7kwkxLizgw
tz/gLeQbiPrgOPD8fBn3
=wxVd
-----END PGP SIGNATURE-----

--ey/N+yb7u/X9mFhi--
