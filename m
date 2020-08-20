Return-Path: <SRS0=OdsF=B6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70247C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Aug 2020 10:13:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D968F20724
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Aug 2020 10:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nL42CIe0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D968F20724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b99911a;
	Thu, 20 Aug 2020 09:47:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f81f2cc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Aug 2020 09:47:04 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c23acffc
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Aug 2020 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=Vb0yZVRazDkkmXbGD
 GN7NIhG1N4=; b=nL42CIe0PuU3hmiMCZxOdXhAMozGztBhD/KZYAu7tvh1wr7Q6
 vsvngiizpDMahKkfFIMn16xX8p1UChx5gDNLbc2/gDpjafeSQVw/FwOjJv6nnYZ/
 fkVzks1BO1Vkno7mgE+Q2D/mfnYnZFUJhGpihwgKGz7+fUWudeIpuGxKiEvqemlh
 Cmn3k1wg5aLlKUevGlZTMdjX2oqnR5epf5PgIRpbGNQFsL/ib3KvLH+qTEcFOJ/i
 bj6h4MPCKC/gVK/54KGG1fNtD5lHAfp/7irZ7+VrIqzyhCWJCCrbjP0+9Q12fWVN
 /735tBroCrSYX+F2zloHiNda0ahUs6E6oJw4A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 267183b8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Aug 2020 09:47:03 +0000 (UTC)
Date: Thu, 20 Aug 2020 12:13:26 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200820 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <9df92b74b25ead68@mail.zx2c4.com>
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

A new version, v1.0.20200820, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * ipc: split into separate files per-platform
  
  This is in preparation for FreeBSD support, which I had hoped to have this
  release, but we're still waiting on some tooling fixes, so hopefully next
  wg(8) will support that. Either way, the code base is now a lot more amenable
  to adding more kernel platform support.
  
  * wincompat: fold random into genkey
  
  As part of moving to per-platform files, we can fold our get_random_bytes
  implementation in the same way that we handle the other ones.
  
  * systemd: add reload target to systemd unit
  
  Users can now run `systemctl reload wg-quick@wgnet0`, as described in the
  wg-quick(8) man page. Note that this won't adjust Address=, DNS=, or the
  various other non-wg(8) fields.
  
  * man: wg-quick: use syncconf instead of addconf for strip example
  
  Simple documentation fix.
  
  * pubkey: isblank is a subset of isspace
  * ctype: use non-locale-specific ctype.h
  
  In addition to ensuring that isalpha() and such isn't locale-specific, we also
  make these constant time, even though we're never distinguishing between bits
  of a secret using them. From that perspective, though, this is markedly better
  than the locale-specific table lookups in glibc, even though base64 characters
  span two cache lines and valid private keys must hit both. This may be useful
  for other projects too: https://git.zx2c4.com/wireguard-tools/tree/src/ctype.h
  
  * wg-quick: wait on process substitutions
  
  Bash does not propagate error values, which is a bummer, but process
  substitutions are a useful feature. Introduce a new idiom to deal with
  this: either "; wait $!" after the line to propagate the error, or "||
  true" to indicate explicitly that we don't care about the error. Discussions
  about this with upstream bash didn't lead anywhere:
  https://lists.gnu.org/archive/html/bug-bash/2020-08/msg00031.html
  So, we now work around this limitation manually.

This release contains commits from: Jason A. Donenfeld and Domonkos P. 
Tomcsanyi.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200820.tar.xz
  SHA2-256: 

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200820.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl8+TDQQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drk/EEADG4YnUkARZmR2qvh+5t3Iiqa9KVMXFOF3/
V+2IZa0IoCBsLqUIxAnuel5/KvMWL9IqycfuP/E+8vj8M0l1WGv3y0VCFPZ/6Hml
O7QWNZVG/71x4iUnz7tgBO08YW7BcASSiQ8KhZHaS+5D2sWofD8LBVofl/xJYVcc
rDpzupfqcD265o5l7MsXwIqakS32Apye6mwptIFMpSw/8xl5S0SGeAF4KYtiJA/B
oU6b9fAkpDcmYpWQ93hbpJboFM0z1yFK380uZZuNeeJLZ9wPod3ub3f8Ftl2ndKI
7yfSt4opKd1TOsqlPU6CR4ZXHWrV37G4Y9/4TbkesjsefKIrtZcB3ShkcU+0GuhZ
aD5PIGxRMuozsBCLiqudfY+28BdOh3MDmxp5UiHA32MZStDmYZl8z4lhxcr0+La8
yKa5n4iDyXQmjqr1IAtZdZBTD6du/rhYKroG4DMhXRkQP3RnFoMje9YgUVPhAoY2
uQUsg+KQa7LLjgNoaDtmzJgB41heLh4IHh+pzYjtfENljFaGEOkklSZlcqIvQwQh
9r9aVV9SYMR6MIx6jg0rXKKHO/XB4BK8JWuDn2v6xw9qg2B/g8iRZNBJF7jP98DP
Id3FaUDrWUXLHt7WEhPyocFtXSod+r1TzAX2Cr5Gl7L4BmQB3jJ1nqZFspSpZtlH
QP8bGmvomQ==
=fJ94
-----END PGP SIGNATURE-----
