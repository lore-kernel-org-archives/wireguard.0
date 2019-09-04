Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7D2C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C5E2081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="WHPRcfFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C5E2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf9aabe3;
	Fri, 6 Sep 2019 19:06:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a759e26d
 for <wireguard@lists.zx2c4.com>; Wed, 4 Sep 2019 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37a46f38
 for <wireguard@lists.zx2c4.com>; Wed, 4 Sep 2019 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1567596851;
 bh=j8PV92TJ8xELgDqYECrI326N2iYt45+bRNpzeEEE76g=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=WHPRcfFNAXsAw+guOhE/FyFDUfUjw/xKk+RSUHc1wo1i8KPqEsTchwB8JquXsNX9g
 pIGYu1ARrZ0T3ShTF3iCJwo6qqqTz54tR/IQF5E4OMqvYGGl1Sa0TlcmW/uHzQNWRE
 6CNMNsR4BRmFTevLwHEhKlxIovdPQlQibjD4Cj/o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Martins-Air.home.lan.mail ([176.198.17.1]) by mail.gmx.com
 (mrgmx001 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MBExR-1hvGnm1Xm9-00AGx8 for <wireguard@lists.zx2c4.com>; Wed, 04 Sep 2019
 13:34:11 +0200
Date: Wed, 4 Sep 2019 13:34:09 +0200
From: Martin Jurasik <martin.jurasik@gmx.de>
To: wireguard@lists.zx2c4.com
Message-ID: <etPan.5d6fa131.739987c8.17679@gmx.de>
Subject: Wireguard installation on Ubuntu 16.04 / kernel
 4.4.0-161-generic fails
MIME-Version: 1.0
X-Provags-ID: V03:K1:yD+CSbIqpgdHR8mjIFkLLJ7J89flm32XI35jQPQ2fntyr4EEVeh
 a8lKWPt+iZIG/8GrfNTPDkMgwYtpJyhk5v07/i717QHdb7mlbEuUW4lAtqwYs/gl3eNnF8h
 w653oKNGQ3DJUCiCPrTUNDn7cJYgcLPnyINX2aO4Hk4rhTm5Y9DxARispSR/44wnjgHzcZf
 joW9rccdEATRTWSFfwwMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zjrk1s/7fQo=:AZUxLmU6isFEPxkCc1JL/c
 YKndteQEC8BWkf8KXpxYMP0mpr4bkdim/O234cnr9VqKM9gcGEahaSdwDi1SLoD6w9RJ7fZNf
 VS81QAJGK6ChB/8B5I9QKVfHEENZEcyeTZL2c9TCvHuuUbsJSsXZL4pcf+BIwq020w60PmKf/
 UNx7v2e8zJ3h8dGJHmhnaRzPclxhXGMBHFfYRxJX/wt38JDdkdyeSOnV7DjC3Wp/4sLBtENe5
 u2jvnBc2oGJeo6g0/TJydk0PIcPtFc/7FIcaoI8uGGI0cOLC19jBgf/wVBKrgA8xNauapVMhU
 FBS1U/UPRFXFAjh/XMY7d7tcsGInR1Ci8zT+RS5uROaQh2PDBumV/HbLCRFQI0WdLcCFw+7MK
 +28CsiEQxrNuyRcwwa5MCnVBfMCxwlbaC6dNcsIlOy7NbU0SglOdFEAY9tVoYH/8J68WbwRIT
 2Q3TiFsxSdpl0ep8D9AzkbaSes4XWpls1aqhpJ9mYXtrHmeIsJbdt0zWvU5Bxk9K3wdTZ66wm
 6JII7fhxVwHZjBLmaqL6ozEsdNJfBC69KT86eY7bjy6Edp1X6tnrK6lBOHG20pGJINpM/bSs4
 rYU0VnN2cu+jfj6pD2HXeGZRY0X4KXgt3jmIxX+qTjtNr7LuiUfREZNFt8+mqOUxk8u9LC+WX
 slhtbf1EmYjxE1Owx/uGhetZPDcbt84SpVRTRKh8YjX0v8tT1b40NSSc5ugwYK3Kl7TsNR9h5
 5RO9fJm5zsO1BJt/TSKlLgY8U7pyL7Ez5GqQw0VQvISEQcL1ejtcOuoWx+czB3hxFlD2dSJ1B
 Q8SOvkwSUXj6ewkNHwnr5E0+YsU7Iv8Zsdp7ijHsaYPSR4Kl8ab64VNBeFy+N1IrpOzFFjrBX
 qLaaLgSEhiy3eY/I/ZYkLss4Q8kDRDuvWvZ0hQRFIKSDOlgKm494P32x11mAuTFgsWHaGH53m
 lCdy5aZtZo3m6QyRtkZPouCBZ5Q8nNgXnQFBBgNAUrGrz7hgMWFPXNoWQX5B75RdKES3VKGSq
 otRkbY/1OztxnFu8fnuY0fKiiwVB/TYzV4z7j3iBZDqaEOp4bwSEHcPIp8oEEoQzR1/FTciBg
 wV8ps423qa5uwkOQhsWHcLKUuZM62lUb9nIBmM3RtqX6bpcRbZ2bKiAUd0ph3dn/1leKaAc/I
 xG7jmrV1Vd1MQT+vdlleb2K+n+G1tnF9AiXo34XdFJbKL9XA==
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:06:10 +0200
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
Content-Type: multipart/mixed; boundary="===============1673996314071966052=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1673996314071966052==
Content-Type: multipart/alternative; boundary="5d6fa131_3fc0e7ce_17679"

--5d6fa131_3fc0e7ce_17679
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Tried to install Wireguard on a newly setup Ubuntu 16.04 VPS.

Building initial module =C2=A0fails with =E2=80=9EError=21 Bad return sta=
tus =E2=80=A6=E2=80=9C=C2=A0

Please see log file attached.

Thanks & Regards,
Martin

=23=23=23=23=23 make.log =23=23=23=23=23

ProblemType: Package
DKMSBuildLog:
=C2=A0DKMS make.log for wireguard-0.0.20190702 for kernel 4.4.0-161-gener=
ic (x86=5F64)
=C2=A0Wed =C2=A04 Sep 12:47:09 CEST 2019
=C2=A0make: Entering directory '/usr/src/linux-headers-4.4.0-161-generic'=

=C2=A0 =C2=A0LD =C2=A0 =C2=A0 =C2=A0/var/lib/dkms/wireguard/0.0.20190702/=
build/built-in.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
main.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
noise.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
device.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
peer.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
timers.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
queueing.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
send.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
receive.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
socket.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
peerlookup.o
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
allowedips.o
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In functio=
n =E2=80=98root=5Fremove=5Fpeer=5Flists=E2=80=99:
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:72:1: warni=
ng: the frame size of 1048 bytes is larger than 1024 bytes =5B-Wframe-lar=
ger-than=3D=5D
=C2=A0 =7D
=C2=A0 =5E
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In functio=
n =E2=80=98root=5Ffree=5Frcu=E2=80=99:
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:59:1: warni=
ng: the frame size of 1048 bytes is larger than 1024 bytes =5B-Wframe-lar=
ger-than=3D=5D
=C2=A0 =7D
=C2=A0 =5E
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c: In functio=
n =E2=80=98walk=5Fremove=5Fby=5Fpeer.isra.3=E2=80=99:
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.c:126:1: warn=
ing: the frame size of 1032 bytes is larger than 1024 bytes =5B-Wframe-la=
rger-than=3D=5D
=C2=A0 =7D
=C2=A0 =5E
=C2=A0 =C2=A0CC =5BM=5D =C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/=
ratelimiter.o
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: erro=
r: unknown type name =E2=80=98hsiphash=5Fkey=5Ft=E2=80=99
=C2=A0 static hsiphash=5Fkey=5Ft key;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=5E
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In functi=
on =E2=80=98wg=5Fratelimiter=5Fallow=E2=80=99:
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: er=
ror: implicit declaration of function =E2=80=98hsiphash=5F2u32=E2=80=99 =5B=
-Werror=3Dimplicit-function-declaration=5D
=C2=A0 =C2=A0 bucket =3D &table=5Fv4=5Bhsiphash=5F2u32(net=5Fword, ip, &k=
ey) &
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=5E
=C2=A0/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:116:22: er=
ror: implicit declaration of function =E2=80=98hsiphash=5F3u32=E2=80=99 =5B=
-Werror=3Dimplicit-function-declaration=5D
=C2=A0 =C2=A0 bucket =3D &table=5Fv6=5Bhsiphash=5F3u32(net=5Fword, ip >> =
32, ip, &key) &
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=5E
=C2=A0cc1: some warnings being treated as errors
=C2=A0scripts/Makefile.build:285: recipe for target '/var/lib/dkms/wiregu=
ard/0.0.20190702/build/ratelimiter.o' failed
=C2=A0make=5B1=5D: *** =5B/var/lib/dkms/wireguard/0.0.20190702/build/rate=
limiter.o=5D Error 1
=C2=A0Makefile:1454: recipe for target '=5Fmodule=5F/var/lib/dkms/wiregua=
rd/0.0.20190702/build' failed
=C2=A0make: *** =5B=5Fmodule=5F/var/lib/dkms/wireguard/0.0.20190702/build=
=5D Error 2
=C2=A0make: Leaving directory '/usr/src/linux-headers-4.4.0-161-generic'
DKMSKernelVersion: 4.4.0-161-generic
Date: Wed Sep =C2=A04 12:47:19 2019
DuplicateSignature: dkms:wireguard-dkms:0.0.20190702-wg1=7Exenial:/var/li=
b/dkms/wireguard/0.0.20190702/build/ratelimiter.c:25:8: error: unknown ty=
pe name =E2=80=98hsiphash=5Fkey=5Ft=E2=80=99
Package: wireguard-dkms 0.0.20190702-wg1=7Exenial
PackageVersion: 0.0.20190702-wg1=7Exenial
SourcePackage: wireguard
Title: wireguard-dkms 0.0.20190702-wg1=7Exenial: wireguard kernel module =
failed to build
--5d6fa131_3fc0e7ce_17679
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><style>body=7Bfont-family:Helvetica,Arial;font-size:13px=7D</=
style></head><body><div style=3D=22font-family:Helvetica,Arial;font-size:=
13px; =22>Tried to install Wireguard on a newly setup Ubuntu 16.04 VPS.</=
div><div style=3D=22font-family:Helvetica,Arial;font-size:13px; =22><br><=
/div><div style=3D=22font-family:Helvetica,Arial;font-size:13px; =22>Buil=
ding initial module &nbsp;fails with =E2=80=9EError=21 Bad return status =
=E2=80=A6=E2=80=9C&nbsp;</div><div style=3D=22font-family:Helvetica,Arial=
;font-size:13px; =22><br></div><div style=3D=22font-family:Helvetica,Aria=
l;font-size:13px; =22>Please see log file attached.</div><div style=3D=22=
font-family:Helvetica,Arial;font-size:13px; =22><br></div><div style=3D=22=
font-family:Helvetica,Arial;font-size:13px; =22>Thanks &amp; Regards,</di=
v><div style=3D=22font-family:Helvetica,Arial;font-size:13px; =22>Martin<=
/div><div style=3D=22font-family:Helvetica,Arial;font-size:13px; =22><br>=
</div><div style=3D=22font-family:Helvetica,Arial;font-size:13px; =22>=23=
=23=23=23=23 make.log =23=23=23=23=23</div><div style=3D=22font-family:He=
lvetica,Arial;font-size:13px; =22><br></div><div style=3D=22font-family:H=
elvetica,Arial;font-size:13px; =22><div style=3D=22margin: 0px;=22>Proble=
mType: Package</div><div style=3D=22margin: 0px;=22>DKMSBuildLog:</div><d=
iv style=3D=22margin: 0px;=22>&nbsp;DKMS make.log for wireguard-0.0.20190=
702 for kernel 4.4.0-161-generic (x86=5F64)</div><div style=3D=22margin: =
0px;=22>&nbsp;Wed &nbsp;4 Sep 12:47:09 CEST 2019</div><div style=3D=22mar=
gin: 0px;=22>&nbsp;make: Entering directory '/usr/src/linux-headers-4.4.0=
-161-generic'</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp;LD &nbsp;=
 &nbsp; &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build/built-in.o</div>=
<div style=3D=22margin: 0px;=22>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/lib/dk=
ms/wireguard/0.0.20190702/build/main.o</div><div style=3D=22margin: 0px;=22=
>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build=
/noise.o</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp;CC =5BM=5D &nb=
sp;/var/lib/dkms/wireguard/0.0.20190702/build/device.o</div><div style=3D=
=22margin: 0px;=22>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/lib/dkms/wireguard/=
0.0.20190702/build/peer.o</div><div style=3D=22margin: 0px;=22>&nbsp; &nb=
sp;CC =5BM=5D &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build/timers.o</=
div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/li=
b/dkms/wireguard/0.0.20190702/build/queueing.o</div><div style=3D=22margi=
n: 0px;=22>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/lib/dkms/wireguard/0.0.2019=
0702/build/send.o</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp;CC =5B=
M=5D &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build/receive.o</div><div=
 style=3D=22margin: 0px;=22>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/lib/dkms/w=
ireguard/0.0.20190702/build/socket.o</div><div style=3D=22margin: 0px;=22=
>&nbsp; &nbsp;CC =5BM=5D &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build=
/peerlookup.o</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp;CC =5BM=5D=
 &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build/allowedips.o</div><div =
style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.20190702/bui=
ld/allowedips.c: In function =E2=80=98root=5Fremove=5Fpeer=5Flists=E2=80=99=
:</div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.=
20190702/build/allowedips.c:72:1: warning: the frame size of 1048 bytes i=
s larger than 1024 bytes =5B-Wframe-larger-than=3D=5D</div><div style=3D=22=
margin: 0px;=22>&nbsp; =7D</div><div style=3D=22margin: 0px;=22>&nbsp; =5E=
</div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.2=
0190702/build/allowedips.c: In function =E2=80=98root=5Ffree=5Frcu=E2=80=99=
:</div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.=
20190702/build/allowedips.c:59:1: warning: the frame size of 1048 bytes i=
s larger than 1024 bytes =5B-Wframe-larger-than=3D=5D</div><div style=3D=22=
margin: 0px;=22>&nbsp; =7D</div><div style=3D=22margin: 0px;=22>&nbsp; =5E=
</div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.2=
0190702/build/allowedips.c: In function =E2=80=98walk=5Fremove=5Fby=5Fpee=
r.isra.3=E2=80=99:</div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dk=
ms/wireguard/0.0.20190702/build/allowedips.c:126:1: warning: the frame si=
ze of 1032 bytes is larger than 1024 bytes =5B-Wframe-larger-than=3D=5D</=
div><div style=3D=22margin: 0px;=22>&nbsp; =7D</div><div style=3D=22margi=
n: 0px;=22>&nbsp; =5E</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp;C=
C =5BM=5D &nbsp;/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o<=
/div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.20=
190702/build/ratelimiter.c:25:8: error: unknown type name =E2=80=98hsipha=
sh=5Fkey=5Ft=E2=80=99</div><div style=3D=22margin: 0px;=22>&nbsp; static =
hsiphash=5Fkey=5Ft key;</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;=5E</div><div style=3D=22margin: 0px;=22>&nbsp;/var=
/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c: In function =E2=80=98=
wg=5Fratelimiter=5Fallow=E2=80=99:</div><div style=3D=22margin: 0px;=22>&=
nbsp;/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.c:109:22: err=
or: implicit declaration of function =E2=80=98hsiphash=5F2u32=E2=80=99 =5B=
-Werror=3Dimplicit-function-declaration=5D</div><div style=3D=22margin: 0=
px;=22>&nbsp; &nbsp; bucket =3D &amp;table=5Fv4=5Bhsiphash=5F2u32(net=5Fw=
ord, ip, &amp;key) &amp;</div><div style=3D=22margin: 0px;=22>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=5E=
</div><div style=3D=22margin: 0px;=22>&nbsp;/var/lib/dkms/wireguard/0.0.2=
0190702/build/ratelimiter.c:116:22: error: implicit declaration of functi=
on =E2=80=98hsiphash=5F3u32=E2=80=99 =5B-Werror=3Dimplicit-function-decla=
ration=5D</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp; bucket =3D &=
amp;table=5Fv6=5Bhsiphash=5F3u32(net=5Fword, ip &gt;&gt; 32, ip, &amp;key=
) &amp;</div><div style=3D=22margin: 0px;=22>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=5E</div><div styl=
e=3D=22margin: 0px;=22>&nbsp;cc1: some warnings being treated as errors</=
div><div style=3D=22margin: 0px;=22>&nbsp;scripts/Makefile.build:285: rec=
ipe for target '/var/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o'=
 failed</div><div style=3D=22margin: 0px;=22>&nbsp;make=5B1=5D: *** =5B/v=
ar/lib/dkms/wireguard/0.0.20190702/build/ratelimiter.o=5D Error 1</div><d=
iv style=3D=22margin: 0px;=22>&nbsp;Makefile:1454: recipe for target '=5F=
module=5F/var/lib/dkms/wireguard/0.0.20190702/build' failed</div><div sty=
le=3D=22margin: 0px;=22>&nbsp;make: *** =5B=5Fmodule=5F/var/lib/dkms/wire=
guard/0.0.20190702/build=5D Error 2</div><div style=3D=22margin: 0px;=22>=
&nbsp;make: Leaving directory '/usr/src/linux-headers-4.4.0-161-generic'<=
/div><div style=3D=22margin: 0px;=22>DKMSKernelVersion: 4.4.0-161-generic=
</div><div style=3D=22margin: 0px;=22>Date: Wed Sep &nbsp;4 12:47:19 2019=
</div><div style=3D=22margin: 0px;=22>DuplicateSignature: dkms:wireguard-=
dkms:0.0.20190702-wg1=7Exenial:/var/lib/dkms/wireguard/0.0.20190702/build=
/ratelimiter.c:25:8: error: unknown type name =E2=80=98hsiphash=5Fkey=5Ft=
=E2=80=99</div><div style=3D=22margin: 0px;=22>Package: wireguard-dkms 0.=
0.20190702-wg1=7Exenial</div><div style=3D=22margin: 0px;=22>PackageVersi=
on: 0.0.20190702-wg1=7Exenial</div><div style=3D=22margin: 0px;=22>Source=
Package: wireguard</div><div style=3D=22margin: 0px;=22>Title: wireguard-=
dkms 0.0.20190702-wg1=7Exenial: wireguard kernel module failed to build</=
div></div></body></html>
--5d6fa131_3fc0e7ce_17679--


--===============1673996314071966052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1673996314071966052==--

