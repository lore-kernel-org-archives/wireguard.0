Return-Path: <SRS0=J3XI=7Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354FEC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Jun 2020 18:22:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D73D20723
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Jun 2020 18:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="RiJ8nN41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D73D20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 523bbb2b;
	Fri, 12 Jun 2020 18:05:01 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 337b6a1d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jun 2020 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1591986146;
 bh=RQLo9kzV9bPUw1PKf4hKY3cMwfeYLqCAeKPu8MvfWM8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=RiJ8nN41UdZZkg2e10mmO34b+dBUaY3FDTR6GihYoOWXZ4eUErACfQynkjM1NUFp7
 AkBwv2bh+8al+CAm4TjYigPhOqfhcnN1cdVT+nKlA+O+3qID+LF3NXZl/eEkADqL2F
 /4v2yzWSAqOA9i7JnEZEMaMoO4Evqewg032QrWZU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [176.198.17.117] ([176.198.17.117]) by web-mail.gmx.net
 (3c-app-gmx-bs62.server.lan [172.19.170.146]) (via HTTP); Fri, 12 Jun 2020
 20:22:26 +0200
MIME-Version: 1.0
Message-ID: <trinity-bcc1ea44-937b-4b1f-a979-acf971aac3ac-1591986145982@3c-app-gmx-bs62>
From: Martin Jurasik <martin.jurasik@gmx.de>
To: wireguard@lists.zx2c4.com
Subject: Aw: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2020 20:22:26 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <etPan.5ee21f64.7c09ac86.1105b@gmx.de>
References: <etPan.5ee21f64.7c09ac86.1105b@gmx.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:w3t3tOPDwcVkBCTf3Bx3f33BqDT+4zW7B3aJRXK1m63+LR3POdZt8izqP/QSqZ2Qp9h+Y
 yRYF542xrvIvZpC1C0pg6Wub2CrSogBsAHIquo03BxKplNDRNfYijXvdEEByEUj0rdlYn8TLLtN7
 Hvogd6duI1oouUzn95onU+Qzbl3zrqQ5WShRcJNSnR7oJyhH0MrmGIFrakQ0WaLHMayZKz16XQPB
 vo3EwvCFICm8ykNnt2pmD+bRRtEgvZFte7H/WZUFtZuPTG/glz6B5CZmUouOOoWttEKWpPolkVss
 ZA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ZxRaUdetjI=:IpJBCnZDZmfF8z+pxSfcvr
 DEJ61F/yPzSuHMfY86ahjdn3IssyVomK9q7SpvSxoqeAjyAhuepHyRc3pRpRodpGstJXF5oCd
 CoFM53liesdDDJVCEDFKeoDEmVLVvVZiFEWti9wtkh1ihQfyCxAHDem8+qE2N0D759D7eB8sM
 TDfyylu5xYtT2SjXppQi/B+0+8tV2p7/w10KFGToCx8E4DNnRs8OLcV8jTTcX9O1vAfgH+6dq
 kSHDk5g94mlI+oxz8X35nUykk8aKWA1MscVsVgNpw41yuVXy757dHrAByZoOY2g479/i6gmCA
 Xtj5YAtuyi782wR5/Tg0zY0570amWDbIA5f5XrngUMrmHZkPCFO7HoMdnVwXtmO8jytPlc0YE
 jd0LjxBKjh3quTDfDQug/t8SOCUrzMNNpqmNYlNMASJ6HM83TPSfOCte2qb/Iz/+ml5pPTV26
 GfSoHM1QrWPmn6RSP61P63VUMQjA8pra2Sii5bXw/1F7uehau322zu3wNmLw47R2I9rYS3vyb
 JD0wFMZ+wh3d/JeHsOt5na4vA198fPQPyMylrxrs24z1/lSe48Qp4YREeLK+RdTNcUdoFYiFJ
 7Lhlv54eXHM8+RumHoIuQKiJNCtk66b/MTDVjXbfwUbgqlEcagSzAIhYfS6qvkikZrbQS9Ct6
 w6Tamkly5ghgAwN24Gez0720F7TFXWUgSM9jvAmBSLyBNm1NEXZP5Md5f2h2NEOInOPU=
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

