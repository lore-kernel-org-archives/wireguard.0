Return-Path: <SRS0=pslF=UA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3737C28CC1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Jun 2019 11:36:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD5F270D7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Jun 2019 11:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nT07P1i0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD5F270D7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 681e66d0;
	Sat, 1 Jun 2019 11:36:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4833fa31
 for <wireguard@lists.zx2c4.com>; Sat, 1 Jun 2019 11:36:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccff5100
 for <wireguard@lists.zx2c4.com>; Sat, 1 Jun 2019 11:36:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91892f85
 for <wireguard@lists.zx2c4.com>; Sat, 1 Jun 2019 11:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=CYpLANxBqeR8VGOZn
 VPIiwiU3Kk=; b=nT07P1i0YFD+Cw/nj/vEzIW+TPG2iOBhD4pfvgMan2x7IyTSu
 u68unvmBPQQ8+8kJdNJTat9SRjoVJeHLLbJVxq3fDWmOcUSWWuXSa3UBPUWwKwqt
 K3tBZiLTNkLbZhd5SEcAKBL7OmWzx95Rt36VGo2cMf/nfwSKA2Nino6jRnNc0LOW
 CqyeWb/zmfbyyeJoAwSnh0V6/Bw3/fxL8SEILoEtPzk7Nv4dSeJeU7fo2/6v9AyP
 fLfXNmxQ6YSL8iyHR5yCGykkTFfAGagnJwjpMG2GTU/XCTrN5jSGpSmkcWnNfMLE
 e6FekTj+7H7faKXwyhfHaNOhiERvSmpulJhbw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e2c4fe22
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 1 Jun 2019 11:05:50 +0000 (UTC)
Date: Sat, 01 Jun 2019 13:36:39 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190601` Available
MIME-Version: 1.0
Message-Id: <85ebbb5e0c1dc1e4@frisell.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20190601`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not constitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * compat: don't call xgetbv on cpus with no XSAVE
  
  There was an issue with the backport compat layer in yesterday's snapshot,
  causing issues on certain (mostly Atom) Intel chips on kernels older than
  4.2, due to the use of xgetbv without checking cpu flags for xsave support.
  This manifested itself simply at module load time. Indeed it's somewhat tricky
  to support 33 different kernel versions (3.10+), plus weird distro
  frankenkernels.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190601.tar.xz
  SHA2-256: 7528461824a0174bd7d4f15e68d8f0ce9a8ea318411502b80759438e8ef65568
  BLAKE2b-256: 24819b8077fb3da083f549eab23be4e1fa32584810c4a2050dafaac9e0b8fbf7

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190601.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlzyYzoQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DruUAEADKX34C+K/6lIG35zdf1E+ujIlmOuzTdftq
tN0j6SmeodbSN1Krr2nmRH5He8PBjhhaVLIw7HdH8P+wYeoXiqARIfGGI39xno9n
HQyfiMc9KQlAZ8ezm8BmSWKkGMZvD7oTOlMWvY+vpBzu0UOFlJIzbQ36iMZ2sdnv
gP9wK+pGYKhWuUvBFvtEHejH2UyRFE879b6WXHhWUZxqjUuNE/xISdyw+sJdK5P1
sGBc9M85UB90ewk2/w968ZAd8EX6NCrtbtPpJxS4UwSl88RxHLZWTLZPPcR7nhTn
/CzNBHATJvWoWXBGSW2STG3PqYQ1X/O5ZaansRL6PzM5FMwU15H+n16LQYCcJgYc
6rXoWvw37cIrS5SbFcJqhVAG+ElbtVfNksfgXHrgvPSd+ENgqfm6q6479W+eME/t
pGDY9l1Fuzn8KsfP1rEH8lhiwI8a96PWraDl0ANpz1A5wLXpKfIBp1ST1xbUiKMg
4gTmNCr9M1tf/N4YjQmXao/+whpe1NCPhelb0PHthUsi/3chq7E0yyGTWsY57wz/
A53/k6BNxgC9WTthbC2DOGRZhLeevnule5HmV7O2IUNFcwlycCKEhitJGbjNTClg
c0uOcNvByqwEz0QwulsBskfqkaJOsGZfDzD/bBbLlotawJUwsunnoM0Wsvugn6ST
4SUjd0PlKw==
=jWln
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
