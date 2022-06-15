Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07FCC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jun 2022 14:13:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id dfe2e690;
	Wed, 15 Jun 2022 14:11:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ea1737b4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jun 2022 14:11:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 699C761BA9
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jun 2022 14:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96557C3411C
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jun 2022 14:11:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="W2gyBtJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655302298;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=2QLrf0Yk20os5Jj2d2C85AlhPPQDptUWHteWmNbVeiM=;
 b=W2gyBtJehbKHgq5weAaVuDDoIkWtm39E8y5Ae3612DSEdluejMDyK0FCn1PSRfw7VfQSJm
 573u6ZgOMwfrwf5Is+oo1L3xD2pVsSc/wN31wf6ntWWghleTCSbl5M+jLvsa6kv4Q9aOoo
 t5mmNGvVlBTCE/XaR/KYVT4osb4gK4k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f60d580
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jun 2022 14:11:38 +0000 (UTC)
Date: Wed, 15 Jun 2022 16:11:35 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20220615 is available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20220615141140.96557C3411C@smtp.kernel.org>
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

An experimental snapshot, v0.0.20220615, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * ci: add FreeBSD 12.3 and 13.1
  * compat: update version to handle sbcreatecontrol() changes
  
  More fixes to the compat layer.
  
  * wg_noise: import hmac from crypto
  * crypto: inline blake2s convenience function
  
  A few crypto cleanups.

This snapshot contains commits from: Jason A. Donenfeld, Joseph Mingrone, and 
Ed Maste.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20220615.tar.xz
  SHA2-256: ad6c42d20a7c0ad2989e729dd41ea5a6a019426b762dfd0c6417e340935cca82

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmKp6JIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgjTEAC5p4+osYbOTZG0uBlpAQ4ETTmlbJ8yV0av
fZ/P0rLJkL2iYifgynnvO6GyKcRBb9rXa37OKb8+Mt350UU6mgwCB9FaGvWYxEGM
cZYN+BVCN49DdFBtiLeCKnDe8ufeLahs87eSQDI1LDbiX9gYkuWR2cxHfN6b5wZX
r/M80gxbOBR7/pFWm5Hplfj3CRyJkb4i89/BSJ+5Zmbo+qGd2CoKIxHsUXLQeatq
0LhJuFxIrol1Hm/L4pA5k4MTa/UmOVrDkB04cR7eCFp7yxEVKE9aol6tO1uSdD7S
XEdNwsARQ2ehf7DoYdRV+1cl/rTnfaNo7Qp0fAu2+dmd7F0cwRtYCnP45Bcw1F0c
83fImSL4ck0MIFzo9brNK1sa15J+jsYsRsnlqLA0ObPBtOPf+ag/FSp1wfuAwHS6
ugcGNsaX+fOZ9yVf1dxpZHDOiw5TACW221TFb979jaCbHFncf1Ix2GTUeUrEImJa
vuS1uhZOWwJza+ZqdsY2SyNPOewvaaXO5owBPZiD2Qz56Tv7c2v1mdYsT21qldah
+cyffwJKi9if8eGLMH2ao9pfdjZ12Q93GR5nDACqRJtcB4lyMJbX5cMCESmHiCGX
A4C3NUyfiaBxi3Pr4eFWeXuAZLCKmj+/GCoaTdlc34a/LJYuA9GVdR/aIcclRn9e
a6zVVuSnPA==
=Ktyi
-----END PGP SIGNATURE-----
