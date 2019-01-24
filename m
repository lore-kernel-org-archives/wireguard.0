Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A98C282C5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 19:35:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6948521906
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 19:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="H72QwujW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6948521906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f877de0;
	Thu, 24 Jan 2019 19:30:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc51595e
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 19:28:33 +0000 (UTC)
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d7c253
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 19:28:33 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 32so6275636ota.12
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jan 2019 11:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7i+hPhE4I4LObMzHtwtUiOvencZMrir8TFlzlQePKA=;
 b=H72QwujWs9rMMteP6tmiBexSGBfpabFUHriuribSDtFczHstroUMAwU0AqOLDh5sru
 3fnSVuxzkP+Jgi1y3VWaULHStfRbtIgIoJixCifVVKdwiL7s9Dmkgxf2crGhxfnV3O+X
 KumANhxg5M7r9g3G17dhBrQGiB0jvn0YJDsXCn75n+JoF4Z5Gv8bjRXVR7YviywfgyHz
 NC2wAKf61QsHV3vbGDvtJNbU1LTaEZx6gXUxX1lZ2uMnhUxb3s18xyv/NM6kGSNA1VVD
 hyq+wHbA0p1uprKcN3YbTZ6q2B1rhmi92cf0rAro14YXec5L5MLMPayQogoJH8J3t5id
 FEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7i+hPhE4I4LObMzHtwtUiOvencZMrir8TFlzlQePKA=;
 b=EZEtBNKZz/V88hTI6xYdTDQCv4lF5rXtbKP+mS/0AoC4CE4rCYDCWJYeVyGyMS4K/Y
 3GqTe0HuTCGofqNhIu4C2MYjjOSVlI8EOZoGeScLbDC4UYKyGaFDNpT8K1HYtr1XWtUT
 AUoYe60YHJyu7XKeJg99J3TZ5ExQLRQT8EPjaJvSFD9PnuaQGIaOTTVv9yeZZWDllBYF
 w1DL5qZRawfYfUmVm4Ei8YrSWke9uLWxHLeVKhKCoc+pLDzdDkegOUzVX/vPBF874lrl
 Ld1sbUGRsjYeEhL48Qny/dzt5c/vmGDxhMPcXJjiFwezMa5qh+ZtpbVf31HTlwpKAax/
 Brdg==
X-Gm-Message-State: AJcUukcB430h2VCm1OKjujsaLORV2VNvQqoKxwnyhMan2xIl9c8ZMkg0
 c8cCTXXY9FUF5l5aa5SRrie1W3YKjf8vDGgex5BPZg==
X-Google-Smtp-Source: ALg8bN7DMC1Y/EBHGsbuneOpL8Y2KjwgN9+e8PhC0oiw01t7IkxuDsttj+kLzkfkGuYC9efcR3CD+pJ1Ol1qVXGIMrU=
X-Received: by 2002:a9d:4d17:: with SMTP id n23mr5512187otf.66.1548358427078; 
 Thu, 24 Jan 2019 11:33:47 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAbgfQ7DY+v40P1tpgHX84HVA=85jvd3-vaEJi8d0kGNcg@mail.gmail.com>
 <7406fa0c-9818-5216-7d14-28a33520b894@newmedia-net.de>
 <CAO_nJAYO4-1JOyCBQ5LuXGNbfiM628wUFyyohArNosfeL9Jpdw@mail.gmail.com>
 <edaee708-7a38-3aef-60b3-638086788b70@newmedia-net.de>
In-Reply-To: <edaee708-7a38-3aef-60b3-638086788b70@newmedia-net.de>
From: John <graysky@archlinux.us>
Date: Thu, 24 Jan 2019 14:33:36 -0500
Message-ID: <CAO_nJAbPfchQWkth1vnMJN52MoyNUgN+s9ewoTTf7Q6YKEoRNg@mail.gmail.com>
Subject: Re: Build error on ARM device due to ld flags
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
X-Mailman-Approved-At: Thu, 24 Jan 2019 20:30:06 +0100
Cc: "wireguard@lists.zx2c4.com >> WireGuard mailing list"
 <wireguard@lists.zx2c4.com>
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

On Thu, Jan 24, 2019 at 4:40 AM Sebastian Gottschall
<s.gottschall@newmedia-net.de> wrote:
>
> the kernel makefiles used for building on different architectures can be
> very different. (see kernel sourcdir/arch/arm/Makefile or arch/x86/Makefile)
> so some of them might also overwrite existing flags. what makes me wonder

The Makefile you mentioned for this system would seem to be
/usr/lib/modules/3.16.62-1-ARCH/build/arch/arm64/Makefile

