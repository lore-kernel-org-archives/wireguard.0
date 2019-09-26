Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B85EFA3728
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1E120659
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1E120659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jzdm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aee1c6b1;
	Wed, 16 Oct 2019 20:15:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a26544b6
 for <WireGuard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 06:34:39 +0000 (UTC)
Received: from mx2.mailbox.org (mx2a.mailbox.org
 [IPv6:2001:67c:2050:104:0:2:25:2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a829a6a5
 for <WireGuard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 06:34:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id AA962A1C55
 for <WireGuard@lists.zx2c4.com>; Thu, 26 Sep 2019 08:34:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id QrgYDoCYISUw for <WireGuard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 08:34:33 +0200 (CEST)
From: "Johannes Z. D. Mieth" <mail@jzdm.de>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: iOS 13.1, AppleMusic and WireGuard not working together
Message-Id: <292B4AFF-49DB-4DF3-831E-20A1FEEA936D@jzdm.de>
Date: Thu, 26 Sep 2019 08:34:31 +0200
To: WireGuard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 16 Oct 2019 22:15:27 +0200
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
Content-Type: multipart/mixed; boundary="===============1109552103775504101=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1109552103775504101==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C746474D-D091-4207-A73C-20BE5BF2F78E";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_C746474D-D091-4207-A73C-20BE5BF2F78E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Dear all,

i am using WireGuard (1.0.6) on an iPhone 7 with iOS 13.1, the WireGuard =
endpoint is located at an Hetzner Cloud-Server (german hosting =
provider).
Since the update from iOS 12.4.1 to iOS 13.1 AppleMusic is no longer =
able to search for music while WireGuard is active.

Can anyone confirm this behaviour?
Is this specific to WireGuard or AppleMusic/iOS?
Unfortunately i am not able to check via a different endpoint as i only =
have this one on the Hetzner Cloud at the moment. Maybe Apple is =
blocking that network, but this would be unexpected and new to the =
current iOS version.

Sincerely,
	Johannes

--Apple-Mail=_C746474D-D091-4207-A73C-20BE5BF2F78E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9Rfk5zbLvt+K4ctGbHFLOjn6joIFAl2MW/cACgkQbHFLOjn6
joIODxAAwLet9ETwsbPZMIz845VCi2zmGjGJ81O/W9N1nenWaw5Cp2W6ruQjkiFu
O66hrCAZ1gujerKL1pawG+Z6GRJ+k6gfOyWvmrllU/0xebOP8jHynHWk59BpQt4s
dXyjyIfKHDeaQET/1RAjQ87VXaxdqBBhUFqaKz+l1ehc5/WujO2Sd02pYTTlWGdw
/OzIFGmApk/BjB9u57lCQ7727CmlFPw3VeKkEz0W6b7Fefp2w31vXCzW7/TBANc3
PCQxEM6xf0hM/iukJlemVBZWWJeTGnC1lfjFaDdwP1Rekc/xvgXGnBUPsl7c6wCF
EvUCzBF/VA/dnSULsdbgPJMuThtualknj12rM5eNlzwsFM/MrVCl1wEbZI9NI8ix
KEP4nY3FTCkgZeL+wyXL1AMM855gCz+Gsgi2IUp/c28FJ2CAAKwS6jEpXQ78h9uZ
xHgsZ3L3Z0vyMpQjuJNNp85ZZXRGmnIP2B3qrrpevnmMzsHUYpbXNg57EhKCP61O
X5jybVbzwT4OLGXBApUtWmnD8qEJsul6rilW7r6w7WcM/O+2jbwBbnCAuZpOR2HB
lzQEd7SYc6Mm2OrEUchFRxniHituBIG8jkzD1gIzS9S+JYe5bDM0dpMrkFmJI2Gz
b96A5xE9m7tGlQ1Pnt6psVdzYjewlMLS9ZG4HR0WC9IJuZQm1NI=
=D4U/
-----END PGP SIGNATURE-----

--Apple-Mail=_C746474D-D091-4207-A73C-20BE5BF2F78E--

--===============1109552103775504101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1109552103775504101==--
