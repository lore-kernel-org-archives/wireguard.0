Return-Path: <SRS0=eD45=PN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF1DC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Jan 2019 17:40:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972222087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Jan 2019 17:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sunfi.sh header.i=@sunfi.sh header.b="OFYQxXHO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 972222087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sunfi.sh
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cad91b0a;
	Sat, 5 Jan 2019 17:37:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 520acc04
 for <wireguard@lists.zx2c4.com>; Sat, 5 Jan 2019 17:37:02 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f55a685
 for <wireguard@lists.zx2c4.com>; Sat, 5 Jan 2019 17:37:02 +0000 (UTC)
Date: Sat, 05 Jan 2019 17:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunfi.sh;
 s=protonmail; t=1546709987;
 bh=xynxL/dlGFjh9bJiCzgXtEb3U8Aj/UHN9ug/4EhEhAg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=OFYQxXHO9Tm123FdkA0CYXCC3HyZkw7QzUloJeBwrei90XO41GfKn6qL2IAiOaZll
 WNtA/io1wjceMn3kHbKP00nrgmNmwei2F28Ml19hT+lJZU/4A13YaEMD9oxehLHpXO
 KiOgBJsWd/lq9xp1pj2JPkWW+L2qOBHu47p8fM/w=
To: David Cowden <dcow@eero.com>
From: Phil Hofer <phil@sunfi.sh>
Subject: Re: Wireguard + anycast
Message-ID: <br7iPtsRaLNNRVU4aLXvRRyGQd991wlyMAVm3orrZmoxQTtdDi0H4usQLYXngYxGZ_7z_YNd16xrgxK1bUIElgbxeW3EDFHRIIRKeSt3TWw=@sunfi.sh>
In-Reply-To: <CACN7iODSSjKJEWPdTKOK3diUFGyj-tRbvKWqNzsG62aKUN28OQ@mail.gmail.com>
References: <CAPRZce1x-TLHiZ=nU9s0_aYcWZdf_hTbcXYg+ZkAjD1F_=X9ng@mail.gmail.com>
 <CACN7iODSSjKJEWPdTKOK3diUFGyj-tRbvKWqNzsG62aKUN28OQ@mail.gmail.com>
Feedback-ID: KQYgXwW95KZKFtdKXbDLp7uXG-WRoO_GBxBXScjXQTnH4hk8IX5tVgVB60E7xVGeWaFgWV0KxGB7LiMdLyDAuw==:Ext:ProtonMail
MIME-Version: 1.0
Cc: Edward Vielmetti <edward.vielmetti@gmail.com>,
 "WireGuard@lists.zx2c4.com" <WireGuard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Phil Hofer <phil@sunfi.sh>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0776724923400139444=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0776724923400139444==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------7a0bdab8a77b099c7853a7f3bc01d0da"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------7a0bdab8a77b099c7853a7f3bc01d0da
Content-Type: multipart/mixed;boundary=---------------------1bc2381b8619db31222337876136d692

-----------------------1bc2381b8619db31222337876136d692
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8


> If Wireguard let you configure a list of allowed keys for a peer (instea=
d of a single key) that would be a logical solution without much extra com=
plexity at all I imagine.

As a handshake initiator, you wouldn't know which key to use.
Similarly, when receiving a handshake initiation, you wouldn't
know which key to use to authenticate the handshake. You'd
have to fall back to trial decryption/encryption, which I
think is a non-starter.

The one-to-one correspondence of IP ranges to keys is
baked into the protocol pretty deeply. I'd say this is one
of those simplifying assumptions that Wireguard makes over
IPsec and friends that makes it easier to configure and
administrate.

-Phil
-----------------------1bc2381b8619db31222337876136d692--

-----------------------7a0bdab8a77b099c7853a7f3bc01d0da
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail
Comment: https://protonmail.com

wsBcBAEBCAAQBQJcMOvZCRCcWq5QArEh8AAAVJUH/jaSL0N3jwgBBHDWDkbB
Qq7GCjM9vgB8XZIMsa0lHG61t8xLyOTyMmD4AQOXchdsPnjeNFu4tIo0yr+t
7QiYLWYQ8zuchnKFxWjUY0mUOXrISC4n7G4elCcPqyoGtNTmrqC3WtHmr6yH
ytcDG/g32TSnoN25KxXPoAZMDHglt7i2b0VprtGKh+ccUMRVlWgz4mJH4Fp1
eEwfhe6qDTtPWCWzDO6CHD2aLBpnY42laWg+LqpH5jdKNTILBZZX8l++ERCX
DQkAsobtzeBkDwYiw17b9zwN0r3DM0dfeoPWnbhvuiPC4M1C3a7zk+ixJi7H
YqXo4pIAxMwjPXAWmpg0EC0=
=f/hZ
-----END PGP SIGNATURE-----


-----------------------7a0bdab8a77b099c7853a7f3bc01d0da--


--===============0776724923400139444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0776724923400139444==--

