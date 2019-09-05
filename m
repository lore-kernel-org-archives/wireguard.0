Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93D0C00307
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:10:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA172081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8kD2ffy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA172081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2db7cf12;
	Fri, 6 Sep 2019 19:08:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f66b78aa
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 16:43:00 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ac2279a
 for <wireguard@lists.zx2c4.com>; Thu, 5 Sep 2019 16:43:00 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v7so2411124oib.4
 for <wireguard@lists.zx2c4.com>; Thu, 05 Sep 2019 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bXY9d9Z6lnTlBIqSQasWGdUtHUQ5ZGPYcXRV2iyWXG4=;
 b=P8kD2ffyPWfK+5wmY4E/SMwxpJvmMrpqLh7UcPKDfS3lvnrhkba4ys3/lpj4xyht31
 hxurU5IjCNLcCmWvW3Y2bAj57bbrR+AFE2za6XoVINunzifU0mYSTXNYl34na4XAW8MI
 nzAvWs1oQAoYeiLviRh+eeXQDFe9o3EeAQS+Xc6naZ/8/+nLiFR6h4GtPB01ZiBU3wDM
 EdQ58rTkenpM71WuLDn3lesTRF8LXX9SsZ2d0yVUYPosYgj3vlJhvw/p5kxcTEAv6zhJ
 Wgtbh1SVN6JTFt9DCZDrbFDpRUsiP+3ke7pufG2UM2L5T0dO5/vvWeLhvBEm3nC0Y4m7
 S6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bXY9d9Z6lnTlBIqSQasWGdUtHUQ5ZGPYcXRV2iyWXG4=;
 b=CklRbO/GM5cHKV+F2jS80JfRlZIFVlpGnFxoN2pF8oRIyw0vvBOVM9zTrjlihfYnR+
 vCmzfyw10PZdV4qe/nwHaArNrVS8GNrU37kMw0A6znXR0yPHWubwpwTxJbCKgurQ5hMb
 uIQhJE/IEMvj15v6HYKLpdqxVK37NefXG+GieOOKucTP1yXl3ScHyZGtWIRjT/+0Z2dl
 mlKezEulpIhc4j7AFlJJf8dorEcVSxzsCxnp4aI+XG7NKQZ7pf1qBPCxDd+WIQ43CHg5
 i0r/W2SnnRs/bIVNCTrDeowfsFm27Qr1bN0SSB8xwSX15WKBJKxPg4bkMedWpepwqPlX
 okfw==
X-Gm-Message-State: APjAAAWhAHHzL0YCNzDSUZ31JvsM4ALGs48tkSGgwihXLSE2OwKKbtvV
 uxfYXN1xGDPgqypZmWL8GkAi3yd95C+2mFt+bMmP/1Ei
X-Google-Smtp-Source: APXvYqzvVQwQeWeKV/b3zqzb/Wnbgb8Ig5EQ9ADhQY6ejSZNX0tKnHuZgWsjJyx/xMmFU0pNb+8cN69Sw1Hbw65sKzY=
X-Received: by 2002:aca:c792:: with SMTP id x140mr3536793oif.132.1567701779092; 
 Thu, 05 Sep 2019 09:42:59 -0700 (PDT)
MIME-Version: 1.0
From: Jorge Mireles <jorgeluismireles@gmail.com>
Date: Thu, 5 Sep 2019 11:42:48 -0500
Message-ID: <CAC4jZLHEJAHZpPnNJR22jzVC-nn1of3CbopgTdv=-5Mv2e5=Yg@mail.gmail.com>
Subject: kernel 4.4.0-161-generic (i686) build problem
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:08:56 +0200
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
Content-Type: multipart/mixed; boundary="===============9047341285188811181=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9047341285188811181==
Content-Type: multipart/alternative; boundary="000000000000a817c50591d10303"

--000000000000a817c50591d10303
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello wireguard team!
After my linux box updated to kernel 4.40-161-generic wireguard stop
working.
I found dkms build reported a problem.
This is my /var/crash/wireguard-dkms.0.crash file content:

---------------------------------

ProblemType: Package
DKMSBuildLog:
 DKMS make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-generic
(i686)
 Wed Sep  4 10:59:50 CDT 2019
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
Date: Wed Sep  4 10:59:58 2019
DuplicateSignature:
dkms:wireguard-dkms:0.0.20190702-wg1~xenial:/var/lib/dkms/wireguard/0.0.201=
90702/build/ratelimiter.c:25:8:
error: unknown type name =E2=80=98hsiphash_key_t=E2=80=99
Package: wireguard-dkms 0.0.20190702-wg1~xenial
PackageVersion: 0.0.20190702-wg1~xenial
SourcePackage: wireguard
Title: wireguard-dkms 0.0.20190702-wg1~xenial: wireguard kernel module
failed to build

-------------------------

Is 4.4.0-161 buggy or something sources can need to be adjusted?
Thanks in advance
Jorge

