Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD360C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Dec 2021 15:20:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1d77a13d;
	Wed, 8 Dec 2021 15:20:46 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7c2d8cdd
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Dec 2021 15:20:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51ECBB8169E
 for <wireguard@lists.zx2c4.com>; Wed,  8 Dec 2021 15:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CF5C00446
 for <wireguard@lists.zx2c4.com>; Wed,  8 Dec 2021 15:20:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AXbEvscb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638976842;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=W9BIO3IaCfgbNlm0ryfBWPxc9ymuz/8bh6Je4wtF6yk=;
 b=AXbEvscbWuuwSNTVzbwc/snPJgykhCQ1VAe14lGK35zSdVDg5FBqSIm0GU43aUEHuS6u+0
 +tRtOy2iTFXzL9eb+qO0VAAoHNT0tHKWaEMwjgLnrepaoxYU8kc/w1p77Mg/KmAGSbZ5vu
 kI9ri06/vSFbZVslMReOA+Ku/enqeFQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 064d91cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Dec 2021 15:20:41 +0000 (UTC)
Date: Wed, 08 Dec 2021 16:20:37 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20211208 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20211208152043.C5CF5C00446@smtp.kernel.org>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20211208, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: account for latest c8s backports
  * compat: update for RHEL 8.5
  
  We now support RHEL 8.5 and C8S.
  
  * compat: account for grsecurity backports and changes
  * crypto: curve25519-x86_64: solve register constraints with reserved registers
  
  Better compatibility with recent grsecurity kernels.
  
  * netns: actually test for routing loops
  * main: rename 'mod_init' & 'mod_exit' functions to be module-specific
  * device: reset peer src endpoint when netns exits
  * receive: use ring buffer for incoming handshakes
  * receive: drop handshakes if queue lock is contended
  * ratelimiter: use kvcalloc() instead of kvzalloc()
  * compat: siphash: use _unaligned version by default
  
  Upstream commits from this merge:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cbd92e7d74314e10a90d12a8f18f6fc66be4fb16
  
  * compat: udp_tunnel: don't take reference to non-init namespace
  
  This is an old bug unearthed by the routing loop test case added in this
  cycle. It turns out that for kernels ≤3.16, interfaces weren't being deleted
  when namespaces exited, due to improper namespace handling for kernel sockets
  in the udp_tunnel backport.

This release contains commits from: Jason A. Donenfeld, Mathias Krause, Randy 
Dunlap, Peter Georg, Gustavo A. R. Silva, and Arnd Bergmann.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20211208.tar.xz
  SHA2-256: c0e607138a17daac656f508d8e63ea3737b5221fa5d9288191ddeb099f5a3b92

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20211208.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmGwzR0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrswXEACxL+6G+4gsFiUUlc/Z60QDYWXFVGJdlTIN
MTgypGU08JNyb1QlaKsc94R1aoV99rKyxS7luHvXr9d6EMF7O0j3SIFqUMD3c4fV
s2IZETCxe85qBdT6xSNhlf5QcuC+aBRXyruZ6WBUk5PvGUWn2/54ERV8UQxydRRu
PZNIvZpRpiHDqHBrCo+PaFsrxbhh3Kw2uDE/CntYILo2pJHhAwvSFpjxX+IzCcKO
/FFOQl99gWQT4ijEDscNz6KjQMLIM0mZ5vFjpjhfGIYLc1iXgVYdzCHKxqKmfUCP
ttYPbnrlnQrwwT63qCqJA7fncYGxVxFiZICdOnA4myr1w+0oCvR2h/FwRdtsEhYP
pwUJJeKugfZkqtNTy8lm5FfA/tfk06wn6WwUuyfXQHMJ9EMR/Uf44v9+qlOzg1cq
RcbXYpwTZ92zUMDCRX4sNvbaBwW01V/BiLtjijYh/UyNI0vvephk4e/+45bB71jd
6dfEREIiHzxNO6HZ16ZTAAj3pRn2YWpp5xYC+mqKIhkwML1g+3u7lP+f66Gql0rG
iX/ln3qqUNijJ3cUwpjgq3stejL6mCd87SvIo8G5j80wRbT1vDXQwpYQO+KxIRZP
NEi1HjWKVdg7zwBjAR0REwfIeqNFalQlfdxDPE2kmjSLFxHf0pvQUIpXgn+x+6TE
WzWDF0eboA==
=vx+c
-----END PGP SIGNATURE-----
