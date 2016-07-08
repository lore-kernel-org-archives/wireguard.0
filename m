Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 515ede8f
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:36:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1253734
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:36:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 955596c1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:36:51 +0000 (UTC)
Date: Fri, 08 Jul 2016 16:37:23 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <278721635a23c243@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160708.1`
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

A new experimental snapshot, `experimental-0.0.20160708.1`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * persistent keepalive: start sending immediately -- the previously released
    feature was not useful without this extra commit. So, getting this in here
    now so that people can actually test this out. Sorry for the churn. Don't
    bother packaging the previous snapshot.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160708.1.tar.xz
  SHA256: 11faf795dd45ff0d13cdd204775b07e01fda596b4a9c2a1b326614c226e9725d

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQItBAEBCAAXBQJXf7p+EBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66C1BAA
r3VYAPR7CNx5j93fK+tTdbotRT/OwVMntgI6Rwy/JgDX6lyGofcwZsGPv8EsKH2j
FSozoC4eCabG1Oq+Rjvh9Hpr+H50tJMruiICodRgKLVQkpQNPzl3XDI1u0nZRxkh
H8N7i9/PWIyCGbQXlSQJjWaYu8/n+qE7rfTDnCfedi2vPyKXR9STKEO14It9brM6
FK/5s9+LQH7wWVSawTPQJIo8G7lZUxJHYMe6Ipb26tXFvyup+D7vvlzVaP0Nfb7x
R67Fly9iBTPjS0eqUaZes+JHZUMQ/T7St5HZ4Xg+diDmjDzuhlHG1i5YyY94NEfA
/D/3MyTMaO6j3kGSIQmKM7kiI2+ngkOaj5tKSqNua+USpiL8v4461m5Jti1psNwA
mm/Qw+MROUz4zkXsMHtN97DSCK+66MVRFB023FI8Ol0Wwitp9RAm57jQWRu+Meij
Vor57Q5SD+299xb0CciNjh1neBlRirkA6fG3RZM4WyUnD7qoR8o3c+ezXslj6qur
giXMZTTb2+BdCgV+w0Z7blHFKqR0PvW8ehJoFPsU5GSAcZ20ucGmZ33Z/gFE5WLQ
QPO4Rzj6Nq4SxWDHwBuo0UaRr28i0tGM7nUJaSjalB7NZ9ZcAf/jMLwkGpJTeCzn
zirmZfYGs2+EviiOE4jX+2cp/AXn5x5xg5EGymxCOD0=
=zcDL
-----END PGP SIGNATURE-----
