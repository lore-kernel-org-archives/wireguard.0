Return-Path: <SRS0=qqbH=72=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6453C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Jun 2020 05:35:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A0F62081A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Jun 2020 05:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="LW1j2xgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A0F62081A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d73f66c;
	Sat, 13 Jun 2020 05:18:19 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6676e60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Jun 2020 05:18:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8C1D2814EC
 for <wireguard@lists.zx2c4.com>; Sat, 13 Jun 2020 07:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1592026544;
 h=from:from:sender:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fw/DMHoE4rMjbB7mp44iCCoKbuhqh5qiqppeLwpwlwU=;
 b=LW1j2xgmGiYjfvA4+yScLIiXuNsGJgRBO/8fpTup7BTmrgYoExf3cKMzKMDs+XGErXzxPa
 ZQCgCg/hSs03RE1rO+9UCHlWRrHyHc1CxoyrKw10yEed7iMX4NvBYPCt2opHkn7X/cpx/P
 3+BpxBSeHGo7Yc8E4fzV0eH884OYA1d9dor1L9VyCn5gfDNkfV4e2czdVPQ0CTO3fzU4WJ
 +lAjIq58UsSMqkqHj4+mE02uO85j0xfQ8lQvkSG94DA4g3UU/NCjyIPz6HRRDCxCB40Hvk
 E8QaMszL7y1IWGYtAUx3IrbZZbuu6q60ZkTawQhB9qliSl/1+iexOJF3J/EBdQ==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: <wireguard@lists.zx2c4.com>
References: <etPan.5ee21f64.7c09ac86.1105b@gmx.de>
 <trinity-bcc1ea44-937b-4b1f-a979-acf971aac3ac-1591986145982@3c-app-gmx-bs62>
In-Reply-To: <trinity-bcc1ea44-937b-4b1f-a979-acf971aac3ac-1591986145982@3c-app-gmx-bs62>
Subject: AW: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
Date: Sat, 13 Jun 2020 07:34:35 +0200
Message-ID: <5e5e01d64144$529b2850$f7d178f0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQKwtmKDDrPEutI15pky9mfxYtUAygGOjltfpxSm4xA=
Content-Language: en-us
X-Last-TLS-Session-Version: TLSv1.2
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

I was hit by that issue as well. Going for HWE kernel as proposed at =
https://www.reddit.com/r/WireGuard/comments/h0tkzt/up_to_date_ubuntu_1804=
4_cannot_compile_wireguard/ solved it for me (for now).
Regards, Joachim

-----Urspr=C3=BCngliche Nachricht-----
Von: WireGuard <wireguard-bounces@lists.zx2c4.com> Im Auftrag von Martin =
Jurasik
Gesendet: Friday, June 12, 2020 8:22 PM
An: wireguard@lists.zx2c4.com
Betreff: Aw: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks =
wireguard-1.0.20200520

I haven't seen any update of the wireguard package yet. Is it still =
missing?
=20
I have only seen an update of wireguard-linux-compat but this isn't used =
under Ubuntu 18.04, right?
=20
Thanks & Regards,
Martin
=20
=20
=20

Gesendet: Donnerstag, 11. Juni 2020 um 14:11 Uhr
Von: "Martin Jurasik" <martin.jurasik@gmx.de>
An: wireguard@lists.zx2c4.com
Betreff: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks =
wireguard-1.0.20200520

Hi Jason,
=20
still no luck with the updated version. make still fails.
=20
#####

wireguard/bionic,bionic,now 1.0.20200513-1~18.04 all =
[installed,automatic] wireguard-dkms/bionic,bionic,now =
1.0.20200611-0ppa1~18.04 all [installed] wireguard-tools/bionic,now =
1.0.20200513-1~18.04 amd64 [installed] deploy@xxx:~$ sudo =
dpkg-reconfigure wireguard-dkms
=20
------------------------------
Deleting module version: 1.0.20200611
completely from the DKMS tree.
------------------------------
Done.
Loading new wireguard-1.0.20200611 DKMS files...
Building for 4.15.0-101-generic 4.15.0-106-generic Building initial =
module for 4.15.0-101-generic
ERROR: Cannot create report: [Errno 17] File exists: =
'/var/crash/wireguard-dkms.0.crash'
Error! Bad return status for module build on kernel: 4.15.0-101-generic =
(x86_64) Consult /var/lib/dkms/wireguard/1.0.20200611/build/make.log for =
more information.
=20
deploy@xxx:~$ cat /var/lib/dkms/wireguard/1.0.20200611/build/make.log
DKMS make.log for wireguard-1.0.20200611 for kernel 4.15.0-101-generic =
(x86_64) Thu 11 Jun 14:07:36 CEST 2020
make: Entering directory '/usr/src/linux-headers-4.15.0-101-generic'
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/main.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200611/build/peerlookup.o
/var/lib/dkms/wireguard/1.0.20200611/build/socket.c: In function =
=E2=80=98send6=E2=80=99:
/var/lib/dkms/wireguard/1.0.20200611/build/socket.c:139:20: error: =
=E2=80=98const struct ipv6_stub=E2=80=99 has no member named =
=E2=80=98ipv6_dst_lookup_flow=E2=80=99; did you mean =
=E2=80=98ipv6_dst_lookup=E2=80=99?
   dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                    ^~~~~~~~~~~~~~~~~~~~
                    ipv6_dst_lookup
scripts/Makefile.build:330: recipe for target =
'/var/lib/dkms/wireguard/1.0.20200611/build/socket.o' failed
make[1]: *** [/var/lib/dkms/wireguard/1.0.20200611/build/socket.o] Error =
1
make[1]: *** Waiting for unfinished jobs....
Makefile:1577: recipe for target =
'_module_/var/lib/dkms/wireguard/1.0.20200611/build' failed
make: *** [_module_/var/lib/dkms/wireguard/1.0.20200611/build] Error 2
make: Leaving directory =
'/usr/src/linux-headers-4.15.0-101-generic=E2=80=98
=20
##########

=20
 Regards,
Martin
=20

