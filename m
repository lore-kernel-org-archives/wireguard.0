Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e23be7a
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 22:13:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c45aa199
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 22:13:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a5b2759
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 22:13:23 +0000 (UTC)
Date: Tue, 29 Nov 2016 23:17:50 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `experimental-0.0.20161129` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffe4df954a@frisell.zx2c4.com>
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

A new experimental snapshot, `experimental-0.0.20161129`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * send: send packet initiation only after requeuing to prevent race
  * tests: be sure we get all messages
  * tests: veth does not come up immediately
  
  We've made the internal testing suite a bit more reliable.
  
  * main: add version to dmesg
  
  The module insertion message now shows the snapshot build date or the git
  revision, depending, which will help with more easily determining what's
  happening from people's logs. Too many incompetent bug reporters have
  inexplicably neglected to mention the version or commit being used when
  reporting a bug. This commit works around this human error, requested by
  Kalin Kozhuharov and others.
  
  * device: conntrack is optional
  
  WireGuard can now run on machines that do not have connection tracking,
  requested by Willy Tarreau and Baptiste Jonglez.
  
  * ratelimiter: load hashlimit at modinsert time
  
  Alex Xu pointed out an interesting deadlock, and we were able to trace it to
  internal kernel infrastructure locking things in opposing orders. To work
  around these bugs, WireGuard now loads the hashlimit module at insertion time
  rather than at interface creation time.
  
  * tools: warn about clock going backward
  
  In the event that some script on your system is making the clock go wild
  backward, the tools should probably indicate that the "last handshake
  completed" date can't be correct, and that subsequent connections might fail.
  This was reported by W. Kennington.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161129.tar.xz
  SHA256: 7bdce3e56aaae91b195b8bbf7afc8d07f68632c997aa702c1ab84745c099d1b7

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlg9/nEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drm3IEADIgOLo+qJWnwVVQ5E9oRzqBI+qd/2FCeyi
+vR7D0SogSKckwcIV1rXocmz3emGgFJQnUcLmJNC6Nm0QirPE2dsdmNRBMrNmvFh
XeelxPyqH3UmLLS1iSs8p6mCz1Q3kqVXtqzbw+0wz827ViW3DilQ3jy/h/4uuuCI
6moXfCO+rw+ATP+hlL74amuR5sLQJ/XkhTcWA1ycSAMVyfnf0jK7SOe3ZcmrNQkO
p6AN8GsQin7oXX2mt3jXOV1poQe6m5HUZGJ6VfLTYkfz6+aTZzyAIU//2lziQU2d
0LE2QJvWfPKTjqvAR86zs2BjABw/w6TKIO9Pey+r6vj24Jiwu5Lmds4/hzz7Rvtd
YVluuUoRwzMgdBH73ZSXMA6pKvsoD8Gew8SinXyH6RHrookqhjZS1IUyEpq3DClT
1fRZC6slWaMk0Ur4evkd7hJYLT9OK9cLH4WRpTNeJPIK0eHaY8BEyKI+AVudltJ1
879HFVMvyk9zHe/pNyfHXHnSDCq+H8wFCspK6OyHdYdL8Sk6vn9fC3OnB5niILYn
/4CRcNVPq4eelgJ9g1WoG2LWAeqdKIDadh/fJhObv8ggQlMTAMzU6pEo7W/flYP9
HvLwPgGQBFV13NuP3xusv7V2Qss4hsUOcVh1e5qNhx5rdk4NAbKNeBDAfqWzs3uP
DHQTz79OtA==
=uNdL
-----END PGP SIGNATURE-----
