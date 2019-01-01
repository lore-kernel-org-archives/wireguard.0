Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DD2C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 07:34:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A238E21871
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 07:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eworm.de header.i=@eworm.de header.b="i9MeiQq9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A238E21871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b62ed594;
	Wed, 2 Jan 2019 07:31:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9578c13
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 20:51:56 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d8b370d
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 20:51:56 +0000 (UTC)
Received: from leda (p5085ADF7.dip0.t-ipconnect.de [80.133.173.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 88B4E96F8A;
 Tue,  1 Jan 2019 21:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.mylinuxtime.de 88B4E96F8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1546376053; bh=AaKrUsFz7q4m6FYAh769EwEWnP8YizRD7bg0mvMPxxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=i9MeiQq9pGoHTibXz8R7/wVyq9NhSjDlpBoy4bcTSV023AEA7r1HisEQfCqjyG/TW
 L5zA5F+fMKuRt7wdxxhYGmu2MSHip1g99mEuqB/1IIaxf2VoSKGNzBV2lhfVevaalB
 YA3uIgxTQqWAUgN/YiEimKWx40Fm9dEg8avs99is=
Date: Tue, 1 Jan 2019 21:54:11 +0100
From: Christian Hesse <mail@eworm.de>
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: binary module for arch?
Message-ID: <20190101215411.10cd57dd@leda>
In-Reply-To: <lPQ5GurSKCXMO-VZWTLlzPNWWOS6oi7Q35asuQZSP6MQzEHDY_XGp0p9_XGkeA3tfX_DQiZyfJqvDel5ncCbKD5doM83U6yUHbh2sv-4ibA=@protonmail.ch>
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
 <CAMp63jVKAeieefottP=EwYMeo0daD5GDxwpT1PiPPOZQkQ6gSA@mail.gmail.com>
 <CAO_nJAYw_zbNBsxtaKbR=kxp-+E4d2VkzUfrWtnSn26ZVkuEMw@mail.gmail.com>
 <lPQ5GurSKCXMO-VZWTLlzPNWWOS6oi7Q35asuQZSP6MQzEHDY_XGp0p9_XGkeA3tfX_DQiZyfJqvDel5ncCbKD5doM83U6yUHbh2sv-4ibA=@protonmail.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
 |\QFlOg>\Bt!b#{; dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
 ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=mail@eworm.de
X-Rspamd-Server: mx
X-Stat-Signature: ax35zi8eqwoanrcyffy93r5hgcrb35f3
X-Rspamd-Queue-Id: 88B4E96F8A
X-Spamd-Result: default: False [-3.23 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,text/plain];
 TO_DN_ALL(0.00)[]; NEURAL_HAM(-2.53)[-0.843,0];
 SIGNED_PGP(-2.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 SUBJECT_ENDS_QUESTION(1.00)[];
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
Content-Type: multipart/mixed; boundary="===============3072354891501684297=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3072354891501684297==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j3FdFLsYhNOvcsWJHP9NKfR"; protocol="application/pgp-signature"

--Sig_/j3FdFLsYhNOvcsWJHP9NKfR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Jordan Glover <Golden_Miller83@protonmail.ch> on Tue, 2019/01/01 12:44:
> On Monday, December 31, 2018 5:11 PM, John <graysky@archlinux.us> wrote:
>=20
> > My recommendation is to change the wording under the command on your
> > install page to something like: "Users of the distro provided kernels
> > (linux and linux-lts) may download the requisite corresponding
> > precompiled wireguard module. Users of custom kernels will require the
> > wireguard-dkms package and corresponding kernel headers to compile the
> > module."
> > =20
>=20
> This isn't strictly true as there are distro provided kernels
> (linux-hardened and linux-zen) which don't have wireguard binary modules
> available. Below would be more appropriate:
>=20
> "Users of linux and linux-lts kernels may download the requisite
> corresponding precompiled wireguard module. Users of other kernels will
> require the wireguard-dkms package and corresponding kernel headers to
> compile the module."

I would propose another change in wording as you do not download modules but
packages:

"Users of linux and linux-lts kernels may download the requisite
corresponding precompiled wireguard module package. Users of other kernels
will require the wireguard-dkms package and corresponding kernel headers to
compile the module."

Installing wireguard-tools package with pacman gives info about optional
dependencies, so the name of the required packages should be obvious.
--=20
Schoene Gruesse
Chris

--Sig_/j3FdFLsYhNOvcsWJHP9NKfR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEvYTecfST32gUsBZyVO3JFgm8kYMFAlwr03MACgkQVO3JFgm8
kYN2bA/7BIMjjJGhB0zo/FTM6g8QEIl95m7vC2IqoTD9octqO89NfeLzdOLlzgDi
wHkWLwtIWjtoZI7VXBlSQaWGXN7u9TyEs/2AoB7fG3HJLPo/ZR97WXIYxpEX7ESn
CyD4K9h5eqc1WhkLXKhA5RslEtuw+YTSQDzSzZH3jeDfqfFX4+6EBKynOQDleW6I
mGMEPsLKPwCzrkOORn5/ZrJAn1lViUqtZEqXgak/RjF77jU8Q/ey5G1hhVHqTnkD
kCzBWxdBhuELbCeMCtWXRcdHp2xz0d7FuYRZ6WqLTZr0G7FiQPxT9g1yu/ToMGXm
g7S4TZYf83acYYMzJHbmVXjiPLXAKLh1F5ptNcoAdmg7TSL5UIJ1J+cnar13Y4h/
ESBnJpzkqI9lixR1KuVWx3mVNPd7xtGDc9TSL+zCYgdmnRwFnp+/wcGiptA3Qq61
v44PHejUxzHKfRiUD41vsGXB6oZFFPi09T8R3wxKKs1Yqiv2kr7qIZg/9sfFoZPb
TNnX6uFihbrguzcYKCtrTvTepe/aIbgmta3+RndBYB2DybXJVLaKnR8taPyaY7xN
VFsLaZIOIpxNpGR2g1GnrThLy6EG8hVO4sF1rS89SR4Ep8zWaS66ee/uz+5JyO54
by1Ytq2DQpSKwPmTwxr9f3T1kCmPBrJrByoZzQdfwRe8yjfyZ9E=
=DY+9
-----END PGP SIGNATURE-----

--Sig_/j3FdFLsYhNOvcsWJHP9NKfR--

--===============3072354891501684297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3072354891501684297==--
