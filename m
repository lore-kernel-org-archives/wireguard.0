Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B95C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 09:13:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E8C21534
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 09:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="th+3p1kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E8C21534
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 696485b5;
	Thu, 12 Nov 2020 09:09:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5085a9e7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 09:09:16 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3422b736
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=2Gt+a5EIB/CE6S/NC
 SrNsU5fcfY=; b=th+3p1kC8R444574HFbrmWwVuI9+8jjHbQuTLAsSLlATpuolk
 9OyMr704TLpniikN6b/PtFfhaVDW0KVO4u+PX+wFCy+k1XXZvgq4Oudba90LI/BJ
 5lpkXAVnKqb/k3djTiazwA9lgGwUPrcZc37PIswUKIQYcEjIXpQsQlrgYejd5SKn
 8b1fhPJnYCoEEKx7ggMNppgLljKoPAF98xuOofwEpTGGC6K7+WovVpttmnzM6UtS
 nqxHDq+AOqQBsK+5uXliCy/Y8SVuqRrXCCQegwerLQp9sA4IvP+uXzlwRs4cpLRs
 qyq+IHvtalZf2HO4kEKFyWMAi6GDqjuXk3Mgw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 62d86566
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 09:10:02 +0000 (UTC)
Date: Thu, 12 Nov 2020 10:13:10 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20201112 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <5cc6d7f6ac153bb5@mail.zx2c4.com>
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

A new version, v1.0.20201112, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * noise: take lock when removing handshake entry from table
  
  This is a defense in depth patch backported from upstream to account for any
  future issues with list node lifecycles.
  
  * netns: check that route_me_harder packets use the right sk
  
  A test for an issue that goes back to before Linux's git history began. I've
  fixed this upstream, but it doesn't look possible to put it into the compat
  layer, as it's a core networking problem. But we still test for it in the
  netns test and warn on broken kernels.
  
  * qemu: drop build support for rhel 8.2
  
  We now test 8.3+.
  
  * compat: SYM_FUNC_{START,END} were backported to 5.4
  * qemu: bump default testing version
  
  The real motivation for this version bump: 5.4.76 made a change that broke our
  compat layer.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20201112.tar.xz
  SHA2-256: 89eae7f0c0bd6c8df3ba2e090984974ff68741a9f26aa0922890f8ca727897e1

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20201112.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl+s/JQQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drn+KD/9H3URt3XC5zTdGmOs1UhN2L2TnzvfL86uj
E3w3D55Jw2r021ka7EcnkXzIV9nTML0+k8Bkqq7NT/57WSY0qQ1ODdK/RfvU9dIs
0YFuTqWJA6FRqleoPcBiw4EF0pd8bRvgYLdOj1yAJch8U748dD9ct1sWGAEvYbYm
FTX/X8U0XkwTo/jjGz4J9qseDlJrUNJz44EDXJDUcSx7yHlfGWLbxVodbdZNuNy2
9xtobWy+n1jtWdISyRwKeLSD2sJP16dzLFRlu7QcobSk33T/F7OENfBIl4GANKVX
N+UW5M8YnGjdrZyPO0h/orC5O2PYDbo2htZx6CCKsvdNHnb95lALxDa13+8niAyN
dO2VewhhiZbOXSjXanfnDfHT8/yCyRP2H0h2SXHPcmi8oCP9tiEwagPIvi/ClW9I
ysgfH/3CPX59eEuxJpnuAIEFDl7Vh/o0GSD/FRnxzxifxDPWeARaAactFsyoJSEK
gIHayX8RHY8tW3mP62jlkV9O7CXU7kMxIrKMaQqQKBgYSXJQn2x5502ODUE3TenB
9/CJVgBNnnNAcaB7mAbI/iDcR/AsRcBumCy9XSad/1tRGBDrDl3h80ur7eC4It5B
54dRj5DgBIRieYtx9bWwZH1DuBtCYL4jXuEefYRiW1idHDtyXZmouug0GagQISV0
fm97k/mdqw==
=8YH8
-----END PGP SIGNATURE-----
