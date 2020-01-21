Return-Path: <SRS0=xGSK=3K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5820CC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jan 2020 15:21:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A4A21569
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jan 2020 15:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="r027Fwrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2A4A21569
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82973bd6;
	Tue, 21 Jan 2020 15:21:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c2eace2
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 15:20:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc9597a1
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 15:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ee25131
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=/W7DubRZepTUP3Pb9
 Qw4IILXAb8=; b=r027FwrpoNQO0BXsx02uvT0gPP2ZLEZqy9Jy2B/78TYhxDszi
 pD2xgK+ZQ1qeTpahtfLDT6BjoDtMyF7Ub9ZC77MA2cpChVvNm5EZSTAnJNfWqvjf
 Hi9xsRvelRHE94h3maY9RCOx4qHlkRcypprVi6GmZHZ+5O6Ir2k80y25hIae1exx
 UFc8SxPz45u3vz7/9CeDfOYUF4EqAdKmVMjHno8vK/c2v464pGJ8KzvbfsSJ4LxV
 GHPrAnynrfA3Xk1JzAJ1fKvc1nwQv2cxM5hCI2G8fwA1Hb9gf4mnZ8Ou+IKl4R9x
 x9c7EXFProENX38UhJ+gNJNWXUcSzWt7iyygQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0bc1a5ad
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 14:20:01 +0000 (UTC)
Date: Tue, 21 Jan 2020 16:20:57 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v0.0.20200121 released
MIME-Version: 1.0
Message-Id: <fa09a641e7fc264a@frisell.zx2c4.com>
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

A new version, v0.0.20200121, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

Please note that until Linux 5.6 is released, this snapshot is a
snapshot rather than a secure final release.

== Changes ==

  * Makefile: strip prefixed v from version.h
  
  This fixes a mistake in dmesg output and when parsing the sysfs entry in the
  filesystem.
  
  * device: skb_list_walk_safe moved upstream
  
  This is a 5.6 change, which we won't support here, but it does make the code
  cleaner, so we make this change to keep things in sync.
  
  * curve25519: x86_64: replace with formally verified implementation
  
  This comes from INRIA's HACL*/Vale. It implements the same algorithm and
  implementation strategy as the code it replaces, only this code has been
  formally verified, sans the base point multiplication, which uses code
  similar to prior, only it uses the formally verified field arithmetic
  alongside reproducable ladder generation steps. This doesn't have a
  pure-bmi2 version, which means haswell no longer benefits, but the
  increased (doubled) code complexity is not worth it for a single
  generation of chips that's already old.
  
  Performance-wise, this is around 1% slower on older microarchitectures,
  and slightly faster on newer microarchitectures, mainly 10nm ones or
  backports of 10nm to 14nm. This implementation is "everest" below:
  
      Xeon E5-2680 v4 (Broadwell)
      
      armfazh: 133340 cycles per call
      everest: 133436 cycles per call
      
      Xeon Gold 5120 (Sky Lake Server)
      
      armfazh: 112636 cycles per call
      everest: 113906 cycles per call
      
      Core i5-6300U (Sky Lake Client)
      
      armfazh: 116810 cycles per call
      everest: 117916 cycles per call
      
      Core i7-7600U (Kaby Lake)
      
      armfazh: 119523 cycles per call
      everest: 119040 cycles per call
      
      Core i7-8750H (Coffee Lake)
      
      armfazh: 113914 cycles per call
      everest: 113650 cycles per call
      
      Core i9-9880H (Coffee Lake Refresh)
      
      armfazh: 112616 cycles per call
      everest: 114082 cycles per call
      
      Core i3-8121U (Cannon Lake)
      
      armfazh: 113202 cycles per call
      everest: 111382 cycles per call
      
      Core i7-8265U (Whiskey Lake)
      
      armfazh: 127307 cycles per call
      everest: 127697 cycles per call
      
      Core i7-8550U (Kaby Lake Refresh)
      
      armfazh: 127522 cycles per call
      everest: 127083 cycles per call
      
      Xeon Platinum 8275CL (Cascade Lake)
      
      armfazh: 114380 cycles per call
      everest: 114656 cycles per call
  
  Achieving these kind of results with formally verified code is quite
  remarkable, especialy considering that performance is favorable for
  newer chips.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200121.tar.xz
  SHA2-256: 7726c2994d11913c4543fd3dc83636f7ce573ca689b15e11b83e980acc04422b

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-0.0.20200121.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4nFZsQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrljdEADXQHCm7AaHZqcSYVPEhFucsad0AWRgpqBS
6GNlUMIAesIO5UdFKKE9otL3m6kyp7Z4iaphqVla35Q96eIvw888ojDrKJ8SIKrX
YrWVKbbRg6V/xGrqunEmlB2f1kj2F/iVFImFKMslYA/50ovlr8qCVBFTdwwKWzE1
4INYmpFIWJ2ibOt9b5KP1gqvv8g/S7sHSXgQ/9AHYqXuVQ05r8w2/w4mv0+GnWBU
SGjKh/h3kK1RevQA4TMY192jtFOLbeSs9HqUHUOCne7sDehzzH0C/DR3TaVnPVnK
fAkrFqTAFU99oKHP2YBEYBJduzN/qNbn4fZXmcs6w7li6vmhWJNKNBOAAgDF59jf
fsrlKsi3qKPzzyXF5O8mhnpbXsz/iirgfwNcmpob+UHC4AgmbnYErHLQEk+VKJH0
EFNeI4vAwNKcpNsG6HCv4ed+cGEsaB65MYr21WLBiJTR4i0wwGPWDOx94I0Q0mKj
5pMLkdKovx/M5i8414vMLnSLPWtgRme/4xxr4/RL/49mW+1NBwa3MChHhosYV49b
WlsyzktNBAba6YFAmhrp0A79CyXEy9VgC44gtnwQq1bW9/KLID90iFdZM1M4G5uc
N4CT72PWXWI/vjTLbdJK+ktzbq7RRLM5IT64Ztv20r9EaXnbfiMNKshdhOccGAQk
v3rnJjSy9A==
=Fmef
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
