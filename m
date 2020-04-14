Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8801BC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 09:19:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DE1206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 09:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="oVVvcCMg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DE1206E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6bda601;
	Tue, 14 Apr 2020 09:09:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e33f9c88
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 09:09:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e04b03b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=kOv13XVYOU7wSP/Qg
 g8CUbUDXhU=; b=oVVvcCMgE7snxXWCchiNIKIhEJ9D8WtNEKsZ7gHk2sdKbuCBP
 Zx+aiFkKaxi28LoGXoTObDO3UV8dHCFqk0OLQ6hPoQpFAz4gcGgTp/RRQ5SMOvt/
 tZ/lRAG1S+v9ygrdfz77D2Dw0e4rWlPqXHsU1Pqo329Ccmyfcga/YaGBmgM02aFR
 jLorp6HxqjS/7mkKAt4/ly+REQdg8FXTV27dtmRa84kRVwhlyfdgdhtCUDKDPr9Q
 ebrJzH3Cv9xPevZUq1T7Rqz4oYA8J2Oz14l0ZLCVeos5u/Sl/4C35dhkLbDOEEKJ
 HMe3kQqwYRvCDIeFWtX114eoRXFoPQRICjT4A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e05b9f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 09:09:32 +0000 (UTC)
Date: Tue, 14 Apr 2020 03:19:19 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200413 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <b9c8be5ee78f3f2f@mail.zx2c4.com>
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

A new version, v1.0.20200413, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: support latest suse 15.1 and 15.2
  * compat: support RHEL 7.8's faulty siphash backport
  * compat: error out if bc is missing
  * compat: backport hsiphash_1u32 for tests
  
  We now have improved support for RHEL 7.8, SUSE 15.[12], and Ubuntu 16.04.
  
  * git: add gitattributes so tarball doesn't have gitignore files
  
  Distros won't need to clean this up manually now.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200413.tar.xz
  SHA2-256: 

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200413.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6VgAEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrmRXD/991+PYGqInXaED97SA2uD1yTjnACLipTwf
LSo3UoBW3PMwrKC8hGOZ8r/wuoC4dISiQGzD4fIzUVV+ASJ6VNvoVqkYN/Dx093i
KGwjbdV1f3mPXZZCa6VeltFwjqMsm64N/4172SGIEJ+v9NMi10NutMD5nU2T0oE1
XRoh/TCDW+04bTKZ6AFT8RQjR78XAhqmRJ0L8nMOGQisRuHmOlkgA/Y81IsONvLb
8Zcfhrs4E39Nj8lOLjrDgXI+7P4VbnzsKlr7K7YZQnOtkY7m6+43lYYv+2uXgju9
5UcL2kjZNgBQhB8KO/yJvoQ9LooJxoYazJjHHeViCjYxZwQ4hytkkdvN0uHsBaYa
RVfRRLQ1e524lVBGBtvwx7lmG2oBazuludTYriq+zqUcBoU7lnO60W8OKaCTsEXc
EGJ8PkTguFKfT0phgDko7mQ7a+nMWc3PzQqX7TEpx5e+ircjzixaPkLWydd67uxB
F5FS+DxI1WdLT0pO4LbSTsPay3t6Tp33yo/GwsZG2L3IHS2SHgKtZxbG1puoXM9q
P7krSoXKDUgkW5NasVbfwUvXVHxlultLJ9hkvSuPLq99RoVr4BuG7GCz+FzVHH39
hy/jXAc/gJsw7G5cVFZX2Dqk81g3vzc+2AO+KV0PSWxCx/vKyfMyULV52D+SFfz2
043kPGz6mg==
=AYdA
-----END PGP SIGNATURE-----
