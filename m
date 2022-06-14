Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFC8C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 09:21:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 90359458;
	Tue, 14 Jun 2022 09:21:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 485c9656
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 09:21:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E31661661
 for <wireguard@lists.zx2c4.com>; Tue, 14 Jun 2022 09:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14834C341C4
 for <wireguard@lists.zx2c4.com>; Tue, 14 Jun 2022 09:21:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LMJNPfd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655198481;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=2LepwrTu2xAo7G1q6DAigynQGbKqyh85tAFuoDOe+vs=;
 b=LMJNPfd41dcPSfd16yPyW3N0uIsrYnzbzB3B7tk1iOYg1C4iDp/BggpRhYeAfBovAVg4be
 SxMyYLnupvaqiahjKbdR3Xofmdnn8vB5yjJYbUj2U07UgNU76VMMgdoVmf+oDAzO3xgWLq
 QgwV9bLauJvKJaK2Y/DorOqIAWP1cc0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8ecc0b0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 09:21:21 +0000 (UTC)
Date: Tue, 14 Jun 2022 11:21:19 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20220614 is available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20220614092123.14834C341C4@smtp.kernel.org>
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

Hi,

An experimental snapshot, v0.0.20220614, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * build: include compat.h for all files
  * compat: fix version stamp
  
  Two lingering compat issues.
  
  * if_wg: wg_peer_alloc and wg_aip_add: Use M_WAITOK with malloc
  
  A small cleanup to memory allocation and error path logic.
  
  * crypto: use OCF to encrypt/decrypt packets when supported
  * crypto: use <crypto/chacha20_poly1305.h> when present
  * crypto: use curve25519 API from the kernel when available
  * crypto: harmonize with compat and clean up
  
  Crypto from OCF and FreeBSD's library code will now be used when available.

This snapshot contains commits from: John Baldwin and Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20220614.tar.xz
  SHA2-256: b048049561f18fd48ab3fa6455f9e0ecca25c6314880f48e68c56ceacf7f6719

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmKoUwMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtWQD/9SrtU+zAXlB50zLYO1LhNexPLlgWMcAZsM
qwJaIzxMdsXPCCfqLOfqxUXOAjPf7EWxFE8cj1iV6hLduzl0wnu84OZIxr7yvSFT
qhk6aZxcgiUTpxIHa4WdJkxiqMNRafv6le33F233VWNBbJCn8f9JjxON8Fph0W/N
DZ0X+fGwPJ25bnCWc//Cl7WhQulT7BxNi2jrsgpuJNmCGOeSRyfTh9ygDRX5WLD6
mZiIfqTs4+l9gVjeUcC7b49qbZeRtpsmePfaXp5fN2U6s5cyk76SbarCHD62aFlP
OM4xdl07J+YhsXdfj98whE1RVTS8jFvz3iADKW0MuwDEeEcDCh4vpspiNerYDIvQ
J+aFT8+zexmv9IdNQxYK3u9W1G6COz0wspBWixZGfeqfNZyPpXVOqgdKarsdFLnz
wYFFz8FPdMlB8A8J+aehNqqsrH6rXbE4J2poz3upxrntKMxG+u0YB5pDoxY0JkAQ
uvT3Ij/7CdsXYHnbKwFtiv9dmSzgSpFNOzSbffBWYb24i1UCCAbJqe5Eae9b7MIh
6PuaBp3YzlR3NHsXcliss2SbEMf1nf2WStTtKHDKW5hAyRdg4dqDMZxvPc8OU6vC
BF1gVIEYC9wRLaNfxU/mW5ugdiN0b3u6uT9ELrN/mV56z45xPKmedpDNXKHqz3b2
JF9KsyRjDg==
=xgbb
-----END PGP SIGNATURE-----
