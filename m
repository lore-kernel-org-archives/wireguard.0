Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc9983ae
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 18:05:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7423dc6
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 18:05:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72f142e9
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 18:17:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2945e943
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 18:17:00 +0000 (UTC)
Date: Wed, 17 May 2017 20:16:59 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170517` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <f38f93d07adb8f72@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170517`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  This is a substantial release, containing lots of changes and
  fixes over last four weeks, including a major protocol improvement.
  Since this is a lot of churn, I imagine there will be a considerable
  amount of feedback, resulting in a new snapshot not too long after
  this one.
  
  * compat: use existing iptunnel_xmit function for stats
  * compat: ssse3 support
  * compat: work around ubnt offloading
  * compat: use real crypto_memneq
  * compat: remember to call iptunnel_xmit_stats
  
  We've made quite a few improvements to our compat layer, which
  should add support to more platforms.
  
  * tools: retry name resolution on temporary failure
  
  If you're using wg(8) in an init script, you'll be happy about
  this. If DNS resolution fails, we'll keep trying for a little
  while before eventually giving up. This should allow for a looser
  init service ordering, for those who like to use tunnels with DNS
  endpoints.
  
  * tools: wg-quick: auto MTU discovery
  
  The wg-quick utility now makes a conservative guestiment on the
  correct MTU, if you don't explicitly specify it yourself with the
  new MTU= directive.
  
  * chacha20poly1305: implement vectorized hchacha20
  
  Our implementation of HChaCha20 is now optimized via SSSE3, which should
  improve cookie encryption and decryption speed, which uses XChaCha20.
  
  * qemu: new packages and better debugging
  * qemu: new location for test kernels
  * Kbuild: optimize debug builds too
  
  The usual set of improvements to our testing and debugging facilities.
  
  * jerry-rig: symlinks are better for tree patching
  
  The jerry-rig script now uses symlinks, which should improve its
  compatibility in more odd environments.
  
  * tools: stricter key file reading
  
  The wg(8) utility is now a bit stricter on garbage at the end of
  key files.
  
  * tests: check for stats counter increases
  
  The test suite checks to see whether the interface stats are actually
  being incremented.
  
  * tools: check for proto error on set too
  * tools: opt-in globally to GNU-isms to keep the BSDs happy
  
  General improvements.
  
  * noise: redesign preshared key mode
  
  Preshared keys are now local to each peer rather than to each interface. This
  allows different peers to have different preshared keys, which improves the
  compromise model. This has been joint work with Trevor Perrin's Noise project,
  and today revision 32 [1] has been published, which adds the handshake pattern
  used by WireGuard -- IKpsk2. This is a protocol change -- an accepted
  potentiality of a still experimental project -- and as such all peers will
  need to be updated to this latest snapshot. The wg(8) utility has been
  updated to account for the change of preshared-key being attached to the
  interface to now being attached to each peer. The WireGuard paper [2],
  protocol webpage [3], and Tamarin model all have been updated accordingly.
  
  * tools: support text-based ipc
  
  As discussed on the mailing list, the wg(8) tool now talks to userspace
  WireGuard implementations using a text-based format [4] over a UNIX socket that
  has been designed to be exceedingly easy to parse in all languages. The wg(8)
  tool now runs fine on FreeBSD. [5]
  
  
  [1] https://noiseprotocol.org/noise.html#pre-shared-symmetric-keys
  [2] https://www.wireguard.io/papers/wireguard.pdf
  [3] https://www.wireguard.io/protocol/
  [4] https://www.wireguard.io/xplatform/
  [5] https://data.zx2c4.com/wg8-on-freebsd.png

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170517.tar.xz
  SHA2-256: 7303e973654a3585039f4789e89a562f807f0d6010c7787b9b69ca72aa7a6908
  BLAKE2b-256: 945422d720030e36095087e02da84d7a5b9de962415c807c33e4f96b2d1a613b

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlkck3wQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrkWMD/9/V3QQOZZB9waMRvg+3WQE2oaQ4eRsLWTW
4fgstwA5JRNHyHkikclzf08o5TUUuV/5hP1E9ydukH3iTEAqyIJ+msjdAlLg9SQk
uqVo8nkG4Fw1DMlm40yrdaAIr4d2ORgjE0zhIVtAtuuLMFzyI1LgnXAtLEUZX9Z1
cKSEOs0mnAPffHxbV/r01LISme4EKewGKHtJfC2+iN4iH28odN1jn9KIDgVWuU9F
tr32OancQIxLFzl5+qgzYxuU29SzJc9N3SdHXF9QUYDeueKY3Ozcaxf3ruIK6bgK
ZUpE5kDRS2IT7bgloi6TJ9170EiWQS/yKEEQrE57KGQn2MgFvg2uA5GEoU9pvzaF
nH/E6lZsq5lWuzr2SdohC79VFvpU44u7aNV6phhTORAnqPS4yJhLw2UXHYFurlR6
XSPNYQN3q944AzOowx+7wh7qLmW07Z0krKvWgKeha+JaR8X9pfXLVS8UfDkvVA+R
t7Qcb68P8DRc06BJoQas75By2+tNz8LSUPz/+QX/dMKw/VXj+llUVWIW7CfIgOPF
OvQLtXh4ZPVuAJsqnQjr+CrSMCsIS+xeNSsg+YlS1rOIo58lC9QFOHVcKU3Mxba1
Ttd/usCXw/LftAAXbUHvrQ8+c6RIrahBn9Il0T2iXuI/3/Kgb2Royho0OZlgCxSC
/l9TRMO0iQ==
=9YYE
-----END PGP SIGNATURE-----
