Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA75C282C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 02:03:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5160217D7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 02:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="f/4WGLtP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5160217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb295fac;
	Thu, 24 Jan 2019 01:58:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e2b6169
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 21:02:52 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b740b838
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 21:02:51 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id 81so3285930otj.2
 for <wireguard@lists.zx2c4.com>; Wed, 23 Jan 2019 13:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=6IUgYG4BY0F3TS+IYmV507MQ8fMeoAfA//CxD5jI9dc=;
 b=f/4WGLtPmJN2FZUDanOymgpVkWrwHndbiNekHFSMrvOHR3TAgYSoVTb13kleSnVw9K
 l9YaXQjyzDuVsScMPUjg8cJrB4bb9lYRo5PmY1OoAj3axv5JgSKWPfdjwnXmPbFN3K69
 0RY/nkqRyE75sT94w4DNY4oqw82PtBv8qZLfl6m4koiQjs0AzL6n6Bg49KvL2R4Xextf
 cRTK3flzmuBGehoHphPTb9bWynt2OAxB7s09ba2aNtool2/mb4zsKXJ2h83PC2o/m7tR
 vX56/LCpegwHRZY7JULzY+a1NrcfP7IWWBJSG6hYEYvxmQm1qu5gLm3HqLNLRi9co8kG
 SbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6IUgYG4BY0F3TS+IYmV507MQ8fMeoAfA//CxD5jI9dc=;
 b=dKlXUTZePeEzEzGpJNE/l+Vvr2PgR240d7jSBVDpKld2LTemy/cWfJqnvLci3U7pwB
 nEZ+ZUEdTE0iqRxxaJgG8uaMFIOo5AJChfBiOtzmInZTCX9MoXUHpU4RlaQ3Wc+in+cJ
 iYr+CGd30X/Jh8RkYedO1cgxHjfbpBAVkXjcPoeEMFMzfHc4YKmawqN+86RHzu5JFCt/
 66Umc1YAEofC2zffhZ29TCKeh5hYnYg3oLl6iQG2ccQOkNQj5v/BreVdZWBrfN6PXai+
 5K6mzzjFclRKHDPx4rs70MU+iiS/MZHCoyOmz+4BaoZtzdx+Ttb3jvGOtCgGd4dfL5hO
 FUMA==
X-Gm-Message-State: AJcUukfQe0tz2l+N9EaVdMvIT24X48Ygl1mfP6pfg+qrLt9JG8eUKXVh
 EoHf7oQgxvI2brfntWRfv0EiNaCBIeuswV7jTO6gYzrWO7I=
X-Google-Smtp-Source: ALg8bN56ET5DRfbS1mSGdM+VI95/DhieN192icxmn4/FtpF2RnnIs6aq7IOkAc5rDGGh2Ycwnk+76zn4q2ZWFoAuElI=
X-Received: by 2002:a9d:2666:: with SMTP id a93mr2395499otb.235.1548277678199; 
 Wed, 23 Jan 2019 13:07:58 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Wed, 23 Jan 2019 16:07:47 -0500
Message-ID: <CAO_nJAbgfQ7DY+v40P1tpgHX84HVA=85jvd3-vaEJi8d0kGNcg@mail.gmail.com>
Subject: Build error on ARM device due to ld flags
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Thu, 24 Jan 2019 02:58:34 +0100
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

I am running Arch ARM (aarch64) on an ODROID-C2 using gcc v8.2.1.
Arch ARM which ships with the following LDFLAGS as defaults,
"-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

When I build wireguard on this device as shown below, I get this error
but am unsure why:

ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
ld: use the --help option for usage information
make[2]: *** [scripts/Makefile.build:393:
/scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
make[1]: *** [Makefile:1358:
_module_/scratch/WireGuard-0.0.20190123/src] Error 2
make: *** [Makefile:36: module] Error 2

If I remove the '-Wl' switch from the distro default, it builds
without error.  Any advice is appreciated.

Complete build log and my FLAGS:

% export CPPFLAGS="-D_FORTIFY_SOURCE=2"
% export CFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
% export CXXFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
% export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
% export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
% export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"

% cd WireGuard-0.0.20190123
% make -j5 -C src
make: Entering directory '/scratch/WireGuard-0.0.20190123/src'
  CC      /scratch/WireGuard-0.0.20190123/src/tools/wg.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/config.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/show.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/terminal.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/ipc.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/mnlg.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/encoding.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/curve25519.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/setconf.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/genkey.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/showconf.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/pubkey.o
  CC      /scratch/WireGuard-0.0.20190123/src/tools/set.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/main.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/device.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/noise.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/peer.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/timers.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/queueing.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/send.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/receive.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/socket.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/hashtables.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/allowedips.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/ratelimiter.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/cookie.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/netlink.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20.o
  PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.S
  CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305.o
  PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.S
  CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20poly1305.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/blake2s/blake2s.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/curve25519/curve25519.o
  LD      /scratch/WireGuard-0.0.20190123/src/tools/wg
  CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/siphash/siphash.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/dst_cache/dst_cache.o
  CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/udp_tunnel/udp_tunnel.o
  AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.o
  AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.o
  LD [M]  /scratch/WireGuard-0.0.20190123/src/wireguard.o
ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
ld: use the --help option for usage information
make[2]: *** [scripts/Makefile.build:393:
/scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
make[1]: *** [Makefile:1358:
_module_/scratch/WireGuard-0.0.20190123/src] Error 2
make: *** [Makefile:36: module] Error 2
make: Leaving directory '/scratch/WireGuard-0.0.20190123/src'
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
