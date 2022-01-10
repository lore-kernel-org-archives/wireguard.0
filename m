Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Jan 2022 20:57:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6e85bca8;
	Mon, 10 Jan 2022 20:56:19 +0000 (UTC)
Received: from sonic304-10.consmr.mail.bf2.yahoo.com
 (sonic304-10.consmr.mail.bf2.yahoo.com [74.6.128.33])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id babed22d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jan 2022 20:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1641848175; bh=+hQME5PkBRLpMbpuvpeReE0uwDjz27ssE1dRK1WX304=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=HCKRll2tFmf+mYR3FATynoOQbenywQPq81OuSXXF+VV10MJlhakmQ9b+mLp4G1bre1szJeqso3mB/dDnUVq/4/u2TxY+mLbb87wXORh75rDPmRd46gYGDHsZv1SwptA9QXbnMSKJspRAIEcnEioyT/CLW/NopB/z5hKqP339bKNcgcwH/snkAAE+yfXT5VFjKJTrRBeTcZzY819567ydD6Sj3dO5Mh2Kbr3iJ+MThzoj08VR7nB7Frw01mnWvw0vRaAQ6xk8Xh/d136lQvO0YiB0Qt+UGcqsYFUNma4cJ88b/8nwhJeCo6RH+PaS7sABncpSijSLEsJ8TCa9QXzkEw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1641848175; bh=K2K8ZExqG6dTDI79vMwEAacHLCaPcsMyVYtau9ERaLZ=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=itRGdOiTGE8XZtH85LuBP8IjX3xaF4cgUnjyqI1i7VbIWPL4Cd+MGNejRFtixeFrBbbe+y+/btRQ5rTznPKShZsVjsQFaxImZVOSh+shOwyKUZOqu3l92a6bquxZnmF6lU4tx4KWyuMtpFe0Qbeah05m8fWSGg9Aicx6jmA13TEBkX83XGbpahj/SPC4Z1qWVsGyM1X5YOhS4cj+rjqWDaWr6AMCJYmoH3WTvHyV1C5cAWvKaq+H1qZXcpSoPnimZnTAwjNXRNuZyXgQ7epZe9t5GOWdQODPTqyDRle+z2ULwILqkioQoUNt4oqqmaPRkJv8Hx2IhbwRxxmwdrV21Q==
