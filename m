Return-Path: <SRS0=wsGv=TQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419DCC04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 06:27:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867E720848
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 06:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sf.lists.topphemmelig.net header.i=@sf.lists.topphemmelig.net header.b="LodhfnZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867E720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sf.lists.topphemmelig.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60a4fa15;
	Thu, 16 May 2019 06:27:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a95ad0b
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 17:32:54 +0000 (UTC)
Received: from mx0.basenordic.cloud (mx0.basenordic.cloud [185.212.44.139])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab1df88f
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 17:32:53 +0000 (UTC)
Received: from localhost (unknown [IPv6:::1])
 by mx0.basenordic.cloud (Postfix) with ESMTP id BB3F78229D3;
 Wed, 15 May 2019 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sf.lists.topphemmelig.net; s=inouz9eefah2too5; t=1557941570;
 bh=iTimSL/MbPxkqelvIhkxJ8Dcv0IKUhBBVzMhz36k83k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LodhfnZCk00mhHu6yPapQXPtTMinHPZqq4D0+ITdX7kzOsX5pT8Sz8xBmYEPu5I86
 1nqtSnS49UkMoFmqSK4esq3ginMn5RnIxs3pGZcMFwlgeDAKzLZYCHhEpHFTxMwI4Q
 PLtooFuWVQ62bZziMZVcwJVSIsvpqHCMJF7Y2i4K4fs3mv1ZwGp1W0nER4iukOScW0
 7jb4kepTIchu0gcB/iTImhOmOM6nIg3OKSeLWnk+HFvu5URXSbAg2Z5ewD3W3OgJB+
 DClz26jbFh7+QczYokvdCu5sjfQ21ShiCtPIYG0v34kEqVWoW7Frjpa1WkS8PhE1in
 yW5cVZFjz4G+A==
