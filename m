Return-Path: <SRS0=49e1=GP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A88C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jan 2021 10:02:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52486206FA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jan 2021 10:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52486206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c705998;
	Tue, 12 Jan 2021 09:57:42 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e61afab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jan 2021 09:57:40 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id w26so2187045ljo.4
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jan 2021 01:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e8gdqRxdJwRq6hziaAMGFd6vXkQq3Hyh0keC/4h+n6M=;
 b=bTOhc53cNj+yn/4y4sexNCU80oTsfplqO+O9Bl8YhwxflXLVgltzK8SWKCF1tmnLfI
 BGoSy7GYQXHzJMYqfuzXPaiVu8e/y2gGK4jjJg2R6XLW/tydRnqh4tuW0VGljqBoVC4s
 B2gqkbCMyJIGOCKE4MfK0gyzDjDaVhNb61UN6KWol7ap8oWNNDFaG0Vq5w2hxMGsAx/i
 D8Nyx6lqz45A3MwoAmXgtQ9JuqzjdelSWHiWu3u/xvAFqeT591DUv3RWSHOEbGUtJVOZ
 zEXvje5gjej0rMX66fgX3JXEt5XJnMJlYC1qNtMuYS1vqAQK8jBrzjH6o14nBy7KLmiQ
 DAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8gdqRxdJwRq6hziaAMGFd6vXkQq3Hyh0keC/4h+n6M=;
 b=XFIkBDrkXQVcdmu6qfANRl/ulihKtvrLRH76xcc83kO/gBRAxQ6RKullO/Mc6vhZ7e
 jmDt/g0TILvoYmDRFrD7x51H0hRd45Glv0VhLzEbm7PAR3OuVeBPmwDmNT8/7Aji7KDQ
 28gJmKQSMow0HBK5WQ/gRZdD1g7woXEZ8bBJfpX5y+ilYp/XRSLISY1BS4cQ5xKO4eEj
 lIOUvj9F36CheaxjgTwEdzg3LU43VJFuHobK0XEtzeKK0bfKIIgIXSBccdAfDihAwdiN
 9bl882Dpsamr9QaZ7eepymiAp7+mF79PjS/aXOFBKjnL4wM5tZgMO1lwpGF7kuBAHvoZ
 AgMA==
X-Gm-Message-State: AOAM531wVwbxpDiJHrt58ysIiKXPJPRZrch/xSOsefaKOwehccpk5pW1
 nTU6MzcVl66YBaDwTAV8PLDTeY8CIxsnl4XaoCFl2sCap7V59A==
X-Google-Smtp-Source: ABdhPJytgBy7tIWf+RGFldH2jp4lN8VRH5X+G8FxLkqyimkgqvmAGCnRg2lyzRvSJoUx9NeOZV8XIH0p83RNK5Dpy/g=
X-Received: by 2002:a2e:361a:: with SMTP id d26mr1692747lja.115.1610445459808; 
 Tue, 12 Jan 2021 01:57:39 -0800 (PST)
MIME-Version: 1.0
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
In-Reply-To: <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
From: Christopher Ng <facboy@gmail.com>
Date: Tue, 12 Jan 2021 09:57:27 +0000
Message-ID: <CAN5wt5rqnPXwD5FdvoocxaXPvDOb_O2Fj_aBq98EKCc2R5JA1Q@mail.gmail.com>
Subject: Re: Wireguard not available for CentOS Stream
To: Joe Doss <joe@solidadmin.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

dkms doesn't work on CentOSStream at the moment:

DKMS make.log for wireguard-1.0.20201221 for kernel
4.18.0-259.el8.x86_64 (x86_64)
Tue 12 Jan 09:55:51 GMT 2021
make: Entering directory '/usr/src/kernels/4.18.0-259.el8.x86_64'
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/main.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/peerlookup.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/allowedips.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/ratelimiter.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/cookie.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/netlink.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/chacha20/chacha20.o
  PERLASM /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/chacha20/chacha20-x86_64.S
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/poly1305/poly1305.o
  PERLASM /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/poly1305/poly1305-x86_64.S
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/chacha20poly1305.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s.o
  AS [M]  /var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.o
In file included from <command-line>:
/var/lib/dkms/wireguard/1.0.20201221/build/compat/compat-asm.h:44:
warning: "SYM_FUNC_START" redefined
 #define SYM_FUNC_START ENTRY

In file included from
/var/lib/dkms/wireguard/1.0.20201221/build/compat/compat-asm.h:9,
                 from <command-line>:
./include/linux/linkage.h:218: note: this is the location of the
previous definition
 #define SYM_FUNC_START(name)    \

In file included from <command-line>:
/var/lib/dkms/wireguard/1.0.20201221/build/compat/compat-asm.h:45:
warning: "SYM_FUNC_END" redefined
 #define SYM_FUNC_END ENDPROC

In file included from
/var/lib/dkms/wireguard/1.0.20201221/build/compat/compat-asm.h:9,
                 from <command-line>:
./include/linux/linkage.h:265: note: this is the location of the
previous definition
 #define SYM_FUNC_END(name)    \

/var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.S:
Assembler messages:
/var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.S:50:
Error: invalid character '(' in mnemonic
/var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.S:176:
Error: invalid character '(' in mnemonic
/var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.S:180:
Error: invalid character '(' in mnemonic
/var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.S:257:
Error: invalid character '(' in mnemonic
make[1]: *** [scripts/Makefile.build:415:
/var/lib/dkms/wireguard/1.0.20201221/build/crypto/zinc/blake2s/blake2s-x86_64.o]
Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1545:
_module_/var/lib/dkms/wireguard/1.0.20201221/build] Error 2
make: Leaving directory '/usr/src/kernels/4.18.0-259.el8.x86_64'

On Mon, 4 Jan 2021 at 01:26, Joe Doss <joe@solidadmin.com> wrote:
>
> https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/
>
> The official DKMS install method for CentOS has a Stream repo enabled. It
> should work fine. Let us know if you have any issues.
>
> Joe
>
> On January 3, 2021 2:19:30 PM Silvan Nagl <mail@53c70r.de> wrote:
>
> > Hi,
> >
> > i noticed that no Wireguard installation source currently supports
> > CentOS Stream and its newer Kernels.
> > Will there be support for it?
> >
> > Greetings,
> >
> > Silvan
>
>
>
