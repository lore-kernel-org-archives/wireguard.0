Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781C8C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628A420989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xaker.ru header.i=@xaker.ru header.b="WcY+UxQY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xaker.ru header.i=@xaker.ru header.b="WcY+UxQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628A420989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xaker.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 827428dc;
	Thu, 6 Dec 2018 23:05:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28a33825
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 13:17:59 +0000 (UTC)
Received: from forward100j.mail.yandex.net (forward100j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::100])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e22f80c
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 13:17:59 +0000 (UTC)
Received: from mxback14g.mail.yandex.net (mxback14g.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:93])
 by forward100j.mail.yandex.net (Yandex) with ESMTP id D4BE42080121
 for <wireguard@lists.zx2c4.com>; Sat,  1 Dec 2018 16:25:24 +0300 (MSK)
Received: from smtp3p.mail.yandex.net (smtp3p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:8])
 by mxback14g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id OBcWHFo21J-POnumwSv;
 Sat, 01 Dec 2018 16:25:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xaker.ru; s=mail;
 t=1543670724; bh=yAuaOs+4EgCDZ9rnjXq5o0A/C3GOsILNue6cpVkkS5I=;
 h=To:From:Subject:Message-ID:Date;
 b=WcY+UxQY0MO1EGlluwe49x8B63H6zFZdqOo+qzMKmrFwG//1vnzw5xluAy65c7YxM
 ykedDp7WhCyXvUkrF8nTv97+fazKn/A9y7FnchbN7sxDvtWMmZdYgC4DM2g4/Ks+1r
 jHaYs8MGyCekOE8wWkAbw2jc1P5t89P2zzUml0DI=
Received: by smtp3p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 jO0PtqrLUB-PO6KSZ2g; Sat, 01 Dec 2018 16:25:24 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xaker.ru; s=mail;
 t=1543670724; bh=yAuaOs+4EgCDZ9rnjXq5o0A/C3GOsILNue6cpVkkS5I=;
 h=To:From:Subject:Message-ID:Date;
 b=WcY+UxQY0MO1EGlluwe49x8B63H6zFZdqOo+qzMKmrFwG//1vnzw5xluAy65c7YxM
 ykedDp7WhCyXvUkrF8nTv97+fazKn/A9y7FnchbN7sxDvtWMmZdYgC4DM2g4/Ks+1r
 jHaYs8MGyCekOE8wWkAbw2jc1P5t89P2zzUml0DI=
Authentication-Results: smtp3p.mail.yandex.net; dkim=pass header.i=@xaker.ru
To: wireguard@lists.zx2c4.com
From: Oleg Chernovskiy <kanedias@xaker.ru>
Subject: Wireguard Android stops working after ~30 minutes
Openpgp: preference=signencrypt
Autocrypt: addr=kanedias@xaker.ru; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7b2c25fc-923a-023f-0b03-f896537d444e@xaker.ru>
Date: Sat, 1 Dec 2018 16:25:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:18 +0100
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
Content-Type: multipart/mixed; boundary="===============7298398289459082931=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7298398289459082931==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="v6M7mz5lR8qpQZ5JKIGHg61EZjpkhwRlx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--v6M7mz5lR8qpQZ5JKIGHg61EZjpkhwRlx
Content-Type: multipart/mixed; boundary="qvWCUW08O8CuAH8RINQGaAn0GxO5LO97d";
 protected-headers="v1"
From: Oleg Chernovskiy <kanedias@xaker.ru>
To: wireguard@lists.zx2c4.com
Message-ID: <7b2c25fc-923a-023f-0b03-f896537d444e@xaker.ru>
Subject: Wireguard Android stops working after ~30 minutes

--qvWCUW08O8CuAH8RINQGaAn0GxO5LO97d
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi guys,


I'm facing following issue: once I establish WG connection on Android it =
works fine for 10-20 minutes.

then the phone becomes locked and sleeps, and then after it wakes up, the=
 tunnel no longer works.


May the fact that I'm using DNS name of my host instead of IP be the case=
?

Does wireguard-android maintain any connections cached?


Thanks,

Oleg



--qvWCUW08O8CuAH8RINQGaAn0GxO5LO97d--

--v6M7mz5lR8qpQZ5JKIGHg61EZjpkhwRlx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJ6n/bKfqQh2It3nOMcyiiOKXbBEFAlwCi8EACgkQMcyiiOKX
bBHpQQ/9EaERkOABgmph6cuLNnMlOwPQSS04qkuS+Xr+gYIY0ZzoSaVIi04bOtg1
YYqQ2AtLBCtAr7hPVZzPN1Ruw3nBl/gRNX8+pmtLHgEr7nUB9Jun0ryA07kwjo43
LKrcpsXEvHc0z6VhgbLLa62aO8MvwyDU1VH6sXnu4TO/gZhvLQ9eJh9JRi47iuAv
K1LBDjQuh3mewbLys+5G1Qi0uRlCV60vbFKNs4JNlXbh4CpuXq/SO/54k/JPcAyu
r9J5yd0jEJh/QoTqfzTXQo8qMfWpXxgabbG//Bhbd77XP+zvgB/HExBArqNB6KCW
lk6GWDeFGoLll98ul3+XA21Gwe1BRb3tk3Ez+Oe1fY7ksD2FGQyFgfVE79SP2oQg
Zug7rZJYc4D7hVFFINFLOh5IavKZLfTuRebepwZ7S4rLMdrrExg7hmel1Zhb253E
nW7ZvjqME3NR+8em7SZumox4EDD5wCkBN2EJytM90Ezz+t9hDDgiwLB8T3zL5kG+
X3Puwd/DSq66pgT0WSLf6GtT41NOJgH2Akc/g1EjsSsHnCFOICdmf2KDnhieLh8M
DR8fo6IxiPubZ3lEp20aeI+VjF+SROYABEkT6aLaXpzslgRygVcSwY8dHJjyiwbC
OJFiw/tj7pdEkShFc8xILTe0PuyUFP1geDeqZ5UkNrVcuSSMw50=
=WYR4
-----END PGP SIGNATURE-----

--v6M7mz5lR8qpQZ5JKIGHg61EZjpkhwRlx--

--===============7298398289459082931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7298398289459082931==--
