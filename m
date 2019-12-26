Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2A6C2D0C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 20:07:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F37420740
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 20:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eworm.de header.i=@eworm.de header.b="ghO8DJpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F37420740
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41d89639;
	Thu, 26 Dec 2019 20:06:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a53e4c2e
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 20:06:54 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66fe5dfc
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 20:06:54 +0000 (UTC)
Received: from leda (p200300CF2F20CD00625718FFFE7F1598.dip0.t-ipconnect.de
 [IPv6:2003:cf:2f20:cd00:6257:18ff:fe7f:1598])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 6492FBDE99;
 Thu, 26 Dec 2019 21:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.mylinuxtime.de 6492FBDE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1577390813; bh=psP9ndyU4bcXfe8kkFt46GSf1GnF2whg0NT92DiaMpU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ghO8DJpKE8xMN/3rE6IxvMv474qbLEvZ4aAy4ESkxsn069VcChrI5NOBFwV651d1N
 Xe9sB3DeRzshI7zXFTWUmNgujgRw/IMB7BtHe5uLSnTNXDZ0F1HuPs+zTcMOdhoL7M
 q7fZoWpANb1JjiT6arSouMOeFY+gpvF8xEJViVug=
Date: Thu, 26 Dec 2019 21:06:48 +0100
From: Christian Hesse <list@eworm.de>
To: Lee Yates <rainmakerraw@icloud.com>
Subject: Re: DKMS failure on Ubuntu with linux-5.4.6 (generic)
Message-ID: <20191226210648.77bc84fe@leda>
In-Reply-To: <1FF80632-4AB8-4A48-BDD3-E166AD407E00@icloud.com>
References: <1FF80632-4AB8-4A48-BDD3-E166AD407E00@icloud.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
 |\QFlOg>\Bt!b#{; dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
 ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=list@eworm.de
X-Rspamd-Server: mx
X-Stat-Signature: qp4nckwcofzbrn17onxhrhi6braee9jm
X-Rspamd-Queue-Id: 6492FBDE99
X-Spamd-Result: default: False [-4.68 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[icloud.com];
 MIME_GOOD(-0.20)[multipart/signed,text/plain];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 NEURAL_HAM(-2.98)[-0.994,0]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[icloud.com]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_TRACE(0.00)[0:+,1:+,2:~];
 ASN(0.00)[asn:3320, ipnet:2003::/19, country:DE]
Cc: WireGuard Mailing List <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============7757687113075728183=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7757687113075728183==
Content-Type: multipart/signed; boundary="Sig_/26wX1PA8LWQw1acNZz5rDdb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/26wX1PA8LWQw1acNZz5rDdb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Lee Yates <rainmakerraw@icloud.com> on Mon, 2019/12/23 00:26:=20
> Does anyone have any ideas? The error log was somewhat vague (to my
> uneducated eyes).

Already fixed, just use the latest code:

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=3De206c2b9e94ae13a9=
ccbec51173213265c01367c

--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/26wX1PA8LWQw1acNZz5rDdb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAl4FEtgACgkQiUUh18yA
9HZICwgAzSFN9boriXs18z/3MZz0IYYR7lR0padWmqTbkM6NYKPiYY3snvt8eoIJ
fabeNI8vPGZJmDk2S/rxMOsiaNVl6y7SFOiwPQbJtuoftqRkKl6rQ9cerhm05Orq
7tOzAgo9qy4Vqa1m5j1FrFlSvmYMHGpT2AsOkasOaG3QPQ7TOn8nUAEUKqxnOgHN
4tGF25sUaCDCZb64MSkn1CUfu+lWRlxmboMJS3BBFv7DiRk55KO5DnwYJUzEBpwq
/Z8A0tA0P9lDTGQMNZ8cy6s9tCwpTb0jvEftuUBRDzuYuJxStkMmRaMc3QcCwdPo
CA9nay0CradGQDIfN+++h/K9We8H9g==
=Qxjv
-----END PGP SIGNATURE-----

--Sig_/26wX1PA8LWQw1acNZz5rDdb--

--===============7757687113075728183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7757687113075728183==--
