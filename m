Return-Path: <SRS0=aF/C=7Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9863C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 12:17:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D57D20760
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 12:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="CK98CII/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D57D20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62781ba9;
	Thu, 11 Jun 2020 11:59:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b3daf3cf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1591877808;
 bh=XVFhF7vr68Vx73miWDoYpb/xcr2mqyLcrtUNbn/YB9o=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=CK98CII/U+pflaoThAgn9slwrNolPjEqynSKdE6Y+W2ZpP6g52wt/Oha5pt0wSLhQ
 1Gnbm6N1iMkeEZ/86C0eTc0PeNIq+K+m3tT+P9WfBBD7bgG0ClS5YK5DStsxwwcRU3
 G+ADhlZJBWK17ddJFqsdiuTSq3QOor4MP5Y2xdOA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [176.198.17.117] ([176.198.17.117]) by web-mail.gmx.net
 (3c-app-gmx-bs25.server.lan [172.19.170.77]) (via HTTP); Thu, 11 Jun 2020
 14:16:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-648c77f5-3d72-4292-a319-247e17105ea9-1591877807942@3c-app-gmx-bs25>
From: Martin Jurasik <martin.jurasik@gmx.de>
To: wireguard@lists.zx2c4.com
Subject: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2020 14:16:47 +0200
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:cDtuSEwQOsA5dMLRBNYkb5ffKlyaHv3+WOYmQTDhMal1ztn6/ZwiKfBMXUs3Zu04Q+ZHR
 2db2RmozadrQuVzUSuWTx+uYUajuGNTp6onW4cFwLvbixQbLDopcVJP2IgkLuO1yXkbwCSq+rNBv
 t9kCnYtrU9ijDAkAaea7t1hmhVXJ9LM7Ra7pD0pZByzw9HJTtkQoj74xsucbBc1t2bGawTnUQDw9
 ACVd12TP0I57w6VGBdgFPslPG2qZ/MJvvYnnoL3dq1IeV8lU4049qsZPwBM6SQOk87XCw0XSLdVa
 FQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ySUTUwMQdNA=:73fXdsT9Bd9fsOzL3TLfRb
 KxhTOLyXtL64mRHhM2IRIZ1xbVQtxmSVt7D8aUjiDtlh3unrCrT2sh4FOlGeSnHwfd3Bo2QLn
 KzpU8oJQw8X2m3FQfBFyJKd8jRKeclzQwHW6Bb+RaOA3ZpDEYWvY3miQbEXua0tSsVcIMebMs
 2H62yODHsbqXI0y5RGaJgGAfBAIeScIhb4y/vteJOXnXe6/Q8/Gh0MbhNVqrBOLQxUYtnP6xu
 fNM5X2fhVHqwl+TAVjM3bj2wUNXNv7UxPOYhlcqCE+s7Bk+Tjifi7MUCXsYy7UR99k+PjnQiD
 iqtVaiUObBGrifB6ISAu+J79eT2a0mjP+0zROoI7+W8f4ODTiOIZbs54O9HKI0xRsT2USBqJW
 17OdcOVvxNh/DRz/0dfXm5NnBL/+qtY5jFvP98ojQaogUjxAj2bWSH7q1NZPun8D2IFqCB31W
 Ms352zgny1+gMCitQjCBCRYzqUXwZ/2JByzel0FazqA4Sk2D7HRtXM3rAM7XvFq8poyWx67BK
 6A5v+HANyNFPOH6SxzLQEQplBGNYz3I31KeySbHSpaloa///otsPuE1oWzOBJLXDU/t5zfVrm
 6Ial4luq2Z9NC4u8EFaL4FML8IRkrogdlRRultIoV8lNW/t36OH64fjCequPa3XaPImMaL1AZ
 uSXwZLk8jNSJlp+OYn1PMqPu3kyehUAPI/1ZwNXRIIuIkShV3VCqrKqyDVTN6JhkxpCc=
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

Hi Jason,

still no luck with the updated version=2E Make still fails =2E=2E=2E

#######

wireguard/bionic,bionic,now 1=2E0=2E20200513-1~18=2E04 all [installed,auto=
matic]
wireguard-dkms/bionic,bionic,now 1=2E0=2E20200611-0ppa1~18=2E04 all [insta=
lled]
wireguard-tools/bionic,now 1=2E0=2E20200513-1~18=2E04 amd64 [installed]

deploy@xxx:~$ sudo dpkg-reconfigure wireguard-dkms

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

deploy@xxx:~$ cat /var/lib/dkms/wireguard/1=2E0=2E20200611/build/make=2Elo=
g=20
DKMS make=2Elog for wireguard-1=2E0=2E20200611 for kernel 4=2E15=2E0-101-g=
eneric (x86_64)
Thu 11 Jun 14:07:36 CEST 2020
make: Entering directory '/usr/src/linux-headers-4=2E15=2E0-101-generic'
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/main=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/noise=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/device=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/peer=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/timers=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/queueing=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/send=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/receive=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Eo
  CC [M]  /var/lib/dkms/wireguard/1=2E0=2E20200611/build/peerlookup=2Eo
/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Ec: In function =E2=
=80=98send6=E2=80=99:
/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Ec:139:20: error: =
=E2=80=98const struct ipv6_stub=E2=80=99 has no member named =E2=80=98ipv6_=
dst_lookup_flow=E2=80=99; did you mean =E2=80=98ipv6_dst_lookup=E2=80=99?
   dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                    ^~~~~~~~~~~~~~~~~~~~
                    ipv6_dst_lookup
scripts/Makefile=2Ebuild:330: recipe for target '/var/lib/dkms/wireguard/1=
=2E0=2E20200611/build/socket=2Eo' failed
make[1]: *** [/var/lib/dkms/wireguard/1=2E0=2E20200611/build/socket=2Eo] E=
rror 1
make[1]: *** Waiting for unfinished jobs=2E=2E=2E=2E
Makefile:1577: recipe for target '_module_/var/lib/dkms/wireguard/1=2E0=2E=
20200611/build' failed
make: *** [_module_/var/lib/dkms/wireguard/1=2E0=2E20200611/build] Error 2
make: Leaving directory '/usr/src/linux-headers-4=2E15=2E0-101-generic'

####

Regards, Martin
