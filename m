Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9E3C5479D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Jan 2023 02:43:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b36c541b;
	Tue, 3 Jan 2023 02:42:27 +0000 (UTC)
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4427d9d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Dec 2022 13:59:58 +0000 (UTC)
Date: Thu, 29 Dec 2022 13:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hr567.me;
 s=protonmail3; t=1672322397; x=1672581597;
 bh=S7b1QxfYAtGPM2QR1YwUdfqBa/VZoI+W74JkGnga8gI=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=VFD+nZkvvABelHJSEeV5XDDEhmzHsRFYa0BAR8/P0EAP2/Z1/wXh4DDsA8IHqDAzV
 lUlx66/r0p1cCoX2BuM/OLLH3qkvDwfHF2qwko9C3pGZvOnRabCYqlFibxIWyyuSnL
 QrbZNxFZLyAIczBwWpQRM2D8nX5Gjv5o8jwWat6YbQ09k0noCj9QzjAsLKs85Oh4ff
 +dkzQ7ZP+gQMi85fgg+bqepiX6rsBi9p57sBeNx3db3Rclr5k9GZs3ENbRaLNAREaT
 ErPXqwp+3AUVhC4JjNPk+kv20Odti3bpfigBu0GgFpxUbAB8yLHooseNdhAknDA+hh
 xRoPf1RbnDTgw==
To: wireguard@lists.zx2c4.com
From: hr567@hr567.me
Subject: example.c in wintun project does not work as expected
Message-ID: <000801d91b8d$cb88f730$629ae590$@hr567.me>
Feedback-ID: 8034366:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="------f906e55626c48e9172b8658fd85f0f6b22048b3d0cbc1cec7ba83c99f7db3946";
 charset=utf-8
X-Mailman-Approved-At: Tue, 03 Jan 2023 02:42:20 +0000
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
--------f906e55626c48e9172b8658fd85f0f6b22048b3d0cbc1cec7ba83c99f7db3946
Content-Type: multipart/mixed;
 boundary=149dd710c70a8faf068b390602935fec3a2d469bb2ba4cf1d6b91687ff4a
From: <hr567@hr567.me>
To: <wireguard@lists.zx2c4.com>
Subject: example.c in wintun project does not work as expected
Date: Thu, 29 Dec 2022 21:59:40 +0800
Message-ID: <000801d91b8d$cb88f730$629ae590$@hr567.me>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AdkbjbJ77fdOm/piSTKyxCZxfoLEmw==

--149dd710c70a8faf068b390602935fec3a2d469bb2ba4cf1d6b91687ff4a
Content-Transfer-Encoding: 7bit
Content-Disposition: 
Content-Type: text/plain; charset=UTF-8

I'm learning how to use wintun with its example.c file, however, the example
program doesn't run correctly currently. I found that the cause of the error
was calling WintunGetAdapterLUID before WintunStartSession. In this case,
WintunGetAdapterLUID set the InterfaceLuid to 0. I'm not sure if the problem
is caused by the wintun version or the OS version. I am using wintul.dll
version 0.14.1 and Windows 11 x86_64.


--149dd710c70a8faf068b390602935fec3a2d469bb2ba4cf1d6b91687ff4a
Content-Transfer-Encoding: base64
Content-Disposition: attachment; name="publickey - hr567@hr567.me -
 c8b7d072.asc"; filename="publickey - hr567@hr567.me - c8b7d072.asc"
Content-Type: application/pgp-keys; name="publickey - hr567@hr567.me -
 c8b7d072.asc"; filename="publickey - hr567@hr567.me - c8b7d072.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdvcGVuUEdQIDIu
