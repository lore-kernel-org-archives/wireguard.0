Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15DEC282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 04:00:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621D42184C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 04:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="dPZN+QHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 621D42184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08473a65;
	Thu, 24 Jan 2019 03:54:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae2200df
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 03:09:10 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13a35792
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=Irpb+TI5+QOPWUEDaZRDfofMtxDzIW+mkIFuGFgckrw=; 
 b=dPZN+QHVOW5ySA24I8EFe5e8kZ6EFquTg6lBirLVDxqAIxLkkRKCdjObnXGWfXjyRrdhBVlaUS5jVRSjElQUrx6H293IM4lh22mdfUmCzljkxhbrUBVPiBN37v7fXmV4UlxYVAp+53bEUfBLt7AfBqkpsxCptju8FsXOYBc0iWQ=;
Subject: Re: Build error on ARM device due to ld flags
To: wireguard@lists.zx2c4.com
References: <CAO_nJAbgfQ7DY+v40P1tpgHX84HVA=85jvd3-vaEJi8d0kGNcg@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <7406fa0c-9818-5216-7d14-28a33520b894@newmedia-net.de>
Date: Thu, 24 Jan 2019 04:14:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAO_nJAbgfQ7DY+v40P1tpgHX84HVA=85jvd3-vaEJi8d0kGNcg@mail.gmail.com>
X-Received: from [2003:c9:3f26:f900:ec3d:fb16:d1c0:1d32]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1gmVT9-0006x5-Ox
 for wireguard@lists.zx2c4.com; Thu, 24 Jan 2019 04:14:19 +0100
X-Mailman-Approved-At: Thu, 24 Jan 2019 04:54:13 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-Wl etc is not a valid linker flag, its a flag for gcc which passes the 
following flags to the linker. so basicly the LDFLAGS are just wrong.
in general no CFLAGS or LDFLAGS should be overriden, since wireguard 
uses exact he same flags which is used for compiling the kernel. so setting
custom flags should be avoided

Am 23.01.2019 um 22:07 schrieb John:
> I am running Arch ARM (aarch64) on an ODROID-C2 using gcc v8.2.1.
> Arch ARM which ships with the following LDFLAGS as defaults,
> "-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
>
> When I build wireguard on this device as shown below, I get this error
> but am unsure why:
>
> ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
> ld: use the --help option for usage information
> make[2]: *** [scripts/Makefile.build:393:
> /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
> make[1]: *** [Makefile:1358:
> _module_/scratch/WireGuard-0.0.20190123/src] Error 2
> make: *** [Makefile:36: module] Error 2
>
> If I remove the '-Wl' switch from the distro default, it builds
> without error.  Any advice is appreciated.
>
> Complete build log and my FLAGS:
>
> % export CPPFLAGS="-D_FORTIFY_SOURCE=2"
> % export CFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
> % export CXXFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
> % export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
> % export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
> % export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
>
> % cd WireGuard-0.0.20190123
> % make -j5 -C src
> make: Entering directory '/scratch/WireGuard-0.0.20190123/src'
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/wg.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/config.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/show.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/terminal.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/ipc.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/mnlg.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/encoding.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/curve25519.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/setconf.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/genkey.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/showconf.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/pubkey.o
>    CC      /scratch/WireGuard-0.0.20190123/src/tools/set.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/main.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/device.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/noise.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/peer.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/timers.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/queueing.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/send.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/receive.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/socket.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/hashtables.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/allowedips.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/ratelimiter.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/cookie.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/netlink.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20.o
>    PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.S
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305.o
>    PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.S
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20poly1305.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/blake2s/blake2s.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/curve25519/curve25519.o
>    LD      /scratch/WireGuard-0.0.20190123/src/tools/wg
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/siphash/siphash.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/dst_cache/dst_cache.o
>    CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/udp_tunnel/udp_tunnel.o
>    AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.o
>    AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.o
>    LD [M]  /scratch/WireGuard-0.0.20190123/src/wireguard.o
> ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
> ld: use the --help option for usage information
> make[2]: *** [scripts/Makefile.build:393:
> /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
> make[1]: *** [Makefile:1358:
> _module_/scratch/WireGuard-0.0.20190123/src] Error 2
> make: *** [Makefile:36: module] Error 2
> make: Leaving directory '/scratch/WireGuard-0.0.20190123/src'
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
