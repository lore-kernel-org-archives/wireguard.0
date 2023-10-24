Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0EFC07545
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Oct 2023 09:38:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efc32435;
	Tue, 24 Oct 2023 09:38:08 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.166])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 21127cb9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Oct 2023 09:38:06 +0000 (UTC)
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4SF6Ry1QH1z3tZv;
 Tue, 24 Oct 2023 11:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
 t=1698140286; bh=Z7/P+ONa906IGUPR+i8YkLYSQV8kXAFrdilYnXwrHKA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kixSOSK+VxQndNJzAJDj8VOCAhRxMoKUDJleIA5esGAO/8yhej964V9pm8y1S58mb
 fer9oqnDBqrs2pD14UuaG8nwM2wsy6iFnkJxkJo61TdYXUIRxoHBwxPf/kfSwLM2Iu
 0N9ADo7ZuTDH2+sXWfnGGkmob39m7rXCmTGJwajNGfLfb+vC8eTzF8NQ9wbN/pFCCj
 plZfTr57OqxIjIjC32xQnl82L0XQ1jGeuXRQXXFoa7vkkZHeWhZJzwFD4ot+rC0GMm
 rv9EIwT/8Wf5dD9AzzHwLFcYGLl/lslqHneetqLBV777oe27PwaKh4ufSlkP1VTLbk
 Sov4pK04p+2IQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4SF6Ry11NJz3tYW;
 Tue, 24 Oct 2023 11:38:06 +0200 (CEST)
Received: from mxe87b.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4SF6Rx5NMNz8sch;
 Tue, 24 Oct 2023 11:38:05 +0200 (CEST)
Received: from parrot (unknown [141.71.180.175])
 by mxe87b.netcup.net (Postfix) with ESMTPSA id 15FE41C0055;
 Tue, 24 Oct 2023 11:38:01 +0200 (CEST)
Authentication-Results: mxe87b;
 spf=pass (sender IP is 141.71.180.175) smtp.mailfrom=m-k-mailling-list@mk16.de
 smtp.helo=parrot
Received-SPF: pass (mxe87b: connection is authenticated)
Date: Tue, 24 Oct 2023 11:37:55 +0200
From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
To: wireguard@lists.zx2c4.com
Cc: v@sess.ink
Subject: Re: AllowedIPs = ::/0 routes IPv4 - on Android?
Message-ID: <20231024113755.6a786c71@parrot>
In-Reply-To: <63bb2149-2d0b-df64-27f9-6e003dfdc577@openoffice.nl>
References: <63bb2149-2d0b-df64-27f9-6e003dfdc577@openoffice.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SgzYSVOCV1sbGUtZJwWbfZt";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-PPP-Message-ID: <169814028125.3971085.6531205636732839278@mxe87b.netcup.net>
X-Rspamd-Queue-Id: 15FE41C0055
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: 0aGnU9ddHMNqGquIhSu+ShwE1Q57E7rzhrBQ0CPfgq1CAdDSYGBHazc=
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

--Sig_/SgzYSVOCV1sbGUtZJwWbfZt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Valentijn,

::/0 does not describe no IPv4 address, but all IP addresses. So when
you write ::/0, all IPv4 addresses are routed through the tunnel. If
you don't want IPv4 routes, you can simply omit them in AllowedIPs (so
only put IPv6 addresses there, or only address which should go through
the tunnel).

Greetings
Marek K=C3=BCthe

On Tue, 5 Sep 2023 16:04:34 +0200
Valentijn Sessink <v@sess.ink> wrote:

> Hi List,
>=20
> I have a WG endpoint configured with
> AllowedIPs =3D ::/0
> ... on an Android phone.
>=20
> To my surprise, I found out that this also tries to route IPv4 addresses=
=20
> to the other WG side.
>=20
> I was able to change that with a single "bogus" IPv4 address,
> "AllowedIPs =3D ::/0, 192.0.2.99/32"
>=20
> Is this a known feature? Android 13, WireGuard for Android=20
> v1.0.20230707, (from AOSP).
>=20
> Best regards,
>=20
> Valentijn


--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/SgzYSVOCV1sbGUtZJwWbfZt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmU3kHMACgkQfoaRRmmR
CMdcPQ//cwpi5B3cGbRj606WFMtnLtGXgkTcjFeTWOMqTofbQvUGnAsVqYWTH+7r
c1o6aj/y98ppItHlUpNx+tGgIWiWZkT9tIyLyo7un55x/lrXdACYRTLnYe3gj9KO
l+Ph2nt7xZUHrW3enosfXGnoZxiJHg4sxo9dDy+6dMTo6RdnYJZ6vGznSNFaauV3
cmeTAuBJALLRvPF05KOEWtZNzqLqOHg5zrqJw5Jh0YqYfpVEPKBx6T7i2lT14pEd
umkGmBEVzy/s+ZIjm+0pERL/ta5Y4HjY6plUmkP63enMtsoyb2AOuiXzWhWnippy
Eo6IICiSn7UorEc/dbWFgInGyv0j6E3rbdk7ObLM1bFWabf2h1/kP8qYFfwJQ37h
jjIyDt2JI5LySZkGtYIN+F8GdjpiPRq9tN7Tv2CBoa/fBCZeTDLE4nw7b0kesEY6
WTkplbURyXKvhFchH0d4+FiJ213YAU+A6C3IYOov75BJMVDR8NmqG1Q3nEU93O8C
k5c3B95tvBeoZNiaSElGP87MH2Yv2EM32VigFo1UtI3Gq+Q5zy9Qqh3nxMGLNIHV
IEjHz76df/T/OWpPY6oYDBE6GonQppefh/VT6LVg3m4cD15LtxI4loFpuYA9MMdX
b/ep1HaYuIDS4arttXFpU4rGxq0yC58SjvjQy3nAkuDGlKzgqFo=
=vJPk
-----END PGP SIGNATURE-----

--Sig_/SgzYSVOCV1sbGUtZJwWbfZt--
