Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD5EC49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:39:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C20EA20838
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C20EA20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 791ac1e1;
	Wed, 11 Sep 2019 16:39:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 725b4ad1
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 21:22:27 +0000 (UTC)
Received: from dd44832.kasserver.com (dd44832.kasserver.com [85.13.162.224])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb2f8f1f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 21:22:27 +0000 (UTC)
Received: from [192.168.0.206]
 (HSI-KBW-046-005-229-199.hsi8.kabel-badenwuerttemberg.de [46.5.229.199])
 by dd44832.kasserver.com (Postfix) with ESMTPSA id 8351F6EC0135;
 Tue, 10 Sep 2019 23:22:25 +0200 (CEST)
Subject: Re: wg-quick invoking resolvectl instead of resolvconf on systems
 where that is appropriate?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
References: <87zhjc3rzr.fsf@fifthhorseman.net>
 <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
From: Michael Biebl <biebl@debian.org>
Openpgp: preference=signencrypt
Autocrypt: addr=biebl@debian.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fca41efd-5478-7845-bc40-75598d9add90@debian.org>
Date: Tue, 10 Sep 2019 23:22:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 11 Sep 2019 18:39:28 +0200
Cc: Willem van den Akker <wvdakker@wilsoft.nl>,
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
Content-Type: multipart/mixed; boundary="===============7630320382275712900=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7630320382275712900==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DBQq2SM4GeeAhRCrcKlqboOe9nicxz7Ws"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DBQq2SM4GeeAhRCrcKlqboOe9nicxz7Ws
Content-Type: multipart/mixed; boundary="ghU6ZC7RSTD68CN9iW8QUq5ZuTIvKeVIM";
 protected-headers="v1"
From: Michael Biebl <biebl@debian.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Willem van den Akker <wvdakker@wilsoft.nl>
Message-ID: <fca41efd-5478-7845-bc40-75598d9add90@debian.org>
Subject: Re: wg-quick invoking resolvectl instead of resolvconf on systems
 where that is appropriate?
References: <87zhjc3rzr.fsf@fifthhorseman.net>
 <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
In-Reply-To: <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>

--ghU6ZC7RSTD68CN9iW8QUq5ZuTIvKeVIM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.09.19 um 20:52 schrieb Jason A. Donenfeld:
> The standard interface for modifying DNS on Linux is resolvconf. It is
> for this reason that systemd added the compatibility layer.=20

I don't think this statemement is true.
resolvconf is by no means a Linux standard interface, e.g. Debian never
has shipped with resolvconf installed by default.

It's an optional interface (where different implementations exist).

I think the only distro that ever installed resolvconf by default is
Ubuntu (and I'm not sure they still do on all flavors nowadays).

Which distros nowadays do install resolvconf by default?

> Debian
>> should install the proper symlink. WireGuard upstream will support the=

>> standard mechanism of resolvconf.

We can't do that (at least not in the systemd package) as that would
make other implementations like openresolv uninstallable.


--=20
Why is it that all of the instruments seeking intelligent life in the
universe are pointed away from Earth?


--ghU6ZC7RSTD68CN9iW8QUq5ZuTIvKeVIM--

--DBQq2SM4GeeAhRCrcKlqboOe9nicxz7Ws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEECbOsLssWnJBDRcxUauHfDWCPItwFAl14FA0ACgkQauHfDWCP
ItyeuRAAmeJl7W+h1HR+FokgC0BT2synQXmA5WuddAP60EvoQHlSce+ygfZ+AcHw
A5XlVlw7itkacNgdEzheqKNeSCPccEH+vJOp+mL6+igy50eVM3tV4loQnUvX4XwR
+NnkFyN3/pJVBF7V2q6GKbiY/8V+07nYY5diwV/f53FR86P+KNMWKN3pbV53XQXC
r2hUoyIACFRrnodkCK+SGno+ywyv/nT3BE7BgTDTkronUsLPxCd/mXvrAEJY6n8n
FyUf36TsLLGLhi0EE1/JkzV444fKBNm44ldgZap1BiBf4Rn+4ALwpDgn0hNWwqbA
dgIrzreTGy8qzJ/mrjRFYH6nRDp9WIpXfRmSPLzdGTyzY6PxKWU6nzeOsAU21cGp
nCDTP4zqCP9bTnn8pLUe9UVQBXSPBOFV4s0XhS7IsJe/hPORq/+P1cNfIpMxyv1y
8H+Hs6a+1Y8hQ0ei6QMDHIKx34R31NxaJpBTfiQ74DwdukyKAO79jNSc8JHYdqEz
m+i0DQhAsAIes79gv9Al5Dv/+B+77qzUnog6V1oP5NKgh/ECfgrsPmTdx/aoHJea
w3U8JQg/kgyp81IOkUoOvgthamYpfyee7rfmxKLadvSLv8ZXItFyddmYS5R1Wr9t
Z8QHPS6Ez5CAy3cLIPeLhoQvKeWok7woSiAGsTs1eep9H+JvDn0=
=odMV
-----END PGP SIGNATURE-----

--DBQq2SM4GeeAhRCrcKlqboOe9nicxz7Ws--

--===============7630320382275712900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7630320382275712900==--
