Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B257C2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 12:35:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFF6206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 12:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JiCzl9px"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFF6206CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 316e927e;
	Thu, 26 Dec 2019 12:35:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 871bfbac
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 12:35:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73d37cfd
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 12:35:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06426e99
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=GNebpEdci2uH5anNw
 /lcKy5V7Zk=; b=JiCzl9pxIyuXVfoE3oKzA2ufw0sTmZGyGTYRbw5lJlCUTHDwX
 winsmza5p9oOHF1aaeisRCtrDobzahkqFpoEtlqNlk/eKOPjkQZkoPRPAhQLD98p
 LDFNmkL1AW35J5ptsVVmEbWdlyOTipuJBWfAtMcW30zs8n9hjuEMZDAD+GBm1apH
 lh24BV4jjcml2XrlZna5rpSnSyqMSHCKL01VykBrZoGe3O67sDxv//oy/8xOU4+n
 2zOBdHvt/OnCZeMQjsRuO/3m5dYwP2R8+UWHwsjbEwjUe+eLRjVQ46e9TeJm5Vjk
 HUCPab2DthAh5EWkzBGlvaw5ggGLiqhfHzJUQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b72bb46e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 11:37:32 +0000 (UTC)
Date: Thu, 26 Dec 2019 13:35:06 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20191226 released 
MIME-Version: 1.0
Message-Id: <fa05a96d8708b837@frisell.zx2c4.com>
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

A new version, v1.0.20191226, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  This new wireguard-tools.git repository replaces the older WireGuard.git's
  src/tools subdirectory. Package managers should begin to migrate to this newer
  repository for distribution packages. There should be no functional changes
  from the previous 0.0.20191219 snapshot from WireGuard.git, but there may be
  build nits. Please send feedback as issues may be encountered. In the coming
  days, WireGuard.git's compat kernel module will also be split out to a new
  repository, and an announcement email will similarly be sent. We've tried to
  retain as much of the git history for the tools as possible. It's still
  slightly possible that the repository may be rebased a bit during this week
  and next, if we receive reports of missing history, but hopefully what's there
  now will form the basis.
  
  The versioning scheme for these will be major.minor.date -- so basically
  semver, but we encode the date as the last nibble, so that it's easier for
  humans to keep track of how old things are.



As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20191226.tar.xz
  SHA2-256: 74be7bb41d5b8a9ef253394f47d17784ea28cce7fabda0f66ab1e209c6acd108

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20191226.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4EqJ8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnS6EACAEjhi3RDGPavc2gGrrPQJtdJjXEQUjnNi
8G1J6WF8F+yzpRv398vHoXgaL5BMPehqgLNflShF5+oThKc4ThPA7iCKXorc+/ZR
XLE3ajurBbD2ekKKWzzqZZmppggxP0g7suCZTF62/ThgjFSAAwLHzKBfwaGGTIRr
gkvfZ56WWdadJHBBuMpEVCXMdns25jtbNW7TC74HAeJuv7TyDMDog9iYgfPCz70P
ePmK50vX+kg8gK17ypfAFFnjPPTyHb02+s17lH2FJQNFhLRObe7cirNcE3Ny7TZH
doEIv3OdTkNkReFOjDalbzzzqLn0rgZx2WDKOMEcM7ca2A0chh4onKDNHgEE9k8G
E3SmW86h4XAqu7J5eQ2Jpys2aIr2kzNbD1RJF0p1csWKb97zmAn6ZRuN78L6fuJG
YjSvQSZY73qbAVvIYbATtGGTu1tvM9MnGROsy/QzLD7m3HSh1N7XRGfP1KV+3oy6
dSPk2WYUExIYsWSVYLl9qCr2Z1/Ubqo0AW0SlvlaT7vLlSWw0+vjfRkKQVPfUhJ1
0y7p28qAphMNuXBS3twdJOpYYNOz2t33JThIl6J3KOBA7cwUQmBWnZNhe9pKRrvt
0Dwz6RxSEGH+wbG0kZSgrS4Rl9RgJgSFAjtwaG4rqgbmsDyu+gg7sqReg6BjgxtG
v4NZkl3Hfg==
=JrF5
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
