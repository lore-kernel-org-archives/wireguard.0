Return-Path: <SRS0=tD3D=XI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF85FC49ED7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 22:09:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21BB22084F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 22:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ugD11xe8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21BB22084F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92cba0fa;
	Fri, 13 Sep 2019 22:08:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d15c68ec
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Sep 2019 22:08:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c9d23cf
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Sep 2019 22:08:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a17698b6
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Sep 2019 21:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=Y6RL9j4dy1D2uqSPq
 QvqAAZxvIM=; b=ugD11xe8VpdNiWIUXKZh3y1mHuZohwnxn/JerpOoQK/mpLRMy
 yr8kUxDPweLWM4en4tr2jVb5+qzWZfaqxIQcxocRePXmaGfEdfsxnye/ge5N54TP
 TDwTRFCEj4WMu5YvPw4u9eI6mZ+mHhYcAJOAaUdBi0dYL2XfoSJuzUdIJ2w5pnmb
 +ayEUPelrQIb5iFdAurGYbsCLRlBiruL0v+k04otDyPrJmE8JBVDxG9ftK1exr33
 wfxYnTo4wo3FjUgMobwHzZh0opnx9yuzzNxwaGiDkwG9Hm9LR5Liek9tINJl9l+T
 MLLY4jvM5DuFh3SI5lc45djHq5d+POKfBbZGA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eb9657ce
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Sep 2019 21:24:35 +0000 (UTC)
Date: Fri, 13 Sep 2019 18:08:49 -0400
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190913` Available
MIME-Version: 1.0
Message-Id: <fa40c5684582cf42@frisell.zx2c4.com>
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

A new snapshot, `0.0.20190913`, has been tagged in the git repository.

Please note that this snapshot is a snapshot rather than a final
release that is considered secure and bug-free. WireGuard is generally
thought to be fairly stable, and most likely will not crash your
computer (though it may).  However, as this is a snapshot, it comes
with no guarantees; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * compat: support newer PaX
  * compat: don't rewrite siphash when it's from compat
  * Kbuild: squelch warnings for stack limit on broken kernel configs
  * compat: support rhel/centos 7.7
  
  These are all compatibility-related fixes, addressing some fallout from the
  last snapshot. This also brings support for RHEL 7.7.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190913.tar.xz
  SHA2-256: 997327185d2d1b597dc118f737c0c165e2a2c21453387ea02659f1159d148518
  BLAKE2b-256: 73aa107bcc2b57f9470d2593c4e3a5e1bc9d3f73d333dd8e1c95a25f6f4d12e9

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190913.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl18E20QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drtm5D/wIbd6aG+JCdooXqtd7NXl/4Eh8feZqKImJ
+QP2YbjPUGAECVXzUyxfWxX0G9I8zd2IIyGGnoQj6GmT0sI6of98O/fl51DifpG3
2vtOga7vAEzLGBSsZ4WZIwQQeY4t9hme9iRPLTS1M4nwgGHysGyi8YK4h2T3qLB4
8etzQmCqUS8pAdRwGEfh0jHX8qnkIWo2SXduTPI/Q97A2SPOXTXClluYIiowZ1O7
1sdiW3Ak/kMnhAYV4b4Oit4KgYsFV0TNEOc+Am0x4VqlHODWjFJhq9Um61giwX/I
OnSXvVCJV3W8UJoe3llTfXkQR7H1wZB/V1Qx71GIMMJxAOcRbLLTUggdak6+hN5M
DCiE/+AJ4LYPQy0iukXwV0mwWPzN3w3U+6CpcQN61VwCMXzWrDMLV5uMaeMFl/BE
HvGxu30OP7Zl2KZlXrIl5oZ4i0C8jpgEFa8TNwS4PePIsWXdqV7IG+3JJ1DRYOZy
1ySWHy63mzbjqakcffr0kGJFykzd3htGFibWKLs2mSPZdlHXGS85WHvC+tQLWBfp
xC0zAgZoHZF2stPvaefsdlAE1LeEahV/sOIUv0dgoJAFQp9qEf3sLWLWcpmL3H0x
X4cI/6mR68W1VdiZHZ9Uf7dtjipylM+7MBBJayoDIAHCqHtuPfCSyhO/2Qd0rtVo
fl1LQHcyvw==
=OGmg
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
