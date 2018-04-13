Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 639c25f8
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 01:24:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f72cf840
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 01:24:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1045eb83
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 01:15:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f8579daf
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 01:15:13 +0000 (UTC)
Date: Fri, 13 Apr 2018 03:38:09 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180413` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9886f7acf021793@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180413`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * wg-quick.8: fix typo
  * wg-quick: hide errors on save
  
  This fixes a small regression in the resolvconf save handling on Debian.
  
  * compat: stable kernels are now receiving b87b619
  * compat: silence warning on frankenkernels
  * compat: support OpenSUSE 15
  
  Usual set of fixes for weird kernels.
  
  * curve25519: use precomp implementation instead of sandy2x
  * curve25519: use cmov instead of xor for cswap
  * curve25519: memzero in batches
  * curve25519: precomp const correctness
  
  Rather than using sandy2x, which requires use of the vector registers and simd
  instructions (and therefore thermal throttling and register save/restores), we
  instead use BMI2 and ADX instructions to achieve better performance, using:
    - https://eprint.iacr.org/2017/264
    - https://github.com/armfazh/rfc7748_precomputed
  
  * curve25519: add self tests from wycheproof
  * chacha20poly1305: add self tests from wycheproof
  
  Wycheproof now provides sneaky test vectors, so we've imported them into our
  self-tests to mitigate regressions. More info can be found at:
    - https://github.com/google/wycheproof

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180413.tar.xz
  SHA2-256: 419ef147c729db4442b9c2bb5ce4f76ae0807bd820d60d1dce17311885e97251
  BLAKE2b-256: 2193f68c2e0511dfc31001cd416e99ab62693e225d1b6fa5c76ab325ee289f4e

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlrQCVgQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtMuEACFm9Si1izgDAkf56A6IDjHQLj/vtpzPs5w
RQUj+7AnLL2C2tD7ShiX1diUQeCIlqEeRBX3BDlK/8B/H8XW6SnUp552NLWopOdK
XjwnxPZOhoCWuL2JZaVlAKkZ0qM/KvVgF/o9s4f5qcFYIALvqziQOXjV/wGRrs60
UdBvfdRtH9Z/+4QtDieSQDyA/aIakdTscWgpumFQMKqozTbRMqJ7jAfXAkFCmAi1
7dUw8jeMpTWS/3P9EXJ2IzWdKg1sPI8Gdz0ckEctWOavQhJuP/nVoilzg29gWB44
01gdrs9K6WDSXt6T+0jVHSUa0Ubdw/rqzqwEDfhfif5IBzbpxA8oKEKoy7imEeTh
ceCDHMSv6P2z8OD7wVqlOW5BRem1kvzAG2jQxwZXX33p1joD0KtgxEOR+uNM+eL6
xkwgRm79TZ3mvJU0LV9XfJLkTXmlhWhcb1WqhVGZZTnfqy1HCX1rChYsG3Zi7zSH
1zWOr8wkv0suESslJioO7EpCMqWQCMNc+WjgeOV42EH+anuRbW4uQAAbv8DGgDXB
LrPXbrucm/UHA4tNvSkWDJVxZls6Ya0PbfSnpNMnu6Yyxfr8QZkhkEru+c/IU7cc
SWugvgUPRK//CjdJeDZR4yuNOiaJytkSAbtPBdnPk5Aw5UdiUeZ4AEpkPzxnb4NL
RNqSPwZuIQ==
=jRZh
-----END PGP SIGNATURE-----
