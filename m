Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC1EC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 14:22:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c10ea49;
	Tue, 20 May 2025 23:22:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 474ecebf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 23:22:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 06035614B8
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 23:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C485C4CEE9
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 23:21:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="dkCkqUg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747783317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=jJTt0J77G8xE4lODgmNYOAQO4ubazvBrm3lXy2NT1X8=;
 b=dkCkqUg52YXZ0vBKu+wC1zoPee12M2jvl380Z6O0rUNFaD2Njdb9CKNmSKdPz4S/ZaUzje
 Q8e+9Rn69ZPAfDs2QnubpaTORsJwD5i2NE18ETUvnsfBIweodZOxpPCvFiqMgT42c+llCA
 vC0ciD0zmtL80yZROGaOGqDYn3+bgtM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 622cd0d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 23:21:57 +0000 (UTC)
Date: Wed, 21 May 2025 01:21:55 +0200
Message-ID: <5343c669ed36696c5dde065a1675a298@thinkpad.zx2c4.com>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20250521 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A new version, v1.0.20250521, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * ipc: use more clever PnP enumerator
  * embeddable-wg-library: add named wg_endpoint union
  * reresolve-dns: use $EPOCHSECONDS instead of $(date +%s)
  * wg-quick: android: use right regex for host-vs-IP
  * global: dual license core files as MIT for FreeBSD
  * wg-quick: linux: prevent traffic from momentarily leaking into tunnel
  * ipc: freebsd: move if_wg path to reflect new in-tree location
  * show: apply const to right part of pointer
  * ipc: freebsd: avoid leaking memory in kernel_get_device()
  * ipc: freebsd: NULL out some freed memory in kernel_set_device()
  * show: fix show all endpoints output
  * man: set private key in PreUp rather than PostUp
  * ipc: linux: enforce IFNAMSIZ limit
  * ipc: freebsd: use AF_LOCAL for the control socket
  * wg-quick: linux: add 'dev' to 'ip link add' to avoid keyword conflicts
  * config: handle strdup failure
  
  * wg-quick: run PreUp hook after creating interface
  
  This makes PreUp actually useful.
  
  * ipc: linux: support incremental allowed ips updates
  * ipc: add stub for allowedips flags on other platforms
  
  These two are neat and worth mentioning. Soon it will be possible to run:
  
    # wg set wg0 peer ... allowed-ips +1.2.3.4/32,-2.4.6.8/32
  
  in order to add and remove allowedips without first clearing all of them.
  

This release contains commits from: Jason A. Donenfeld, Kyle Evans, 
TriangleSnake, Tom Yan, Mikael Magnusson, Jordan Rife, Ilia Shipitsin, Dmitry 
Selivanov, and Daniel Gröber.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz
  SHA2-256: b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmgtDoIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqIuEACLc6L9YTFeIdMux9b4z2D7EiiX2+7+skp5
S0fEh07EelPTbPFPbLswvogyJrOK7SWXfLdeHgPSSxBFH95OZUhdnorM8XfOC5ST
VmMktVy9UZwxmrCVDd401rXRdZpkv4Dfob9iDU7McOcLoV+QnugEofljRuQbQExy
LB7e99hj06TP8eFBsQydfxv8OGSHu9H61ypVHCESZFFheFCfcJWjo8OzQu+CuhFl
fIklPiiAQL3ZQQA+v7r6wm93QuYwyQKfwNUC4F0quwwDMtWpgKs2hXRxMa93fZ3W
f2GlemJVWO5bj7VQKf6qZpILkCOLeIXPvAi8PIZX5QOvX2Yon88KiCw2caZqrm67
XWoqD75c1xZX78wHR0xniyAi5w12Hzpcnci7mBm7RBNBDN15ZQY01V5t4H6VulM2
uOUGspm/rcK1tCYDFV9DWAFon6881JJllXOe30n/dBsE0mNL2r4k5R5qCNxbWMmB
vp1qP6Thu3XO1vLo42A5EmJEbu04blCSVi3BKfby/21VTzCbrgufvv3JKAauTFEz
mmNwP1OW927/4C0aypkxUSkAv8aOwfrC+VWX5UAiFm9Zirc1nBgGFGjxZDQ+biV5
FT4zoEfqQQJ2pwZQq2leNKiFQE7pIcbvmY1O7LB1WXA92Ba4pGk7m1fP0Q8jLl7L
YBEORDlgig==
=de0O
-----END PGP SIGNATURE-----
