Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F351C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 07:34:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6CE21871
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 07:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eworm.de header.i=@eworm.de header.b="uBXsqPQR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6CE21871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17b35c78;
	Wed, 2 Jan 2019 07:31:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7091385e
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 20:47:54 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de
 [IPv6:2a01:4f8:13a:16c2::25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dd3bec8
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 20:47:54 +0000 (UTC)
Received: from leda (p5085ADF7.dip0.t-ipconnect.de [80.133.173.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 849D996E3D;
 Tue,  1 Jan 2019 21:50:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.mylinuxtime.de 849D996E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1546375809; bh=z1CNMo0+gyWQtA6QL0VcfiLdjQDZi0ccWu88FP8s4AA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=uBXsqPQRL7PdXj91CgPXxv8wDG0jsELxmgIrSljOH2W/RIXjqir9M8wf2/Bd4C2IK
 WhPh7/XxPEeHcYvjxfKiVGUNz4QQSp3LzSADrrfI96W2e8FiC18TnStGFa2waFZxxt
 tm87PoreSj+lWDgCNqzESFQGAbBE8raY4QAsxmvY=
Date: Tue, 1 Jan 2019 21:50:07 +0100
From: Christian Hesse <mail@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: binary module for arch?
Message-ID: <20190101215007.15f15e05@leda>
In-Reply-To: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
 |\QFlOg>\Bt!b#{; dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
 ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=mail@eworm.de
X-Rspamd-Server: mx
X-Stat-Signature: 13msma3fsdbg187ik6iuofwrh1w9cgpt
X-Rspamd-Queue-Id: 849D996E3D
X-Spamd-Result: default: False [-3.54 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,text/plain];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 NEURAL_HAM(-2.84)[-0.946,0]; SIGNED_PGP(-2.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; SUBJECT_ENDS_QUESTION(1.00)[];
 ASN(0.00)[asn:3320, ipnet:80.128.0.0/12, country:DE];
 RCVD_TLS_ALL(0.00)[]
X-Mailman-Approved-At: Wed, 02 Jan 2019 08:31:25 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2052594869516426732=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2052594869516426732==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G1t9gNHpvU_5yZWNl59N/ig"; protocol="application/pgp-signature"

--Sig_/G1t9gNHpvU_5yZWNl59N/ig
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Mon, 2018/12/31 01:58:
> Hey Christian,
>=20
> I noticed there are now two distro-built packages for wireguard for
> arch -- wireguard-lts and wireguard-arch. These seem probably more
> convenient for most people than the dkms one. What would you recommend
> in terms of updating wireguard.com/install/ ? And do you plan on
> depreciating the dkms one at some point, or do you think it will
> remain useful for certain users?

Hey Jason,

some people gave their legit reasons to keep wireguard-dkms. I have to add
another one: It is a build-dependency for the binary modules packages. So it
will stay definitely. ;)
--=20
Best regards,
Chris

--Sig_/G1t9gNHpvU_5yZWNl59N/ig
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEvYTecfST32gUsBZyVO3JFgm8kYMFAlwr0n8ACgkQVO3JFgm8
kYPacxAAlfd9CZZYh+cVCIhsBt8o/qk8M6HxXNM0D+bb7uVKv3ktznz75jQry2wu
A2yf/GQKFclg1+sFVJHBUeV7K2hzCPkctlFfknjVKJACM2cwaDyitwuh/KRWXL2K
WREe4kshjNa0UZkqWAwL8/TYCn1cKdsbZv5OFD/byS+6i4hMuv/RETfWjewhYnF7
cwJjiZlYPEHYDHy5BUWYvHad2+Wv3VCYwOLhMAiYv3FzvWXDT2CYlq0Kvhjw/BX9
NbDxTfHHYBeBg+wsc0W9Djf5x9T2SrOM1laVGHYjeAtvQ0vvRYd+kcI9NMUW/xP+
J7tcdsnTkOwqDzZxSijojcoBz2lpqmUePbyIxfSG/2rEBp3SuOtU2RaDvBhW4yRq
ZIhBwhN0JnneIK+asddiZgcwIaO8OsgqbyiHN0PTY61C2MySrQwZFoPwfLyNPCr3
5fQRMHLzEWUejFyc849B8PIfe3fO/Qx+k7AJUh7yMlPvM0R9sh1fjZd+LqKnJsgR
EzAsh+YmUEsSV0UBJ+wm9MplEp7+7j4HOvi0ZRG0JIOSHvHPVGTorNYBRqgTxYqH
zWtLL8/BS+V9bcmxpMTAI7gTraWyCl4e46UvXh47OtfmSmu40ZAA+xjG0Djnuv2W
TbZbt+Ek8GcET3xVsrk9q9n7dluapIYaRErl5UOXl68Ly/froa8=
=6te7
-----END PGP SIGNATURE-----

--Sig_/G1t9gNHpvU_5yZWNl59N/ig--

--===============2052594869516426732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2052594869516426732==--
