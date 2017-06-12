Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f13a0e8
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 22:13:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a93b4ff
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 22:13:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91525967
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 22:26:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a9c67b8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jun 2017 22:26:53 +0000 (UTC)
Date: Tue, 13 Jun 2017 00:27:57 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170613` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <f64329363be46e89@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170613`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  Apologies for such a quick bump after yesterday's. Ivan Kozik noticed
  that on systems with very little entropy in the RNG, systems would hang
  when WireGuard interface configuration was a blocking item in the boot
  sequence.
  
  The previous snapshot added some checks to ensure that ephemeral keys and
  nonces are not generated dangerously before the RNG has enough entropy. It
  did this by simply making interface configuration block the caller until
  it was ready. However, doing this while holding rtnl_lock() meant that it
  would also block the configuration of other interfaces. This in turn meant
  that everything would come to a halt, and enough entropy would only be
  generated after many minutes, which could exceed particular udevd timeouts.
  
  The solution is to move the waiting for entropy to be at exactly the moment
  when entropy is needed: immediately before generating an ephemeral key or a
  nonce. After quite a bit of testing, this works very well. A WireGuard
  interface can be fully configured as early as possible in the boot sequence,
  but it will only ever complete a handshake sometime later, after it has
  gathered enough entropy. Since nothing except handshake processing itself is
  blocked, the rest of the system is freed up to go gather lots of entropy from
  its usual sources.
  
  This is a continuation of the work begun on the upstream Linux kernel,
  described in this LWN article:
      https://lwn.net/SubscriberLink/724643/6a0cd411eefcce75/
  
  Because this could be something of a large annoyance, I'm releasing this
  quick patch a day after the previous snapshot.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170613.tar.xz
  SHA2-256: 88ac77569eeb79c517318d58a0954caa0a4d2a6a1694e74c2a3b1c14438ac941
  BLAKE2b-256: cf5b7fe0e78fe33f407b8a01a7cb07332790bfe653abae38058165b3581149ed

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlk/FPYQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtH1EACra46NhKawmzCHT7oUlewjhYqEWsEuMJ/N
YyHKlez6t6UZPhFA0GdgFOekBMtDLHC4boFyrtX1SMNVJFsooK0GKZjx3wykjUh3
zhLIOhpoJaadZDQzUQsWRruKGQJlumJR2vo5UzQe0mBDYfUEzQpPssvkXb4JRsRP
EBKQwN51hToc5NMW7CrhenEBL4fDCfujBTDgU7AviurifwCr4QX4MPoySToCAB/U
Q0FhKiUaurIejLOBZGufxsc840x5eXejUK30sTb1te6oZ24u08LvtpKMHYWgpF3m
y15vBLzyxIwOhDdkQ5vYzk+SWNFTrUhRL2XyNWakyC5j3eVvzX0mTJrX81IQKOiT
v5XAoaXV595b+DoWcP0RpmGfFKttYS6bG2WTwZS+V8Y27DDOOpEEZAwv4aRplnx1
48VEfhiI0B0I0YoIl4cvcIkwKeY+upV+tOZYHMg2QQocebYHk+F5x41M5ogvZNsY
uL2GbclQVUevFAT3/VMz8mwVvjJmUBivl3V/5aasWJ6UEqUd4tkhxnCBi64F9hS2
p96LVtmm5g5K+BoGtTBtanhSgW4Zy+asVmObB6OLHYwxo6izjjHF/IxqOAkEDlV+
4p/8N7Pp0K/z8zI9Id6cPxO6RLrQQhdGWaQgojdU3h/gwUPdxQy+fbengPwAf2Bj
clZSTj9PsQ==
=5zeV
-----END PGP SIGNATURE-----
