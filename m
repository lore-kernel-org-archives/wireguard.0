Return-Path: <SRS0=WErI=2X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE17C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 18:57:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC04F21655
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 18:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="p45r/Sv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC04F21655
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3df33e05;
	Thu, 2 Jan 2020 18:57:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6534ac70
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 18:57:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c601f96
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 18:57:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d374ee5d
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=UIqkIqqhmn/4NCVGA
 tpaAvOmnuI=; b=p45r/Sv42W5CIE0GzDEEbaXBPA74VZkOqtxs6H/Yj/J0Gxk3I
 Kilg6hMXS3fg7J1kp3juPf0B/lY6raaSbA3Rku7+7HyIfL5LqB5q6kxlcWW4FXTV
 oxk5ZD9Aophj68zfdn4WRCs78SAO9zSADUG+LBqZjT0Vdfx+HFgnK061uMhi7K62
 9ZbeNHoLMMa/4HkicN3BsPX+NNvGE872zX1zdqf8br7LE0Di3BuM72ohqrr48EO4
 4MbpYZJEPEjiquoU6ly1ymOcYJGxslmADoqdpS+Bi1XvOCCYpFOM50fX09g6g/vt
 SeHcmoryZ7LHYz2Xsov8q5q7e030/Wxyo4rsw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id afbcf7be
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 17:59:13 +0000 (UTC)
Date: Thu, 02 Jan 2020 19:57:43 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200102 released 
MIME-Version: 1.0
Message-Id: <fa069be92ea93878@frisell.zx2c4.com>
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

A new version, v1.0.20200102, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * systemd: update documentation URL
  * global: bump copyright
  
  Usual house keeping.
  
  * Makefile: DEBUG_TOOLS -> DEBUG and document
  * Makefile: port static analysis check
  * dns-hatchet: adjust path for new repo layout
  * Makefile: rework automatic version.h mangling
  
  These are some important-ish cleanups for downstream package maintainers that
  should make packaging this a lot smoother.
  
  * man: add documentation about removing explicit listen-port
  
  Documentation improvement.
  
  * wg-quick: linux: quote ifname for nft
  
  This should fix issues with weirdly named ifnames and odd versions of nft(8).
  
  * fuzz: find bugs in the config syntax parser
  * fuzz: find bugs when parsing uapi input
  
  These are two fuzzers that have been laying around without a repo for a while.
  Perhaps somebody with enough compute power will find bugs with them.

This release contains commits from: Jason A. Donenfeld and Devin Smith.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200102.tar.xz
  SHA2-256: 547cd1c2f8dca904faac9e8d3964f1ef956c24bb12e3498da88dde95243c7f08

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200102.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4OPQsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DriThD/wN35VDlD2OBYZkPSnyEBLiB8kPoxC0qheY
5ghP3EGyvG1bpKnYVbZG7oRNl1YG8+xU8hDYPBBiGzIoOTmDyOng6zt65jhEaTIP
nEc4rOyWLybVRiLaJzix9eARwVLX6HhcjupDbvkQtqpudmsveYWIB4U1ebZFXPo7
4YvkmFyl86DlwZhYzN6yHDkAVqQBytjUncTlas7q/t9c06b8xBEUJKPzDFxCZVh6
0S/+WpJiFgKLoUiKsuqNSGwZFKiQUOcs0z3UkXJ03HWj5Vwu87I+im/wkZwt3ZLn
w4tB32K0QWVxbbi4z7lNpzcXgOoGIcPmSdfHvpWWWPnLnu2F0zu05vzW6+JCiO64
Zs5IWVpZ2z6tgcdofIv/5Xap4LfcXjgUDdzlO97e/ql8jXHnE9furkLNAepa5rGL
2V9CummqDrF5G24KK/qEqWJZYR4dB4r8Pprd4GrrZNLtlcN7V2Q2Po1wgmEjpgEn
VarQ5uf5S4YP/B8iaNc8RzOtyngWZ2l7xTuEUuwXDDoRlzbadgmQz1L5Mr73Yx3r
J3M9HRvNRE7LZwrB6xknl1q3/j698UFvcjRHFIHsd/GSlKScIf47p2fwIEs2cPUs
DVRCJ00qCija25L7iIM+UqXyUQ2mcR4rVpIyyH8T/8CJo9psi66btDCOLx1oOnTQ
Y3UOSl2BpA==
=s6nE
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
