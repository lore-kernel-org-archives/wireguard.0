Return-Path: <SRS0=T0To=T7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB590C04AB6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 May 2019 16:46:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED90226C61
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 May 2019 16:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h3LFDHVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED90226C61
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac90f745;
	Fri, 31 May 2019 16:46:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 881be246
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 May 2019 16:46:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 486dfb24
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 May 2019 16:46:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e17fd6de
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 May 2019 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=f6/D0A6WiEtEwQfdS
 nW7urgEXWk=; b=h3LFDHVEVT0YnMrVj82ULQa+hD3GPLoYhcb/hdfYpKTVH3W2w
 DKk++OIyFHWbwi1bdI9IBA+ulVqbeP/CQ1lA5p0/lSWXUv1lJqDUoyqJtNwAwfuh
 AZBFcc1InunuooOt9kwuGDWiwK6dHIAnyvGrnmECh7YGK14wERXNqaHoJAyyU7By
 ETL3oOkuKgQGkdy9CqJncbj0N8CROkt16StzTSG5jv+Dcj9AQfT6XihJjLU8QRy/
 1UAjchr5aE8Tr+i0b+IYbz0OEJWB8L7GiBlyMhaIQKTbm5f0mmir4+Cu7sr9GC+j
 kVVrn2WSki4q77C0i9E4dtNxSMIai/loNharw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a564b5c0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 May 2019 16:15:23 +0000 (UTC)
Date: Fri, 31 May 2019 18:46:03 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20190531` Available
MIME-Version: 1.0
Message-Id: <85eb7b00357c5cb2@frisell.zx2c4.com>
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

A new snapshot, `0.0.20190531`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not constitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * tools: add wincompat layer to wg(8)
  
  Consistent with a lot of the Windows work we've been doing this last cycle,
  wg(8) now supports the WireGuard for Windows app by talking through a named
  pipe. You can compile this as `PLATFORM=windows make -C src/tools` with mingw.
  Because programming things for Windows is pretty ugly, we've done this via a
  separate standalone wincompat layer, so that we don't pollute our pretty *nix
  utility.
  
  * compat: udp_tunnel: force cast sk_data_ready
  
  This is a hack to work around broken Android kernel wrapper scripts.
  
  * wg-quick: freebsd: workaround SIOCGIFSTATUS race in FreeBSD kernel
  
  FreeBSD had a number of kernel race conditions, some of which we can vaguely
  work around. These are in the process of being fixed upstream, but probably
  people won't update for a while.
  
  * wg-quick: make darwin and freebsd path search strict like linux
  
  Correctness.
  
  * socket: set ignore_df=1 on xmit
  
  This was intended from early on but didn't work on IPv6 without the ignore_df
  flag. It allows sending fragments over IPv6.
  
  * qemu: use newer iproute2 and kernel
  * qemu: build iproute2 with libmnl support
  * qemu: do not check for alignment with ubsan
  
  The QEMU build system has been improved to compile newer versions. Linking
  against libmnl gives us better error messages. As well, enabling the alignment
  check on x86 UBSAN isn't realistic.
  
  * wg-quick: look up existing routes properly
  * wg-quick: specify protocol to ip(8), because of inconsistencies
  
  The route inclusion check was wrong prior, and Linux 5.1 made it break
  entirely. This makes a better invocation of `ip route show match`.
  
  * netlink: use new strict length types in policy for 5.2
  * kbuild: account for recent upstream changes
  * zinc: arm64: use cpu_get_elf_hwcap accessor for 5.2
  
  The usual churn of changes required for the upcoming 5.2.
  
  * timers: add jitter on ack failure reinitiation
  
  Correctness tweak in the timer system.
  
  * blake2s,chacha: latency tweak
  * blake2s: shorten ssse3 loop
  
  In every odd-numbered round, instead of operating over the state
      x00 x01 x02 x03
      x05 x06 x07 x04
      x10 x11 x08 x09
      x15 x12 x13 x14
  we operate over the rotated state
      x03 x00 x01 x02
      x04 x05 x06 x07
      x09 x10 x11 x08
      x14 x15 x12 x13
  The advantage here is that this requires no changes to the 'x04 x05 x06 x07'
  row, which is in the critical path. This results in a noticeable latency
  improvement of roughly R cycles, for R diagonal rounds in the primitive. As
  well, the blake2s AVX implementation is now SSSE3 and considerably shorter.
  
  * tools: allow setting WG_ENDPOINT_RESOLUTION_RETRIES
  
  System integrators can now specify things like
  WG_ENDPOINT_RESOLUTION_RETRIES=infinity when building wg(8)-based init
  scripts and services, or 0, or any other integer.

This snapshot contains commits from: Jason A. Donenfeld, Samuel Neves, and 
Joe Holden.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190531.tar.xz
  SHA2-256: 8b0280322ec4c46fd1a786af4db0c4d0c600053542c4563582baac478e4127b1
  BLAKE2b-256: aacf7222915d00fa9b4f091a3b1c6b2f5dc296f767b1d92da213e53e99795eaf

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190531.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlzxWjAQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnZUD/9Z4WqAOh3Ule6iis8v0Agpe88fvqIgrvoo
tjsQZ8sjXIUnrM/B8TfHcI2YlI6d0Q9mB83Ql2ybHqCPQxRv8j37glhce9yq+h9g
5gYg4SHW1HzJhqLyiGKwRVxvmMo5oKrl2/c9sSuZkXq8OhGrWLX89qR/p9a7NADT
ddtBLqqwq4QPRR2m97Or4KHF7BqCOA0958TZsaTu5CU6e2/9EO3Da1BV5+MKluwg
8bacyLUHPFDg0zJIMBkscjwFGJnddrQnai5XfTXSH40FKGN/OJcWokxvYElzNXeQ
q+TxzE2ZsLOjVM2Lsml0Mt8lOGCSSLNfBEhJBS6htLVEjRtI4lS0KdrCgdyH1WsG
3KNc8XzkFmTFHQ2QmMuKKMy/4LUuC9EGtSYJGVAiwt3BQesyh4RBlzlNwshgVOJx
7GYR/IZQ7YJvol0WqVC9GzudHHbWXcM+er6vtCkBZUVY6CArRphWYfQm50LUbGxo
9I178KEdOnZhdYwyfPNnYcNDXHFoUhqpyK/qQXHab2eHeIoQJdSymO/VGLh9GO12
Otuec3BwZMPqEQlDdUuFPH22v/htcJVejKk9pF0DKxXgqB0NR5X59SashIru+33l
NEYnOz2bg4PZhnsPEIbnCAbLtvQRv0BzSknO2MUaiLi61Krgz1Gc8ChqUZltubC/
Gknv9Oznug==
=fYEC
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
