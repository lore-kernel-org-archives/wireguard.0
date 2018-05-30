Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e305b693
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 23:52:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f371ac4
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 23:52:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46e5e3f7
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 23:51:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19224278
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 23:51:01 +0000 (UTC)
Date: Thu, 31 May 2018 01:54:23 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180531` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b99bae1087f25e34@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180531`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * compat: don't clash with get_random_u32 backports
  
  This should allow running on recent Qualcomm msm8998 kernels.
  
  * wg-quick: determine IPs when saving interface
  * wg-quick: darwin: add multiple IP addresses
  * wg-quick: freebsd: configure as p2p link
  * wg-quick: darwin: set DNS servers after delay on route change
  
  Usual set of wg-quick changes, since the recent cross platform additions.
  
  * curve25519: x86_64: satisfy sparse
  * curve25519: x86_64: make symbol static
  * crypto: consistent constification
  
  Small cleanups in the crypto primitives.
  
  * chacha20poly1305: split up into separate files
  * chacha20poly1305: combine stack variables into union
  * chacha20poly1305: test scattergather functions too
  * chacha20poly1305: test for authtag failure
  
  We've reorganized our chapoly implementation and added lots of new tests as
  well. The generic C chacha should be slightly faster in the process.
  
  * poly1305: mips: compute S on fly
  
  Small speedup on MIPS.
  
  * device: do not assume dst is always valid
  
  Fixes a crash when forwarding packets from devices that use flow offloading.
  
  * tools: constanter time encoding
  
  Not essential, but nice to have.

This snapshot contains commits from: Jason A. Donenfeld and René van Dorst.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180531.tar.xz
  SHA2-256: ff653095cc0e4c491ab6cd095ddf5d1db207f48f947fb92873a73220363f423c
  BLAKE2b-256: 9a360a69e9e32a3345b12305825ea92e8165c9123dcaf9c4b0168000eec2a92c

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlsPOVIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DroubD/9vtU2UUUeDDCkdx7q3pc0EglDq/iAbcNjC
uUJqRWQcAgzMl4lJ/XQiNil1UKYtv16fX8VdEsqaHp2bOmJolllNN6kDlwJcREbj
qjdLrE4z0FGKCzUNLRm1y31TwaPcdhKZalDeF8ECaqHyQH5H3RXNTPCNbKxoPhKx
DH2dp8gt3ctrIw4Pp8i5MYBHP3ZelDj2oEyetoWYmikUSaMZKnBqh8J8+SiJL0/X
VdoDSDoW1L/9Xuet4inli1HQraADnbMvhCCl/I5htjQV5Vrx/Jb+2mOl0yHX2N1M
oVrMCSiqIFdKUUoULjJGcFDTzRKPXeKKZZGt2t2aJPBelEoyvzOgkma2gTHKQgsX
S3fsNFuvKPSNiDrUNZjQi7wfhoNLvDEusmHE9b8Ta1tbevi4e8HIf5uLdPHSLBVU
UiElgWkn5P9KlNLAjKbtXOF68Jh8VvXTUf/S1qiv99QbY8WwpQdcfLjG5rABoeN9
Q/MVrsrvXMYJibbyixI+tHPROXnDwtBac1LTAnVcuUgnqbICZUbTZx6dsTz4n3Oc
54ap2DEA4X6JiQqL2gPR5tBiAfDOb+ICHYCwG74IMabllpzoUP5GCxx17zj56anr
C2peCDhvrdDxjDMkuP8UDVKyl0H1dy5AwShUvYsb5IXOsQszUnqRIoKMFQr4vAsE
ikF4YDDp0g==
=18Tu
-----END PGP SIGNATURE-----
