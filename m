Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b75c567
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 19:11:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c53e1fae
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 19:11:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28f4fb8d
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 19:24:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ecfcf323
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 19:24:49 +0000 (UTC)
Date: Thu, 29 Jun 2017 21:27:58 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170629` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <f64aa1535f888863@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170629`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  This release fixes a regression reported by Reuben Martin, which we
  then debugged together on his hardware.
  
  Certain length checking conflicted with GRO on particular hardware which only
  pulled the precise UDP header into the skb head fragment. This caused certain
  packets to be rejected unnecessarily.
  
  The regression was introduced during a cleanup of the last snapshot. The
  static analysis suite is being augmented to catch these types of errors in the
  future.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170629.tar.xz
  SHA2-256: 51c44624f20eaff96780845214f85491c0c7330598633cd180bb2a6547e5d2b2
  BLAKE2b-256: cbbf05325863f18c87cfd2a9789fe35892c0fa3fd338a5ca8db2e31a8cb92653

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAllVVLMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrneREADS1547FFb308knr/oZuw+wVZedIvT3Ih64
bu6nigNNBhhcANePKKXHAYS0oBrcIkyJazfgSzp1uzwn8wXXFTMSJ2P1GuZz+SFc
U1QyHJA9r0GiUoodWtoP3lj3dKz6XuvQGU6VpHhJaq/DlRVeFeCdjrEudKywCOTc
lauzkxkktwL+QjT2c06RaKIScJHRX8z9uUlCWfLIy1593EBgi764N27uS/gGoNey
ZkJizPxrKcE20XNCIGEDkEsF5lBtXFH+yNUkHbRdewbsLwiNmDL6Hii/ZBmSun1s
Yw4cWfKwuB939vw5v5xHLllvmI58ILeBWvUMCErMUCV6jo5BSosTUZGc+ZE4ECHd
ZANcZWHDUflrBoT0v2yYQIHtCvsFASP2GFoX6WXvxbyKctoOktF3wF3R2C7pcIvN
Cl3tnAmVW6oMgod0H6QGVszqB5xKb+6sK3ksRchG2rYAbw6QaNLvU9P58MjFcBzG
WQCkLhxvngmddbHhmoCkj9KPQdusr/2c4cuUe6nwyntxN0yJ4F9C17MbBgtGRa4/
v+3DILDOGG8nf847RY9U3oMgaMVQPWZiflQwKutRF10YUYlhSSn6/Rc2p87pR2Mx
LQeaL1Ru7meeyEenqsSbdzwnY7kZYz5KWcxlAW+HZ5OVdCyhPB/k3y/EPJVm6Lj5
u+vI6rpkew==
=qCMn
-----END PGP SIGNATURE-----