X-Virus-Scanned: amavisd-new at sommerseths.net
Received: from mx0.basenordic.cloud ([127.0.0.1])
 by localhost (winterfell.topphemmelig.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id unb1Cyoc6uUb; Wed, 15 May 2019 19:32:49 +0200 (CEST)
Received: from zimbra.sommerseth.email (zimbra.sommerseth.email [172.16.33.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx0.basenordic.cloud (Postfix) with ESMTPS id DF25381E908;
 Wed, 15 May 2019 19:32:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.sommerseth.email (Postfix) with ESMTP id 096DA49870CB;
 Wed, 15 May 2019 19:32:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.sommerseth.email
Received: from zimbra.sommerseth.email ([127.0.0.1])
 by localhost (zimbra.sommerseth.email [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U32jPQiukzgt; Wed, 15 May 2019 19:32:46 +0200 (CEST)
Received: from optimus.homebase.sommerseths.net (unknown [10.35.7.45])
 by zimbra.sommerseth.email (Postfix) with ESMTPS id 2169949870CA;
 Wed, 15 May 2019 19:32:45 +0200 (CEST)
Subject: Re: [Openvpn-devel] Wintun performance results
To: =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>,
 Lev Stipakov <lstipakov@gmail.com>
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
From: David Sommerseth <openvpn@sf.lists.topphemmelig.net>
Openpgp: id=7ACD56B74144925C6214329757DB9DAB613B8DA1
Autocrypt: addr=openvpn@sf.lists.topphemmelig.net; keydata=
 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
Message-ID: <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
Date: Wed, 15 May 2019 19:32:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 16 May 2019 08:27:22 +0200
Cc: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============0831946350315614168=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0831946350315614168==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="O3ptvSazV74Q7QbuBXlyFrvAoW1N4SEVY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O3ptvSazV74Q7QbuBXlyFrvAoW1N4SEVY
Content-Type: multipart/mixed; boundary="cFAGVrySS71eMk0tZ1Lv7c67iYmZfD3xM";
 protected-headers="v1"
From: David Sommerseth <openvpn@sf.lists.topphemmelig.net>
To: =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>,
 Lev Stipakov <lstipakov@gmail.com>
Cc: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
Message-ID: <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
Subject: Re: [Openvpn-devel] Wintun performance results
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
In-Reply-To: <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>

--cFAGVrySS71eMk0tZ1Lv7c67iYmZfD3xM
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 15/05/2019 16:49, =D0=98=D0=BB=D1=8C=D1=8F =D0=A8=D0=B8=D0=BF=D0=B8=D1=
=86=D0=B8=D0=BD wrote:
> it will most probably get lost in mailing list.
> can we add it to https://openvpn.net website ? something like "performa=
nce
> testing" with full configs provided ?

Good idea, but maybe not the official corp web pages just yet.  But we sh=
ould
definitely have some wiki pages under https://community.openvpn.net/ rela=
ted
to how to prepare a good setup for performance testing.


--=20
kind regards,

David Sommerseth
OpenVPN Inc


> =D1=81=D1=80, 15 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 18:49, Lev Stip=
akov <lstipakov@gmail.com
> <mailto:lstipakov@gmail.com>>:
>=20
>     Hi guys,
>=20
>     I made openvpn3 (required changes will be incorporated into main br=
anch at
>     some point) work with wintun and did performance testing in AWS.
>=20
>     Client:=C2=A0 =C2=A0 c5.xlarge, Windows Server 2016, patched openvp=
n3 test client
>     and OpenVPN Connect 2.7.1.103 (uses tap-windows6, based on openvpn3=
).
>=20
>     Server:=C2=A0 c5.xlarge, Ubuntu 18.04, openvpn 2.4.4
>=20
>     Client and server instances are in the same VPC and placement group=
=2E
>=20
>     iPerf3 running on server:
>=20
>     > iperf3 -s -B 0.0.0.0 -V
>=20
>     iPerf3 running on client:
>=20
>     > iperf3 -c 10.8.0.1 -V (server VPN address)
>     > iperf3 -c 10.0.0.18 -V (server VPC address)=C2=A0=C2=A0
>=20
>     Results:
>=20
>     - no vpn
>=20
>     [ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Transfer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Bandwidth
>     [=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=
=A08.67 GBytes=C2=A0=C2=A07.45 Gbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
sender
>     [=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=
=A08.67 GBytes=C2=A0=C2=A07.45 Gbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
receiver
>     CPU Utilization: local/sender 61.4% (5.6%u/55.8%s), remote/receiver=
 33.9%
>     (1.7%u/32.2%s)
>=20
>     - tap-windows6
>=20
>     [ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Transfer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Bandwidth
>     [=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=
=A0=C2=A0404 MBytes=C2=A0=C2=A0=C2=A0339 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0sender
>     [=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=
=A0=C2=A0404 MBytes=C2=A0=C2=A0=C2=A0339 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0receiver
>     CPU Utilization: local/sender 4.6% (0.3%u/4.3%s), remote/receiver 2=
1.4%
>     (2.2%u/19.2%s)
>=20
>     - wintun
>=20
>     [ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Transfer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Bandwidth
>     [=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=
=A0=C2=A0536 MBytes=C2=A0=C2=A0=C2=A0449 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0sender
>     [=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=
=A0=C2=A0536 MBytes=C2=A0=C2=A0=C2=A0449 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0receiver
>     CPU Utilization: local/sender 2.9% (0.1%u/2.8%s), remote/receiver 1=
0.1%
>     (0.7%u/9.3%s)
>=20
>     As you see, wintun performs 30% better comparison to tap-windows6 a=
nd
>     incurs significantly less CPU usage.
>=20
>     --=20
>     -Lev


--cFAGVrySS71eMk0tZ1Lv7c67iYmZfD3xM--

--O3ptvSazV74Q7QbuBXlyFrvAoW1N4SEVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCgAGBQJc3E08AAoJEIbPlEyWcf3ykI4QAK2KumYR5jRlBMDn2FyNFSqC
Ch9uOdwRd3p0uuR+yyMt+ai+Mjob9JddRpDOtXeaE0QQIDMEpP8erwuJbohCrsFR
CIwMxdyEnkyPDhA/Jw975wjlh4imUvqUnwaP+qbRgoeN/uVJ/NJFFCcpVd9Z2ePe
xF8uY8i77s1Z/mlOuYSe+Q1tZN6eWyeVNB7vw0il4FvlEZVbA61CaJx2q9Q9fHjs
YSkt5Vv7SxAOvmJkYtUI8nO0A3wqfQwoO0F6GuL43u4Tcvcy6nCuRBr+0+KeKHfd
ZRdBnpw/XszCGQ2uSsP8o4YUfYnwyHe4XGkBQ/ckrvKoDg2mOZZhKWrmdGfrUqxB
ELWB5ulnZdZ0naexRRFtS2T+KjScrpNuH7fyd0IRh3ZksRhC1Aw1wjJubCo7rxed
c6FOyvT9J8+Oxa0lyKJKsH3bfLd7Ahl8Efo6piZuwmkazZuXB0z2WAkVH+wRlk2Z
RDoCZGxDFYwWWnVfx8cQ7PgxNPJU1XDdTok5hbLzMPgy4c8AA0lUHStPjlPg8iTT
GoJeLF1+YMuUYLehRA8u9AGTmCd5slqV6kGwUdXKPBrXI1RQxVGSjp2RXpWzyT/c
gcF6G8ts7O2Z0BhmIO7V8bAxn1Ns5xuSOxxT/cSFgDBRITnbvU9u9Mlp/YdZiwUT
4MaZf0UuHM6u/eqSqHZO
=83Fb
-----END PGP SIGNATURE-----

--O3ptvSazV74Q7QbuBXlyFrvAoW1N4SEVY--

--===============0831946350315614168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0831946350315614168==--