--000000000000a817c50591d10303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace">Hello wireguard team!</font><div>=
<font face=3D"monospace">After my linux box updated to kernel 4.40-161-gene=
ric wireguard stop working.</font></div><div><font face=3D"monospace">I fou=
nd dkms build reported a problem.</font></div><div><span style=3D"font-fami=
ly:monospace">This is my /var/crash/wireguard-dkms.0.crash file content:</s=
pan><br></div><div><font face=3D"monospace"><br></font></div><div><font fac=
e=3D"monospace">---------------------------------</font></div><div><span st=
yle=3D"font-family:monospace"><br></span></div><div><span style=3D"font-fam=
ily:monospace">ProblemType: Package</span><br></div><div><font face=3D"mono=
space">DKMSBuildLog:<br>=C2=A0DKMS make.log for wireguard-0.0.20190702 for =
kernel 4.4.0-161-generic (i686)<br>=C2=A0Wed Sep =C2=A04 10:59:50 CDT 2019<=
br>=C2=A0make: Entering directory &#39;/usr/src/linux-headers-4.4.0-161-gen=
eric&#39;<br>=C2=A0 =C2=A0LD =C2=A0 =C2=A0 =C2=A0/var/lib/dkms/wireguard/0.=
0.20190702/build/built-in.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wire=
guard/0.0.20190702/build/main.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/=
wireguard/0.0.20190702/build/noise.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/=
dkms/wireguard/0.0.20190702/build/device.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/va=
r/lib/dkms/wireguard/0.0.20190702/build/peer.o<br>=C2=A0 =C2=A0CC [M] =C2=
=A0/var/lib/dkms/wireguard/0.0.20190702/build/timers.o<br>=C2=A0 =C2=A0CC [=
M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/queueing.o<br>=C2=A0 =
=C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/send.o<br>=C2=
=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/receive.o=
<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/so=
cket.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20190702/bu=
ild/peerlookup.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.2=
0190702/build/allowedips.o<br>=C2=A0 =C2=A0CC [M] =C2=A0/var/lib/dkms/wireg=
uard/0.0.20190702/build/ratelimiter.o<br>=C2=A0/var/lib/dkms/wireguard/0.0.=
20190702/build/ratelimiter.c:25:8: error: unknown type name =E2=80=98hsipha=
sh_key_t=E2=80=99<br>=C2=A0 static hsiphash_key_t key;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^<br>=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/rate=
limiter.c: In function =E2=80=98wg_ratelimiter_allow=E2=80=99:<br>=C2=A0/va=
r/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: error: implic=
it declaration of function =E2=80=98hsiphash_2u32=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]<br>=C2=A0 =C2=A0 bucket =3D &amp;table_v4[hsiphas=
h_2u32(net_word, ip, &amp;key) &amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>=C2=A0/var/lib/dkms/wi=
reguard/0.0.20190702/build/ratelimiter.c:116:22: error: implicit declaratio=
n of function =E2=80=98hsiphash_3u32=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]<br>=C2=A0 =C2=A0 bucket =3D &amp;table_v6[hsiphash_3u32(net_wo=
rd, ip &gt;&gt; 32, ip, &amp;key) &amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>=C2=A0cc1: some wa=
rnings being treated as errors<br>=C2=A0scripts/Makefile.build:285: recipe =
for target &#39;/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o&#3=
9; failed<br>=C2=A0make[1]: *** [/var/lib/dkms/wireguard/0.0.20190702/build=
/ratelimiter.o] Error 1<br>=C2=A0Makefile:1454: recipe for target &#39;_mod=
ule_/var/lib/dkms/wireguard/0.0.20190702/build&#39; failed<br>=C2=A0make: *=
** [_module_/var/lib/dkms/wireguard/0.0.20190702/build] Error 2<br>=C2=A0ma=
ke: Leaving directory &#39;/usr/src/linux-headers-4.4.0-161-generic&#39;<br=
>DKMSKernelVersion: 4.4.0-161-generic<br>Date: Wed Sep =C2=A04 10:59:58 201=
9<br>DuplicateSignature: dkms:wireguard-dkms:0.0.20190702-wg1~xenial:/var/l=
ib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error: unknown typ=
e name =E2=80=98hsiphash_key_t=E2=80=99<br>Package: wireguard-dkms 0.0.2019=
0702-wg1~xenial<br>PackageVersion: 0.0.20190702-wg1~xenial<br>SourcePackage=
: wireguard<br>Title: wireguard-dkms 0.0.20190702-wg1~xenial: wireguard ker=
nel module failed to build</font><br></div><div><font face=3D"monospace"><b=
r></font></div><div><font face=3D"monospace">-------------------------</fon=
t></div><div><font face=3D"monospace"><br></font></div><div><font face=3D"m=
onospace">Is 4.4.0-161 buggy or something sources can need to be adjusted?<=
/font></div><div><font face=3D"monospace">Thanks in advance</font></div><di=
v><font face=3D"monospace">Jorge</font></div><div><font face=3D"monospace">=
<br></font></div><div><font face=3D"monospace"><br></font></div></div>

--000000000000a817c50591d10303--

--===============9047341285188811181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9047341285188811181==--
