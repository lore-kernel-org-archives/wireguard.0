Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77CEFCEE87
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Feb 2026 11:28:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cd9a5439;
	Wed, 25 Feb 2026 11:28:10 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [2a01:4f8:222:1e83::25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 416baeae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Feb 2026 11:28:03 +0000 (UTC)
Received: from leda.eworm.net (unknown [193.159.163.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 3FB51321204;
 Wed, 25 Feb 2026 12:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.mylinuxtime.de 3FB51321204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1772018883; bh=4EhPJzO1A3a3qJsPhRWZESO00Ovv9dqhscblBe86qR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LN5e4PpZmrWGBusZYbIHC0dc3RjbxMOAEzj4A9Iihs6GKbe7uPWhxvmTryqNiWWAU
 GVn/DHP1wi1lNbznplvxneTjt1EuT4ENpirV1JrSRXB0GpK7OxarQehZRPmYyX8nmX
 6Jk8nWSxqgMhEDPE4RIm/bfd+9DQ6botSZkeqCSM=
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=list@eworm.de
Date: Wed, 25 Feb 2026 12:28:02 +0100
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Arch Linux - out of date?!
Message-ID: <20260225122802.5e00abb4@leda.eworm.net>
In-Reply-To: <CAHmME9pnCLQCp=6=25fnV1jJcNQMeyrAaxLWTmAEOjDff-FkVw@mail.gmail.com>
References: <20260210143016.0144acf1@leda.eworm.net>
 <20260224115254.761df5a9@leda.eworm.net>
 <CAHmME9pf=TNw6S6HB48q3NKhHzNLAo4qxH64Y7i8Lgg6etFCsg@mail.gmail.com>
 <20260224130751.1faee59a@leda.eworm.net>
 <CAHmME9pnCLQCp=6=25fnV1jJcNQMeyrAaxLWTmAEOjDff-FkVw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
 |\QFlOg>\Bt!b#{; dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
 ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f3.WTz33Q3IO5mtJlpd.Mt_";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.00 / 15.00]
X-Rspamd-Server: mx
X-Rspamd-Queue-Id: 3FB51321204
X-Stat-Signature: i9yapxdhkffazxwods1irpp9uwgbx68c
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

--Sig_/f3.WTz33Q3IO5mtJlpd.Mt_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Tue, 2026/02/24 13:27:
> I sorted out the arch and alpine ones, but there are still a bunch of
> others that are out of date or broken. For alpine I had to work around
> anubis (by using a curl useragent).

Thanks a lot!
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/f3.WTz33Q3IO5mtJlpd.Mt_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAmme3MIACgkQiUUh18yA
9Haz9wf+PbYvjtyB0giGRwj+IeTyXtWimYY6CpBmUAct6iluBIuid8nzcGcZEs0h
zbpbLJVtsR7aZY1bd0SYZ/B5MWGqcZIuoVqjh9GCHDAGzRpbbch2A4kCFPdaPKCO
4mZgYTnaV0yrf4sy4pAQe3UJ5qcqILM5Gdtrk66VZ0GXzoDa+pIZAbIGWsJ+GtbU
yiAGvO5jOMwOEh3e8M5T4nOC4qD7f5g4J2eGBaaI8iJSlTFRbHdHWul3F3/yydfN
X2ViPwceKTAdRNwGgyBC69OoZ18TMR9QcZ2s9rJ/T1GK7sc/e4FqMQF6HE1sO4rG
PRK6YFqYyqMUbEXLysspbjQHxxJeiA==
=OJAV
-----END PGP SIGNATURE-----

--Sig_/f3.WTz33Q3IO5mtJlpd.Mt_--
