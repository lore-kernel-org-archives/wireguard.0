Return-Path: <SRS0=HYXs=QB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864CAC282C0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 11:54:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F574218CD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 11:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="Z+s/hysh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F574218CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25c765f8;
	Fri, 25 Jan 2019 11:49:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab220608
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 11:49:07 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2cf6522
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=7b7sVKs1ZrYs8OQJU61ohoHDl1SGISejVwIr0JcUEUw=; 
 b=Z+s/hyshjdg+jB9XU7jB1Q4uxFARt6FDAWtqV6wc8IYp6vPjYupBzV1yLsOKrcw9CpjpT6I2nqGidI99PYaJ10psorDVUSJIcwB4HV01U5JLNzxJ14bN3Wf9zm0smG90A30AvfDGvdnFg3AWJKDB9k2IiTIsMw3itmqP1+NVSIw=;
Subject: Re: Build error on ARM device due to ld flags
To: John <graysky@archlinux.us>
References: <CAO_nJAbgfQ7DY+v40P1tpgHX84HVA=85jvd3-vaEJi8d0kGNcg@mail.gmail.com>
 <7406fa0c-9818-5216-7d14-28a33520b894@newmedia-net.de>
 <CAO_nJAYO4-1JOyCBQ5LuXGNbfiM628wUFyyohArNosfeL9Jpdw@mail.gmail.com>
 <edaee708-7a38-3aef-60b3-638086788b70@newmedia-net.de>
 <CAO_nJAbPfchQWkth1vnMJN52MoyNUgN+s9ewoTTf7Q6YKEoRNg@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <c3359b05-337f-c701-a1cd-3495a9521ed2@newmedia-net.de>
Date: Fri, 25 Jan 2019 12:54:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAO_nJAbPfchQWkth1vnMJN52MoyNUgN+s9ewoTTf7Q6YKEoRNg@mail.gmail.com>
X-Received: from [2003:c9:3f26:f900:9149:f246:b12d:5060]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1gn042-0002mE-09; Fri, 25 Jan 2019 12:54:26 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


> The packager on Arch (makepkg) has a config file (/etc/makepkg.conf)
> that is read when a package is built by it which sets the build flags.
> I just exported the flags therein on the shell then built manually to
> keep it simple (ie without explaining about the packager).  I can tell
> you that I get the identical error when I build manually as shown or
> with the packager.
the problem here is that no external flags should be set for kernel 
related builds. the kernel has its own flags

and exakt these flags must be used for wireguard and this is how it 
works. otherwise strange things will happen.
but i also never used makepkg. a plain make / make install does the job 
by itself

>
> Curiously, I only get this error when I build Wireguard on this
> platform (again reading from /etc/makepkg.conf which sets those
> flags).  I can build anything else without the error (linux kernel,
> ffmpeg, owncloud, nginx, etc.)
>
>> Am 24.01.2019 um 09:57 schrieb John:
>>> Thank you for the reply. What is odd is that I can build just fine on
>>> Arch x86_64 which uses the identical LDFLAGS.  In any case, is your
>>> recommendation to drop the -Wl portion of the LDFLAGS or so unset all
>>> ie:
>>>
>>> unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS
>>>
>>> On Wed, Jan 23, 2019 at 11:02 PM Sebastian Gottschall
>>> <s.gottschall@newmedia-net.de> wrote:
>>>> -Wl etc is not a valid linker flag, its a flag for gcc which passes the
>>>> following flags to the linker. so basicly the LDFLAGS are just wrong.
>>>> in general no CFLAGS or LDFLAGS should be overriden, since wireguard
>>>> uses exact he same flags which is used for compiling the kernel. so setting
>>>> custom flags should be avoided
>>>>
>>>> Am 23.01.2019 um 22:07 schrieb John:
>>>>> I am running Arch ARM (aarch64) on an ODROID-C2 using gcc v8.2.1.
>>>>> Arch ARM which ships with the following LDFLAGS as defaults,
>>>>> "-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
>>>>>
>>>>> When I build wireguard on this device as shown below, I get this error
>>>>> but am unsure why:
>>>>>
>>>>> ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
>>>>> ld: use the --help option for usage information
>>>>> make[2]: *** [scripts/Makefile.build:393:
>>>>> /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
>>>>> make[1]: *** [Makefile:1358:
>>>>> _module_/scratch/WireGuard-0.0.20190123/src] Error 2
>>>>> make: *** [Makefile:36: module] Error 2
>>>>>
>>>>> If I remove the '-Wl' switch from the distro default, it builds
>>>>> without error.  Any advice is appreciated.
>>>>>
>>>>> Complete build log and my FLAGS:
>>>>>
>>>>> % export CPPFLAGS="-D_FORTIFY_SOURCE=2"
>>>>> % export CFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
>>>>> % export CXXFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt"
>>>>> % export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
>>>>> % export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
>>>>> % export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
>>>>>
>>>>> % cd WireGuard-0.0.20190123
>>>>> % make -j5 -C src
>>>>> make: Entering directory '/scratch/WireGuard-0.0.20190123/src'
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/wg.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/config.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/show.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/terminal.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/ipc.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/mnlg.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/encoding.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/curve25519.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/setconf.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/genkey.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/showconf.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/pubkey.o
>>>>>      CC      /scratch/WireGuard-0.0.20190123/src/tools/set.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/main.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/device.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/noise.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/peer.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/timers.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/queueing.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/send.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/receive.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/socket.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/hashtables.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/allowedips.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/ratelimiter.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/cookie.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/netlink.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20.o
>>>>>      PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.S
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305.o
>>>>>      PERLASM /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.S
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20poly1305.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/blake2s/blake2s.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/curve25519/curve25519.o
>>>>>      LD      /scratch/WireGuard-0.0.20190123/src/tools/wg
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/siphash/siphash.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/dst_cache/dst_cache.o
>>>>>      CC [M]  /scratch/WireGuard-0.0.20190123/src/compat/udp_tunnel/udp_tunnel.o
>>>>>      AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/chacha20/chacha20-arm64.o
>>>>>      AS [M]  /scratch/WireGuard-0.0.20190123/src/crypto/zinc/poly1305/poly1305-arm64.o
>>>>>      LD [M]  /scratch/WireGuard-0.0.20190123/src/wireguard.o
>>>>> ld: unrecognized option '-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
>>>>> ld: use the --help option for usage information
>>>>> make[2]: *** [scripts/Makefile.build:393:
>>>>> /scratch/WireGuard-0.0.20190123/src/wireguard.o] Error 1
>>>>> make[1]: *** [Makefile:1358:
>>>>> _module_/scratch/WireGuard-0.0.20190123/src] Error 2
>>>>> make: *** [Makefile:36: module] Error 2
>>>>> make: Leaving directory '/scratch/WireGuard-0.0.20190123/src'
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
