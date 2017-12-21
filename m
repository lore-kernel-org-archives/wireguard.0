Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dff1a86
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Dec 2017 01:19:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9243feb5
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Dec 2017 01:19:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee633a7d
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Dec 2017 01:19:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 27c5ade6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Dec 2017 01:19:40 +0000 (UTC)
Date: Thu, 21 Dec 2017 02:28:21 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171221` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b96069ed92607495@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171221`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * keygen-html: remove prebuilt file
  
  This follows our mailing list discussion.
  
  * wg-quick: add the "Table" config option
  
  In collaboration with Luis Ressel, wg-quick(8) grew an option! We generally
  do not like to add things to wg-quick or allow feature-creep, but this was
  basic enough and mostly involves disabling functionality. Specifically,
  wg-quick now accepts a Table= parameter with these semantics:
  
    ~ Table=auto (default) selects the current behaviour
    ~ Table=off disables creation of routes from allowed ips altogether
    ~ All other values are passed through to "ip route add"'s table option
  
  This should enable people to do basic policy routing. It also matches the
  functionality provided by LEDE/OpenWRT's uci config as well as NixOS's
  networking configuration.
  
  * wg-quick: dumber matching for default routes
  
  Efficiency.
  
  * crypto: compile on UML
  
  UML allows you to compile a Linux Kernel as a standalone ELF binary that runs
  within normal Linux. WireGuard can now be compiled as a normal Linux program,
  runnable on Linux, which is useful for the test suite... and other things.
  
  * compat: kernels < 3.13 modified genl_ops
  
  This fixes a rather important bug with 3.10, 3.11, and 3.12 kernels, where in
  some cases, gcc failed to de-constify a struct that was marked as const when
  it should not have been on on these older kernels, triggering an oops at
  module insertion time.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171221.tar.xz
  SHA2-256: 2b97697e9b271ba8836a04120a287b824648124f21d5309170ec51c1f86ac5ed
  BLAKE2b-256: be1b4ae1680074169f575c80487375660a5e77a6b42924f8d69f25e931f0665e

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlo7DcgQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqwSEACLAqI1pSRXGba3IJ3yFAxMja3ro4kzaQpA
gKRrWOxzzJ/N39MEmRTR+ldDu6d3xUB0oxDgsccpwEFQeC7KR6XUTsq3JWwqWzx0
ZuBRaX9lHicnOibElONkuzcyHRBa2d4jsHPGfRidfmaOaNBTDxPJcMnYZiTatb+V
6pfsD9O61smb1PAi271ArGpxzZbr44plwqm9894dbKblOiY1cu+7eOCILv69My/x
duUmTYoHoKmJUeJm87jJQXaDpWwB+voHeyMUs/AxdNzBwJMZ1ByVJsGDMgHxWqPh
e6z2aJVNaR6BTGd7OZYNQBNy/CmpUd/28bDE0EUVAHNIps+ep6yk4KmIvtPB0Xo/
X41rmeNQwJWkj0O8FlyekCLGcslfUAWc42UiXAlhU1C82+2lMdublLUzsJJNu+2u
GTkNIcXJSICzEPYyEH90j6j+3lmjdjRuDnWc4HvFACPETd7ci69wS1ln8JEDXgyE
g1Cs0XlSPfY8M0eTKO72d1UUlnfimmPk+U80wCUtL2KFI1Hc/we/GvzDadNTKShv
11llKqC+w2yFtJVlH1eAY/axpksGshsYVl2LMJRtJexHfzqyWTjTU3mQIVorhJsP
UhUNk+nQsZpDtXWroFtLTxmbImbXoL3r7O/9rR0h/gfJLDpf9pgMAjGcJ7rJojgr
8ezCmif75A==
=FX57
-----END PGP SIGNATURE-----
