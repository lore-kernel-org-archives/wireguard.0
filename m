Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F4DC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 07:58:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A906A2075B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 07:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eworm.de header.i=@eworm.de header.b="PwplTiBx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A906A2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b13464b3;
	Wed, 2 Jan 2019 07:55:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83b8801d
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 07:55:24 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7686746d
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 07:55:24 +0000 (UTC)
Received: from leda (unknown [IPv6:2001:470:99c1:714:e078:5e8f:bc9c:af22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 4197499675;
 Wed,  2 Jan 2019 08:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.mylinuxtime.de 4197499675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1546415864; bh=qYrdrm1O/JjCxJ2ebmFeaQwma6fwxJ/7DS3A4kP5n58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=PwplTiBxj8YK8HZceYWt+hIgVSB80qPBZgTJNN1vE7VoswtZTMFSvRkEr1xnTJMtU
 Z+ViwXZ3OnedBGc9FxGGAd4TRButXJ3+JDiAO/3WdWo2WOpGUBn+yEdc044TSELjiJ
 boy63b+oVB4G/USJQqddctq4g7XLrbUuPv++9qyk=
Date: Wed, 2 Jan 2019 08:57:42 +0100
From: Christian Hesse <list@eworm.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: binary module for arch?
Message-ID: <20190102085742.6184fe45@leda>
In-Reply-To: <CAHmME9puWpU-acT_sAE4qvg6ENAkvwpxMEU7czYUwtdMUQPLVg@mail.gmail.com>
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
 <20190101215007.15f15e05@leda>
 <CAHmME9puWpU-acT_sAE4qvg6ENAkvwpxMEU7czYUwtdMUQPLVg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
 |\QFlOg>\Bt!b#{; dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
 ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=mail@eworm.de smtp.mailfrom=list@eworm.de
X-Rspamd-Server: mx
X-Stat-Signature: mwuuz8yek6wxyu6mzytcfrzonrzec5my
X-Rspamd-Queue-Id: 4197499675
X-Spamd-Result: default: False [-3.49 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,text/plain];
 TO_DN_ALL(0.00)[]; NEURAL_HAM(-2.79)[-0.930,0];
 SIGNED_PGP(-2.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 SUBJECT_ENDS_QUESTION(1.00)[];
 ASN(0.00)[asn:6939, ipnet:2001:470::/32, country:US];
 RCVD_TLS_ALL(0.00)[]
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============9129079272054933077=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9129079272054933077==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EPW22kGDOhKKMoQJgCQMO1q"; protocol="application/pgp-signature"

--Sig_/EPW22kGDOhKKMoQJgCQMO1q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

"Jason A. Donenfeld" <Jason@zx2c4.com> on Wed, 2019/01/02 01:22:
> Hi Christian,
>=20
> On Tue, Jan 1, 2019 at 9:50 PM Christian Hesse <mail@eworm.de> wrote:
> >
> > "Jason A. Donenfeld" <Jason@zx2c4.com> on Mon, 2018/12/31 01:58: =20
> > > Hey Christian,
> > >
> > > I noticed there are now two distro-built packages for wireguard for
> > > arch -- wireguard-lts and wireguard-arch. These seem probably more
> > > convenient for most people than the dkms one. What would you recommend
> > > in terms of updating wireguard.com/install/ ? And do you plan on
> > > depreciating the dkms one at some point, or do you think it will
> > > remain useful for certain users? =20
> > some people gave their legit reasons to keep wireguard-dkms. I have to =
add
> > another one: It is a build-dependency for the binary modules packages. =
So
> > it will stay definitely. ;) =20
>=20
> Makes sense. I was mostly wondering about that first question though:
> what would you recommend I put on wireguard.com/install/ for Arch
> users?

I sent another mail to the other branch of the thread. Did that answer your
question?
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/EPW22kGDOhKKMoQJgCQMO1q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAlwsbvYACgkQiUUh18yA
9HbrfAf6AzASL5u5c9uhqGIjgaaenGmQAoSJmlY6W1f3kM6WBgLa8o+nsFNq2miV
vSYTpYyASVDEDGbxBMzVM3xP9q/guP3FHmTxCCsgz+KSjvgnZbs+c4BSRFHu5Vz9
+dSW8Y62kNP3GVvSUZKXRm2G2pOOi8xL1Ym+1edFOhVL0QNB6dqjxnOvewz7ezBN
JRe9MUmcn/YV9qxWyPkmSxlUOO0Jorjm2uz912seipEqJjfyEEOPgKse0g/jTjBP
u3pC2a1s9zthh3KbysvH0OW0O2tRlKdKhSTrjntHdqClgHgg1gPBm/9X9cX3BNw0
eCpXhReZ40qR5eueaKtbTQ5ECR+2ig==
=/QMp
-----END PGP SIGNATURE-----

--Sig_/EPW22kGDOhKKMoQJgCQMO1q--

--===============9129079272054933077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9129079272054933077==--