X-YMail-OSG: 0WF9lP4VM1nb6OYJ8RVWTezOjVq59wRCvzSV7jOraaimUch8V5IBH3c_hdg3_MV
 YPMWVViQmksLlv2PfKfWRJ8u0Nc20K1Z.vsQUt3Sd.xZMdn3hlRKV3PLIbczkfsbYi3JPGC_EzI0
 W3MKxHo9xnGW60CjXcdX_EnoumHZYqc2ishriEQmH6HlNxrJXm7vSBs9bLdYZdvnOCPczggqVzqD
 GxjZ5OJE4FP8W6oDNGfg2yrewATOjpstscRg98oQTg0_3TL0oLxkJMBjXyHzHhnkegvvZSfVLTQk
 LQyp62sz2uI7aOv72sSccLt8BLKdCiFozm0X4WLYahqBCEeMR2Lsf8U_2MQEyYG9O4R7v6x3WC6G
 2mZxQvwYFqkl2uWK.fESrqrPLX9VX8X5TX2JbEbWu8kkJFP6_68WmljlHHbTo46aa8klgmgjOM4O
 UenrMJ6E4.SiKmxTYKwnSinxGeOliB85VQ1I1aHindQRqPy_lWLt44n7xBoF67SjWk7Ctaw..hKg
 Cn0_Yenvg7Dlirt6fM.s8zOPapweLqCAtBj3Mmg2rM_xO2ALWhnhj41cHnSM_x4uGsIWqRljbyha
 Cve8NhgEadtBzXCL7Tvkq3M.Vc34157Dcv1GXyv_.713_yl9AWr9HFfny2BNQitb5fjXBgCtku6Y
 4zBrfQbkeYKcD92eLx4Wkt7PV4fp_yyn54uvJtSMEAoDTwGwIL4OfZb6dlnyqP9mMd_kFMuWkPdo
 zKCFtCPUKpn5qEMBuegVGD9SsLyerj.rmTD4aoMMolR5g.DQZIY62j6H65DfIg9ntzgXAtnV8XHa
 q89MRd3draa.ORle.DKccgVUosHymBzChUQv8JusYZ1cWki1NNsrhQ85mLutCebB7P9E0GFh4JKH
 29yrCW7Jbymd4mwFMx9JpdO5FWIG_JS1yJQXrSHy9VOPdEBHuOv54riA4dvfemzJ6xEqvpXEwEwy
 K5kbj8eMAOcQ9X36Sf7BzullKJqcol22z2DV8GC1FGFgacx0MIZuQL0UOpVVJimtKMl432sHflrB
 _5zGpOO5nPlokyG2gVJY_twHsChb8hWC9DN4dgsZ6JXI1EItYX.pp6NlVHuVnFOcNSC90Lf2a.Dj
 LZWs2YH4VuRkuGSoDfFjAlwDJZCb0MYjK7KeHsiJZyZ4p9ZbPJweU8iRhQz._2j4N9HmNMNTaNuH
 Hw5PdtjYekXf2OcjSN.ihHUDAnr4KcIkzSlN5ZHP.2LZgk2sKLR5f8Y5zlyY8E4i9xzfodQjsLE_
 _jx5Uc_twnsQMIkEq0QCmbB.d3.cUXRYuLHQYOlOSOYkpSmz0B5QE7C7l9DLdq.6WdkeMNMF.TgE
 MY6crwm7sYtfD1ni2bPxwuuUUoXmBKf41xRQ0XZ3GRsIRTuowP3mjn4JK4rndi8Ej2M3.bHiK5yb
 O1sqIQWfStKjET.coWGVk4qzv8hFDC.D6SVYdm9ajZB6O9ypLta4AUan6WQQeMMkRFvYK5xUVLH2
 CprkHMVvAhR.Z111s9jKIvVLKSbAP_TmQetftxgDrQUb0zDUwQIRG.dIpmKMCaHml28GaLM4AH9q
 kV9ckkiyC3i8xSiPMOzWs6gWUcsy1nUuVBUFcDCR.24vcfQLv9c67Yvuv_PFqNkrvMbtSwkFpVsm
 3A6XwxemA97ygaenlyboZ.UQLJfm64wRaLCo5tk8TIKCnrR7OMWGBgS6IVI3JmRBYmfwtveYDUC0
 AIFd3zznEAAKiWSHJRM6iL34vQqdEMZhMqFX1o6eU1WEAGLa2OKITYXvaTIeDWoOBER7AwktXUau
 yQqXO3dasHMYzSOD7TC7T3z6IsiO4qIgTQ52_srxEAu_9JSTJGlSAZ1aLXZg3KZXkU49pr30D5nL
 aLcvKaSG9SP1rvBmrmZkQDGjHL0_1FE1z.UBQdbrZOjzt_hAuorVj2GLz.Ux11LAfQzD5ZRcY3E8
 uKKKU.IugoKVqssSIbwJWdUdFCMlbXEwqW2Sd9WRxd5BbjSdOPVsJfNn2047VFSZb6CWnO4XavbH
 tq8rxGGJKmNBC4rndMJgqgEUqGObTf8A8iKmE5c8FTAWZ58RVkagdvD4NUumbmOZamzNmSXv08d2
 rbVxLgtzdUvspozxq043oj_9SKC8.ZYbmu5lvd6wD_besgSF99fuFV.hvdndYOTlj4_Bf7RGJY6r
 MHzIPvHssiUq0sbebyvsc9Bub3sngRgA56SyUjw8dovHB9n8xsjneeTvGc8T3c6JUhfpt38Ds..B
 sed7IsT7cu8owwSTlnjckL1T.
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.bf2.yahoo.com with HTTP; Mon, 10 Jan 2022 20:56:15 +0000
Received: by kubenode523.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 1f28a83317864ef0f3555ff77b7cbce1; 
 Mon, 10 Jan 2022 20:56:10 +0000 (UTC)
