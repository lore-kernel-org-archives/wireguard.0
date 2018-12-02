Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A453C64EB1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9171920989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="1hwspPPi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9171920989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d0773b4;
	Thu, 6 Dec 2018 23:05:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6668866c
 for <wireguard@lists.zx2c4.com>; Sun, 2 Dec 2018 10:21:44 +0000 (UTC)
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6a88411
 for <wireguard@lists.zx2c4.com>; Sun, 2 Dec 2018 10:21:44 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id t5so9088070otk.1
 for <wireguard@lists.zx2c4.com>; Sun, 02 Dec 2018 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+iaeYj7CU5hrIW2qV4jJ6+KK+Ye9qdcWeeP48gkmhXw=;
 b=1hwspPPiupCk+Z48fb09e3Vk6YweBoXP9wy+oxXMorG8mvn7depbjbwBdVCbcf7fSm
 0/TMKc9NGWgAeYlQ2R1fAjjWaq5lfCifllmuY6q3sjDS+vwPTI54MF+4C4eSX6KzxNBi
 9gBFoYnJtW+/f+pVTGikNGTNWsDfZxjMySI8T3IAWeaxYKetlnJiKZCtxoLrJYLoI1gq
 24u9kqBwgCKFp1o+L6+rpINEX7GQv6kWCKfhu0nuGCJvzeIODFVnjtk1xQdYgwmyrzFr
 AE+MMDXiOz8S2C/PNJDohie+jB16U7Z7NkKE8d/BQJsA8t0TQlL2DeqoWdaK35JD9U2m
 GjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iaeYj7CU5hrIW2qV4jJ6+KK+Ye9qdcWeeP48gkmhXw=;
 b=X7MQFoMGidpQ7z2kua0720+6idoMTxs9NpwMKQWRK6vrbe05tlN00iAwpXzb07BnSj
 HWBqQKPkEiPJjy/EtErrYmInL9cPlGMs+tX8kr5LC88a1KHnLnToQL2qkG1JsapCg/ZP
 6Jh/SbEtW0Bv1F8wIxf97oydtEi7ag5vQX6xKET01Y4Zv0USPQKYzwv9MYbgPElCw5es
 kmLYRf3Yrx/yOdqC+Dcz2Cqz3/rrMNp7B65trQKKadd3/g3a1sBuQIrfUip1C3eXZqsa
 1uwM0pwn27EcEJ8o4BHef9+iCxFnoR5P+55aB05qYqP83mpRA4xlwQFtunjZYRpJsbCc
 1mcw==
X-Gm-Message-State: AA+aEWYRHkuv5gm6gKYXWaFtK11d0HT9P+gxp0GDYGzsNHgMCFdINjVi
 Fq8tRCEDCyy5+XbA+90zFE5pB33BO9+SkwCFJy/aYA==
X-Google-Smtp-Source: AFSGD/UzKJUSSnZT2bf0jjEPh7x54tjeZAMogNswDVMNlVP9Ju+lhx0+jAtxz0Stj5Wjvzgr517Kb1LseErTg+HZJRg=
X-Received: by 2002:a9d:ac3:: with SMTP id 61mr8002489otq.272.1543746561134;
 Sun, 02 Dec 2018 02:29:21 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
In-Reply-To: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Sun, 2 Dec 2018 05:29:10 -0500
Message-ID: <CAO_nJAboz0tJcP_dvb+m9pEe2Bp_M3H=KH7kmr9o8U3tWUZsVw@mail.gmail.com>
Subject: Re: Build fails on Debian, kernel 4.20.0-rc4
To: laszlo.kertesz@gmail.com
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:17 +0100
Cc: wireguard@lists.zx2c4.com
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

I think the issue isn't with the WireGuard code but with something
unique to Debian or to dkms.  I am able to build the module on Arch
Linux using 4.20-rc4 (linux-mainline package from the AUR) with issue.
I haven't tried dkms (not a fan).

Here is a PKGBUILD for wireguard tools and module without using DKMS:
https://gist.github.com/graysky2/c9b3a44576f498e002fd1a255dab1c44

