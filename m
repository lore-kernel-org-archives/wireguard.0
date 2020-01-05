Return-Path: <SRS0=oups=22=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDE5C00523
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Jan 2020 23:08:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E80A2085B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Jan 2020 23:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xTfS9y+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E80A2085B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58f4d272;
	Sun, 5 Jan 2020 23:08:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd05feb0
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 23:07:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91a710a5
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 23:07:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f83e1994
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=CYGMRN8PCA1qqRtey
 iX0zbVd57w=; b=xTfS9y+E/w+mZWSDs3qaLDsp0j+y7h0+9C7cDMrBwyz2kVq/q
 H5VzEdhVv5XlDOsMZmj4qSvkvfqEDkHpV6vvKJzUnnqbywmjJ5Z0ahMvF66CwNZK
 WszWtWmeXcEHkUXo62KtSp31JzUDyAlxtqZXMPfoaJbCnE14cEkWJR3PQDUgHAVU
 kHv6h6X9smPA88NN77reihxA6jgt5rtDUMbSWguQUfhmTC3rcOZ5ehysfoX0brmw
 Hoi3+BGSD2txlEFmOpq/Ry2LK4le/9oN/DirS8jVSxAw0DgtZDVMDwFujWfivbki
 W2aCdplqyaB7n8PBkEL+PYxoUf8R+/Zh7Yn2Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 919cc610
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 22:09:02 +0000 (UTC)
Date: Sun, 05 Jan 2020 18:07:57 -0500
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200105 released
MIME-Version: 1.0
Message-Id: <fa073f1fc3e6150b@frisell.zx2c4.com>
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

A new version, v0.0.20200105, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  * qemu: bump packages and support m68k properly
  * qemu: re-add dependency on wireguard sources
  * qemu: only compare archs when deciding whether to use kvm
  
  Our test suite continues to grow. Check out the tremendous set of
  architectures we're now building on https://www.wireguard.com/build-status/
  
  * socket: mark skbs as not on list when receiving via gro
  
  The real purpose of this release. Certain drivers will pass gro skbs to udp,
  at which point the udp driver simply iterates through them and passes them off
  to encap_rcv, which is where we pick up. At the moment, we're not attempting
  to coalesce these into bundles, but we also don't want to wind up having
  cascaded lists of skbs treated separately. The right behavior here, then, is
  to just mark each incoming one as not on a list. This can be seen in practice,
  for example, with Qualcomm's rmnet_perf driver. This lead to crashes on
  OnePlus devices and possibly other Qualcomm 4.14 devices. But I fear that it
  could lead to issues on other drivers on fancy servers, too.
  
  This commit is upstream in net-next as:
  https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=736775d06bac60d7a353e405398b48b2bd8b1e54

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200105.tar.xz
  SHA2-256: 9f12f68e96f6865325995c38213e09b05751cd1ef03e0bbc9f1bdc3e5680b337

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200105.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4SbDsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DriGLD/96FFOMidCpQ0bEys1GMJem1V0USzAdllmg
E9NVOakNF4Tj794w0YWWiBVjEkTjojvILMPkQwaCbVpzXd67Elh44MMyfng2LFh5
kpLPrEDWDMcDr1pEZrpANwcueIUNRbe4+/lfnTnhN+Gr5Z10hpiAr4TasAZVJsZ6
dFmTsvf06nqlPfnevWB/H8Vmif4p7QdeKPquOxE4slPBwCNatUa7uJw3kPhstOCi
lp+A+i/oorxb4nwC9y7vIhKeDThWm3NadMLFjj8pn8Lzq4p37VpBUnpHSc0BX6+m
oW7lMa3X7UcQNnNTt1X5PWPI31ajF60H1mfcccuxeH5xpK7+uqa78YuyHRVccpMm
aTf1JGX/+QGxF4hXM7Hp94uPLToMvkcm+w7O9mI80FAXK+sxjdPF7jT3Rl9TfqA4
W/shg40lGr0h7YrVojBwYSA2aF+UgqXX2/U9o3rgkdUAQQ3kRxsZ1bH164GtQvsD
YWt5JzOBFvHboyZnPtJdSlUU1dEuLJJE/PCzY2o+Fxeh8k0fd7VD0TL+mZjR5cLM
00tAaBjqmbcDZRJmnmI4TM2Ebxuai4WeOrVXUebNrCvW/Ec+/JYvCBPqfSbfJjNE
Iu+AZF0VC+H1/TyTgfTiukf2A8vK6zqbjY8ZgVrTDCZ3jactvvDsm0Ggs+16S+7a
hLAESASlbQ==
=LS5o
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
