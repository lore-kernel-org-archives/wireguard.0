Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48AEC05027
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 22:06:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fdc5138;
	Sun, 19 Feb 2023 22:06:56 +0000 (UTC)
Received: from sonic311-24.consmr.mail.ne1.yahoo.com
 (sonic311-24.consmr.mail.ne1.yahoo.com [66.163.188.205])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f4136f8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 22:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1676844410; bh=XuM9f/klHOqv5MkgDPSD/JlQBnMQxAzNm3cyVMnHZ4g=;
 h=Date:From:Subject:To:References:In-Reply-To:From:Subject:Reply-To;
 b=izzhaAJ0xTGaXMB34VHLSuNQcYvNZYBL9PqrPpDc/c83izsQm3lr2bdbkXmOCiC6KgogqFzzUiuX658tcg34EM07nwKsaD9JJvgNSCxIMOHbUZKU/vzVWU5w2FUguZQPzmZ1xE2gWrRaQdvEi4+OZc2ueOvhvCERtvcu9GyQIlc2zAoeKJzHM3Yc1H1i0tzMZE/CGlK6aW5CDkVeXVniWoUsHEbDbCDMF+6uc+JSTZGZJ1GQBVRno9gy/qZAtuHMNnuJpDNF510CC0VMZwdWHdIh6TLfRRXzI31y6/iQXGfo9giBewnW5vrnzQRdbDKeZJXcgLm2yJukVqADlYg2Sw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1676844410; bh=7QZHQNrX0Pq8y95CIYd6p02g7SthEGX8/D9fBw9ul9+=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=nyvbkMxhsadCUp7bceIhb9bpt4b/qQR9ErPrLMug4/pwFdKXz96zCXuY326iFZT85cE9qUtKd4afQ/Ms5Zbh3to2UnhvhQW0XcAkrf3GMQFuOp/JPghDl2ngBoQ2IPSxpt03W6piFgoPN7nf/X+5GQJxZnQlju8NQuw7MdvTXSfr2KDEi9ON4ebNim0I2gyzm3EABS0mjHX1LWV5uFQPMn0BJ4zspn5N+Oq5kDGh50D64pUCQm1BBUJzxGFtl98STLJ9iFp8dO4iRhj0ehgMd56Z1XNOgDnh7gOJwCqTxv0cQpbkyvPOqVyC2JuEoVuW8UpZBFe16a5P5mftDuHKGA==