% grep FLAG /usr/lib/modules/3.16.62-1-ARCH/build/arch/arm64/Makefile
LDFLAGS_vmlinux :=-p --no-undefined -X
CPPFLAGS_vmlinux.lds = -DTEXT_OFFSET=$(TEXT_OFFSET)
OBJCOPYFLAGS :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
GZFLAGS :=-9
LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
KBUILD_CFLAGS += -mgeneral-regs-only
KBUILD_CFLAGS += $(call cc-option, -mpc-relative-literal-loads)
KBUILD_CPPFLAGS += -mbig-endian
KBUILD_CPPFLAGS += -mlittle-endian
CHECKFLAGS += -D__aarch64__
KBUILD_CFLAGS_MODULE += -mcmodel=large
KBUILD_CFLAGS_MODULE += $(call cc-option, -mpc-relative-literal-loads)
export TEXT_OFFSET GZFLAGS

I actually don't see a plain LDFLAGS in it... just LDFLAGS_vmlinux.

> according to your build log you're setting various flags before
> entering the wireguard dir and compiling.
> why?

The packager on Arch (makepkg) has a config file (/etc/makepkg.conf)
that is read when a package is built by it which sets the build flags.
I just exported the flags therein on the shell then built manually to
keep it simple (ie without explaining about the packager).  I can tell
you that I get the identical error when I build manually as shown or
with the packager.

Curiously, I only get this error when I build Wireguard on this
platform (again reading from /etc/makepkg.conf which sets those
flags).  I can build anything else without the error (linux kernel,
ffmpeg, owncloud, nginx, etc.)

> Am 24.01.2019 um 09:57 schrieb John:
> > Thank you for the reply. What is odd is that I can build just fine on
> > Arch x86_64 which uses the identical LDFLAGS.  In any case, is your
> > recommendation to drop the -Wl portion of the LDFLAGS or so unset all
> > ie:
> >
> > unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS
> >
> > On Wed, Jan 23, 2019 at 11:02 PM Sebastian Gottschall
> > <s.gottschall@newmedia-net.de> wrote:
> >> -Wl etc is not a valid linker flag, its a flag for gcc which passes the
> >> following flags to the linker. so basicly the LDFLAGS are just wrong.
> >> in general no CFLAGS or LDFLAGS should be overriden, since wireguard
> >> uses exact he same flags which is used for compiling the kernel. so setting
> >> custom flags should be avoided
> >>
> >> Am 23.01.2019 um 22:07 schrieb John:
> >>> I am running Arch ARM (aarch64) on an ODROID-C2 using gcc v8.2.1.
> >>> Arch ARM which ships with the following LDFLAGS as defaults,
> >>> "-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
> >>>
> >>> When I build wireguard on this device as shown below, I get this error
> >>> but am unsure why:
> >>>
> >>> ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
> >>> ld: use the --help option for usage information
> >>> make[2]: *** [scripts/Makefile.build:393:
> >>> /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
> >>> make[1]: *** [Makefile:1358:
> >>> _module_/scratch/WireGuard-0.0.20190123/src] Error 2
> >>> make: *** [Makefile:36: module] Error 2
> >>>
> >>> If I remove the '-Wl' switch from the distro default, it builds
> >>> without error.  Any advice is appreciated.
> >>>
> >>> Complete build log and my FLAGS:
> >>>
> >>> % export CPPFLAGS="-D_FORTIFY_SOURCE=2"
> >>> % export CFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
> >>> % export CXXFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
> >>> % export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
> >>> % export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
> >>> % export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
> >>>
> >>> % cd WireGuard-0.0.20190123
> >>> % make -j5 -C src
> >>> make: Entering directory '/scratch/WireGuard-0.0.20190123/src'
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/wg.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/config.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/show.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/terminal.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/ipc.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/mnlg.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/encoding.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/curve25519.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/setconf.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/genkey.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/showconf.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/pubkey.o
> >>>     CC      /scratch/WireGuard-0.0.20190123/src/tools/set.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/main.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/device.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/noise.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/peer.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/timers.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/queueing.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/send.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/receive.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/socket.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/hashtables.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/allowedips.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/ratelimiter.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/cookie.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/netlink.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20.o
> >>>     PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.S
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305.o
> >>>     PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.S
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20poly1305.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/blake2s/blake2s.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/curve25519/curve25519.o
> >>>     LD      /scratch/WireGuard-0.0.20190123/src/tools/wg
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/siphash/siphash.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/dst_cache/dst_cache.o
> >>>     CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/udp_tunnel/udp_tunnel.o
> >>>     AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.o
> >>>     AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.o
> >>>     LD [M]  /scratch/WireGuard-0.0.20190123/src/wireguard.o
> >>> ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
> >>> ld: use the --help option for usage information
> >>> make[2]: *** [scripts/Makefile.build:393:
> >>> /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
> >>> make[1]: *** [Makefile:1358:
> >>> _module_/scratch/WireGuard-0.0.20190123/src] Error 2
> >>> make: *** [Makefile:36: module] Error 2
> >>> make: Leaving directory '/scratch/WireGuard-0.0.20190123/src'
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
