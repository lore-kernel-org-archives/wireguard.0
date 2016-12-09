Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c36f11c
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 20:52:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be5b9f40
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 20:52:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4e636d9
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 20:52:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 11343f03
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 20:52:56 +0000 (UTC)
Date: Fri, 09 Dec 2016 21:58:31 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `0.0.20161209` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <fffffffff14497aa@frisell.zx2c4.com>
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

A new snapshot, `0.0.20161209`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  ** Note To Packagers **
  
  The URL scheme for this package has changed, so please take note. Also, you
  might seriously consider switching to using the new `make dkms-install` target
  instead of whatever downstream solutions currently exist, if you're using
  dkms.
  
  
  * hashtable: use random number each time
  
  This reverts some hashtable changes from a while back.
  
  * tests: make sure ncat gets killed
  * tests: directly kill nmap
  * qemu: bump kernel version
  
  Now running `make test` cleans up some zombie ncat processes.
  
  * build system: add dkms installation
  
  This is a biggie for packagers. You can now run `make dkms-install` to install
  the source and dkms.conf file to an environment-variable specified location.
  Since the majority of downstreams are using dkms, providing it upstream makes
  sense.
  
  * data: reset tc when resetting skb
  
  Correctness fix.
  
  * device: clear all peer ephemeral keys on sleep
  * device: make suspend code conditional on CONFIG_PM_SLEEP
  
  WireGuard is now the only VPN software that will clear your ephemeral keys
  before the computer goes into sleep. This is a nice security feature for
  extreme cases.
  
  * timers: add random jitter to handshake retry
  * socket: clear src address when retrying handshake
  
  This increases the reliability of reconnections succeeding in the case of
  connection trouble.
  
  * device: cleaner error teardown
  * main: cleaner error teardown
  * device: traditional if is cleaner than switch for this small
  * compat: build dep errors belong here, since it's out of tree specific
  * cookie: kill redundant forward declaration
  
  Just code cleanups.
  
  * contrib: add wg-config
  
  This is a nice new example utility for adding a wireguard device and
  configuring its IPs and routes all in one go. It's extensively documented in
  its contrib directory and comes with a Makefile installer.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20161209.tar.xz
  SHA2-256: caabb9bb471a262e178162c30b8b8524cc3a05e0e9daf23a921870a4106ec886
  BLAKE2b-256: c5d1842b6c76b2481dfe742e7b0ee8778d01b10438936f5ef044da80d07d8700

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlhLGkoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrsI7D/9iywyqwxzUGlvT7NEJ0jlnZnIT6CZCEs3H
8QKtFIk7+ryDS9eCzrCCc7fNII7Ym9zBBi74dmAN4uCMjlSUa+ZAuCYKp3xXAH6u
zFjnKPnbHePSV8oiHFWCKN/3vzIuITlUXcWKbC0NXptpjrBZXDH0lSadKfy9+erw
CLK99JSo/G7BIE7buaA3mr0XgxTspvLUm/mBPRnNW2ttJDDkHUDHJjYKJhanTOtK
wkjDfntcW/MtJOf8JlZGeoA/pXs1goI1MMGIBj4925p8jqe9weC1Q2W0/8C8WZnm
NfNYWojrAq+85dPPG1fUehkd6Xm3STZ6gwveo/D61hDZlc3wxWnZjsQO9b9Uy4zt
V37VmXO3N2X0ncYv3X+LhHFgBT9hxhbGux/sOryYh61n/S/IwbZmnfUVjWm07NMw
v3u0kAlKva7MUtKZ/G0DSE1uck6ea18CzHR3wW11JZN8j9AUWIIMT3NSy8EirwWc
ozM/HnOZCN7998dtV3XXBHb3XZ5rkiPVknvsCrZty76jzL5eEV3AvOMdatW66ILa
1TdZUaK6+Acy3xhL18t0pV15z4crYdzKSpkPehHaqsoeKNnQYTG7fEt3qfluKF4w
hOY/NLYVqdA0AkDl/OXUEsaBvXpcTRVjYA+uWh2HldWY7/GZVo7sHkghGwW9Ed03
f6XWixgXfw==
=xmAI
-----END PGP SIGNATURE-----