make -C src module
make: Entering directory '/build/wireguard/src/WireGuard-0.0.20181119/src'
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/main.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/noise.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/peer.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/device.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/timers.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/queueing.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/send.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/receive.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/socket.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/hashtables.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/allowedips.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/ratelimiter.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/cookie.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/netlink.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/chacha20/chacha20.o
  PERLASM /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/chacha20/chacha20-x86_64.S
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/poly1305/poly1305.o
  PERLASM /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/poly1305/poly1305-x86_64.S
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/chacha20poly1305.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/blake2s/blake2s.o
  AS [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/blake2s/blake2s-x86_64.o
  CC [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/curve25519/curve25519.o
  AS [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/chacha20/chacha20-x86_64.o
  AS [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/crypto/zinc/poly1305/poly1305-x86_64.o
  LD [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/wireguard.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /build/wireguard/src/WireGuard-0.0.20181119/src/wireguard.mod.o
  LD [M]  /build/wireguard/src/WireGuard-0.0.20181119/src/wireguard.ko
make: Leaving directory '/build/wireguard/src/WireGuard-0.0.20181119/src'
On Sat, Dec 1, 2018 at 4:00 PM Laszlo KERTESZ <laszlo.kertesz@gmail.com> wrote:
>
> Hi,
> The wireguard module (0.0.20181119 from Debian Unstable) fails to build on my machine using kernel 4.20 rc4.
>
> I get the following errors:
>
>> # cat /var/lib/dkms/wireguard/0.0.20181119/build/make.log
>> DKMS make.log for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)
>> Sat Dec  1 22:51:18 EET 2018
>> make: Entering directory '/usr/src/linux-headers-4.20.0-rc4'
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/main.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/noise.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/device.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/peer.o
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or directory
>> make[1]: *** [scripts/Makefile.build:293: /var/lib/dkms/wireguard/0.0.20181119/build/main.o] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or directory
>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction: `lock_prefix xaddq %rax,peer_counter(%rip)'
>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction: `lock_prefix orb $32,1592(%rbx)'
>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction: `lock_prefix andb $-2,1592(%rbx)'
>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction: `lock_prefix andb $-9,1592(%rbx)'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=".L15"key="descriptor.66338+40"branch="0"'
>> ./include/linux/netdevice.h:515: Error: no such instruction: `asm_bug ins=".byte 0x0f, 0x0b"file=.LC0 line=515 flags=0 size=12'
>> ./include/linux/netdevice.h:515: Error: no such instruction: `annotate_unreachable counter=80'
>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction: `lock_prefix cmpxchgl %ecx,(%rdx)'
>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction: `refcount_error counter="(%rdx)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 1528(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="1528(%rbx)"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=".L61"key="descriptor.66372+40"branch="0"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 1528(%rdi)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="1528(%rdi)"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=".L80"key="descriptor.66372+40"branch="0"'
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or directory
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 4(%rdi)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="4(%rdi)"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=".L6"key="descriptor.67356+40"branch="0"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=".L32"key="descriptor.67420+40"branch="0"'
>> ./arch/x86/include/asm/refcount.h:65: Error: no such instruction: `lock_prefix incl 4(%rdi)'
>> ./arch/x86/include/asm/refcount.h:66: Error: no such instruction: `refcount_check_lt_zero counter="4(%rdi)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 4(%rdi)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="4(%rdi)"'
>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such instruction: `asm_bug ins=".byte 0x0f, 0x0b"file=.LC7 line=404 flags=2305 size=12'
>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such instruction: `annotate_reachable counter=163'
>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction: `lock_prefix orb $32,328(%rax)'
>> make[1]: *** [scripts/Makefile.build:293: /var/lib/dkms/wireguard/0.0.20181119/build/peer.o] Error 1
>> make[1]: *** [scripts/Makefile.build:293: /var/lib/dkms/wireguard/0.0.20181119/build/device.o] Error 1
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or directory
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="680(%rbx)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="680(%rbx)"'
>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction: `lock_prefix cmpxchgl %ecx,(%rdx)'
>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction: `refcount_error counter="(%rdx)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter="680(%rbx)"'
>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction: `lock_prefix xaddq %rax,keypair_counter(%rip)'
>> make[1]: *** [scripts/Makefile.build:293: /var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1
>> make: *** [Makefile:1565: _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2
>> make: Leaving directory '/usr/src/linux-headers-4.20.0-rc4'
>>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
