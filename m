Return-Path: <SRS0=FlPj=7X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B65DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Jun 2020 10:42:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747F020656
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Jun 2020 10:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ginkel.com header.i=@ginkel.com header.b="kEHELZXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747F020656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ginkel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fd3a530;
	Wed, 10 Jun 2020 10:24:33 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e586f2bf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jun 2020 10:24:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c21so1170424lfb.3
 for <wireguard@lists.zx2c4.com>; Wed, 10 Jun 2020 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ginkel.com; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=b70QCre1CuWuWwuABjAKVCI5lGqLSoyY641GAvg14to=;
 b=kEHELZXvrn24GaZ43Zjrba7kSAqRICml+NrOe7rgaecDUTFhQXp65VOBgn/7NVIeJd
 llcergHXs5Vsjljx4lIKlvgk7bs2mUDL5O2+KSiIzGS009r0P248iOlMJD+DYwJ9EFsL
 3kDGXVxaY9dThQv8wO1ldwStjHzSiw5hG76Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=b70QCre1CuWuWwuABjAKVCI5lGqLSoyY641GAvg14to=;
 b=V6gnXIQm5oy3eCfcIIYTrb7yqZlUuMKlCBS2aapmC73WPvbydKpEtydF5zg/XtRTgv
 Gam7nlfd0fyfRC1KwNBGGiUmNkL9b9uTWGfOUu9sW0Jl9xdbgsLDVHUbZFeBpoULxidN
 eY5Bn25A9+SYNPEc5fgGh3w3fN/3PvXx7p4UA+67dvrb7MLtqyzLHRMmIcKDACUeSBor
 h9yJLrS3VDLmNp0jcMfvcCJLILWQcyMpagIGZw1eZZ7720vJK2dgKCKoOzT7Fm1nF5cK
 tKLPIFe3AV8T4q8iSJG1YrYgI9AFMjObq7VYIfcPp9EnQgHx3cMB8io2cCRvkuU/bl16
 hX9w==
X-Gm-Message-State: AOAM532F0DKx3LY0jtbd+JhB2YOlXyCW6NcvWtTzY6PRXluyXuV8cm/C
 h1taMKzhagApQ4cLxAHLnn8OgxEDg25+db6jYqvoBqLEH3s=
X-Google-Smtp-Source: ABdhPJwEhMotll9V+9fN911s22s2T6c1ZZje8cwVTX3EjVPY4YX0+BLp4yV1kiALGlCjcH2X52YY+ecTtYwu4Vag+58=
X-Received: by 2002:ac2:4886:: with SMTP id x6mr1395825lfc.198.1591785700046; 
 Wed, 10 Jun 2020 03:41:40 -0700 (PDT)
MIME-Version: 1.0
From: Thilo-Alexander Ginkel <thilo@ginkel.com>
Date: Wed, 10 Jun 2020 12:41:24 +0200
Message-ID: <CANvSZQ97BG02tHyTUBf46XUfJKXArx-gaKe-R2ao0UEUoh55LA@mail.gmail.com>
Subject: Ubuntu 18.04 kernel 4.15.0-106-generic breaks wireguard-1.0.20200520
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi there,

after updating to the current Ubuntu 18.04 kernel 4.15.0-106-generic
kernel wireguard-dkms no longer compiles with the following build
failure:

DKMS make.log for wireguard-1.0.20200520 for kernel 4.15.0-106-generic (x86=
_64)
Wed Jun 10 12:32:13 CEST 2020
make: Entering directory '/usr/src/linux-headers-4.15.0-106-generic'
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/main.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/peerlookup.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/allowedips.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/ratelimiter.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/cookie.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/netlink.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/crypto/zinc/chacha20/c=
hacha20.o
  PERLASM /var/lib/dkms/wireguard/1.0.20200520/build/crypto/zinc/chacha20/c=
hacha20-x86_64.S
  CC [M]  /var/lib/dkms/wireguard/1.0.20200520/build/crypto/zinc/poly1305/p=
oly1305.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/1.0.20200520/build/socket.c: In function =E2=80=98s=
end6=E2=80=99:
/var/lib/dkms/wireguard/1.0.20200520/build/compat/compat.h:102:42:
error: =E2=80=98const struct ipv6_stub=E2=80=99 has no member named =E2=80=
=98ipv6_dst_lookup=E2=80=99;
did you mean =E2=80=98ipv6_dst_lookup_flow=E2=80=99?
 #define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup(a, b, &dst,
c) + (void *)0 ?: dst
                                          ^
/var/lib/dkms/wireguard/1.0.20200520/build/socket.c:139:20: note: in
expansion of macro =E2=80=98ipv6_dst_lookup_flow=E2=80=99
   dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                    ^~~~~~~~~~~~~~~~~~~~
scripts/Makefile.build:330: recipe for target
'/var/lib/dkms/wireguard/1.0.20200520/build/socket.o' failed
make[1]: *** [/var/lib/dkms/wireguard/1.0.20200520/build/socket.o] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1577: recipe for target
'_module_/var/lib/dkms/wireguard/1.0.20200520/build' failed
make: *** [_module_/var/lib/dkms/wireguard/1.0.20200520/build] Error 2
make: Leaving directory '/usr/src/linux-headers-4.15.0-106-generic'

Regards,
Thilo