I haven't seen any update of the wireguard package yet=2E Is it still missi=
ng?
=20
I have only seen an update of wireguard-linux-compat but this isn't used u=
nder Ubuntu 18=2E04, right?
=20
Thanks & Regards,
Martin
=C2=A0
=C2=A0
=C2=A0

Gesendet:=C2=A0Donnerstag, 11=2E Juni 2020 um 14:11 Uhr
Von:=C2=A0"Martin Jurasik" <martin=2Ejurasik@gmx=2Ede>
An:=C2=A0wireguard@lists=2Ezx2c4=2Ecom
Betreff:=C2=A0Re: Ubuntu 18=2E04 kernel 4=2E15=2E0-106-generic breaks wire=
guard-1=2E0=2E20200520

Hi Jason,
=C2=A0
still no luck with the updated version=2E make still fails=2E
=C2=A0
#####

wireguard/bionic,bionic,now 1=2E0=2E20200513-1~18=2E04 all [installed,auto=
matic]
wireguard-dkms/bionic,bionic,now 1=2E0=2E20200611-0ppa1~18=2E04 all [insta=
lled]
wireguard-tools/bionic,now 1=2E0=2E20200513-1~18=2E04 amd64 [installed]
deploy@xxx:~$ sudo dpkg-reconfigure wireguard-dkms
=C2=A0
------------------------------
Deleting module version: 1=2E0=2E20200611
completely from the DKMS tree=2E
------------------------------
Done=2E
Loading new wireguard-1=2E0=2E20200611 DKMS files=2E=2E=2E
Building for 4=2E15=2E0-101-generic 4=2E15=2E0-106-generic
Building initial module for 4=2E15=2E0-101-generic
ERROR: Cannot create report: [Errno 17] File exists: '/var/crash/wireguard=
-dkms=2E0=2Ecrash'
Error! Bad return status for module build on kernel: 4=2E15=2E0-101-generi=
c (x86_64)
Consult /var/lib/dkms/wireguard/1=2E0=2E20200611/build/make=2Elog for more=
 information=2E
=C2=A0
deploy@xxx:~$ cat /var/lib/dkms/wireguard/1=2E0=2E20200611/build/make=2Elo=
g=C2=A0
DKMS make=2Elog for wireguard-1=2E0=2E20200611 for kernel 4=2E15=2E0-101-g=
eneric (x86_64)
Thu 11 Jun 14:07:36 CEST 2020
make: Entering directory '/usr/src/linux-headers-4=2E15=2E0-101-generic'
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/main=2E=
o
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/noise=
=2Eo
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/device=
=2Eo
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/peer=2E=
o
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/timers=
=2Eo
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/queuein=
g=2Eo
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/send=2E=
o
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/receive=
=2Eo
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=
=2Eo
=C2=A0 CC [M] =C2=A0/var/lib/dkms/wireguard/1=2E0=2E20200611/build/peerloo=
kup=2Eo
/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Ec: In function =E2=
=80=98send6=E2=80=99:
/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Ec:139:20: error: =
=E2=80=98const struct ipv6_stub=E2=80=99 has no member named =E2=80=98ipv6_=
dst_lookup_flow=E2=80=99; did you mean =E2=80=98ipv6_dst_lookup=E2=80=99?
=C2=A0 =C2=A0dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock,=
 &fl,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~=
~~~~~~~~~~~~~~~~
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipv6=
_dst_lookup
scripts/Makefile=2Ebuild:330: recipe for target '/var/lib/dkms/wireguard/1=
=2E0=2E20200611/build/socket=2Eo' failed
make[1]: *** [/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Eo] E=
rror 1
make[1]: *** Waiting for unfinished jobs=2E=2E=2E=2E
Makefile:1577: recipe for target '_module_/var/lib/dkms/wireguard/1=2E0=2E=
20200611/build' failed
make: *** [_module_/var/lib/dkms/wireguard/1=2E0=2E20200611/build] Error 2
make: Leaving directory '/usr/src/linux-headers-4=2E15=2E0-101-generic=E2=
=80=98
=C2=A0
##########

=C2=A0
=C2=A0Regards,=C2=A0
Martin
=C2=A0
