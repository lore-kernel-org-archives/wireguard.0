Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529C8C43140
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:10:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EADF52081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+frNk7i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EADF52081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 793e8957;
	Fri, 6 Sep 2019 19:09:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15f0c631
 for <wireguard@lists.zx2c4.com>; Tue, 3 Sep 2019 22:07:28 +0000 (UTC)
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3f3b188
 for <wireguard@lists.zx2c4.com>; Tue, 3 Sep 2019 22:07:28 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id v78so1219017vke.4
 for <wireguard@lists.zx2c4.com>; Tue, 03 Sep 2019 15:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L0TzyhSAJPtDO+4K2efkICWQD3JIavkYZKIdURHMBFA=;
 b=C+frNk7iGF6sJB3+znmEu935I8r5MXiSHbF9gJCTqq2876+DF/SH3wW/tFVGqy9bk+
 tb15xb+1YixlkNCkvOAanVGeTAu4J8HNyNJUku7ophb2NZAzo0zNihbGOeP5swJ9AqsP
 lMm6AJYZ+OnG/dCi21DzVsQoYTW917jj1jX3TJxZrg6MOeoERhOTX6K2FKAtLWjAxS1u
 AlJJdemoqnyxlbX85asm1a8B/3uUEZk1kH/fcNozzhRdj7WTr9xHMrxNbV6H3i73/Adx
 wz71biSemScXEOY/BmK3rwirQe8IfItpIvsQtubdk76ImVF5txyfkJoW5F36zqOHBMDx
 ux+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L0TzyhSAJPtDO+4K2efkICWQD3JIavkYZKIdURHMBFA=;
 b=bdGJFywjlNJxdGGtIQtUXIKCo5eJaFLhr9Dg3fRkv+k7GKcVFuTZy6VbJ/w0cJA1+Z
 kinYRNx6xB3n698IWqK+7ixjsV053TAC4KgF4k5tccrMQejwbaR1w+KKVDau0KcCTOeQ
 ASvkbSxdg5r1HlIR0c21ftlL5FCNWNAsd4/hUmZ5cbgBR/u+7KFshJ54c/oNy9QvlqKX
 igiKg2EModbwnPFxBxVQT4lSA8VltByVwWBkNnJGfV7ZdVYe4kvRpLHJ+z4f9JSJRcPO
 nQc7HB+tBdh9t0zpXedRNMGkLYGRtmFy45ke90d+K5YUcALmkvE2fCNw+wX/BVlxGXiJ
 WtjQ==
X-Gm-Message-State: APjAAAWzoJ0e4CLWfxtrax2hRLz4A7qpnzduOTMkzkd/U/ZHOEIpjv7H
 W5fsKQAkcCSJsNcbqaz7h4gZe9xVgAWYCvla3EIbZD3U
X-Google-Smtp-Source: APXvYqxfvNkR1iNXQ1rX3v+Ja4ozBi65tqham1sl/Ue+sGNLPqDI5ezhuFhEATObK4BPVKt496U7C3k/E3D8NqkzwLc=
X-Received: by 2002:a1f:d586:: with SMTP id m128mr18110424vkg.24.1567548447125; 
 Tue, 03 Sep 2019 15:07:27 -0700 (PDT)
MIME-Version: 1.0
From: Felix Tang <felix.gofaster@gmail.com>
Date: Tue, 3 Sep 2019 18:07:16 -0400
Message-ID: <CALJizUN=-NyTqegwwjez9X_OZtr_CLzjDDbVoCwkBLBPsortOA@mail.gmail.com>
Subject: dkms build failure - Ubuntu 16.04 kernel 4.4.0-161-generic
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:09:09 +0200
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
Content-Type: multipart/mixed; boundary="===============0207037889591764365=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0207037889591764365==
Content-Type: multipart/alternative; boundary="0000000000005bf86a0591ad507f"

--0000000000005bf86a0591ad507f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi -

The wireguard dkms build failed with a recent Ubuntu 16.04 kernel upgrade
4.4.0-161-generic.  The build was successful with the previous kernel
4.4.0-159-generic.

---

* dkms: running auto installation service for kernel 4.4.0-161-generic

Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area....
make KERNELRELEASE=3D4.4.0-161-generic -C
/lib/modules/4.4.0-161-generic/build
M=3D/var/lib/dkms/wireguard/0.0.20190702/build......(bad exit status: 2)
ERROR: Cannot create report: [Errno 17] File exists:
'/var/crash/wireguard-dkms.0.crash'
Error! Bad return status for module build on kernel: 4.4.0-161-generic
(x86_64)
Consult /var/lib/dkms/wireguard/0.0.20190702/build/make.log for more
information.
   ...done.

