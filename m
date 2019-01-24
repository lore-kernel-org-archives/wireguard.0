Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53E2C282C5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 12:40:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A91421855
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 12:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="lNcCRMh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A91421855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9bfafe2;
	Thu, 24 Jan 2019 12:34:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b58704df
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 08:52:08 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d480585b
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 08:52:08 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id m6so4200594oig.11
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jan 2019 00:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGcCVqwBuFt47VTPPoNFHpoPX6ruGKDxXGtBRi51+4Y=;
 b=lNcCRMh/DtQdzXymR6vhvvTIViYls/BJGLEh5dLDeqjKDp/SLrUxFwutvw9I5viQe/
 SXhRuBc6X0nTHROX64DQSIyH0BuifAgNqQ3QkG3Ox4TKlcLEa/QIFUvrgCMVeJy1MaIK
 oILzsPkEdQdjmGshi4wcX4ySjsHFyfukTgk0PwW73lVswrhWa/7yiTqO+mfr5hIZPfCK
 hn8xlFQv+p9Ck+sL0QkwycmqWn6nsMaBfAGJmTSvs00+u/u9Y4O4UzfoYLAh8StCtZVS
 hjaXaO7mRvAEPwd6frtqhdbDMk/HAVj2j2HDdXgcyUOfMma9YX/kjQStaJEVg7SX9/jt
 8rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGcCVqwBuFt47VTPPoNFHpoPX6ruGKDxXGtBRi51+4Y=;
 b=If3h36X4Cy4w6GXp2X3kgtND/KsO2YYt1n3WEkVKYinWiMRVzYmnx2UTm2kWU33Ixf
 fZhS0uc0coQzyBA3YBodC1kcBQpWJakCAUI9+lGxaEdbqY2gA3FyxCntA7yK+DxNCEve
 M0GIlXsxxwmgQn0LWa+/tslwdG9dn34SCNb8LQNXMGq9qSSKHJ2K+BMMN46rAPQBmenI
 TO36k/BcpfQJRm06zN5UXA4GfoFb6n1I+oL6wDUx6MmgxN2sDKIFwnrhjNAqq88p0dqm
 q/WES4Oll+BjVuQqfKelmphofeJJizwpyOzDTQAdQNfrG9SYbpWpeWC8WWJJYYvAhuC3
 hNPA==
X-Gm-Message-State: AHQUAuatPVa9sqQWyBvMCclNemeEFYIcdRB8b7ZmzhTwRMY6ewcAUnC6
 6fXMSK1rS2EEwGoE54bceVkCoLbEmd3J+Xb2RRTa0+B1AEg=
X-Google-Smtp-Source: ALg8bN68sjsZKsLtlQcb+6BRBxApCP3acR1C4pB3+4340GowpOpbTzG6l1ASD5s08hIbckwPJc9ETHbjLioFjabY/04=
X-Received: by 2002:aca:4ed8:: with SMTP id c207mr592296oib.276.1548320239024; 
 Thu, 24 Jan 2019 00:57:19 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAbgfQ7DY+v40P1tpgHX84HVA=85jvd3-vaEJi8d0kGNcg@mail.gmail.com>
 <7406fa0c-9818-5216-7d14-28a33520b894@newmedia-net.de>
In-Reply-To: <7406fa0c-9818-5216-7d14-28a33520b894@newmedia-net.de>
From: John <graysky@archlinux.us>
Date: Thu, 24 Jan 2019 03:57:08 -0500
Message-ID: <CAO_nJAYO4-1JOyCBQ5LuXGNbfiM628wUFyyohArNosfeL9Jpdw@mail.gmail.com>
Subject: Re: Build error on ARM device due to ld flags
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
X-Mailman-Approved-At: Thu, 24 Jan 2019 13:34:33 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thank you for the reply. What is odd is that I can build just fine on
Arch x86_64 which uses the identical LDFLAGS.  In any case, is your
recommendation to drop the -Wl portion of the LDFLAGS or so unset all
ie:

unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS

On Wed, Jan 23, 2019 at 11:02 PM Sebastian Gottschall
<s.gottschall@newmedia-net.de> wrote:
>
> -Wl etc is not a valid linker flag, its a flag for gcc which passes the
> following flags to the linker. so basicly the LDFLAGS are just wrong.
> in general no CFLAGS or LDFLAGS should be overriden, since wireguard
> uses exact he same flags which is used for compiling the kernel. so setting
> custom flags should be avoided
>
> Am 23.01.2019 um 22:07 schrieb John:
> > I am running Arch ARM (aarch64) on an ODROID-C2 using gcc v8.2.1.
> > Arch ARM which ships with the following LDFLAGS as defaults,
> > "-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
> >
> > When I build wireguard on this device as shown below, I get this error
> > but am unsure why:
> >
> > ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
> > ld: use the --help option for usage information
> > make[2]: *** [scripts/Makefile.build:393:
> > /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
> > make[1]: *** [Makefile:1358:
> > _module_/scratch/WireGuard-0.0.20190123/src] Error 2
> > make: *** [Makefile:36: module] Error 2
> >
> > If I remove the '-Wl' switch from the distro default, it builds
> > without error.  Any advice is appreciated.
> >
> > Complete build log and my FLAGS:
> >
> > % export CPPFLAGS="-D_FORTIFY_SOURCE=2"
> > % export CFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
> > % export CXXFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
> > % export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
> > % export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
> > % export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
> >
> > % cd WireGuard-0.0.20190123
> > % make -j5 -C src
> > make: Entering directory '/scratch/WireGuard-0.0.20190123/src'
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/wg.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/config.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/show.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/terminal.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/ipc.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/mnlg.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/encoding.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/curve25519.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/setconf.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/genkey.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/showconf.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/pubkey.o
> >    CC      /scratch/WireGuard-0.0.20190123/src/tools/set.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/main.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/device.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/noise.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/peer.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/timers.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/queueing.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/send.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/receive.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/socket.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/hashtables.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/allowedips.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/ratelimiter.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/cookie.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/netlink.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20.o
> >    PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.S
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305.o
> >    PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.S
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20poly1305.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/blake2s/blake2s.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/curve25519/curve25519.o
> >    LD      /scratch/WireGuard-0.0.20190123/src/tools/wg
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/siphash/siphash.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/dst_cache/dst_cache.o
> >    CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/udp_tunnel/udp_tunnel.o
> >    AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.o
> >    AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.o
> >    LD [M]  /scratch/WireGuard-0.0.20190123/src/wireguard.o
> > ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
> > ld: use the --help option for usage information
> > make[2]: *** [scripts/Makefile.build:393:
> > /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
> > make[1]: *** [Makefile:1358:
> > _module_/scratch/WireGuard-0.0.20190123/src] Error 2
> > make: *** [Makefile:36: module] Error 2
> > make: Leaving directory '/scratch/WireGuard-0.0.20190123/src'
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> >
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
