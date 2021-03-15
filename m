Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFB8C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 14:19:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBADC64F19
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 14:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBADC64F19
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80260351;
	Mon, 15 Mar 2021 14:17:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0198a65a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615817819;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=aDXvw9ZO04T0CPq64pPF3jV+8x+RGSaZdXGUVOZjctY=;
 b=HHg7rxu8DqsEt8Fb3P2f7rpgM9r15kR+GXjTM2SZ5Y1UmTry8jNVc7EUUSd89DgfUzGozf
 CmaLIezI/yCdWI87HPoxh+b8yvpH69StJu1PR+aQfiATha9Ynxz6uSD4pqwQiQWE++Ah2o
 XR5Q/CysgxaLkBfD4kNfIjQmWewJaWw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2b64024
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 14:16:59 +0000 (UTC)
Date: Mon, 15 Mar 2021 08:16:55 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20210315 released 
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
Message-ID: <200fe853c7f21359@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20210315, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * Makefile: fix version indicator
  
  This lets releases be untar'd into existing git repos without accidentally
  picking up that repo's version number.
  
  * wireguard-tools: const correctness
  * wireguard-tools: drag in headers for prototypes
  
  Cleanups, thanks to verbose warnings on FreeBSD's clang.
  
  * ipc: uniformly ignore preshared keys that are zero
  
  Shouldn't have a practical effect, but fixes correctness on OpenBSD.
  
  * wg-quick: freebsd: add kernel support
  * ipc: freebsd: add initial FreeBSD support
  * wg-quick: freebsd: avoid writing private keys to /tmp
  
  We now support FreeBSD! I'll send an announcement soon with details, but Kyle,
  MattD, and I worked tirelessly to get FreeBSD's kernel implementation up to
  snuff and well supported:
  https://cgit.freebsd.org/src/commit/?id=74ae3f3e33b810248da19004c58b3581cd367843

This release contains commits from: Jason A. Donenfeld, Kyle Evans, and 
Florian Eckert.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210315.tar.xz
  SHA2-256: af001d5492be6bf58ef0bebe04b446b6f50eb53e1226fab679cc34af40733a22

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210315.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmBPbE0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DruifEADUwp1ZjLW4HBrdefitdFS15AsRtZCYcXWn
PyxaTf/tTjeZMbVgkLh0vSOp+xOxRU6MfdtIvUK7I8dCotmI6ddtS11UjyuSmLjZ
CQA4nmKQoQJ2HeohksCWZDzEFWYKeRsCmzOk39qYFVz2xeAS3YLpuTgRP6jpdgal
o1gDty4A1vNt3nAuRPYMJHx1kBC5+nhvACv25270tf5CLuBvi6+VVHkPsSEl9rOY
XSQtXZrhza/0l82dN8gxkx7D4XmF60NhN8kbaX7V/lVX3ogagP2jSIjkk1xSMbX/
qpPRLod/5IMweA3t2YtQvHnkhBCjSt4jGvFqQJv6bPDKHtNgxYvRYX+gbVF0qBlB
6PZLq1s9fazOD8kCWbY4MV0E+/JbYc6ee8ILI7f2wCVQhKcQiRSiVhYetbenVJzC
7vg1s9sU0i4YpZ/obtNIXuNhfqX0RCa5Q7r3CLpkOOGY7/I05evqakcNNjwtSb8E
W2E8eJ8+bz9Gr5ltqZ56+HA3qvo/tIuqfAYMdITrvEv/TkWMHcaP03qbYNoz4ECG
3zCtJXqXMHNR/mw5vqnKxL8RLoLsdeaR5iU1G2gy9HECzs8iElQijMAgzSJT2MYU
vO8la63vpWa5Fs9YFDQ9CrBPeHNpeDw2mkNYNalLreeMEZW19rGaQK2xser6Jle8
S/BJJp7nfw==
=08Wx
-----END PGP SIGNATURE-----
