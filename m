Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D40C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 22:40:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 01b53e46;
	Tue, 23 Nov 2021 22:40:14 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f7d07f5b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 22:40:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l16so537772wrp.11
 for <wireguard@lists.zx2c4.com>; Tue, 23 Nov 2021 14:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=york.ac.uk; s=20160523.google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to;
 bh=ZGziUA1Ld0mbK43iMKNHlU/pe3sGJ8SF4EpTwKjeSeM=;
 b=evnRxmMBh5Qn+4kj/1N+f0H9o61xce9LoaBN91dIKgRZu8Hakjp8XTrMEG32mqgPl2
 RLMaBN29KRsVvJXb3oMHC31/Nu8i/czus1kUcx1g6bN9o7jlyjYNUs6nG9nOYYV7Syx3
 Mvh562STiNgaZeNxbg+DplB5ckSPI2uTVzYT/cDPWCBP1drLq7GO3Te3YzhONAmMhRTM
 RSxh0FH90SSCzRvlFAyBtae8qVbLO1EvxFpu6ihx56tsRbwWBGWtg1BGTabUjUWKMRn/
 /aDmKgmQGrDkRi9QFHccRX+FfNDsenl1mKXXOTovUGFYP6HBxq6JtximFnxAC1HDoXPH
 dI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to;
 bh=ZGziUA1Ld0mbK43iMKNHlU/pe3sGJ8SF4EpTwKjeSeM=;
 b=VpIhkUyCC5XJVizQb/c/8nqyt5Fwe/bnPpkhJY7jGKcUn4/WkQh/t1svNgdgpXcIoa
 RHy4PGIRVINVASurBbIcCaXNRxbUvR+x8TptaXty0JpS7HGHeW1tfwpunZ7n3iqzwjoD
 ozQYCg/Qawcl97lrvClcXpNieiSTyaeqTqUFcXjgAfZNlL52AF0s1dcnu7Rwlxp17dhz
 i7MmubS1VKtt5A1ZsGxp/R3pxVaDuF59lVu3a4OjTcqkP+6Qu4GU9uYJ6ziqqa8Jthpj
 CMcpKVHM+GSwnEEqYWND7wgjrryyjlak6jTMR3pFa74uTql/bn9DqVQ63zAoJKYLyazz
 xS9g==
X-Gm-Message-State: AOAM5304oSwZL50S32kcG0QHlinU4CVxgYwKhW0+jmmeLk8sCK09r17r
 E3B8u3omDTs0gYrRY/eTwOXCalhwsXMeenlj
X-Google-Smtp-Source: ABdhPJyCuY1IcJPEr1vqlXrR2wTNBPX8A0Ui08dut73ffxz0HSRuJZbVleF4WXgJabXYXM4898cyuw==
X-Received: by 2002:adf:e2c5:: with SMTP id d5mr12109992wrj.338.1637707212303; 
 Tue, 23 Nov 2021 14:40:12 -0800 (PST)
Received: from [192.168.0.230] (uk.webcrumb.net. [176.126.241.16])
 by smtp.gmail.com with ESMTPSA id u23sm14193880wru.21.2021.11.23.14.40.10
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 14:40:10 -0800 (PST)
Message-ID: <edfa128e-7c6d-c329-5d63-4a3b32c2517c@york.ac.uk>
Date: Tue, 23 Nov 2021 22:40:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Dynamic routes
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
References: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
In-Reply-To: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rgsjla5CUjy5zDrPyb29y0gz"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Rgsjla5CUjy5zDrPyb29y0gz
Content-Type: multipart/mixed; boundary="------------k1rkqas0saLR0Z2IfMcBsX4o";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <edfa128e-7c6d-c329-5d63-4a3b32c2517c@york.ac.uk>
Subject: Re: Dynamic routes
References: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
In-Reply-To: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>

--------------k1rkqas0saLR0Z2IfMcBsX4o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIvMTEvMjAyMSAxNzoyMCwgUm9iZXJ0IERhaGxlbSB3cm90ZToNCj4gVGhlIGlkZWEg
YmVoaW5kIHRoaXMgaXMgdG8gaGF2ZSByZWR1bmRhbnQgdHVubmVscy4gTGV0J3Mgc2F5IGEg
V2lyZWd1YXJkDQo+IGNsaWVudCBoYXMgYSBwcmVmZXJyZWQgc2VydmVyIGFuZCBhIHNlY29u
ZGFyeSBzZXJ2ZXIuIFBhY2tldHMgc2hvdWxkIGJlDQo+IHJvdXRlZCB0aHJvdWdoIHRoZSBw
cmVmZXJyZWQgcm91dGVyIHdoaWxlIHRoYXQgdHVubmVsIGlzIGVzdGFibGlzaGVkIGFuZA0K
PiB0aHJvdWdoIHRoZSBzZWNvbmRhcnkgc2VydmVyIHdoZW4gdGhlIHByZWZlcnJlZCBzZXJ2
ZXIgaXMgbm90IGF2YWlsYWJsZQ0KPiBmb3Igc29tZSByZWFzb24uDQoNCldvdWxkIHJvdXRl
IG1ldHJpY3Mgd29yayBmb3IgdGhpcz8NCg==

--------------k1rkqas0saLR0Z2IfMcBsX4o--

--------------Rgsjla5CUjy5zDrPyb29y0gz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAmGdbcYFAwAAAAAACgkQ4DBDgow/9LtH
gg//RMe07o7Tp0ImbLSSanv5aSiDHYVDbpKKiZPFenZbBGj7wboNDgWr/Y1ekrTn45YoGkZWPeTC
mtzksG8Z0oTdlrRQvymG+N1EZj8XYtdnM4XqDSTowL8NUdus8rmZJtceN3+c7lI4wqZw4bW5djrL
t2xSHOFM7cd8YnRg5ANtau9EbtnosPVBwLItBEKQBZcK6a30Bo0dIW3hZIsShSRuBKtuz7hzAiwx
lfm8h9VFfwPxCbwNOprSrZ3CkYor5yIboAMSvQugc9gy3CpRX99OA8qWKh3izKk0QHc4XPBTy/p2
MV6eS1uNCi7LgMWR2F6rHmc2ZbNGEGRNVdcyj2VfZN0n67/ljpnYSn+kKXP72aMPEDTQvyXW9wd/
qoW/KB5dPEokxzpBDCmUpgSXmkx2IjTdq+o7mHs0tg6ItCvcVOIgwvgej/85Q433aVpxGiCibm0u
Lf76QtmD4nBZ5tm6rDqIB/dMkZbbSoDHgEmsD2bWzVdkqxzm7yt/lqojlS3tZ40LeE9WVkafLW5z
KBlUFk4k1Vw56ONLrO4JxxQRA56QjOejEkiAjxD/V+tHGXodlz/ehh2kvyN2ULG4x4kddHfBvemQ
Zce56yQXs5YW0Du/GqRhWFFtlRfgJwqnVO34exO65LA0UKVrRBzdPL2Lwh36c5EOdnMi/6IiWgqa
Tbk=
=JXEn
-----END PGP SIGNATURE-----

--------------Rgsjla5CUjy5zDrPyb29y0gz--
