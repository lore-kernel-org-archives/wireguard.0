Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A48C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 14:07:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4997020854
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 14:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NRhFpchu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4997020854
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2c55509;
	Fri, 6 Sep 2019 14:07:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c85afd46
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 14:07:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed7a15a0
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 14:07:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c303b8d
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=45b08PR5rqPUpm0TYguGQfq8hp8=; b=NRhFpc
 huY1jsuZjmhpYYrKhk3aozWsa2B89cwfrZ4xp7EQJu9d/oRbRXmJDo/hS2e6Ywtl
 13BqBQQZpQtczgbUAR8Z59EovjvmBRO/IrJV38pHqWjXgZTY6YrQZ5h2XQetBwoR
 wUGqVSV0Tpw5u/FKKEgMWZnAaLw1CqiiQ4RCn1AYeKp1F4PpAAiWxlCiLj1DkN9X
 mChbTKsJRQgSlUT21MkfBfSzWr0ul/oXZJxaHT/Xp9wdtHHmxhskz3mbvyw29SRb
 Zg4fGvIvN8dkiAwofWrsrLFiATKGDA88JF1Qu5KsaWa+z2wq6jCi7qCAwgahr7+3
 1csUjVH0aYWn0+1w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 649dd37a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 13:23:48 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id y39so5817999ota.7
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 07:07:07 -0700 (PDT)
X-Gm-Message-State: APjAAAVDaWPsjMn82kxTrMxoeaZszWqh2UhXnXohYWq6Bw56K2QPbtkH
 1WY1wcqAJCf5taUPPoJ6aYjp6vziRsBNqSAP13U=
X-Google-Smtp-Source: APXvYqzc8BFQsNn3t6KPazHhEfBLS3rBNmbgOOw4/qZ++nDyPH6bnrI7QlcTmhLOv/3XQd/BCmE4uvrQkT/Idyh6+eY=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr7214159otk.369.1567778826902; 
 Fri, 06 Sep 2019 07:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <a8a4d088-d5fd-5e3b-23ab-72e2c7932ff3@activezone.de>
In-Reply-To: <a8a4d088-d5fd-5e3b-23ab-72e2c7932ff3@activezone.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 08:06:54 -0600
X-Gmail-Original-Message-ID: <CAHmME9pTAY5X3h2xwwz6LPjqWpgtd2R+Lw4C3-ZPqxve=4HCSw@mail.gmail.com>
Message-ID: <CAHmME9pTAY5X3h2xwwz6LPjqWpgtd2R+Lw4C3-ZPqxve=4HCSw@mail.gmail.com>
Subject: Re: DMKS failed after Kernel Upgrade to 4.4.0-161-generic on Ubuntu
 16.04 LTS
To: Markus Grundmann <markus@activezone.de>
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
Content-Type: multipart/mixed; boundary="===============7674202370217769959=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7674202370217769959==
Content-Type: multipart/alternative; boundary="0000000000001084a20591e2f4b9"

--0000000000001084a20591e2f4b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Ubuntu kernel team backported something wrong. They know that they
screwed it up, but they're unable to fix it for another 7 weeks. That sort
of delay is unacceptable for users who rely on WireGuard, so I released a
new version, 20190905, yesterday that contains a workaround. At this point
we're waiting on Egbert to bump the Ubuntu package to the newer version I
released.

Sorry for the hassle. I'm not happy about the situation either, but it is
what it is. Ubuntu isn't the best distro to deal with unfortunately.

I'll poke Egbert again to see if he can hurry up.

On Fri, Sep 6, 2019, 01:39 Markus Grundmann <markus@activezone.de> wrote:

