Return-Path: <SRS0=b0XG=VY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C71C433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jul 2019 12:28:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244762082E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jul 2019 12:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244762082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitsofnetworks.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb1b9143;
	Sat, 27 Jul 2019 12:27:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f463263
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jul 2019 12:27:50 +0000 (UTC)
Received: from mails.bitsofnetworks.org (mails.bitsofnetworks.org
 [IPv6:2001:912:1800:ff::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d76ae97b
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jul 2019 12:27:49 +0000 (UTC)
Received: from [2001:912:1800:0:6047:46ae:9b34:a5df] (helo=lud.localdomain)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1hrLnf-0006ur-2Y
 for wireguard@lists.zx2c4.com; Sat, 27 Jul 2019 14:27:47 +0200
Date: Sat, 27 Jul 2019 14:27:43 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Running Wireguard on a switch
Message-ID: <20190727122743.GA31059@lud.localdomain>
MIME-Version: 1.0
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Content-Type: multipart/mixed; boundary="===============8818883435529393468=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8818883435529393468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Nowadays, manageable switches often run Linux.  Ben Cox managed to run
wireguard on such a switch from Dell: https://blog.benjojo.co.uk/post/dell-switch-hacking

He's not talking about performance (that was not the goal): the CPU on
this switch looks like a low-end ARM so it's probably not that good, but
it's still fun :)

Cisco datacenter switches like the Nexus n3k have a x86 CPU and run
CentOS, so I wonder if somebody already tried Wireguard on those?

Baptiste

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAl08QzsACgkQvgHsIqBO
LkYR1xAAqqJyGsqmP/E2p+59JND0MorVaJssc5Cv1ZNAWlsLSBK6Rlxswu9pFBya
6pcUKROsrOF2kw55BepIOKlinQToHx+VpXDbKsz7Kl5dtHWD4pemwty+p1yDB7wD
HFwfqRMqm+Pp+JtCj/4a14VSX/FTKebvzAwEjZzx4Do5ADkAyZLNrWhJ5EwavNYr
KpEmwm9iMSuLh3Qb8bZTy7A85yXAvik8dcalK037gI1z8d0LAS5driH+sql9IdEL
RiP7U5h/GvGcZgh7nTYLSTlm44IBK49ONb+BfJFZFBRssJUY7SEacdX9od8hL/TA
zm46f6q071yf9SuwmoX+5K4rpO/g2nRhmjpeip8IRyMa5ly0UYgeHtkPBaoonIw1
aZ3KlTNAGXFCEHtdjNnUqn7WagDME3LGNR2vCTN4tPoMgUddltCabTvFoVgj7kcz
UhdcInK9op0/JoqT5R37CQ38IgEfm0AtsHM2LtMF+iZ5el/7zWCMfi1TJKGSPXYv
I/knAeFDSUxPAffAQqikWuVS+WFxwpb+HfKj8uhkBN7tB9vXM6B8S0wKkSew9y6r
2pG+oekrSVz1yizTD5SRUghJJ/Y2oaLLocstGql4D3Je2ozcKOLazVJhJGCT27ss
2dsagrsN4RxsLYxoCRWa+lC38uHXnolMzHnSv+NaEFc7Hj8kZuI=
=1+7E
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============8818883435529393468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8818883435529393468==--
