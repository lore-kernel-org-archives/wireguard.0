Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE224C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Feb 2022 13:55:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c7c9be54;
	Mon, 14 Feb 2022 13:55:11 +0000 (UTC)
Received: from smtp.dataaturservice.se (smtp.dataaturservice.se
 [46.246.118.194])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a6f8f2f9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Feb 2022 13:59:17 +0000 (UTC)
Received: from DESKTOPS9I7141 (c-bd9f524e.02-19-73746f30.bbcust.telenor.se
 [78.82.159.189])
 by smtp.dataaturservice.se (OpenSMTPD) with ESMTPSA id 878110ed
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Feb 2022 13:59:14 +0000 (UTC)
From: <brian@kuehn.se>
To: <wireguard@lists.zx2c4.com>
Subject: Installer failed to install on Win 11
Date: Wed, 9 Feb 2022 14:59:18 +0100
Message-ID: <00b501d81dbd$3b2514e0$b16f3ea0$@kuehn.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdgdvOhQck0bWKnkSZSQfizRhc7ATg==
Content-Language: sv
X-Mailman-Approved-At: Mon, 14 Feb 2022 13:55:05 +0000
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

I=E2=80=99ve been trying to install the Windows Client on my Win 11 =
machine. To no avail.

No I can=E2=80=99t change over to Linux on this machine. =F0=9F=98=89

The installer downloads fine. When started it just sits and waits for =
something. After a while, don=E2=80=99t know how long exactly, but maybe =
around 10 minutes a message shows up and says the installer has stopped =
responding. I tried a retry, but same procedure.

The .msi file downloads fine. When started, it says wait until Windows =
configures the install. Then after like 10 minutes, a message pops up =
saying the server isn=E2=80=99t responding. I tried a retry, but same as =
before.

I am a programmer, but Go isn=E2=80=99t something I=E2=80=99ve even =
played with, and I am totally new to this area of computing. =
I=E2=80=99ll probably open a VM and in Linux hook up this way until the =
client will install.

Greetings,

Brian Kuehn