Message-ID: <f1444860-f37f-c268-1972-79dc31df2a9a@yahoo.com>
Date: Mon, 10 Jan 2022 15:56:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Question about MTU and Wireguard and the current changes
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <1e345f21-4564-7df8-1aae-32ba14d42779@qupfer.de>
From: tlhackque <tlhackque@yahoo.com>
In-Reply-To: <1e345f21-4564-7df8-1aae-32ba14d42779@qupfer.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Cu12K6TZXvTUJveQKN2oXRGk"
X-Mailer: WebService/1.1.19551
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
--------------Cu12K6TZXvTUJveQKN2oXRGk
Content-Type: multipart/mixed; boundary="------------CPcgzNWH9PsfR0idKLRCDnBU";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: wireguard@lists.zx2c4.com
Message-ID: <f1444860-f37f-c268-1972-79dc31df2a9a@yahoo.com>
Subject: Re: Question about MTU and Wireguard and the current changes
References: <1e345f21-4564-7df8-1aae-32ba14d42779@qupfer.de>
In-Reply-To: <1e345f21-4564-7df8-1aae-32ba14d42779@qupfer.de>

--------------CPcgzNWH9PsfR0idKLRCDnBU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAtSmFuLTIyIDE1OjM3LCBoZW5uaW5nLnJlaWNoQGdtYWlsLmNvbSB3cm90ZToNCj4g
SGksDQo+IEkgcnVuIGluIHNvbWUgY29ubmVjdGlvbiB0cm91YmxlcyBiZXR3ZWVuIHR3byB3
aXJlZ3VhcmRzIGhvc3QgKG9uZSANCj4gcnVubmluZyBmZWRvcmEgMzUsIG9uZSBhcmNoIGxp
bnV4KS4gSWYgSSB0cmllZCB0byB0cmFuc2ZlciBsYXJnZSBmaWxlcyANCj4gdGhyb3VnaCBT
U0ggKFNDUCBvciBidHJmcyBzZW5kL3JlY2VpdmUgdGhvcnVnaCBzc2ggdGhyb3VnaCB3aXJl
Z3VhcmQgDQo+IHR1bm5lbCkgaXQgc3R1Y2tzIGFmdGVyIGEgZmV3IGJ5dGUgYW5kIG5vdGhp
bmcgdHJhbnNmZXJlZCBhbnltb3JlLg0KPg0KPiBUaGlzIGhhcHBlbnMgaW4gdGhlIGxhc3Qg
ZGF5cywgc28gcHJvYmFibHkgYW4gdXBkYXRlIG9uIG9uZSBvciBib3RoIA0KPiBtYWNoaW5l
cy4gSSBhbHNvIHNhdywgdGhhdCB0aGVyZSBzb21lIGNoYW5nZXMgb24gdGhlIE1UVSB0aGlu
ZyAoSWYgSSANCj4gcmVtZW1iZXIgY29ycmVjdGx5LCBhIHBlciBwZWVyIE1UVSBpcyBjb25m
aWd1cmFibGUpDQo+DQo+IEhvd2V2ZXIuIE15IGZpcnN0IHRyeSB3YXMganVzdCBzZXQgdGhl
IE1UVSB0byBhIGxvd2VyIG51bWJlciAoTVRVID0gDQo+IDEyMDApIGFuZCB5ZXMsIHNjcCB3
b3JrcyBhZ2Fpbi4NCj4gT2theSwgc28gSSBkaWQgdGhlIGdvb2Qgb2xkIHBpbmcgdGVzdC4g
InBpbmcgLU0gZG8gLXMgJFNJWkUgLWMgMSANCj4gMTcyLjE2LjAuMiIgd2l0aCAkU0laRSBp
bmNyZWFzaW5nLiBBbmQgdGhhdCBzdXJwcmlzZWQgbWUuIEl0IHdvcmtzIA0KPiB1bnRpbCBh
biBTaXplIG9mIDM2OTMyIEJ5dGVzLiBDaGVja2VkIHdpdGggd2lyZWd1YXJkIGFuZCAiTVRV
ID0gMzY5MzIiIA0KPiBhbmQgeWVzLCBzY3Agc3RpbGwgd29ya2luZy4NCj4NCj4gQ2FuIHNv
bWVib2R5IGV4cGxhaW4sIHdoeSB0aGUgb2xkIGRlZmF1bHQgc2V0dGluZyBvZiAiNjU0NTYi
IGRvZXNuJ3QgDQo+IHdvcmsgYW55bW9yZSBidXQgdGhlIE1UVSBjYW4gc2V0IHRvIG11Y2gg
aGlnaGVyIHZhbHVlcyBhcyB0eXBpY2FsIG9uZXM/DQo+DQo+IFRoYW5rcw0KPiBIZW5uaW5n
DQo+DQpHdWVzczogRnJhZ21lbnRhdGlvbiBoYXBwZW5zIHNvbWV3aGVyZSBhbmQgZnJhZ21l
bnRzIGFyZSBibG9ja2VkIGF0IHlvdXIgDQpyb3V0ZXIvZmlyZXdhbGwvaG9zdC7CoCBCbG9j
a2luZyBmcmFnbWVudHMgaXMgYSBjb21tb24sIGlmIG1pc2d1aWRlZCwgDQoic2VjdXJpdHkg
ZW5oYW5jZW1lbnQiLg0KDQpBIHBhY2tldCB0cmFjZSB3b3VsZCBwcm92aWRlIHRoZSBuZWNl
c3NhcnkgY2x1ZXMgaW4gYW55IGNhc2UuDQoNCldpcmVzaGFyayBpcyBhIGNvbnZlbmllbnQg
d2F5IHRvIGdldCBvbmUuDQoNCg==

