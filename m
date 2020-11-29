Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDA1C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 15:42:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF1B2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 15:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF1B2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b843e425;
	Sun, 29 Nov 2020 15:36:24 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acdfea25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 15:36:22 +0000 (UTC)
Received: from [192.168.177.20] ([91.56.68.139]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mq2za-1kMlfM2g4Y-00n5sn; Sun, 29 Nov 2020 16:42:26 +0100
From: "Hendrik Friedel" <hendrik@friedels.name>
To: nikolai@lusan.id.au, wireguard@lists.zx2c4.com
Subject: Re[6]: Connection works, ping does not
Date: Sun, 29 Nov 2020 15:42:24 +0000
Message-Id: <em812a7fbc-63b1-4186-92f7-3c651c6087be@ryzen>
In-Reply-To: <109669cd65b1ffd860fa293ebeea23432a89f63d.camel@lusan.id.au>
References: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
 <20201123170255.joa7zsjvztukjxd4@desktop42>
 <emb79b6386-4a15-4186-aebf-9a21540c6055@desktop-g0r648m>
 <em1f4c294f-4708-4a7c-b268-300b1b5df65d@desktop-g0r648m>
 <em0d8407bb-2467-41ad-9d4d-5db6dabbe1c6@desktop-g0r648m>
 <109669cd65b1ffd860fa293ebeea23432a89f63d.camel@lusan.id.au>
User-Agent: eM_Client/8.0.3385.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oa8A3TEkCZ7quB/xNEcbGdahT422Rv5VS8bV2qEBVNse6V7n2Kv
 9USB1h61nWpeo7+jbvXPVvigFZUvwW+Y8fHlHVko2jYrF60y73B0wkDuQCv7yQ4X4dCyk/T
 +bF8ZQ8VrZaAT6nVHg6dXbE2aRKd77MUiGAFWtM18J4tPrQJ5mPu0JBp3QJQQ0YTbzXCvJq
 Gjdtnp6GCRsP7rL4FrzQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:93oTF6uTdAA=:5WU7V19Qhw1GmlIocUdM2Y
 MKnYNkcMpIO0AxHgpsM9wgTBjnVjjLG5VxxS3XyeZJGefuMFFgQnH3wDTzcD2ef44hOUF8yCn
 eM4KTddkxuZ724UBc2R9rbE0o6Njkew2UlGlJHMTqK5VZcfFHd9YSiTeqi/OOZ+KP1xz5/9ub
 EvglBrEqm+dm++yID9UdwCfK3wRnUk7YrbqUPia/kOAnzfOnHUxCxpZEq6gJkPBDbM4F7mI2U
 JCKKkhYGzuGZxo5xwu9mkfWQK+lwi9rCUtKI0GFiF1QEKEH2TuEeSZBxzy37NrTtRcFBi4CC9
 t28y+AxG6XBu3VepaFTYsIcico709mNjORQJNvB1T3SN/P2RLd7lSKI1mbqZGTUrpjViK+mbC
 K4kKBx6xeEsFojNYhwGsQx9SE5Nxlzo/kOGeF2NQNmTpYysfhq69BZLhbtyyvvq41OtVFyecK
 5kJLP0MCiQ==
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

yes, I did that, thanks.
With that, I created the output posted before.

Regards,
Hendrik

------ Originalnachricht ------
Von: "Nikolai Lusan" <nikolai@lusan.id.au>
An: wireguard@lists.zx2c4.com
Gesendet: 29.11.2020 15:20:31
Betreff: Re: Re[4]: Connection works, ping does not

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA512
>
>On Sat, 2020-11-28 at 16:50 +0000, Hendrik Friedel wrote:
> >
> > in the mail below the mtr results as picture, as "mtr" opens a GUI
>
>To keep mtr in the terminal you need to use 'mtr -t' or for ipv6 only
>'mtr -t6' :)
>
>- --
>Nikolai Lusan <nikolai@lusan.id.au>
>-----BEGIN PGP SIGNATURE-----
>
>iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAl/Dri8ACgkQ4ZaDRV2V
>L6TjJg/+K5tHU3bUOvf/PxBp+8QjJEwiEiYJ42ffWJaKtXWIi4YLMUHNCicicFV9
>eNO3cIZXKdp3YQtoSAtP8PNswVgaud2NO7/JBTyul1fYnFwuZBVsOgjdgztJ4wCo
>ds4WmgBs1yVoyHDlmalAjEi0cK5idLNtt0JEzpMbmL/luAXZqpXbkxm2vSsE8QPT
>j7nZAM+BGgDApkqeCFsblUGgv4c68tMHL6SJUH3XoLL5EE0KSC3eQFzWpypSyomW
>E6oiHGfDnC7dEIrnfS1NnoI0J3UQF1S9+IGpdf6xOIZwhSqTVCc2fl1Wy43KXfgi
>yd4n5+VQ6BbIrw1JXdadk5Rt/O0qhk8TWCtUPM/1W3U0wL3UCY0D9fwY9G46bkdi
>eyH1qgr/YCKr07ZCvQwpy4Y8ZUVQkTuadaaGzAl8TUAgfLzwUZLbTg2jnBBfuTG0
>CYG98RxCwfdmOTalzwsYw5CoMULTzzl0DUjB7izOlVQwhnmNXFNEBp3E3Ybql1b6
>xb3UteD/ziHQ1x/bskQvXZ3EFWm976yqNcR9qZWHSLVLleGknPfztzgfwZWSJwYV
>NA/aOz9maQCnUHDsQtNBI62K9IOckoFJ7lW3JUZaakVj72wLvXsXU8SLUK5jI6RQ
>NfMt4mv1n4tQzBiHAdbz5kyTYKuWVXwtj120a7VRjKfbAam+fiM=3D
>=3De7gK
>-----END PGP SIGNATURE-----
>

