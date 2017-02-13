Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d086ac6
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 20:53:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24287455
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 20:53:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 160f9576
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 20:53:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5fdd63f1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 20:53:06 +0000 (UTC)
Date: Mon, 13 Feb 2017 22:07:11 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170213` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffff8c5087c5@frisell.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20170213`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * curve25519: do everything on the stack
  
  Now that OpenWRT ships the MIPS SoftIRQ stack patch, and it's also made it
  upstream, we no longer need to do the mallocing, which should improve
  performance.
  
  * tools: man: recommend correct port
  
  Before we used 41414 in the documentation, which we should be suggesting the
  use of 51820.
  
  * tools: wg-quick: recommend using resolvconf in exclusive mode
  
  -x prevents DNS leakage.
  
  * timers: use setup_timer macro helper
  * timers: use simpler uninit sync technique
  
  Simplifies code a bit.
  
  * socket: synchronize net on socket tear down
  * device: shorter workqueue names to fit in ps
  * main: add `wg` type alias
  
  * socket: general ephemeral ports instead of name-based ports
  
  If no port is specified, a port is selected ephemerally, instead of trying to
  be overly clever with the interface name.
  
  * socket: enable setting of fwmark
  
  This is a nice new feature which enables policy-based routing on fwmarks, used
  by Android and wg-quick.
  
  * tools: setconf should remove existing psk
  * tools: remove key for any empty file
  * tools: wg-quick: support v6 dual stack
  * tools: wg-quick: set LC_ALL for consistent regex
  
  * Kconfig: can be a module
  * create-patch: be sure it's actually after NETFILTER
  
  * compat: backport siphash & dst_cache from mainline
  
  Since siphash is upstream now, we use the mainline implementation. While we're
  at it with reorganizing compat, we also backport dst_cache, so older kernels
  can benefit from it.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170213.tar.xz
  SHA2-256: 256a7d41cf228f2a88e1b03b3911746dc827fe7be5b982c60080e7f81998cc6d
  BLAKE2b-256: 0c63e065c1754c78b9586b24186ccf6bb7513d962fa1f15364a03f4901fa10fc

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAliiH/QQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drt4QEACd93zEsAU+LRJ3WHsRPBXGuIkSuyWzzM4v
+YC4YyXVJzc5c7sfQzmJNg3r25yk3Hj/P7QTty0OqacsT3nerOGSbg4YFUs4z347
s60inL44vrUF6JGlwaQj+VQ+v8hNwQMtMd0PJ5+lNxIcc01ZFDGQVHrTI2LbsL6t
Ho3G0jrGpAkFFyOPpqVVKu81ZWZuqPmnnW2Few6e0/7TuTc0fE62nmb22qhObC8Q
pZn6w0MbwCx2Uyzz//k1XgGaKg9RXYossmnoSnQf4LB1Na4x437vr696hkuQYu43
kcDOBHOmH7bSEZY7/b7Zf3YlTRSwnjYc1yuU4Xw3YKLPXGwQz/GAntVSvqnmEusa
nvE+dgMK/jMGdNW7zFJh6Y5JL7dAHsEYDCcWTunXYsjGUTmFpW61JB9YuI9nfPeS
hrTVWnImiSQL22lnXhuxv6VA0FokFjvFeyO3dZaZZIwnUwXDdtNi8UHvFw6ych1U
Bi+Cw1jVFwM/grqnfkEF/VVVbYYKXzRI/hzsuK7n4rHbe34TOOPPy2/X0AoZUcvZ
dwKWhXFyAqIqmIUYsvfMXS1OYOk+ahdA/TXoH9oTc2/Ppy/tmSzXaf2CPj5mCGeR
dOHvysgyvEVb757C+PYk7lAMDXWSXDNKCVSHHStaXYvPvx0jHe1wuWUvdOqHYDLY
jCa+86zQGg==
=FUCB
-----END PGP SIGNATURE-----
