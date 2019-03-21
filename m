Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89B2C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:00:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14236213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14236213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=colinfinck.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 111778d5;
	Sat, 23 Mar 2019 00:00:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1372ef8d
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 07:32:24 +0000 (UTC)
Received: from wp221.webpack.hosteurope.de (wp221.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:84e4::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b7bafb2
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 07:32:24 +0000 (UTC)
Received: from xdsl-78-34-96-230.nc.de ([78.34.96.230] helo=[10.24.0.101]);
 authenticated
 by wp221.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1h6sBt-0002iX-HK; Thu, 21 Mar 2019 08:32:41 +0100
Subject: Re: [PATCH] wg-quick: Unset the DNS first, then delete the WireGuard
 interface.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20190314115612.2412-1-mail@colinfinck.de>
 <CAHmME9prfELb2_V+aPfPyUkNv_eKcmt3K_s5HA9RCaDbH-YaHQ@mail.gmail.com>
From: Colin Finck <mail@colinfinck.de>
Openpgp: preference=signencrypt
Autocrypt: addr=mail@colinfinck.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4632add0-2696-c47e-0f85-cfbae1b6d0ea@colinfinck.de>
Date: Thu, 21 Mar 2019 08:32:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9prfELb2_V+aPfPyUkNv_eKcmt3K_s5HA9RCaDbH-YaHQ@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;mail@colinfinck.de;1553153568;f07505fe;
X-HE-SMSGID: 1h6sBt-0002iX-HK
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:00:05 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5814315070799643193=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5814315070799643193==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ummCzLK7jY9FNJLJsY38ygCFC0TzIZnPT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ummCzLK7jY9FNJLJsY38ygCFC0TzIZnPT
Content-Type: multipart/mixed; boundary="HcCssnklKzwxYMNdKuq4qS4BGwLnJZlsi";
 protected-headers="v1"
From: Colin Finck <mail@colinfinck.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <4632add0-2696-c47e-0f85-cfbae1b6d0ea@colinfinck.de>
Subject: Re: [PATCH] wg-quick: Unset the DNS first, then delete the WireGuard
 interface.
References: <20190314115612.2412-1-mail@colinfinck.de>
 <CAHmME9prfELb2_V+aPfPyUkNv_eKcmt3K_s5HA9RCaDbH-YaHQ@mail.gmail.com>
In-Reply-To: <CAHmME9prfELb2_V+aPfPyUkNv_eKcmt3K_s5HA9RCaDbH-YaHQ@mail.gmail.com>

--HcCssnklKzwxYMNdKuq4qS4BGwLnJZlsi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Am 20.03.2019 um 23:55 schrieb Jason A. Donenfeld:
> Your patch seems basic and reasonable enough. However, I don't know
> how to reproduce the error you're getting. Usually resolvconf doesn't
> care if the interface is there or not. What OS/configuration is this
> for you?

This is resolvconf from systemd-resolved, running on a custom Linux with
kernel 4.14.x.
"resolvconf --version" reports "systemd 239".


- Colin


--HcCssnklKzwxYMNdKuq4qS4BGwLnJZlsi--

--ummCzLK7jY9FNJLJsY38ygCFC0TzIZnPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEENLXXTejc76VQ9g3AG6dOcEVroakFAlyTPhoACgkQG6dOcEVr
oal8Qw/+KQEvu4gwTygrg1f45leYl9BhK9ckPfQL9sZkZnnRoUKnwTJDYRpA+Ged
mlwevWmqVZDnkBPSZr9rr0MHiZJCN+K1GbJFE+pj9Jj6CcJ1HmEI1Ye/TZ59eC+0
b2UiuB3jfjgREraOIVN7L3+xs/bFZ2svRSM2Gsw+0rCR5w/A+AO97Q+wGDAlaaxp
D19CgR/7gE+Pr1l8k/MOy0n1FGSKWUwurKBIQo6mf/AIeoprsc1M8wuAuijQczZw
rXc5f7KtNG30TlceIU8H8xuF+HJW3UoaTWtD4JwGVvNlcW4MRF5hSONZEYe+LEDL
fqcGMc+Hts1dp8kZSF1cMukHAb3jQGSxqONfF7XE7DnosTNF95UyuW+IzMuY6O7I
zh1FMa/JSh2cThNDXhLOVHqxBi+7ZmWM+BRBbUDmm6DSCKDCR1y74MbYZC8/hUs4
stHhDzHpTX0kb8O9txpQKpa+wQVJEkebVMcSdK4PP0zITBPMHgmHfb+kQTkZHiWN
PYKCdXn4Kwz19wJKrRE97etPQxy/VJn3mwNcjsTl5kjM+imwWBmrsvJ28mmMjXVu
Jxg7AlWcHBEqWS3Yr4mZ77m9YhFdU9PykpDKhXOdAwxVmFCswr8SrBq0qo+ExLm1
ZICh03NUzD9SoLvF8rhJBVfasZ4Y1QAFq2/cQlkeu5eZkONh9XM=
=O6ma
-----END PGP SIGNATURE-----

--ummCzLK7jY9FNJLJsY38ygCFC0TzIZnPT--

--===============5814315070799643193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5814315070799643193==--