---

$ cat /var/crash/wireguard-dkms.0.crash
ProblemType: Package
DKMSBuildLog:
 DKMS make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-generic
(x86_64)
 Mon Sep  2 18:20:16 EDT 2019
 make: Entering directory '/usr/src/linux-headers-4.4.0-161-generic'
   LD      /var/lib/dkms/wireguard/0.0.20190702/build/built-in.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/main.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/noise.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/device.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/peer.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/timers.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/queueing.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/send.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/receive.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/socket.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/peerlookup.o
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.o
 /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
=E2=80=98root_remove_peer_lists=E2=80=99:
 /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:72:1: warning: the
frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
  }
  ^
 /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
=E2=80=98root_free_rcu=E2=80=99:
 /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:59:1: warning: the
frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
  }
  ^
 /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
=E2=80=98walk_remove_by_peer.isra.3=E2=80=99:
 /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:126:1: warning:
the frame size of 1032 bytes is larger than 1024 bytes
[-Wframe-larger-than=3D]
  }
  ^
   CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o
 /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error:
unknown type name =E2=80=98hsiphash_key_t=E2=80=99
  static hsiphash_key_t key;
         ^
 /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In function
=E2=80=98wg_ratelimiter_allow=E2=80=99:
 /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: error:
implicit declaration of function =E2=80=98hsiphash_2u32=E2=80=99
[-Werror=3Dimplicit-function-declaration]
    bucket =3D &table_v4[hsiphash_2u32(net_word, ip, &key) &
                       ^
 /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:116:22: error:
implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=99
[-Werror=3Dimplicit-function-declaration]
    bucket =3D &table_v6[hsiphash_3u32(net_word, ip >> 32, ip, &key) &
                       ^
 cc1: some warnings being treated as errors
 scripts/Makefile.build:285: recipe for target
'/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o' failed
 make[1]: *** [/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o]
Error 1
 Makefile:1454: recipe for target
'_module_/var/lib/dkms/wireguard/0.0.20190702/build' failed
 make: *** [_module_/var/lib/dkms/wireguard/0.0.20190702/build] Error 2
 make: Leaving directory '/usr/src/linux-headers-4.4.0-161-generic'
DKMSKernelVersion: 4.4.0-161-generic
Date: Mon Sep  2 18:20:27 2019
DuplicateSignature:
dkms:wireguard-dkms:0.0.20190702-wg1~xenial:/var/lib/dkms/wireguard/0.0.201=
90702/build/ratelimiter.c:25:8:
error: unknown type name =E2=80=98hsiphash_key_t=E2=80=99
Package: wireguard-dkms 0.0.20190702-wg1~xenial
PackageVersion: 0.0.20190702-wg1~xenial
SourcePackage: wireguard
Title: wireguard-dkms 0.0.20190702-wg1~xenial: wireguard kernel module
failed to build

---

$ cat  /var/lib/dkms/wireguard/0.0.20190702/build/make.log
DKMS make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-generic
(x86_64)
Tue Sep  3 15:36:39 EDT 2019
make: Entering directory '/usr/src/linux-headers-4.4.0-161-generic'
  LD      /var/lib/dkms/wireguard/0.0.20190702/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/send.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/peerlookup.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.o
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
=E2=80=98root_remove_peer_lists=E2=80=99:
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:72:1: warning: the
frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
 }
 ^
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
=E2=80=98root_free_rcu=E2=80=99:
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:59:1: warning: the
frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
 }
 ^
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
=E2=80=98walk_remove_by_peer.isra.3=E2=80=99:
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:126:1: warning: the
frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
 }
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o
/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error:
unknown type name =E2=80=98hsiphash_key_t=E2=80=99
 static hsiphash_key_t key;
        ^
