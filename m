Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_RANDY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F6BC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:16:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7100420753
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nPBuzb3d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7100420753
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdc4c901;
	Wed, 6 May 2020 22:02:57 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c504b993
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:02:55 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4b60f92
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=J/Odx11axYVMQAXub
 SuGk7p0FDA=; b=nPBuzb3dFy1+U9v0+e0fRUpfIgFchgOSz4ncFySRo3WLp7uqz
 wNzzIqLqgU+fJSdeLaP2KziBZobwnMk9zJ288LZKWe/oUT+Y2b9j+rvFb1ArGxxC
 +8sGFd/g7CIFIQ8xav9IC4yN/XfNM3rLW3KIBw4BfoM5e2VVq7Dm4YdIaNgjI13h
 eNY0ThFLGp1+7ETR148+gOPIp1j2UrrXpJIajUuGBclA3qTy0/wPxKDhBXMgTW0m
 QJNm+xfzcnJ2b1JDTnx67mm42Uje9UYaueN4UtZFWLX50r0IOx40xBJSRonSCZUu
 7su0mIpj1irBGcydhaxcogb7hQURj5OX9A5sA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 29841c2f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:02:55 +0000 (UTC)
Date: Wed, 06 May 2020 16:15:37 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200506 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <b9cb52bcc1bf3c59@mail.zx2c4.com>
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

