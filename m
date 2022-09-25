Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7ABC6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:35:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1f931ce2;
	Wed, 28 Sep 2022 10:21:12 +0000 (UTC)
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 07adf10b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Sep 2022 11:20:20 +0000 (UTC)
Date: Sun, 25 Sep 2022 11:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coot.me;
 s=protonmail3; t=1664104819; x=1664364019;
 bh=z2i0SOVqfSHKC2eq/IEUf3rTF+uYf8rocCG9z4BUIEs=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=Mtd4UoThyJsEQTCcErmxtW/n5v6xD9Jzj7B1VdA/4Ccmr6BxydO/FXaw4I0Z/+rc7
 pUBhwk/HilX2wtMFyDuDK12lhLv9GRBVQxksNDZZdu/zAdAYrjOCVW+LzOlZO90Cma
 XMuvDpdEInv2ZJiE2o0vHA7l41A6nC5ijMzcaBzz1hwyTvoYrqrQFAtrMpkpUfLYTy
 pfwTfpUqRqaec9h5K0OrCipR9hbwGNc4s6ZbWnL2ruDJV2Cllq1XlzgejSz19ougwD
 K8wt0MOkiehKSdk7ealjrTGPDuGvMdx/sTc9DauRTjTv3fulla3MiYB+LYVwydX965
 eNqW3pJPmgrEg==
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: coot@coot.me
Subject: WireGuard invalid MAC
Message-ID: <tc_RJxAHLCkuwnH-zzqG_kRpINdKQPkHV2EcHxd9Hvg35zKUqTjSD1enVM8UAEBeURm-4aBHxJEadNfVqn7ZRxyV2BAKrarPa5cL_hKhpB4=@coot.me>
Feedback-ID: 9389779:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="------5cf1df8c086003ad229c8a56167d3d1ab60217138d7bbed4162ad21bf6a97e32";
 charset=utf-8
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------5cf1df8c086003ad229c8a56167d3d1ab60217138d7bbed4162ad21bf6a97e32
Content-Type: multipart/mixed;boundary=---------------------83049b1c07457db80a83db2856a9cc9c

-----------------------83049b1c07457db80a83db2856a9cc9c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hello,

I configured wireguard so I can access my home server from a laptop.

When the laptop is using its eth0 interface to transport wireguard protoco=
l messages it works fine, but when I switch it off and use wlan0 (which is=
 using a different ISP), on the server side the kernel logs:

Keypair 20 destroyed for peer 2
Keypair 21 created for peer 2
Invalid MAC of handshake, dropping packet from ...

I am using a ddns to setup the endpoint on the laptop.  It's not a connect=
ion issue, as packets are reaching the server, but somehow the message aut=
hentication code (MAC) is not right after switching the interfaces.  Any c=
lues how could I investigate this further?

Client config:
```
[Interface]
Address =3D 10.0.0.3/24
ListenPort =3D 5000
PrivateKey =3D <client_private_key>

[Peer]
PublicKey =3D <server_pubic_key>
AllowedIPs =3D 10.0.0.1/32
Endpoint =3D <dynamic domain name>:5000
```

Server config:
```
[Interface]
Address =3D 10.0.0.1/24
ListenPort =3D 5000
PrivateKey =3D <server_private_key>

[Peer]
PublicKey =3D <client_public_key>
AllowedIPs =3D 10.0.0.3/32
```

When the laptop is using wlan0, the server receives a packet `Handshake In=
itiation`, which is not replied.  When the laptop is using eth0 it just se=
nds messages of type `Transport Data` (both observed with a tcpdump).

Regards,
Marcin
-----------------------83049b1c07457db80a83db2856a9cc9c--

--------5cf1df8c086003ad229c8a56167d3d1ab60217138d7bbed4162ad21bf6a97e32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBzBAEBCAAGBQJjMDlOACEJELzb3fH7p2X/FiEEoEYDG+01s7povBmrvNvd
8funZf+kggf/ZjaUPbEK4Z5ji/nigS2kCrZqqxsab3x6Ot8Sk+LKejLtts98
SBc5NdUn/GgEPkPjfogC7tLpIOt5l5QyvHrp9wTNmmfSS0Oamhc7Wpv8ZF8w
RorB/WU/zQVU7OM4BI1VBL5eFyOuyqwKnZMHsYgUxxVGn3a+htdCoHe26QSU
ZGiOPc4NdWHDNr+7IGwK4frCOWWCKw6bTuzuAx/N4m+zi9bOok3ojUolGAn2
METMzJ/IAjQxsqOeDkSQ0JP4J2sQbCDKksPhKhJtEx1Azm7XsjSjDqStVtbO
JZzvOA68HSIyg1mMJ3JXJDpdMulFvP+XFS8sMlQmumWALZdnSEHc8Q==
=ELbS
-----END PGP SIGNATURE-----


--------5cf1df8c086003ad229c8a56167d3d1ab60217138d7bbed4162ad21bf6a97e32--

