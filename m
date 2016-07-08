Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8353a275
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 11:23:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1012acb5
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 11:23:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b4f515f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 11:23:07 +0000 (UTC)
Date: Fri, 08 Jul 2016 13:23:38 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-Id: <ffffffffae147499@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160708`
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

A new experimental snapshot, `experimental-0.0.20160708`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * Remove old development scripts and cruft from contrib/.
  * Reorganize contrib/examples. Distribution packagers are now encouraged to
    install contrib/examples to /usr/share/${pkg}/examples.
  * Make sure we add 4611686018427387914 to TAI64N second stamps, to be in spec.
  * Improve error reporting and detection in wg(8), ignoring extra input and
    generally being more helpful.
  * Enable always falling back to /dev/urandom when getrandom(2) fails.
  * Add synergy example script.
  * Use `pkg-config` for libmnl in tools Makefile if it exists. Otherwise we
    fallback to just specifying -lmnl statically.
  * Improve go test to send and receive ICMP ping packet through tunnel.
  * Add the new persistent keepalive mechanism, as discussed on the mailing
    list. This is available via `wg set wg0 peer ABCD persistent-keepalive 25`
    as well as `PersistentKeepalive = 25` in the `[Peer]` section of
    configuration files. This is off by default, as it's only useful for users
    behind NAT or stateful firewall that expect to receive external VPN
    connections while they are idle. This has been documented in the wg(8) man
    page as well as a small blurb on the quick start page of the website.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160708.tar.xz
  SHA256: 3eeabf36f2c8391f5f1622b727fa5bb7b6b66a0de874f621904ee5b56e50fec1

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQItBAEBCAAXBQJXf40GEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66+vBAA
wGUBhom9CjTIbGLwKGSyzxjcwTJxWovqZF6IDqBUWVakRMx5sfD9WNmZHmW3IHdl
Dlt4kUUSrcNYXcVZHu74yN7SUlFy/JxrgVqjxPv9mDBrjZtDYUOYXFHafm83XcC1
ngVT1rwsQxEHnhQQBvV706fIa4f+w0VuPd5VuCauKq3DqL6fy0XgYoIOjGrRQZQe
UtbDYOLkkeK67Bd+zKF4aFQJWi/oG14z7CsS6BSmRSLJj/z5rFw2yjV2qtnWc7nD
EDK/EiOUin+ltrGv3lx+D5MqHLC8FKE+r2pr1bUy+OIp9NYVh3K6B41xCWfct5bX
hAfMU2+5lDd+qZHG3SzFkFiVKFkuQcjBCN6OUD5lV1CChSxewAMrj+srbMjEe6p3
+n8qxlGXebOx4ywiqENhgNwOrVU+Rf2wtoMIfWUqlbw9Oi7mwhTxifPrqLl+md53
XxJvc8x6GrmPan3465JM+82vTlLNDA2gNNfFqNU1DtdxYBj2sxRqjNnZLG6R19jL
f5gClNpegsQ/W0bDAQQSs1hA/7rU4Hn5yxesSa49g/NTazVfush0w8fJnCPlP4V2
Y1U2N9NfEukC7+aOXFD4ynQqIgR6ZFhYz8dh536HNie54bJ1gLyxVbLuvpz1vKhK
v0LFQD1oM2khtc8arg/5n+aPGgJcKJMFSOUym3LZ17A=
=9Dy6
-----END PGP SIGNATURE-----