--------------CPcgzNWH9PsfR0idKLRCDnBU--

--------------Cu12K6TZXvTUJveQKN2oXRGk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmHcnWcFAwAAAAAACgkQ3PhOoB301mbh
fxAAsUzrmZItyxrOd+bUDHlBPTe8/Ouhevai9RMy3/B5j5LYManA0GXX6LFqFI8fy810oT6EdV5T
mqDghMmsRY4KZViKpgvqB5Vlg0Hg3N/hD5Ud0UbAuQpoElzQYqusnHTM8L6NZ7yOLlMmcZCpXoxv
zcG5QzzLdiPTT81QO9WwpR89xXMaIOWrNASmCo19MWxb8ifyiCQQGKzZY8MuPNz3nQ5RGuGPfJSZ
Ba9bMKqz+xWEFVJGjbYufvRk2TCX2zvluEM2DG1p8zfpZeoC4xBV/Iq+RR5zL4ftEpVlViPMU3ek
mrM4oaBq1WSuOHmsjXZBl0h5oUGdwzjVxyCpJpaQS4kgV3sfLu8EwQ6EROTCHTbrCTUOfUaNiO0J
egKuvuxYT7bUMH7zlOsX0WFiuTfJVQW/5Xyj7uX1HwcBqhCcSmXQxCJ0RHKib5PU0bEDFywT71kC
zKpxAd4mE/A9+cnqIrQM1OEFYLNLFBLiCBCJI0vJxnnrGIxevmpnAeLgyJQC6PGeX/ZcXfkyum16
f4gjUGh4PkDm4hNyYwPwYTPV9LU6sjU3OQH3keeK3x7ty3tL6fpendsUPsS+dYgVi5cGOOpnd3Ek
kvuaiCoTVIi4WgC6kOYqLD9xzjpiksDAoChyMcjDDmyXJO/L23UFqQD9lryhRRaIXlj9woC++e6z
EnI=
=JSE+
-----END PGP SIGNATURE-----

--------------Cu12K6TZXvTUJveQKN2oXRGk--
