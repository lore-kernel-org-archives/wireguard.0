Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B6DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Feb 2022 17:55:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 865892c7;
	Mon, 14 Feb 2022 17:55:07 +0000 (UTC)
Received: from smtp.dataaturservice.se (smtp.dataaturservice.se
 [46.246.118.194])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e95b3f3d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Feb 2022 17:55:05 +0000 (UTC)
Received: from smtpclient.apple (c-bd9f524e.02-19-73746f30.bbcust.telenor.se
 [78.82.159.189])
 by smtp.dataaturservice.se (OpenSMTPD) with ESMTPSA id b8127dfa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Feb 2022 17:55:01 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Brian Kuehn <brian@kuehn.se>
Mime-Version: 1.0 (1.0)
Subject: Re: Installer failed to install on Win 11
Date: Mon, 14 Feb 2022 18:55:04 +0100
Message-Id: <F5ABA895-81D4-4D1A-8A03-8A28F2DCF102@kuehn.se>
References: <00b501d81dbd$3b2514e0$b16f3ea0$@kuehn.se>
In-Reply-To: <00b501d81dbd$3b2514e0$b16f3ea0$@kuehn.se>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (19C63)
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

Hello all!

I=E2=80=99ve since this last message been able to install Wireguard. I=E2=80=
=99ve connected to my server and everything thing works perfectly.=20

In the Device Manager I have 3 Unknown devices, all seemingly connected to W=
ireguard. It wasn=E2=80=99t until I deactivated these unknown devices that e=
verything kicked in motion.

Upon further investigation I found 2 network devices showing Wireguard affil=
iation.

I have to open a windows terminal with admin access to open a Wireguard sess=
ion that activates.

The thing I am wondering about is, why didn=E2=80=99t the options to run as a=
dmin work in the first place? I have checked my Win 11 installation and ther=
e is nothing outstanding nor nothing else strange. Any insights would be gre=
at.

Also how to get rid of the unknown devices would also be helpful.

Greetings,

Brian Kuehn

Skickat fr=C3=A5n min iPhone

> 14 feb. 2022 kl. 15:05 skrev brian@kuehn.se:
>=20
> =EF=BB=BFHello all!
>=20
> I=E2=80=99ve been trying to install the Windows Client on my Win 11 machin=
e. To no avail.
>=20
> No I can=E2=80=99t change over to Linux on this machine. =F0=9F=98=89
>=20
> The installer downloads fine. When started it just sits and waits for some=
thing. After a while, don=E2=80=99t know how long exactly, but maybe around 1=
0 minutes a message shows up and says the installer has stopped responding. I=
 tried a retry, but same procedure.
>=20
> The .msi file downloads fine. When started, it says wait until Windows con=
figures the install. Then after like 10 minutes, a message pops up saying th=
e server isn=E2=80=99t responding. I tried a retry, but same as before.
>=20
> I am a programmer, but Go isn=E2=80=99t something I=E2=80=99ve even played=
 with, and I am totally new to this area of computing. I=E2=80=99ll probably=
 open a VM and in Linux hook up this way until the client will install.
>=20
> Greetings,
>=20
> Brian Kuehn
>=20
>=20

