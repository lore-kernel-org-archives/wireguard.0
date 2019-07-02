Return-Path: <SRS0=SwL3=U7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930BCC06510
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jul 2019 12:39:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C34205F4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jul 2019 12:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="R4ZB9iZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C34205F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14885da6;
	Tue, 2 Jul 2019 12:39:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cf80a01
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 12:38:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e45e1794
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 12:38:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09b44008
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=YrqrVNMsaYYImrFCT
 tZcVNDu8Is=; b=R4ZB9iZwjaesck60vE1PVulIYcho5jNaUusW5wrHB4iIiyDbr
 7SDg3gDJ52saOmvcQcTK4BUyKKRybSCNe6QeEdOAML9W5OVj5UrFU4s9ky5WqsFa
 tryU05g1XliEA+B2h/XTttOcMHDb7Q9cQSRIE+kDSKBGGSi2uodvkvemRHwO/dX1
 o2pcy0KPXdeK3VwGGCulLytbRfTi2yB+TFFYoOYR5aSAVPwSk/RuSXnhMWj5CX2d
 JNr5/c9hKnGqwkHJgD3did+l3ORt+tM/uLXL2lukLfvGQjuhjwMwgtdmJW7RA+mq
 u3NzsPG8ZQ13hq2X/7F2KVgobCgQwcFWf1N2w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1dd3fb8f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 12:04:10 +0000 (UTC)
Date: Tue, 02 Jul 2019 14:38:57 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190702` Available
MIME-Version: 1.0
Message-Id: <59eba07cc65097ac@frisell.zx2c4.com>
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

A new snapshot, `0.0.20190702`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not constitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * curve25519: not all linkers support bmi2 and adx
  
  This should allow WireGuard to build on older toolchains.
  
  * qemu: show signal when failing
  
  This was useful in tracking down upstream armeb bugs such as:
  http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/655926.html
  
  * wg-quick: darwin: support being called from launchd
  
  We now ship a sample launchd file, for folks who would like to run WireGuard
  on macOS servers with some form of automation. Most users are still advised to
  use the GUI app from the App Store.
  
  * compat: some kernels weirdly backport prandom_u32_max
  * compat: unify custom function prefix/suffix
  * compat: rhel backported list modifications
  
  Usual maintance of our compat layer for existing platforms and kernels.
  
  * compat: support RHEL8's skb_mark_not_on_list backport
  
  We now support RHEL8/CentOS8's kernel.
  
  * global: switch to coarse ktime
  
  Our prior use of fast ktime before meant that sometimes, depending on how
  broken the motherboard was, we'd wind up calling into the HPET slow path. Here
  we move to coarse ktime which is always super speedy. In the process we had to
  fix the resolution of the clock, as well as introduce a new interface for it,
  landing in 5.3. Older kernels fall back to a fast-enough mechanism based on
  jiffies.
  
  https://lore.kernel.org/lkml/tip-e3ff9c3678b4d80e22d2557b68726174578eaf52@git.kernel.org/
  https://lore.kernel.org/lkml/20190621203249.3909-3-Jason@zx2c4.com/
  
  * netlink: cast struct over cb->args for type safety
  
  This follow recent upstream changes such as:
  
  https://lore.kernel.org/lkml/20190628144022.31376-1-Jason@zx2c4.com/
  
  * peer: use LIST_HEAD macro
  
  Style nit.
  
  * receive: queue dead packets to napi queue instead of empty rx_queue
  
  This mitigates a WARN_ON being triggered by the workqueue code. It was quite
  hard to trigger, except sporadically, or reliably with a PC Engines ALIX, an
  extremely slow board with an AMD LX800 that Ryan Whelan of Axatrax was kind
  enough to mail me.

This snapshot contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190702.tar.xz
  SHA2-256: 1a1311bc71abd47a72c47d918be3bacc486b3de90734661858af75cc990dbaac
  BLAKE2b-256: 3b8668eed4c11c3d5995f23152c645ee40017ab84c8b15ce5f84015730290c9f

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190702.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl0bUEMQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgJjD/kBcJ9f/bemJpiUSJ0a/HIIWMjOPfA4bcDE
r4tRn+Oz+5MEBpDhm4cy3hjzRLbMQn5/c/i2EfByko8m1t3AE+qYaFr81mC4hYsY
OqE/30VHY2lJSnyeAuJTo6rZr/LByTTtXstm9AEjOFuGlV4FdjFvDhFbvPdYVPVv
Tl//w8Eo7ZZ9A39pRTpd4InF6iMSvbF8dG1VXuE8OZnfOkV/u/06KO+AILUXGa0Q
CTlKK/y7LMob1xeO4r0+Cy0qM8Cx9iIPYIu5DMW9QSWU3jpc09rR7uYEcQ4uuQp9
5zmFEYqJLJwbxuK1T5CtKPEUVuF0a/iY1stbw/B2pt8UfweGpMnxNJe1znzBfDLa
J94F5f7PtCMmug8lks1qyozi2S6/uTDAcLxE2mhJWQ/Esrv6Rc/8TyY7O/IWM5Di
xFaLbLdI+VAvkBFLJdA9htQKa3Q1QmdEx2oh0uLkjIS3LRfmiL1f/EdSLKVzn/7t
Q5iCjtmaIDN968tREzZfGAB+yt/QlyeYoE7YxerS9IR0Y2PfkqMYNbKnSTvjF7wY
8bAKq/9D9v4WjRm2b+r1LAQXh/CWDJjy3jfQROHEkhERfKbAAhiivjRNN7SX+TCl
/zOPgBe1dOzXDsDYukS3Afrn270UILQPvQAEuMJoA6fzc37CM2i8Mf+j61Kvjh34
kShuZHlL7g==
=LMh+
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
