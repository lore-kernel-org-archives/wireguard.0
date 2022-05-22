Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F8FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 May 2022 10:54:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2667cf01;
	Thu, 26 May 2022 10:51:57 +0000 (UTC)
Received: from vsp-unauthed02.binero.net (vsp-unauthed02.binero.net
 [195.74.38.227])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f9ec0b61
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 May 2022 11:15:12 +0000 (UTC)
X-Halon-ID: 72389a60-d9c0-11ec-88e0-0050569116f7
Authorized-sender: joakim@tallinger.se
Received: from smtpclient.apple (81-224-60-119-no2340.tbcn.telia.com
 [81.224.60.119])
 by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPSA
 id 72389a60-d9c0-11ec-88e0-0050569116f7;
 Sun, 22 May 2022 13:15:11 +0200 (CEST)
From: Joakim Tallinger <joakim@tallinger.se>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Building Directly In Tree with Buildroot
Message-Id: <5DE587F6-FA8E-4935-A75F-4373A9D1CA89@tallinger.se>
Date: Sun, 22 May 2022 13:15:11 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Mailman-Approved-At: Thu, 26 May 2022 10:51:53 +0000
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

Hi,

I=E2=80=99m using Buildroot to build a custom linux kernel (4.14.185) =
for an embedded system, for which I now want to add Wireguard to. I have =
one config for initrd and another one for rootfs.

I added  =E2=80=9CBR2_PACKAGE_WIREGUARD_LINUX_COMPAT=E2=80=9D to initrd =
and =E2=80=9CBR2_PACKAGE_WIREGUARD_TOOLS=E2=80=9D to rootfs. It =
downloads the source and builds it accordingly. I can see the module is =
there before initrd image is created, but since system is booted with =
initrd, and then rootfs is mounted I can=E2=80=99t access the module =
with modprobe. To my understanding I need to solve this by building =
Wireguard in tree (i.e where module is always active)?

Which brings me to the question on how to apply the kernel tree script =
=E2=80=9Ccreate-patch.sh=E2=80=9D. I can manually navigate to the linux =
src directory and run it, but that won=E2=80=99t work as part of the =
Buildroot process.

I guess I need to add a pre-build step to run the script to patch the =
linux src, then add CONFIG_WIREGUARD=3Dy to my custom kernel config. =
Would this be the correct way to do it? Or is there some easier way to =
manage it?

Br, Joakim=20=