X-YMail-OSG: kRYbfJkVM1mnl5ByGh6.ftSblgvGi5I9JgprZH7pJXE6wDp5_tAF74Qp8hJrMO9
 O8H0gUcikJnKtxTlcVQuI5XraFhAITX.6NmBDyB5TiujPrCcFbYX_jRbJUb_r7XQE0u9mu6Gyc6R
 6RN3sGGVaU1URKSHP5qa4VFrnr_dN2xmt2so_clivlG_vBnx33at7Jp_xkNpW6R.hVtRGzXApYsL
 M1MFV0KFVUhPGKa.Bbvg95Q3REAEgA46UXqahBA4P3c4dTaL._g.8udeCr4Elv7P_cebu9vg8O66
 l_CzC360Po3fVVyFpgzFxQQ_WlmDKOzYG8Q.Si_TZEqSEA.qvxuaBLUwKSTkN2cwzNvSL60cUIR_
 aWcB7ILl8ofMNgN6jTg.QbjPIu.57NuS_6ZKuyK4O5BGufigsoTtSHg__UBQ8PTj87D37x6P1389
 dUocRAXUcnIrGj5nxEmRME2.DXGEvG9UhvN5iIQKjuV68rVgInvsIc15RE3_z2QCGo_5MXknmFmY
 kWq43UNi34NyT_ZMUg1fs.ZxRx8cxp7_WPxwlbHRoa9WLZPd8VJxh4kH7ea7PKwxhjQY1dGF4DW9
 5gtenV8Rb_i2WloqP18XCItlhq_6hyzxlfXjFAK26Ei0b40YToy8UYuKsjL9ipyrgwvoP8.mCCii
 Qvdb9p9UyJXZqRn0Y5PGwXyynMj9tJKoebinXI04y3cqiYhFsxSgich_vEZEQT8XQc30RUADaTVc
 T7WossBlm84ru9jB9Cn5aiho2RxwvMoXfbjPlKH.dspaSqD3L.WcCsDE0fwqSOml6IZ5PmW_1585
 QBDz5a5Qn_jdLa4a.NtxwHS6vMVvufYTblTQ966GCytsT73ETZk73MUdepJbauajFHIL2Y85Vwl8
 W1QpRxTHuhA_eQ50g.v0xQNc.hT0BNBK5ZNk5udUM0d20B1XjIIsDT46DhFBhCIlrtEoSXp_tnMG
 gI1i.Ouni7dDJDiSkiIdQ3p1FWdeQDWpOyy9AfWFPHcCedC3fLaALMWgp4AWXO0YyUD4FixTKN4B
 QmiDBiFCrd.57dpzymHCMBZLuNpiSp9VRn2T67kFBHmtXl6Amsfselpwlng5ue9y2AhgsFdmzZyb
 dFHHx0QLrPneWdMzLscPnGvFYKJsXMVsDA2xswaw94ADLF1KZxA.iSD5ILsh13oLctKuS_cpgc0G
 NUovsTEFaenRTczxlMv_6Vt5to4yU8BcCM_OeqgNygUf.xbs_WBvkLr3HzC7WqTphDPHa4I5c.Nn
 cDdFPK1hN0_HWRRLMOcS9BqlfWIr0OY_H8bpCTXs.ebP7uUjEDyrviuna2b9j.CLVPa1bg3fzJV_
 qMTV0Aqh_IiUS1Euuj4CoDfAPZNA0sqyhc2YULXRi_0MOJgEGSxPJzf7C3HSoLjHNOoj1va.xYrw
 75ATH1E444gzX0crPSIGAQvn49riyPZtWuVLoJhJuTRXokhLHyX6Hc3Jaty2MGq5lmk6pbo_zCSp
 X1xa3ucmr3aZ72u1dua_QWJEHyFbdnz4Ugp89g2OuVFxI2fsWTlAniM4KV1oCBLYhXPu7eIqen9Z
 _XtsIIUJ5c_xc0Jnf1cztm9t53HQX4Yn5WFrwpkSrn37YR4lRvhud93GJv58UlroU5JcDZLphLDB
 SDRvuFAbyVN45L0rVT0O_TgIR1r1a4EMR06ySTSzRETW78pxkbRIDyXlEvUDOBfLbSGGY6yhu1Ix
 .LQqBndMyLjYWr61eGAWJA8vvREFsW8fAnp1WneWm9gqAs0g9e3.bMbFxJgzbv3T4TKtlea6EvlG
 Ayklou6n6BTvdJ1k54p_GGTNyWCjLXTFOyHECL4rIs4v_9YGJjByBjiej5h22ofcaA7QLaZzatOC
 iBcAQuNLt3lMiOVR5aTmntH3tkvmEx6kmmTTwL0ZUGoZ1VEUui4TIh6uueDEWe7Iudb.NGVJHvhT
 4iI_mSmGYwjwpOGwmZTgQHcBg4zFjBy7OfxHzDABGnZMZNI7PsEksBsvLFAmAVmJBDztG3dv2CKK
 HxdWo477hiEfPpIpFUsEq3XD08nOKi4TwTDMDicOWO.2j8gl4KiSpKFtQs2P.BDv4Dl8QXEIoTHD
 TgxbIkOMKFTZqJV3kj1H1Z6SpesCYVn0wScSD3WWa_wKCpqx.hDDPmtHRqHgWPi_IPlCKrGOpLYu
 YaIeeJCa3M9P1ycN0KzBsAGtl1wWF4.ARXlacxpK6pZc9csLgq84spEVZkZiRwOa0bssVFn6VOCX
 HSPS5VUvBcJjVSQU07R4ocfVa
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Sun, 19 Feb 2023 22:06:50 +0000
Received: by hermes--production-gq1-655ddccc9-h558d (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d111cd3eeec5662761bcc1063d80f433; 
 Sun, 19 Feb 2023 22:06:46 +0000 (UTC)
Message-ID: <48ed189f-3b11-7649-8d0a-fbef3f788bdc@yahoo.com>
Date: Sun, 19 Feb 2023 17:06:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: tlhackque <tlhackque@yahoo.com>
Subject: Re: Source IP incorrect on multi homed systems
To: WireGuard Mailing list <wireguard@lists.zx2c4.com>
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com> <87o7pp76a2.fsf@ungleich.ch>
 <20230220014252.21178988@nvm> <87h6vh72d4.fsf@ungleich.ch>
Content-Language: en-US
In-Reply-To: <87h6vh72d4.fsf@ungleich.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BoDHg94kH1tepEVFMoI9JDHq"
X-Mailer: WebService/1.1.21183
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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
--------------BoDHg94kH1tepEVFMoI9JDHq
Content-Type: multipart/mixed; boundary="------------ywWpEmawXd0ONp7Zp0g0UAbk";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: WireGuard Mailing list <wireguard@lists.zx2c4.com>
Message-ID: <48ed189f-3b11-7649-8d0a-fbef3f788bdc@yahoo.com>
Subject: Re: Source IP incorrect on multi homed systems
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com> <87o7pp76a2.fsf@ungleich.ch>
 <20230220014252.21178988@nvm> <87h6vh72d4.fsf@ungleich.ch>
In-Reply-To: <87h6vh72d4.fsf@ungleich.ch>

--------------ywWpEmawXd0ONp7Zp0g0UAbk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTktRmViLTIzIDE2OjE5LCBOaWNvIFNjaG90dGVsaXVzIHdyb3RlOg0KPiBTbyBmYXIg
dGhpcyBzaXR1YXRpb24gZG9lc24ndCBleGlzdCBmb3IgdXMsIGJlY2F1c2Ugb25seSBzZXJ2
ZXJzIGFyZQ0KPiBtdWx0aSBob21lZC4NCg0KSXQncyBub3QgdGhhdCB1bmNvbW1vbjsgY29u
c2lkZXIgYSBkb2NrZWQgbm90ZWJvb2sgdGhhdCBoYXMgYSBXaUZpIA0KYWRkcmVzcyBhbmQg
YW4gRXRoZXJuZXQgYWRkcmVzcyBvbiB0aGUgc2FtZSBzdWJuZXQuDQoNCldoaWxlIHR5cGlj
YWxseSB0aGUgcm91dGluZyBwcmlvcml0aWVzIGZhdm9yIHRoZSBFdGhlcm5ldCwgdGhlIG1v
YmlsZSANCndpbGwgaGF2ZSBib3RoIGFkZHJlc3Nlcy4NCg0KSW4gYSBjYXIsIHlvdSBjYW4g
aGF2ZSBXaUZpIHRocnUgdGhlIGNhciBhbmQgbW9iaWxlIGRhdGEuwqAgKE5vdCBzYXlpbmcg
SSANCmxpa2UgdGhpcywgYnV0IC4uKQ0KDQpUaGVyZSBhcmUgcHJvYmFibHkgb3RoZXIgY2Fz
ZXMsIGJ1dCBJIHdvdWxkbid0IGFzc3VtZSBpdCdzIG9ubHkgYSBzZXJ2ZXIgDQppc3N1ZS4N
Cg0KQXMgSSBhbHNvIG5vdGVkIGluIGFub3RoZXIgbm90ZTogdHdvIHNlcnZlcnMgY2FuIGhh
dmUgdGhlIHNhbWUgaXNzdWUsIGlmIA0KYm90aCBhcmUgbXVsdGktaG9tZWQuDQoNClRoZSBz
b2x1dGlvbiByZWFsbHkgbmVlZHMgdG8gYmUgc3ltbWV0cmljLg0KDQoNCg==

--------------ywWpEmawXd0ONp7Zp0g0UAbk--

--------------BoDHg94kH1tepEVFMoI9JDHq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmPynXQFAwAAAAAACgkQ3PhOoB301mbR
sg//XQ6nP6fgKb4bUKtCFU1AnWUVEnrOWIir6JX9XnrCBrMIAL5qXHKkAMUFEzkLBIv07W9ZrjfO
OHqf/aV8kcnrS2J+qAinNHhjWW1nVcTQODqHOFeCPkYpF2miD5cEwAoPuB+wvdyADb02xjoCQnJn
Noy+uMIZvKyfkk73pMQ8N7Qn91g84bAL1uXZyxzu+HbKQ49u3FzWr570v4McRidJUwNxx8yPmmTg
kQ26af3IoZ2jaWPEMBw2Y/yOr8AKl448VJgQP0JPlqUt4tvTSRSkzNsxREQR+cldGXgmJkp3R+ZG
sVv76zTpV90408ukxeGJYBoKVoFz6GDeycl3IOmmozAt5np+7nH+8isHroO4Q6wuBtAq9l9HXDCg
+oybjXtwoTNtPh3N/4sbHuyRYjutLEBfg09jyBdzo7+xphKV8uRSfQY0k+PQNieIL7D8Wqvk+erU
6u7TUlvevHAazdi+7UawkCdf4z4oCQIRfU2cm5m1ie1GzifDBgArrpdbRzzi2LM/6XhaKNuZr4Lj
Mk9iz5zYiW0oSJrsCDbKFwVbK8HHeU8UROmVbZTYe3hmOgLQ9mO3XBc4YJbNMmE/lSZUl4iI40Ly
7YJWCnfk65cd7M0e9Xhd5zutKajNjbsT13QndQE7XwJ4s59uOq85kCpJvi+PEyxFp0O4WmT25TLt
GNE=
=4IB3
-----END PGP SIGNATURE-----

--------------BoDHg94kH1tepEVFMoI9JDHq--
