Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90ACC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 13:39:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 375302168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 13:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vidx6DxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 375302168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c35377f;
	Fri, 14 Feb 2020 13:36:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bc90031
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 13:36:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15f13e82
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 13:36:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f111b47
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=h7hmO0v0ik4xnYZr1
 Sif3RJtoAU=; b=Vidx6DxVmSb28jgUlWoCu7EpBEpkSOJpi7ARfhN7x0SR3SmKB
 8yfxI1pBvDchxXYsl6WT5fVAIYHgqhCnR8Vt4sy0YXM5qnL0xNLpUGn7JFR6W0gU
 Oi7XEWtrrPy0KerA/bCvVlw09IWSCn2w82RH4Sg/eDN7v6LGpf1CO8qy3FsFFsep
 HIsJdQGmKUN5Tv79MU9uoeryA/+PqiykxR75UAPIgDlGV7ILyXmmYCpSPmkAw7+M
 gpbTyfLx3RVIqGmOV5wt2EhzBkesUM+fKukF5qHCMphUEHvVduhD2nDOZUUiKPCM
 OHwMbDeUN9PtnyalM9z8IlamGdpjLeycB/IAg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54ca1ac7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 13:36:42 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:38:48 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200214 released
MIME-Version: 1.0
Message-Id: <ff1bc7a55ddd0da2@frisell.zx2c4.com>
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

A new version, v0.0.20200214, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  * chacha20poly1305: defensively protect against large inputs
  
  Defense-in-depth sort of check.
  
  * netns: ensure that icmp src address is correct with nat
  
  We finally upstreamed the last remaining compat.h hack in this patch series:
  https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=803381f9f117493d6204d82445a530c834040fe6
  That means we can port compat.h to use the new proper API.
  
  * receive: reset last_under_load to zero
  
  Matt found a small optimization while porting the Linux kernel module to
  OpenBSD's kernel.
  
  * send: account for mtu=0 devices
  
  This fixes issues related to setting the MTU of a device to zero.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200214.tar.xz
  SHA2-256: 6aaed62beb23803a456b7875a56e9462125a589c9dfb6d0b672c1a8f9f3f45ab

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200214.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl5GouAQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrjcREADZ62q40fW86qwDY2c3WglegysWlytKNuy2
fzyg07ZbJpoN4mUWzVxwv96ewkU4q34iwJ/EM5/LGqV+uP4rsLWO8HeaT/TdTsfi
OPSwnx5B89Hc8N+RejDB++eCtVU1nr6BEPIyK/Gi8Ng4biZWea5U7Q85/gAYOLVE
W5HN51XobxRa0W0Y7DYGpMONXXWRXh1YICtROUo51Z/l1SsR9/B8K/uKoXuqGJR7
GKVrjkdSQDJTQIIepkn123xL/2s4QncfSqpDkbxnQKAn1rh3ZlfFDUDsjfJVLFnP
4A+pfF2Z82vURZNgtV70Ur1w0niuIHUC7NMbQJEHaaapMa7CQZ1pkOJR549KGG1r
6PQ28USZf6ZLxY0dkHesuTzkbYlSxM1+Sodi3lqyEmJy/laavVzR62EP/k7d/i9g
UJkDS5yRs8yg4KXLtqUqYJEy62ZTS0CbmbSMFPgPlXYXtymzXec1f4QHE/h2n9Kt
MDH7O4vSxYnKAjj4tHpabIfK8f0Brl7Ha1WOJbYhG7sA9bgylGuMh5ruv8U/SHlY
V4v0/fM4PQxmHJxyzKaQ1BDj14a/zy4LcBogUtGqKJ0X2DQ/HBap154lPM0q5TT8
Ov026Uts4dqIm4lMk2qiC06WaAYhXFHsiunpmBtpOd+dzwHmDc6bMYCdkFRFFZt9
gkjz6SzcOQ==
=leGA
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
