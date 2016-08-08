Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ba98121
 for <wireguard@lists.zx2c4.com>; Mon, 8 Aug 2016 15:53:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68fef2be
 for <wireguard@lists.zx2c4.com>; Mon, 8 Aug 2016 15:53:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ad829eb1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Aug 2016 15:53:00 +0000 (UTC)
Date: Mon, 08 Aug 2016 17:57:16 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <8fe252f543fb81be@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160808`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new experimental snapshot, `experimental-0.0.20160808`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * timers: upstream removed the slack concept
  We now group timers ourselves, this time with the ability to round down. This
  ensures that we don't wind up rescheduling timers for every packet, but
  instead keeping things within a quarter second window.
  
  * c: specify static array size in function params
  See https://hamberg.no/erlend/posts/2013-02-18-static-array-indices.html
  
  * contrib: move patchers to contrib/kernel-tree
  There are now two patchers:
    - contrib/kernel-tree/create-patch.sh This patcher simply spits out a patch
      for use with `patch(1)` to stdout.
    - contrib/kernel-tree/jerry-rig.sh This is the old hack that patches into
      the kernel tree a reference to the WireGuard tree.
  
  * tools: do not show private keys in pretty output
  The `WG_HIDE_KEYS` environment variable now determines whether or not keys are
  shown in the pretty `wg show` output.
  
  * persistent-keepalive: change range to [1,65535]
  Linux connection tracking is granular to 1 second, so it's important that we
  do the same.
  
  * selftest: move to subfolder
  * Kbuild: move module deps out of tests/
  * tests: use makefile and expand greatly
  This is a big one. The entire testing subsystem has been entirely expanded.
  With the help of Alex Xu and Naveen Nathan, the test suite is now hugely
  expanded, and even does NAT testing with the persistent-keepalive feature. Not
  only that, but the QEMU runner now builds from a Makefile and is much more
  robust. We now build and run 7 kernels for every single commit, with the test
  results published on https://www.wireguard.io/build-status/
  
  * ratelimiter: do not require IPv6
  CONFIG_IPV6 is no longer required at all for WireGuard.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160808.tar.xz
  SHA256: 1cf6eb537432c8282b97da1c53bab015acaea07054c513a79575fe86624f3a7d

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQItBAEBCAAXBQJXqKvJEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA676MQ//
UUGD5990FO+4XFONmhW+4rTfmbq+4zvgNYU+FBC5QuQVBvC5u9C8eeDf4bF4Rktr
HYEG3r/PDnEHvyUK+lCnlpYUAFafooSfW/wRjVM9S13+PBxTQpW7aOvUn97U3pYG
kgiY+4aYw8zQEOEE5uk/xqyCtSr9T9KoKmXePVi+YFfSye+Fn3TIgp1IhcuVuHVU
RY6mO5OUBjqWWdWlJ6o8KlGX5BvZs8PVHYdJzMF3X212tpiMhGHEHrhCH1ezRItL
i5ffiRdYm/2yhYckaUYm7cKJeY1XvjrNZzByFwATLflMCNGXYdNKFzhoiMMdiIYp
MDIzv/DOjv5YKZwWrnOJkG7UfQr2RkafWwiwOhNwluJ2smRM6DC3Rfrq/jayxVlV
MKMnRZHf0eJV0IVKaJjP2mdalTpHiTmsXrGbt7veCO087mEjzfpwmUZHNgLp+41A
eQ6/nPgCTY1CC6lAuYNPJJDHJgNzymUjUNHf0/wS+89j34Z58k5IZMyKrie8gTIS
RiSX0xFzLZ4xd9C2ltJ63JsifTZYjeqAjOWxYgtmbV++jZRnOovv62JAX3rtw825
31klNEQGKJpzzAf74zTbOGLJAXX06O5h7w/CUgVQasQVy3BQbm4JFZtTnbMlghVs
GHWOcGNR9+clVybz3OWZPHfLeQdAWagPniInxEiuDwA=
=+4tL
-----END PGP SIGNATURE-----