> Question: If the patch needed?
>
> Don't touch a running system :-|
> -Markus
>
>
> [..]
> Selecting previously unselected package wireguard-dkms.
> (Reading database ... 346239 files and directories currently installed.)
> Preparing to unpack .../wireguard-dkms_0.0.20190702-wg1~xenial_all.deb ..=
.
> Unpacking wireguard-dkms (0.0.20190702-wg1~xenial) ...
> Selecting previously unselected package wireguard-tools.
> Preparing to unpack
> .../wireguard-tools_0.0.20190702-wg1~xenial_amd64.deb ...
> Unpacking wireguard-tools (0.0.20190702-wg1~xenial) ...
> Selecting previously unselected package wireguard.
> Preparing to unpack .../wireguard_0.0.20190702-wg1~xenial_all.deb ...
> Unpacking wireguard (0.0.20190702-wg1~xenial) ...
> Processing triggers for man-db (2.7.5-1) ...
> Setting up wireguard-dkms (0.0.20190702-wg1~xenial) ...
> Loading new wireguard-0.0.20190702 DKMS files...
> First Installation: checking all kernels...
> Building only for 4.4.0-161-generic
> Building initial module for 4.4.0-161-generic
> ERROR: Cannot create report: [Errno 17] File exists:
> '/var/crash/wireguard-dkms.0.crash'
> Error! Bad return status for module build on kernel: 4.4.0-161-generic
> (x86_64)
> Consult /var/lib/dkms/wireguard/0.0.20190702/build/make.log for more
> information.
> Setting up wireguard-tools (0.0.20190702-wg1~xenial) ...
> Setting up wireguard (0.0.20190702-wg1~xenial) ...
>
> =3D=3D=3D Crash Report =3D=3D=3D
> ProblemType: Package
> DKMSBuildLog:
>  DKMS make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-generic
> (x86_64)
>  Fr 6. Sep 09:02:18 CEST 2019
>  make: Entering directory '/usr/src/linux-headers-4.4.0-161-generic'
>    LD      /var/lib/dkms/wireguard/0.0.20190702/build/built-in.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/main.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/noise.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/device.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/peer.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/timers.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/queueing.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/send.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/receive.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/socket.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/peerlookup.o
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.o
>  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
> =E2=80=98root_remove_peer_lists=E2=80=99:
>  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:72:1: warning:
> the frame size of 1048 bytes is larger than 1024 bytes
> [-Wframe-larger-than=3D]
>   }
>   ^
>  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
> =E2=80=98root_free_rcu=E2=80=99:
>  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:59:1: warning:
> the frame size of 1048 bytes is larger than 1024 bytes
> [-Wframe-larger-than=3D]
>   }
>   ^
>  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function
> =E2=80=98walk_remove_by_peer.isra.3=E2=80=99:
>  /var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:126:1: warning:
> the frame size of 1032 bytes is larger than 1024 bytes
> [-Wframe-larger-than=3D]
>   }
>   ^
>    CC [M]  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o
>  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error:
> unknown type name =E2=80=98hsiphash_key_t=E2=80=99
>   static hsiphash_key_t key;
>          ^
>  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In function
> =E2=80=98wg_ratelimiter_allow=E2=80=99:
>  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: error:
> implicit declaration of function =E2=80=98hsiphash_2u32=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>     bucket =3D &table_v4[hsiphash_2u32(net_word, ip, &key) &
>                        ^
>  /var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:116:22: error:
> implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>     bucket =3D &table_v6[hsiphash_3u32(net_word, ip >> 32, ip, &key) &
>                        ^
>  cc1: some warnings being treated as errors
>  scripts/Makefile.build:285: recipe for target
> '/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o' failed
>  make[1]: *** [/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o]
> Error 1
>  Makefile:1454: recipe for target
> '_module_/var/lib/dkms/wireguard/0.0.20190702/build' failed
>  make: *** [_module_/var/lib/dkms/wireguard/0.0.20190702/build] Error 2
>  make: Leaving directory '/usr/src/linux-headers-4.4.0-161-generic'
> DKMSKernelVersion: 4.4.0-161-generic
> Date: Fri Sep  6 09:02:28 2019
> DuplicateSignature:
>
> dkms:wireguard-dkms:0.0.20190702-wg1~xenial:/var/lib/dkms/wireguard/0.0.2=
0190702/build/ratelimiter.c:25:8:
> error: unknown type name =E2=80=98hsiphash_key_t=E2=80=99
> Package: wireguard-dkms 0.0.20190702-wg1~xenial
> PackageVersion: 0.0.20190702-wg1~xenial
> SourcePackage: wireguard
> Title: wireguard-dkms 0.0.20190702-wg1~xenial: wireguard kernel module
> failed to build
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000001084a20591e2f4b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The Ubuntu kernel team backported something wrong. They k=
now that they screwed it up, but they&#39;re unable to fix it for another 7=
 weeks. That sort of delay is unacceptable for users who rely on WireGuard,=
 so I released a new version, 20190905, yesterday that contains a workaroun=
d. At this point we&#39;re waiting on Egbert to bump the Ubuntu package to =
the newer version I released.<div dir=3D"auto"><br></div><div dir=3D"auto">=
Sorry for the hassle. I&#39;m not happy about the situation either, but it =
is what it is. Ubuntu isn&#39;t the best distro to deal with unfortunately.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll poke Egbert ag=
ain to see if he can hurry up.</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019, 01:39 Markus Grund=
mann &lt;<a href=3D"mailto:markus@activezone.de">markus@activezone.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Question: If the patch ne=
eded?<br>
<br>
Don&#39;t touch a running system :-|<br>
-Markus<br>
<br>
<br>
[..]<br>
Selecting previously unselected package wireguard-dkms.<br>
(Reading database ... 346239 files and directories currently installed.)<br=
>
Preparing to unpack .../wireguard-dkms_0.0.20190702-wg1~xenial_all.deb ...<=
br>
Unpacking wireguard-dkms (0.0.20190702-wg1~xenial) ...<br>
Selecting previously unselected package wireguard-tools.<br>
Preparing to unpack<br>
.../wireguard-tools_0.0.20190702-wg1~xenial_amd64.deb ...<br>
Unpacking wireguard-tools (0.0.20190702-wg1~xenial) ...<br>
Selecting previously unselected package wireguard.<br>
Preparing to unpack .../wireguard_0.0.20190702-wg1~xenial_all.deb ...<br>
Unpacking wireguard (0.0.20190702-wg1~xenial) ...<br>
Processing triggers for man-db (2.7.5-1) ...<br>
Setting up wireguard-dkms (0.0.20190702-wg1~xenial) ...<br>
Loading new wireguard-0.0.20190702 DKMS files...<br>
First Installation: checking all kernels...<br>
Building only for 4.4.0-161-generic<br>
Building initial module for 4.4.0-161-generic<br>
ERROR: Cannot create report: [Errno 17] File exists:<br>
&#39;/var/crash/wireguard-dkms.0.crash&#39;<br>
Error! Bad return status for module build on kernel: 4.4.0-161-generic<br>
(x86_64)<br>
Consult /var/lib/dkms/wireguard/0.0.20190702/build/make.log for more<br>
information.<br>
Setting up wireguard-tools (0.0.20190702-wg1~xenial) ...<br>
Setting up wireguard (0.0.20190702-wg1~xenial) ...<br>
<br>
=3D=3D=3D Crash Report =3D=3D=3D<br>
ProblemType: Package<br>
DKMSBuildLog:<br>
=C2=A0DKMS make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-generic=
<br>
(x86_64)<br>
=C2=A0Fr 6. Sep 09:02:18 CEST 2019<br>
=C2=A0make: Entering directory &#39;/usr/src/linux-headers-4.4.0-161-generi=
c&#39;<br>
=C2=A0 =C2=A0LD=C2=A0 =C2=A0 =C2=A0 /var/lib/dkms/wireguard/0.0.20190702/bu=
ild/built-in.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/main.o=
<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/noise.=
o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/device=
.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/peer.o=
<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/timers=
.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/queuei=
ng.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/send.o=
<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/receiv=
e.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/socket=
.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/peerlo=
okup.o<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/allowe=
dips.o<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function<=
br>
=E2=80=98root_remove_peer_lists=E2=80=99:<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:72:1: warning=
:<br>
the frame size of 1048 bytes is larger than 1024 bytes<br>
[-Wframe-larger-than=3D]<br>
=C2=A0 }<br>
=C2=A0 ^<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function<=
br>
=E2=80=98root_free_rcu=E2=80=99:<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:59:1: warning=
:<br>
the frame size of 1048 bytes is larger than 1024 bytes<br>
[-Wframe-larger-than=3D]<br>
=C2=A0 }<br>
=C2=A0 ^<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In function<=
br>
=E2=80=98walk_remove_by_peer.isra.3=E2=80=99:<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:126:1: warnin=
g:<br>
the frame size of 1032 bytes is larger than 1024 bytes<br>
[-Wframe-larger-than=3D]<br>
=C2=A0 }<br>
=C2=A0 ^<br>
=C2=A0 =C2=A0CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20190702/build/rateli=
miter.o<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error:=
<br>
unknown type name =E2=80=98hsiphash_key_t=E2=80=99<br>
=C2=A0 static hsiphash_key_t key;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In function=
<br>
=E2=80=98wg_ratelimiter_allow=E2=80=99:<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: erro=
r:<br>
implicit declaration of function =E2=80=98hsiphash_2u32=E2=80=99<br>
[-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 =C2=A0 bucket =3D &amp;table_v4[hsiphash_2u32(net_word, ip, &amp;key=
) &amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:116:22: erro=
r:<br>
implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=99<br>
[-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 =C2=A0 bucket =3D &amp;table_v6[hsiphash_3u32(net_word, ip &gt;&gt; =
32, ip, &amp;key) &amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>
=C2=A0cc1: some warnings being treated as errors<br>
=C2=A0scripts/Makefile.build:285: recipe for target<br>
&#39;/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o&#39; failed<b=
r>
=C2=A0make[1]: *** [/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.=
o]<br>
Error 1<br>
=C2=A0Makefile:1454: recipe for target<br>
&#39;_module_/var/lib/dkms/wireguard/0.0.20190702/build&#39; failed<br>
=C2=A0make: *** [_module_/var/lib/dkms/wireguard/0.0.20190702/build] Error =
2<br>
=C2=A0make: Leaving directory &#39;/usr/src/linux-headers-4.4.0-161-generic=
&#39;<br>
DKMSKernelVersion: 4.4.0-161-generic<br>
Date: Fri Sep=C2=A0 6 09:02:28 2019<br>
DuplicateSignature:<br>
dkms:wireguard-dkms:0.0.20190702-wg1~xenial:/var/lib/dkms/wireguard/0.0.201=
90702/build/ratelimiter.c:25:8:<br>
error: unknown type name =E2=80=98hsiphash_key_t=E2=80=99<br>
Package: wireguard-dkms 0.0.20190702-wg1~xenial<br>
PackageVersion: 0.0.20190702-wg1~xenial<br>
SourcePackage: wireguard<br>
Title: wireguard-dkms 0.0.20190702-wg1~xenial: wireguard kernel module<br>
failed to build<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000001084a20591e2f4b9--

--===============7674202370217769959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7674202370217769959==--