NC43CkNvbW1lbnQ6IGh0dHBzOi8vZ29wZW5wZ3Aub3JnCgp4c0JOQkZ0RjZ2a0JDQURxWEU1UEFr
b3JBWmFtUzQrQXJWV0tDQnVnVWdneWlJZldERmVJc01uZDdocE5MQ04wCmwxYzlaazFQOEJkSEhL
RlFEZG1KNkdONk95bGplSWo1bnluR1llaURJU3FsT1MyK21haXZlNkxBV1J4NEdORDUKbjRNenRr
TW1ZTDJzZG9UeUVrSHRNRlhnaWdrRWFvcklZNmUvY3hRTG9tSlJ4dUc1Mm1IY3BidXlmbmdZN1NB
Rgp2QnRXeGxwSWtiaWR4QkJVMFQzdThXOGZGQ00vZGpQVjgvSm1IWGlzTlRISlc1MVkxc3I4TW9G
RkFUTGJFd2dHCmNtekZFTmRTeFhDb2ZDd0Yxb1VMYkxYSm8zaXpNeGJhMldrVGhFVUZEdkFPcTFi
OHRzajI2RnE4bWhBV1NycE8KQ3VzMmJHVE1tOW5sd2hYaFJOWUVSSjVFbWkydDdOYVV1eXM3QUJF
QkFBSE5IMmh5TlRZM1FHaHlOVFkzTG0xbApJRHhvY2pVMk4wQm9jalUyTnk1dFpUN0N3SDhFRUFF
SUFDa0ZBbHRGNnZrR0N3a0hDQU1DQ1JEQkk1SW1XdFRwCjJnUVZDQW9DQXhZQ0FRSVpBUUliQXdJ
ZUFRQUtDUkRCSTVJbVd0VHAybFF3Q0FEVHlhMFBURTdkQTJoQkkybGgKNmpEM0hoSU1sZmNyNHJB
TlZGRWszSUd4K21QMTJmM2JxVnpQOW9Fb2d4K0tmU2dDQVpNMTRZME1VQTFHVEhVVwpUSm5udjBp
QlpiVmVaN0EwVE1Ic3ZxK2dMc2VBSmhyNlJkMWw5ODJ4K1diemcvRTI4UFAzalozaUR4VWZ3c3Ja
CmY2dWVFMGlQdGdIcEZabHpnNXppcXBPb3R6VkkxYmxTblBUd0lsRG5zMUVFMVA1M3lTSWFhdVA0
WFNFUjNXck8KWjlrb040ck1vdTRFWlVtWXpuZ2lJTnE1bGVMaVh2eEhZTmY2akYycEY4UE1kcC8v
L1pwdXIzNEp4c2FOSytwYwpwNWw5dHo5eVBWYlZKL2R5Q0lqK0QvNEdoUWQ5dUdUK0J0clM0S3JJ
ci9VMno4NGtOejlob2dNaUtYZVQxUVB0CjZnTHJ6c0JOQkZ0RjZ2a0JDQUN4MDhOdFhhRmNyakpZ
azRWQUpIcW5WdzkxUElyMmZtQzIvcnFYN053WVFBZG4KaW5MbjlsbGxKaHd5RWZLMTRrdWZhUnBL
V2IvZHlBaWRQWk5kWkdkYUxHb3RIbEdlcFljUVpJZ055VW9LSWJHOAprTjJVRkNRU1Y5L1pTbUV5
NHU1MVZmZjVFUHNuVnBKVHUwdkhBSGZzODQ3WDBmWDFDY0loVm5Db3J6bEJjcUtwCmVPUTBjaXB6
MWFhbTlWMlhzbVk1V2thdnUveE5DZEZoNmQrSG1UMmthTXo1UlFhTDM2VGdabVFyTGppT3hLVnIK
RW9CS1JJNjRNOVhaTCtHaVVOOWljdndpQ205c3lzVUtDVncxWDdYVVhUbkVlM2Y5RkhlamRsbkNs
NWJEdDBUKwpPNUdtNmJjdXRQRWI3UklhNThmMGlzODdSUXdUdm8xVUExRlNKd2dwQUJFQkFBSEN3
R2tFR0FFSUFCTUZBbHRGCjZ2b0pFTUVqa2laYTFPbmFBaHNNQUFvSkVNRWpraVphMU9uYXByZ0lB
SzZHOWUvRGZ4M21zTWRYZm5kWHlXOUoKVm9lRkFjQi96L3o2dVpsbGcvb2J5TDFIT1crei9mdnB1
ZTNCRTF2cDY5UXZJb0Z1OGFpZ1Z4cHNpTXJ5RE50cgpDWXBlaW5qYTdVMW5XMDFFYjl6c3MrWEFr
OVNjYzJRRGdjT25KOWxrdCtCQkd1OGJ3NEdoYzlxU2U5MzdEYllJCjNlTGJKRnVENmFDelZxTGNv
ckUzb2htcEVxSDdzTFRHSTRPNVVTNlFTRmFRZk5Ed1Zhbi9RemM4VENuUVFud3MKTURRd3RsaUZ5
MGlhVTQ0eDBZSDVlemlPZEtmMHI2RWhBQTZKdFZ1dGZ0UmxRTFVOcmhWaFI2dkpiUmdSNHhWUwpw
aXFpa0QrMjJ1bTlHMStPV2dNUmFDQjZnT2VlQ1NuNWRlZ0lkb1FxcHhwQ1JrVk9nWUdOOXRnNU16
TjQ5WDQ9Cj14TzllCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0=
--149dd710c70a8faf068b390602935fec3a2d469bb2ba4cf1d6b91687ff4a--

--------f906e55626c48e9172b8658fd85f0f6b22048b3d0cbc1cec7ba83c99f7db3946
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBzBAEBCAAnBQJjrZ1NCZDBI5ImWtTp2hYhBMi30HJcsOYUiV/CiMEjkiZa
1OnaAADxGwgAgOzEDgPBApII06T7M15sDwN8Bg5huFGvXeDcM0PRQoB0bQOF
zWvHJJ/6ZcglLRimifTyJzFR0N5nWwd/w5QO4Zh3UEGHSlc3sm4O6lsr9Owc
Cx5q0a9V5Xv6+yU0/2/Atc9mmx6eG8KI22f69VvdclpMnlXe5ns24StKk/gr
ZT5Fl/jIjAejSyf47yUgc/h+F7mvK9crG+pv8dmi5Hg6Uzvpd6xDnYD2CbWi
9nAIao1ALDdiB+/M3VcF22DmzE8Y2IfunjbopMm6bwVhIi/3+dUGB4nt/4O7
yObc0C6mM3E3bGXz2pALIgIDge/zwRJ4yPeLyAXW/R0zNlIIh5UOFw==
=BERM
-----END PGP SIGNATURE-----


--------f906e55626c48e9172b8658fd85f0f6b22048b3d0cbc1cec7ba83c99f7db3946--

