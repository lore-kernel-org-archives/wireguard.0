Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0015FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jun 2022 10:59:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 92f6d8ab;
	Mon, 27 Jun 2022 10:59:41 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7ab32a7a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jun 2022 10:59:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F1A4B810A3
 for <wireguard@lists.zx2c4.com>; Mon, 27 Jun 2022 10:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD68C3411D
 for <wireguard@lists.zx2c4.com>; Mon, 27 Jun 2022 10:59:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ef4DCK1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656327575;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=0A6aXPBMjfdDS3rQKWUwv6w/kCBwKByw9exa2vw5UfM=;
 b=Ef4DCK1/9xi0DJGYLt7b0cWwmE2g0UZHqlH1dVaC8tsQp8TVcAMvtQmwJjj7oj/+K4tl4c
 1YW2/ASnuEucCcTheXWiq3SPUeAgtkUbCHptktzm80CkP7tCEmoLS+YidKmyYzecN8KZL/
 6dTYMW8ArMZeXjlIjwHazlQ21oxZQSo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 72aa8522
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jun 2022 10:59:35 +0000 (UTC)
Date: Mon, 27 Jun 2022 12:59:34 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20220627 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20220627105937.BCD68C3411D@smtp.kernel.org>
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

A new version, v1.0.20220627, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  * compat: drop Ubuntu 14.04
  
  We announced it was going to be EOL a long time ago, and now it finally is.
  
  * qemu: give up on RHEL8 in CI
  
  RHEL8 makes CI impossible and their kernel team doesn't accept patches to fix
  it. So just drop it from CI. This means that likely CentOS 8 "Stream" support
  will falter. If you're interested in having RHEL8 support up to date, please
  get in touch.
  
  * crypto: curve25519-x86_64: use in/out register constraints more precisely
  * queueing: use CFI-safe ptr_ring cleanup function
  * qemu: simplify RNG seeding
  * socket: free skb in send6 when ipv6 is disabled
  * socket: ignore v6 endpoints when ipv6 is disabled
  * qemu: enable ACPI for SMP
  * device: check for metadata_dst with skb_valid_dst()
  * netns: make routing loop test non-fatal
  * netns: limit parallelism to $(nproc) tests at once
  * qemu: use vports on arm
  * qemu: set panic_on_warn=1 from cmdline
  
  Various fixes from upstream, now backported.
  
  * compat: handle backported rng and blake2s
  
  Recent kernels did large backports of the RNG code and BLAKE2s, which the
  compat layer previously had various stubs for. Now the compat layer uses the
  properly backported code instead.

This release contains commits from: Jason A. Donenfeld, Wang Hai, and Nikolay 
Aleksandrov.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20220627.tar.xz
  SHA2-256: 362d412693c8fe82de00283435818d5c5def7f15e2433a07a9fe99d0518f63c0

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20220627.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmK5jY0QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DroByD/44LVUG2mmvrbBWFuJ30gXeT7P4m8uNJJwB
Ykup/HcA/CSaKvhCqIFE+Vc2BqY/Ns8Tp3qucVwZ6EF80w42AICFwD8S+c8X88er
9LSbGvXiW3Pjvs2oXtiDnhgNZt/msM7EtLODkH3SuVoTaYcsecG5K42k+IcKrteR
Du5XfN4nuMGV4CSYoTQlyId9VLigEasb3CfA6yTV3VA7Ry4V+LTeE/Ngy1S5FNxj
UENZ5sptzA7OEwdgkb7gHw00MrHW3ptd5UUEQAai1rVWRl4pHNq2HC1VMsdkTbQ0
nWXEZWNcZT2dJWzxrsbtvGAzEQ/UoTyzzjckpTk5xHE4GAuG0tEIhMoFaD+knqDQ
gornocfeOjyZD5Tk86MM4rmGkICW3YGpqoEQrxrhzuUwZfytf1cl5Deock8ODjNF
PGfMEWmibVfW+/RHwIi/6niH644mdUlBEU+ilXstBXDSVpf4QhKzQYdqdV8v9xVh
OulrmVRikX8tMQ0b2hHbC5yh7u0K0QRJGqnRl36OrYNhF2Ny/zKcp5ASjDCNFDW4
o8++eQzzMqzLknmmWyrG9aeQeVvx6gOmqozItUz0uV4CGegq9m2CdXhsQyySpkqk
tWCWOaDrYjHHdV2YHVT3JlcS8/CTLI1nMIY2D+T8RTIeHb6546OyBUNG/zwUliVh
cAdOuxrEag==
=Jp6L
-----END PGP SIGNATURE-----
