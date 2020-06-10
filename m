Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08916C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:50:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437592073E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=icymint.me header.i=@icymint.me header.b="RBoUc6vq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 437592073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=icymint.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dec4ee7;
	Wed, 17 Jun 2020 07:26:47 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 97a26011
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jun 2020 15:17:53 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y17so1087948plb.8
 for <wireguard@lists.zx2c4.com>; Wed, 10 Jun 2020 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icymint.me; s=icymint;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=MiSEXgDY7Mhjx7o9ZWuOTvsb4LqIUQ8Ktbdbv0TEerg=;
 b=RBoUc6vq9s8VLHU4C0xAFs1HgRHjRzH/C/vVEdtvZYU3J82PfRNPtKZnqccgSw8X2K
 bbbEJOPGGqUKik7mS1Ylo1DyFv+RNNVAmu1fFjbg/hCqqcp5sZu3d6zgnryIQcFE1alI
 RmLr2EwOzVoFa/lzFf5VgJJEyB+ShJpLQ2id4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=MiSEXgDY7Mhjx7o9ZWuOTvsb4LqIUQ8Ktbdbv0TEerg=;
 b=uWcFnYkiQzpxuVFVJmQpfxGEQc129lE+UJIEMECAfCDh0jDB4m6TzOqiVJ+/3GqGlV
 TVnO9AtowrCO4VJd55j7DqIQre9ZG95X9hw7pAwhUZXdyMJQCBId19x0YsWlpXTTTu0N
 SVz5unRnZLsV26a0mjrqEcgfGVajNPOrGPuJHBXg/6Twxmu2dQPiu5V35gElmFSlfjtD
 3O/aVrSSsiJxUU0kFvDab7xXz2Ge7srMwBhJi7VqKYv4r8xu+tIfGWhSvzDlvwMorr9Y
 eKDep7KlpPBe09XJ0uHRG55oLsl7V99gdDAftMRO6OvfSYI6vuSn2+9yo+GVvmATvp9w
 4e/Q==
X-Gm-Message-State: AOAM532PlCZtwWBdo5DP+2Ol4u9IuGQjD5lHT38tgse/rF0mqQTfuTdV
 hUfbUXHvucX6+UhXU1XeWR56Bw1fxI0=
X-Google-Smtp-Source: ABdhPJwzRx3fpgfkezy0d8EuFN72qV3FzJxb4zONpckSLDAR3/hJRsxLDCRvJnLaOrEovBDlcnHQng==
X-Received: by 2002:a17:90a:2222:: with SMTP id
 c31mr3509512pje.200.1591803304033; 
 Wed, 10 Jun 2020 08:35:04 -0700 (PDT)
Received: from [240.0.0.1] (163.181.194.35.bc.googleusercontent.com.
 [35.194.181.163])
 by smtp.gmail.com with ESMTPSA id 124sm289477pfb.15.2020.06.10.08.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 08:35:03 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: YU News <news@icymint.me>
Mime-Version: 1.0 (1.0)
Subject: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
Date: Wed, 10 Jun 2020 23:34:59 +0800
Message-Id: <5BEE97FA-EF67-4C9A-BD4C-7B0AC9D625EB@icymint.me>
References: <CANvSZQ97BG02tHyTUBf46XUfJKXArx-gaKe-R2ao0UEUoh55LA@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CANvSZQ97BG02tHyTUBf46XUfJKXArx-gaKe-R2ao0UEUoh55LA@mail.gmail.com>
To: Thilo-Alexander Ginkel <thilo@ginkel.com>
X-Mailer: iPhone Mail (17F75)
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:35 +0200
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

Also breaks Ubuntu 16.04 kernel 4.4.0-184

DKMS make.log for wireguard-1.0.20200520 for kernel 4.4.0-184-generic (x86_6=
4)
Wed Jun 10 22:30:23 CST 2020
make: Entering directory '/usr/src/linux-headers-4.4.0-184-generic'
  LD      /var/lib/dkms/wireguard/1.0.20200520/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/main.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/socket.o
/var/lib/dkms/wireguard/1.0.20200520/build/socket.c: In function =E2=80=98se=
nd6=E2=80=99:
/var/lib/dkms/wireguard/1.0.20200520/build/socket.c:139:18: error: =E2=80=98=
const struct ipv6_stub=E2=80=99 has no member named =E2=80=98ipv6_dst_lookup=
=E2=80=99
   dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                  ^
scripts/Makefile.build:285: recipe for target '/var/lib/dkms/wireguard/1.0.2=
0200520/build/socket.o' failed
make[1]: *** [/var/lib/dkms/wireguard/1.0.20200520/build/socket.o] Error 1
Makefile:1457: recipe for target '_module_/var/lib/dkms/wireguard/1.0.202005=
20/build' failed
make: *** [_module_/var/lib/dkms/wireguard/1.0.20200520/build] Error 2
make: Leaving directory '/usr/src/linux-headers-4.4.0-184-generic'

> =E5=9C=A8 2020=E5=B9=B46=E6=9C=8810=E6=97=A5=EF=BC=8C18:53=EF=BC=8CThilo-A=
lexander Ginkel <thilo@ginkel.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFHi there,
>=20
> after updating to the current Ubuntu 18.04 kernel 4.15.0-106-generic
> kernel wireguard-dkms no longer compiles with the following build
> failure:
>=20
> DKMS make.log for wireguard-1.0.20200520 for kernel 4.15.0-106-generic (x8=
6_64)
> Wed Jun 10 12:32:13 CEST 2020
> make: Entering directory '/usr/src/linux-headers-4.15.0-106-generic'
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/main.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/noise.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/device.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/peer.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/timers.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/queueing.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/send.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/receive.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/socket.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/peerlookup.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/allowedips.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/ratelimiter.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/cookie.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/netlink.o
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/crypto/zinc/chacha20/c=
hacha20.o
>  PERLASM /var/lib/dkms/wireguard/1.0.20200520/build/crypto/zinc/chacha20/c=
hacha20-x86_64.S
>  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/crypto/zinc/poly1305/p=
oly1305.o
> In file included from <command-line>:0:0:
> /var/lib/dkms/wireguard/1.0.20200520/build/socket.c: In function =E2=80=98=
send6=E2=80=99:
> /var/lib/dkms/wireguard/1.0.20200520/build/compat/compat.h:102:42:
> error: =E2=80=98const struct ipv6_stub=E2=80=99 has no member named =E2=80=
=98ipv6_dst_lookup=E2=80=99;
> did you mean =E2=80=98ipv6_dst_lookup_flow=E2=80=99?
> #define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup(a, b, &dst,
> c) + (void *)0 ?: dst
>                                          ^
> /var/lib/dkms/wireguard/1.0.20200520/build/socket.c:139:20: note: in
> expansion of macro =E2=80=98ipv6_dst_lookup_flow=E2=80=99
>   dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
>                    ^~~~~~~~~~~~~~~~~~~~
> scripts/Makefile.build:330: recipe for target
> '/var/lib/dkms/wireguard/1.0.20200520/build/socket.o' failed
> make[1]: *** [/var/lib/dkms/wireguard/1.0.20200520/build/socket.o] Error 1=

> make[1]: *** Waiting for unfinished jobs....
> Makefile:1577: recipe for target
> '_module_/var/lib/dkms/wireguard/1.0.20200520/build' failed
> make: *** [_module_/var/lib/dkms/wireguard/1.0.20200520/build] Error 2
> make: Leaving directory '/usr/src/linux-headers-4.15.0-106-generic'
>=20
> Regards,
> Thilo
