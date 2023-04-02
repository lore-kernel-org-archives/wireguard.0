Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB0DC76196
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Apr 2023 22:41:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c00e6a08;
	Mon, 3 Apr 2023 22:39:04 +0000 (UTC)
Received: from mail.redxen.eu (chisa.nurnberg.hetzner.redxen.eu
 [2a01:4f8:c2c:b2fc::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 547cbdc2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Apr 2023 12:57:52 +0000 (UTC)
Received: from localhost (karu.nurnberg.hetzner.redxen.eu [157.90.160.106])
 by mail.redxen.eu (RedXen Mail Postfix) with ESMTPSA id 2DD185FA63
 for <wireguard@lists.zx2c4.com>; Sun,  2 Apr 2023 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redxen.eu;
 s=2021.05.31.01-mail; t=1680440272;
 bh=aYiMpv9KtF0gshYdl59/LDU2Nfkar0BhFVfRsJojQ6A=;
 h=Date:To:Subject:From;
 b=n8VIjJQS4rGLJRVTuBna9wpe3Q/5vHkq1J8ogkB+tpig9UruVM8F50tZv7U6G2hjn
 rOk9IlhPS0takQmmqVWY8mDXPDOepwfsa89dHmQC6B2Yr4mGgsfoWrVMtn1setZ9Lc
 DRFJ9UpvhrScljUmDz8Wk1E56BHtieYWNqVyj/K8DZ5Ivx+7qFwAfCR/a7AbYY6XWt
 HD4Faky1l3/pmhWStAQ77otYwsYQY2MMmw8gKaOd2O3vOmqIWVF1J+9U0KR1i2PIVb
 g271cpWvgSsM4ReJMa88jUb/pRSYO+XsEKGhEK5YyJysrXGfaG8QlCK5AQX69okwA8
 nBMsWFeFr5lqA==
Authentication-Results: mail.redxen.eu;
 auth=pass smtp.auth=caskd smtp.mailfrom=caskd@redxen.eu
Date: Sun, 02 Apr 2023 12:54:12 +0000
To: wireguard@lists.zx2c4.com
Subject: Race condition/no locking on configuration load
From: caskd <caskd@redxen.eu>
Message-Id: <3ADWX816HB4BO.3EX0UVUOJ70FG@unix.is.love.unix.is.life>
User-Agent: mblaze/20220328-3140-g8658ea6aef
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="----_=_521c75be4fad84127b8bc015_=_"
X-Mailman-Approved-At: Mon, 03 Apr 2023 22:39:03 +0000
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

This is a multipart message in MIME format.

------_=_521c75be4fad84127b8bc015_=_
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_795f82f472eebc601b4ec0db_=_"

This is a multipart message in MIME format.

------_=_795f82f472eebc601b4ec0db_=_
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

i've hit a weird edgecase where the wireguard config gets loaded and during=
 the load the interface gets a address assigned which just disappears. Here=
's how i replicate it.

ip link add $IFNAME type wireguard
wg setconf $IFNAME $CONFIG #-- while this runs, run the command below in pa=
rallel
ip -6 address add $ADDR dev $IFNAME

Following this, the added interface address doesn't persist, yet no error i=
s returned by either iproute2 or wireguard-tools.

Using:
iproute2 6.2.0
Linux 6.1.9
wireguard-tools 1.0.20210914

Is this a known problem? I assume it has to do with no locking being done o=
r similar but i haven't looked deeper into it.

--=20
Alex D.
RedXen System & Infrastructure Administration
https://redxen.eu/

------_=_795f82f472eebc601b4ec0db_=_--

------_=_521c75be4fad84127b8bc015_=_
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJEBAABCgAuFiEE2k4nnbsAOnatJfEW+SuoX2H0wXMFAmQpe8sQHGNhc2tkQHJl
ZHhlbi5ldQAKCRD5K6hfYfTBc62TD/9QEpAJw+4d/wDvwcYqokz6OIzxIxZ1WUJY
66PDoJOWqzCFOgnvr5QtmLVEqmrRaJL2cZOZ4IKXXWe+6WDLiz7iZn0Ig9b1DKiv
yNb3nyh90VnXUbUYZfYiWIpv0JtRvz3991dt8trumUp+0mRupvIObj4UdiL/LYWS
2xS68D0rLIAsj1YDe5Wsjz4EEVqJZ/t8IthaljyOabrVoaSSz6gSCnbbZMr3du74
IBcy6q5GEXwDX3IQkMsp4qWq994D5G9zTxoxbw/oeNOzMKAn20NnpQR3pdFihAej
SSHYu6gM10SV18aDVlEKrfMhcvKnTKyco3SUpIK6wdbuESR3xIfiguYy7H7Dd6J+
v51NvSCtXmdXxK5fdVyyDG6Zg9gJnZXvpL/3+m+o9GPpm6T7MyCSMdy6GdEnAGyH
W8oKEVA4wQ6Vt2jArHknUO74lmZ/k7VChla24q3afXNu81VfJKJe1a/V1cvf2ayV
nLCRTmVpF6dVQL0renVhPuhB+hkZJnIWMDwbcD3jTIsxUnALormV/nqAlLOKJ73/
BwGMvM0MS6rU+NkUHgCatH0up6AXuZTJaUYTsQVspVBeL9oTx5y0fF63FrpgWOMW
HxUD+1KI35TNeyL8gOtcS07sClQpIVCIQ17q+8v9ztETwchgNFjYJfXlVrOAd06z
Q1WLomZJ+w==
=GjW3
-----END PGP SIGNATURE-----

------_=_521c75be4fad84127b8bc015_=_--
