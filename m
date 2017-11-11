Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0686f771
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 03:35:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a84c87e
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 03:35:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47408fef
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 03:35:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 344d2825
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 03:35:27 +0000 (UTC)
Date: Sat, 11 Nov 2017 12:39:02 +0900
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171111` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0d66bf2b110fdd88@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171111`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * Kconfig: remove trailing whitespace
  * allowedips: rename from routingtable
  * tools: remove ioctl cruft
  * global: revert checkpatch.pl changes
  
  Cleanliness.
  
  * device: please lockdep
  * device: wait for all peers to be freed before destroying
  
  These make the various checkers happy.
  
  * netlink: plug memory leak
  * qemu: check for memory leaks
  
  There was a small memory leak on the netlink configuration layer that's now
  been fixed.
  
  * receive: hoist fpu outside of receive loop
  
  Should be a small speedup on x86_64.
  
  * qemu: more debugging
  * qemu: bump kernel version
  
  Significantly more debugging checkers have been turned on.
  
  * wg-quick: stat the correct enclosing folder of config file
  * wg-quick: allow for tabs in keys
  
  Minor fixups for wg-quick(8).
  
  * compat: 4.4.0 has strange ECN function
  
  Nobody actually runs base 4.4.0, but this is more correct anyway.
  
  * netlink: make sure we reserve space for NLMSG_DONE
  
  A rather important change - due to an upstream kernel bug, that's existed
  since the advent of netlink itself, sometimes wg(8) failed to receive valid
  data back from kernelspace, resulting in "ENOBUFS" when trying to dump all
  peers. This patch works around it while we wait for upstream to commit the
  fix.
  
  * curve25519: reject deriving from NULL private keys
  * tools: allow for NULL keys everywhere
  
  A null 25519 private point isn't a valid point (prior to normalization), which
  is why we use it as the "unsetting" value. Conversely, however, except for
  psk, we should be using the existence of it in the netlink message being an
  indication of whether or not it's set, for the tools.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171111.tar.xz
  SHA2-256: d9347786a9406ac276d86321ca64aadb1f0639cb0582c6e0519c634cf6e81157
  BLAKE2b-256: d77e1b04bdc970a0bdf9b699b08786907ddd9d763f0573dfbe130b7a587aac78

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAloGcM0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrsjzEADHv0iR4jNgIY23raDqDqvflkzYWtcKNSLk
otE7jDN6WubgVC0TF0qc1KtkmJ1fpHePsGOcap/eOwxm9Bk9MgW8/39m92mXGMOm
JzKinijnEfOIzSI6bMRNcpEHM+K0MO5cR7lOIS5V1JwGfIju4jDKml23de3Wu7K9
w/vPH5ZhOovx5tYCTwqxxtUk9oqjC1111ceh7cg1z7JzjsQe2DlWtYGAp55C3Juw
SuTwJp7wnQ1pirf5fC6dHXCpzsDdWheeLLHtwagkDi3qWAngVYozPAz1Yz8cEdUA
jaTriXgamxn9BXmghNmqSNWUDaAQZ0guZjpkvB2MmtipvFEPMTRv7nXRESDhT+Dm
HoaohLlNiNpqGRpwaF5xvKueaRHUu9dXdbylvlZWUEHbzcVwM0Q+I00rA+yH26iO
6VIIbgh/LOIoLoS0oGtBxYIvCXFLteMPnQfQrlwVRlJeuteQNcYHW8SyghaD34WK
YBVGzbNb0lE697NeASxRtRfHoNX48Q3Q5/n81URwjjmybDcuJZ8eRqKghg5oUO/b
/aL1ttJ+L+JuBOjj6UYMP6zBX3oOz/1EIneMzytjF5i7XOTfAhp97PugavZwAJsP
zUUtvlM1PAST0Czf31NuF8/6pRY8n/Mbem+EYo3LSB/j4d4MlK9ibDyoUNS4U0Cz
6hD/jB5EIw==
=8GTK
-----END PGP SIGNATURE-----
