Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8892E9B24E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 10:53:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bf229b4d;
	Tue, 24 Feb 2026 10:53:01 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [46.4.70.188])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3f244ada
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 10:52:59 +0000 (UTC)
Received: from leda.eworm.net (unknown [193.159.163.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 0C6D92FF1E6;
 Tue, 24 Feb 2026 11:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.mylinuxtime.de 0C6D92FF1E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1771930379; bh=HB750z/b/pL/sqRaCr1UakJmBf20r/U3AqjlAgwVKgM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JleUb1ff7356ywZQ5XpUN8q/rudmFUaN3yHDVWp4kDso5xdXyjzVN1tOasEbhzpNf
 au2toYx7KuGA/23XS0CLCgRU6biRH/NpjhQwfx6NjpkGgl/bxx6bEYYuhO4npUbWIp
 pk/VJeJnrjAKfoVIU9xdavCzFZDMdIyIDq46lESo=
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=list@eworm.de
Date: Tue, 24 Feb 2026 11:52:54 +0100
From: Christian Hesse <list@eworm.de>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: Arch Linux - out of date?!
Message-ID: <20260224115254.761df5a9@leda.eworm.net>
In-Reply-To: <20260210143016.0144acf1@leda.eworm.net>
References: <20260210143016.0144acf1@leda.eworm.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
 |\QFlOg>\Bt!b#{; dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
 ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_2HUtzmlUYAzG1_ux0AYt=j";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.00 / 15.00]
X-Rspamd-Server: mx
X-Rspamd-Queue-Id: 0C6D92FF1E6
X-Stat-Signature: aitmfypcbjtpheheahs5bso6cqnqkn1e
X-Rspamd-Action: no action
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

--Sig_/_2HUtzmlUYAzG1_ux0AYt=j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Christian Hesse <list@eworm.de> on Tue, 2026/02/10 14:30:
> Hello everybody,
>=20
> for some time already I am annoyed by mails clogging my input regarding
> wireguard-tools for Arch Linux being out of date. Obviously this is not
> true, I built the package the day of release. [0]
>=20
> Now found the install page mentioning the package being out-of date... [1]
> What goes wrong and how to fix that?
>=20
> [0] https://archlinux.org/packages/extra/x86_64/wireguard-tools/
> [1] https://www.wireguard.com/install/#arch-module-tools

Ping... I would like to see this resolved.

Alternatively I will set up my mail server to forward these mails to you
personally, Jason.

Thanks!
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/_2HUtzmlUYAzG1_ux0AYt=j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAmmdgwYACgkQiUUh18yA
9HZM6gf/YyiqWZsJ3nPbmFrJZ0LvcC4ZYtcS4EFh32cJnCadNMzWbGHAmelJ+xbR
mGxR2kRZXY15QaOkYWCJjXYc5AhJ+ljdboO+NxTn1ZY7OM49mbgwWysxvQCTHK7y
WXB5jzqQoDFaz6lpyzChhWcS2ebeDcL2U23Mm3AwYbR3z3gOsxlTrAuC3iVduwEn
z016TSR9FrKryXYp2OAGUVYWVxWwhNCH6nPsmay47MUKKAOV+FebwqCmiBNKPCTg
hKnvYhalooq09vNmsPCBZx/4RnebeAERwIG9xI9IJqLmpaLn0qYcINcqHSxPFvYp
QvA/sXF7L0V0y7mOihGHi9joZGyIqQ==
=HzZs
-----END PGP SIGNATURE-----

--Sig_/_2HUtzmlUYAzG1_ux0AYt=j--
