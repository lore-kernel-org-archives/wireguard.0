Return-Path: <SRS0=Fz9z=32=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903E8C33CAC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Feb 2020 15:28:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA940222C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Feb 2020 15:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wR1uud44"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA940222C2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 819d5ba9;
	Thu, 6 Feb 2020 15:27:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 221753d0
 for <wireguard@lists.zx2c4.com>; Thu, 6 Feb 2020 15:27:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6242e0b1
 for <wireguard@lists.zx2c4.com>; Thu, 6 Feb 2020 15:27:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c707c65
 for <wireguard@lists.zx2c4.com>; Thu, 6 Feb 2020 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=1HVvynAi4M6HKELZW
 47IRPUY54o=; b=wR1uud44kYpT7Cog9WpDz8tAriVeb8jQh36YgwnBKUAgQ7VvE
 a8PShhqSQIy4YIRKaTz874fsF0j7h7vvKwxzOLyjH6dcgFAD6hNlvmFjvF3n/p7G
 E3yBKXfevEK2c7NtChBbm5XivGN+9owZR1XJH7ubu5q7AgzVcig5g8BqYMoufDfw
 eEDJIGR+9qUWBGKinoACFLX56j3nr7baTtusisOeTpR3aWLO1QdWPOkTQz7rufEi
 gxAGPEqBSpxZoJ/pToaJZZkbv+RGdZ6sf+oV8ID1Q/KIk3I9dgEZ7FnxRddHbNPU
 2wjJEeMc66dGx0b5KTCdadqq067K+rSs1K52Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3c1c642
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Feb 2020 15:27:20 +0000 (UTC)
Date: Thu, 06 Feb 2020 16:28:23 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200206 released 
MIME-Version: 1.0
Message-Id: <ff1ae5ba8b5af10e@frisell.zx2c4.com>
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

A new version, v1.0.20200206, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * wg-quick: android: split uids into multiple commands
  
  Newer android's ndc implementations have limits on uid size, so we have to
  break these into several lists.
  
  * man: document dynamic debug trick for Linux
  
  This comes up occasionally, so it may be useful to mention its
  possibility in the man page. At least the Arch Linux and Ubuntu kernels
  support dynamic debugging, so this advice will at least help somebody. So that
  you don't have to go digging into the commit, this adds this helpful tidbit
  to the man page for getting debug logs on Linux:
  
  # modprobe wireguard && echo module wireguard +p > /sys/kernel/debug/dynamic_debug/control
  
  * extract-{handshakes,keys}: rework for upstream kernel
  
  These tools will now use the source code from the running kernel instead of
  from the old monolithic repo. Essential for the functioning of Wireshark.
  
  === PACKAGE MANAGERS TAKE NOTE: ===
  
  * netlink: remove libmnl requirement
  
  We no longer require libmnl. It turns out that inlining the small subset of
  libmnl that we actually use results in a smaller binary than the overhead of
  linking to the external library. And we intend to gradually morph this code
  into something domain specific as a libwg emerges. Performance has also
  increased, thanks to the inliner. On all platforms, wg(8) only needs a normal
  libc. Compile time on my system is still less than one second. So all in all
  we have: smaller binary, zero dependencies, faster performance.
  
  Packagers should no longer have their wireguard-tools package depend on
  libmnl.
  
  * embeddable-wg-library: use newer string_list
  * netlink: don't pretend that sysconf isn't a function
  
  Small cleanups.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200206.tar.xz
  SHA2-256: f5207248c6a3c3e3bfc9ab30b91c1897b00802ed861e1f9faaed873366078c64

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200206.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl48MJIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqMtEACnNoFoNKENZ5HnFqZBut1RrFFVsGEmHvgQ
pzAo6WCEYNlMuNsNguXH4kuhbYuVnfja7/TWLvPG3y5AeLY3yK9HJLKRbAj90kBc
/6vDv7WmNedIAtEPKFCBg+nRj/+GRhQHe17/9jWPWsFQhSZJYTEyl+JHYxPkjrPM
xrR8ZExxOzZldPhuWRNHh66g/RkaMVfDaiofKaUfX2M6z8ILe3Chl5n0hVD/qOVA
m8BXo499oVG9Nf6lQkL+rRjAONndwdYfJsPwm3w/2uRI7n8qr4rZjCiUwxqNRFeW
81IDHxjLUVTYQm1afbwXedwf64YR/wOKEzlHxVn9rzuvozoy6as4sSagFVngvGxL
TUdspHn4MVxExoMZExW8BFrh5E7+4gOToEGdIUWkfyAKr6QD5NK7pRxjtUxJJicZ
7aQRawnmSloa4xZL1k9XBph2tT/W3dpXt80LuAYQrezk59kk9+g8mJ3rlWeAJnyG
7vM9W7Apuc7qdC4FlW/whZsdENFhXYe2/vkpgbL4DyfLRvHOvR3g+4kN2X6di5KH
lO64v15DiTIy5kkE+CAG+1DvLCYVLrmmnxMnlEwUzRtBo81FCBs1fqwVqAc97UT7
Ix/LCXOfBaXSVFjn1I9idqYX/Vh0b3+O8dHvIEqih7665Z9v4LrEbUbIh6sbUImt
Z/5IjQarig==
=VTp0
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
