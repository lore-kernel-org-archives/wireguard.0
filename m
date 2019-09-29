Return-Path: <SRS0=JYHX=XY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FABEC4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 14:28:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D668D217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 14:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D668D217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noc23.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c45c0345;
	Sun, 29 Sep 2019 14:27:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21191d62
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 14:27:42 +0000 (UTC)
Received: from dubhe.uberspace.de (dubhe.uberspace.de [185.26.156.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3e5c006
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 14:27:42 +0000 (UTC)
Received: (qmail 30510 invoked from network); 29 Sep 2019 14:27:40 -0000
Received: from localhost (HELO ?172.31.255.4?) (127.0.0.1)
 by dubhe.uberspace.de with SMTP; 29 Sep 2019 14:27:40 -0000
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
To: wireguard@lists.zx2c4.com
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
From: Ulrich Kalloch <ulli@noc23.de>
Autocrypt: addr=ulli@noc23.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
Date: Sun, 29 Sep 2019 16:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
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
Content-Type: multipart/mixed; boundary="===============6303302044557479958=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6303302044557479958==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DfCR0iQSyk8Uhpv3grl57tWCB0nYqqbl5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DfCR0iQSyk8Uhpv3grl57tWCB0nYqqbl5
Content-Type: multipart/mixed; boundary="36yBimZxdejOQRvewtI7s9BTgVr9FCW6k";
 protected-headers="v1"
From: Ulrich Kalloch <ulli@noc23.de>
To: wireguard@lists.zx2c4.com
Message-ID: <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
In-Reply-To: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>

--36yBimZxdejOQRvewtI7s9BTgVr9FCW6k
Content-Type: multipart/mixed;
 boundary="------------8FD30997579F2DD77786AE99"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8FD30997579F2DD77786AE99
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello @ all

i am interested in this too.

Regards

Ulli

Am 27.05.19 um 20:10 schrieb Rene 'Renne' Bartsch, B.Sc. Informatics:
> Hi,
>
> is it meanwhile possible to define an IPv6 endpoint AND and an IPv4
> endpoint as fallback
> in case a road warrior does not get IPv6 connectivity when switching
> internet sockets?
>
> Regards,
>
> Renne
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--------------8FD30997579F2DD77786AE99
Content-Type: application/pgp-keys;
 name="0x44BE4EB74E7625C8.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0x44BE4EB74E7625C8.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
1MpLlAUU
=3D/upJ
-----END PGP PUBLIC KEY BLOCK-----

--------------8FD30997579F2DD77786AE99--

--36yBimZxdejOQRvewtI7s9BTgVr9FCW6k--

--DfCR0iQSyk8Uhpv3grl57tWCB0nYqqbl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEENG5AQe49g8SDl9CNRL5Ot052JcgFAl2Qv1kACgkQRL5Ot052
JcgdMRAAj+pv1MEZiZYInnsu+VEXgtdvFYsDJSmJes/5voQxGGSkBcfrifKzU91I
PuZ5mXRPKxgT41p2ys41b0Ro7VRQVrbAGdd08kTWA+f2c+0rxmSovH09Cl73SsoW
yf/Z2cPEPxamJBFCq1wY6iwF9iN4LU+DsBr94rIEipKofF26QTTJmtPA/Jcp77X+
HHuSL9ksmik37Iy480423YxXjQaYQ3vA8yd8vWS209IR0QsTIGyPcqIklOcRQWir
C+Y+xhHTybkDsUq1mxY8JdDjvQDKfa9k6nxUz48gsr57FRcKrPhmgKaIwlyoE3Fi
bDvJajxuWiR8NJwQs4UVzM0HdZs6sINTk3jhcV8Imv3ItPqNXvpcbIwQsIsme5HQ
mShu+M1cPthbN4t4lU7U6PkcgFL0WMOL720HAh2CCddwUlZzmPD0e+LGAhGD/QTz
G65KSWJiV/A92tYcFt6ue1r4V3nG2sMpCRbnipGXHw9S5NUmzz2zWeFEEkeIkBk1
rwqHjn4ZNKt4aQ9EobMVPka6fEZTF/SKBFQqt3LxvuJCNi0xTJSKBnKGf/jGHs6S
l8WqFHyXHdqTkXulEmtPQZKdwVHqr4soBkKvqYanLVzU1r4L9abFlpFfDDn+wWAI
cysH2gk4i1A3mVuqcWd681ve5DOAfSkEmul8xT+qohBr8xrcLcc=
=jih2
-----END PGP SIGNATURE-----

--DfCR0iQSyk8Uhpv3grl57tWCB0nYqqbl5--

--===============6303302044557479958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6303302044557479958==--