A new version, v1.0.20200506, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  This release corresponds with the patches I just sent Dave for 5.7-rc5:
  https://lore.kernel.org/netdev/20200506213306.1344212-1-Jason@zx2c4.com/T/
  
  * compat: timeconst.h is a generated artifact
  
  Before we were trying to check for timeconst.h by looking in the kernel
  source directory. This isn't quite correct on configurations in which
  the object directory is separate from the kernel source directory, for
  example when using O="elsewhere" as a make option when building the
  kernel. The correct fix is to use $(CURDIR), which should point to
  where we want.
  
  * qemu: loop entropy adding until getrandom doesn't block
  
  Before the 256 was just a guess, which was made wrong by qemu 5.0, so
  instead actually query whether or not we're all set.
  
  * compat: detect Debian's backport of ip6_dst_lookup_flow into 4.19.118
  
  Debian took a 4.19.119 patch into their 4.19.118, so for the first time we're
  forced to detect Debian as a distro kernel, which is unfortunate.
  
  * compat: use bash instead of bc for HZ-->USEC calculation
  
  This should make packaging somewhat easier, as bash is generally already
  available (at least for dkms), whereas bc isn't provided by distros by
  default in their build meta packages.
  
  * qemu: use normal kernel stack size on ppc64
  
  While at some point it might have made sense to be running these tests
  on ppc64 with 4k stacks, the kernel hasn't actually used 4k stacks on
  64-bit powerpc in a long time, and more interesting things that we test
  don't really work when we deviate from the default (16k). So, we stop
  pushing our luck in this commit, and return to the default instead of
  the minimum.
  
  * socket: remove errant restriction on looping to self
  
  It's already possible to create two different interfaces and loop
  packets between them. This has always been possible with tunnels in the
  kernel, and isn't specific to wireguard. Therefore, the networking stack
  already needs to deal with that. At the very least, the packet winds up
  exceeding the MTU and is discarded at that point. So, since this is
  already something that happens, there's no need to forbid the not very
  exceptional case of routing a packet back to the same interface; this
  loop is no different than others, and we shouldn't special case it, but
  rather rely on generic handling of loops in general. This also makes it
  easier to do interesting things with wireguard such as onion routing.
  At the same time, we add a selftest for this, ensuring that both onion
  routing works and infinite routing loops do not crash the kernel. We
  also add a test case for wireguard interfaces nesting packets and
  sending traffic between each other, as well as the loop in this case
  too. We make sure to send some throughput-heavy traffic for this use
  case, to stress out any possible recursion issues with the locks around
  workqueues.
  
  * send: cond_resched() when processing tx ringbuffers
  
  Users with pathological hardware reported CPU stalls on CONFIG_
  PREEMPT_VOLUNTARY=y, because the ringbuffers would stay full, meaning
  these workers would never terminate. That turned out not to be okay on
  systems without forced preemption. This commit adds a cond_resched() to
  the bottom of each loop iteration, so that these workers don't hog the
  core. We don't do this on encryption/decryption because the compat
  module here uses simd_relax, which already includes a call to schedule
  in preempt_enable.
  
  * compat: Ubuntu 19.10 and 18.04-hwe backported skb_reset_redirect
  
  This patch makes this release work with kernels that are presently in
  -proposed but not yet in -updates. Hopefully the newer kernels will migrate
  soon. Current status as of writing:
  
  19.10 - https://bugs.launchpad.net/kernel-sru-workflow/+bug/1874752:
  zx2c4@thinkpad ~ $ curl -s http://archive.ubuntu.com/ubuntu/dists/eoan-updates/main/binary-amd64/Packages.xz | unxz | grep -A2 '^Package: linux-image-generic' | grep ^Version:
  Version: 5.3.0.51.42
  zx2c4@thinkpad ~ $ curl -s http://archive.ubuntu.com/ubuntu/dists/eoan-proposed/main/binary-amd64/Packages.xz | unxz | grep -A2 '^Package: linux-image-generic' | grep ^Version:
  Version: 5.3.0.52.44
  
  18.04 hwe - https://bugs.launchpad.net/kernel-sru-workflow/+bug/1874751:
  zx2c4@thinkpad ~ $ curl -s http://archive.ubuntu.com/ubuntu/dists/bionic-updates/main/binary-amd64/Packages.xz | unxz | grep -A2 '^Package: linux-image-generic-hwe-18.04$' | grep ^Version:
  Version: 5.3.0.51.104
  zx2c4@thinkpad ~ $ curl -s http://archive.ubuntu.com/ubuntu/dists/bionic-proposed/main/binary-amd64/Packages.xz | unxz | grep -A2 '^Package: linux-image-generic-hwe-18.04$' | grep ^Version:
  Version: 5.3.0.52.106
  
  In this case, we're waiting on the .52 kernels to migrate.
  
  * selftests: initalize ipv6 members to NULL to squelch clang warning
  
  This fixes a worthless warning from clang.
  
  * send/receive: use explicit unlikely branch instead of implicit coalescing
  
  Some code readibility cleanups.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200506.tar.xz
  SHA2-256: 98a99f2b825a82d57a7213e666f1ee4f7cc02bddb09bf4908b4b09447a8f121e

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200506.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJDBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6zNwEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrknJD/dZCCq3v2hsqfK767O89Sq4X55H2fcgYPQo
nYAnIVlhWJM0j8UmOamwqAAodIaZjfiN8gDV3iWnrNbJIkIzkWOs0woYQ6U4fPpd
pg0rdILOjmmyDZ6oPUzUhxpG5TXW8l469gCYSR5Tmmwit4GZesIXWPWgxJRktTZr
hEZiMsLVCXWXsPEsRXOtmjAJ7HTqZwszuCIjB458aQAtouBF8yvp6sDvpnWhDLZ9
z/ZttubJe+9AWN1bv/klV00rN8QXcF0p6YMq2DzkABOvbkdG+htjkV72ydP0NM/F
5Jdynpss1FK3K8ZH5/EPziNHLYx914eqQJx2o+DCCuSrsxdgMkgK8yL4+O9qBYir
JzH33o9+sfKx8OKBTNDfHHE2jNJvQdm6Wl1uydX6+TRXaIm02LY4NHHbziDcia3y
GvXJcuETc56hVulKBliUPosGtzq5sPCckjyugwxSEWniPHexyOaa2ptfu4wZXB1b
XxpLcf7Df2zxnsU3GBR2sXQ6pJKKCNWNKqPlSidR/ep6TCN/Vxm7M+I1iFbNs8bx
hKk8YkIVwI5fWfU7kjDkyCEJ4u4iDhGJienTvZZ5IW3SAabfrgCHsZWR7eLVWB8l
zLCBUt+Ht5UTBnRxjaRw2VWN0sVeDPNf8OWIqhdktSJOJY1AQbXcukbqA2Ubl+ex
hGcNVxID
=XsJJ
-----END PGP SIGNATURE-----