/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In function
=E2=80=98wg_ratelimiter_allow=E2=80=99:
/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: error:
implicit declaration of function =E2=80=98hsiphash_2u32=E2=80=99
[-Werror=3Dimplicit-function-declaration]
   bucket =3D &table_v4[hsiphash_2u32(net_word, ip, &key) &
                      ^
/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:116:22: error:
implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=99
[-Werror=3Dimplicit-function-declaration]
   bucket =3D &table_v6[hsiphash_3u32(net_word, ip >> 32, ip, &key) &
                      ^
cc1: some warnings being treated as errors
scripts/Makefile.build:285: recipe for target
'/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o' failed
make[1]: *** [/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o]
Error 1
Makefile:1454: recipe for target
'_module_/var/lib/dkms/wireguard/0.0.20190702/build' failed
make: *** [_module_/var/lib/dkms/wireguard/0.0.20190702/build] Error 2
make: Leaving directory '/usr/src/linux-headers-4.4.0-161-generic'

--
# lsb_release --all
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.6 LTS
Release:        16.04
Codename:       xenial
---

# apt list |grep wireguard|grep installed
wireguard-dkms/xenial,xenial,now 0.0.20190702-wg1~xenial all
[installed,automatic]
wireguard-tools/xenial,now 0.0.20190702-wg1~xenial amd64 [installed]

--0000000000005bf86a0591ad507f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"monospace">Hi -=C2=A0=C2=A0</font></div=
><div><font face=3D"monospace"><br></font></div><div><font face=3D"monospac=
e">The wireguard dkms build failed with a recent Ubuntu 16.04 kernel upgrad=
e 4.4.0-161-generic.=C2=A0 The build was successful with the previous kerne=
l 4.4.0-159-generic.</font></div><div><font face=3D"monospace"><br></font><=
/div><div><font face=3D"monospace">---</font></div><font face=3D"monospace"=
><div><font face=3D"monospace"><br></font></div>* dkms: running auto instal=
lation service for kernel 4.4.0-161-generic<br><br>Kernel preparation unnec=
essary for this kernel.=C2=A0 Skipping...<br><br>Building module:<br>cleani=
ng build area....<br>make KERNELRELEASE=3D4.4.0-161-generic -C /lib/modules=
/4.4.0-161-generic/build M=3D/var/lib/dkms/wireguard/0.0.20190702/build....=
..(bad exit status: 2)<br>ERROR: Cannot create report: [Errno 17] File exis=
ts: &#39;/var/crash/wireguard-dkms.0.crash&#39;<br>Error! Bad return status=
 for module build on kernel: 4.4.0-161-generic (x86_64)<br>Consult /var/lib=
/dkms/wireguard/0.0.20190702/build/make.log for more information.<br>=C2=A0=
 =C2=A0...done.<br><br>---<br><br>$ cat /var/crash/wireguard-dkms.0.crash<b=
r>ProblemType: Package<br>DKMSBuildLog:<br>=C2=A0DKMS make.log for wireguar=
d-0.0.20190702 for kernel 4.4.0-161-generic (x86_64)<br>=C2=A0Mon Sep =C2=
=A02 18:20:16 EDT 2019<br>=C2=A0make: Entering directory &#39;/usr/src/linu=
x-headers-4.4.0-161-generic&#39;<br>=C2=A0 =C2=A0LD =C2=A0 =C2=A0 =C2=A0/va=
r/lib/dkms/wireguard/0.0.20190702/build/built-in.o<br>=C2=A0 =C2=A0CC [M] =
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/main.o<br>=C2=A0 =C2=A0CC =
[M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/noise.o<br>=C2=A0 =C2=
=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/device.o<br>=C2=
=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/peer.o<br=
>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/timer=
s.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build=
/queueing.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.201907=
02/build/send.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20=
190702/build/receive.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard=
/0.0.20190702/build/socket.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wir=
eguard/0.0.20190702/build/peerlookup.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/li=
b/dkms/wireguard/0.0.20190702/build/allowedips.o<br>=C2=A0/var/lib/dkms/wir=
eguard/0.0.20190702/build/allowedips.c: In function =E2=80=98root_remove_pe=
er_lists=E2=80=99:<br>=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allo=
wedips.c:72:1: warning: the frame size of 1048 bytes is larger than 1024 by=
tes [-Wframe-larger-than=3D]<br>=C2=A0 }<br>=C2=A0 ^<br>=C2=A0/var/lib/dkms=
/wireguard/0.0.20190702/build/allowedips.c: In function =E2=80=98root_free_=
rcu=E2=80=99:<br>=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedip=
s.c:59:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [=
-Wframe-larger-than=3D]<br>=C2=A0 }<br>=C2=A0 ^<br>=C2=A0/var/lib/dkms/wire=
guard/0.0.20190702/build/allowedips.c: In function =E2=80=98walk_remove_by_=
peer.isra.3=E2=80=99:<br>=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/a=
llowedips.c:126:1: warning: the frame size of 1032 bytes is larger than 102=
4 bytes [-Wframe-larger-than=3D]<br>=C2=A0 }<br>=C2=A0 ^<br>=C2=A0 =C2=A0CC=
 [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o<br>=C2=
=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error: un=
known type name =E2=80=98hsiphash_key_t=E2=80=99<br>=C2=A0 static hsiphash_=
key_t key;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>=C2=A0/var/lib/dkms/wi=
reguard/0.0.20190702/build/ratelimiter.c: In function =E2=80=98wg_ratelimit=
er_allow=E2=80=99:<br>=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/rate=
limiter.c:109:22: error: implicit declaration of function =E2=80=98hsiphash=
_2u32=E2=80=99 [-Werror=3Dimplicit-function-declaration]<br>=C2=A0 =C2=A0 b=
ucket =3D &amp;table_v4[hsiphash_2u32(net_word, ip, &amp;key) &amp;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^<br>=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:1=
16:22: error: implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=
=99 [-Werror=3Dimplicit-function-declaration]<br>=C2=A0 =C2=A0 bucket =3D &=
amp;table_v6[hsiphash_3u32(net_word, ip &gt;&gt; 32, ip, &amp;key) &amp;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>=C2=A0cc1: some warnings being treated as errors<br>=C2=A0sc=
ripts/Makefile.build:285: recipe for target &#39;/var/lib/dkms/wireguard/0.=
0.20190702/build/ratelimiter.o&#39; failed<br>=C2=A0make[1]: *** [/var/lib/=
dkms/wireguard/0.0.20190702/build/ratelimiter.o] Error 1<br>=C2=A0Makefile:=
1454: recipe for target &#39;_module_/var/lib/dkms/wireguard/0.0.20190702/b=
uild&#39; failed<br>=C2=A0make: *** [_module_/var/lib/dkms/wireguard/0.0.20=
190702/build] Error 2<br>=C2=A0make: Leaving directory &#39;/usr/src/linux-=
headers-4.4.0-161-generic&#39;<br>DKMSKernelVersion: 4.4.0-161-generic<br>D=
ate: Mon Sep =C2=A02 18:20:27 2019<br>DuplicateSignature: dkms:wireguard-dk=
ms:0.0.20190702-wg1~xenial:/var/lib/dkms/wireguard/0.0.20190702/build/ratel=
imiter.c:25:8: error: unknown type name =E2=80=98hsiphash_key_t=E2=80=99<br=
>Package: wireguard-dkms 0.0.20190702-wg1~xenial<br>PackageVersion: 0.0.201=
90702-wg1~xenial<br>SourcePackage: wireguard<br>Title: wireguard-dkms 0.0.2=
0190702-wg1~xenial: wireguard kernel module failed to build<br><br>---<br><=
br>$ cat =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/make.log<br>DKMS =
make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-generic (x86_64)<b=
r>Tue Sep =C2=A03 15:36:39 EDT 2019<br>make: Entering directory &#39;/usr/s=
rc/linux-headers-4.4.0-161-generic&#39;<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/v=
ar/lib/dkms/wireguard/0.0.20190702/build/built-in.o<br>=C2=A0 CC [M] =C2=A0=
/var/lib/dkms/wireguard/0.0.20190702/build/main.o<br>=C2=A0 CC [M] =C2=A0/v=
ar/lib/dkms/wireguard/0.0.20190702/build/noise.o<br>=C2=A0 CC [M] =C2=A0/va=
r/lib/dkms/wireguard/0.0.20190702/build/device.o<br>=C2=A0 CC [M] =C2=A0/va=
r/lib/dkms/wireguard/0.0.20190702/build/peer.o<br>=C2=A0 CC [M] =C2=A0/var/=
lib/dkms/wireguard/0.0.20190702/build/timers.o<br>=C2=A0 CC [M] =C2=A0/var/=
lib/dkms/wireguard/0.0.20190702/build/queueing.o<br>=C2=A0 CC [M] =C2=A0/va=
r/lib/dkms/wireguard/0.0.20190702/build/send.o<br>=C2=A0 CC [M] =C2=A0/var/=
lib/dkms/wireguard/0.0.20190702/build/receive.o<br>=C2=A0 CC [M] =C2=A0/var=
/lib/dkms/wireguard/0.0.20190702/build/socket.o<br>=C2=A0 CC [M] =C2=A0/var=
/lib/dkms/wireguard/0.0.20190702/build/peerlookup.o<br>=C2=A0 CC [M] =C2=A0=
/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.o<br>/var/lib/dkms/wi=
reguard/0.0.20190702/build/allowedips.c: In function =E2=80=98root_remove_p=
eer_lists=E2=80=99:<br>/var/lib/dkms/wireguard/0.0.20190702/build/allowedip=
s.c:72:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [=
-Wframe-larger-than=3D]<br>=C2=A0}<br>=C2=A0^<br>/var/lib/dkms/wireguard/0.=
0.20190702/build/allowedips.c: In function =E2=80=98root_free_rcu=E2=80=99:=
<br>/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:59:1: warning: =
the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=
=3D]<br>=C2=A0}<br>=C2=A0^<br>/var/lib/dkms/wireguard/0.0.20190702/build/al=
lowedips.c: In function =E2=80=98walk_remove_by_peer.isra.3=E2=80=99:<br>/v=
ar/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:126:1: warning: the f=
rame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]<=
br>=C2=A0}<br>=C2=A0^<br>=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20=
190702/build/ratelimiter.o<br>/var/lib/dkms/wireguard/0.0.20190702/build/ra=
telimiter.c:25:8: error: unknown type name =E2=80=98hsiphash_key_t=E2=80=99=
<br>=C2=A0static hsiphash_key_t key;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>/v=
ar/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In function =E2=80=
=98wg_ratelimiter_allow=E2=80=99:<br>/var/lib/dkms/wireguard/0.0.20190702/b=
uild/ratelimiter.c:109:22: error: implicit declaration of function =E2=80=
=98hsiphash_2u32=E2=80=99 [-Werror=3Dimplicit-function-declaration]<br>=C2=
=A0 =C2=A0bucket =3D &amp;table_v4[hsiphash_2u32(net_word, ip, &amp;key) &a=
mp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:11=
6:22: error: implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=
=99 [-Werror=3Dimplicit-function-declaration]<br>=C2=A0 =C2=A0bucket =3D &a=
mp;table_v6[hsiphash_3u32(net_word, ip &gt;&gt; 32, ip, &amp;key) &amp;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^<br>cc1: some warnings being treated as errors<br>scripts/Makefile.bui=
ld:285: recipe for target &#39;/var/lib/dkms/wireguard/0.0.20190702/build/r=
atelimiter.o&#39; failed<br>make[1]: *** [/var/lib/dkms/wireguard/0.0.20190=
702/build/ratelimiter.o] Error 1<br>Makefile:1454: recipe for target &#39;_=
module_/var/lib/dkms/wireguard/0.0.20190702/build&#39; failed<br>make: *** =
[_module_/var/lib/dkms/wireguard/0.0.20190702/build] Error 2<br>make: Leavi=
ng directory &#39;/usr/src/linux-headers-4.4.0-161-generic&#39;<br></font><=
div class=3D"gmail-yj6qo"></div><div class=3D"gmail-adL"><br></div><div cla=
ss=3D"gmail-adL">--</div><div class=3D"gmail-adL"><span style=3D"font-famil=
y:monospace"># lsb_release --all</span><br></div><div class=3D"gmail-adL"><=
font face=3D"monospace">No LSB modules are available.<br>Distributor ID: Ub=
untu<br>Description: =C2=A0 =C2=A0Ubuntu 16.04.6 LTS<br>Release: =C2=A0 =C2=
=A0 =C2=A0 =C2=A016.04<br>Codename: =C2=A0 =C2=A0 =C2=A0 xenial</font><br><=
/div><div class=3D"gmail-adL"><span style=3D"font-family:monospace">---</sp=
an><br></div><div class=3D"gmail-adL"><span style=3D"font-family:monospace"=
><br></span></div><div class=3D"gmail-adL"><font face=3D"monospace"># apt l=
ist |grep wireguard|grep installed<br>wireguard-dkms/xenial,xenial,now 0.0.=
20190702-wg1~xenial all [installed,automatic]<br>wireguard-tools/xenial,now=
 0.0.20190702-wg1~xenial amd64 [installed]</font><br></div></div>

--0000000000005bf86a0591ad507f--

--===============0207037889591764365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0207037889591764365==--
