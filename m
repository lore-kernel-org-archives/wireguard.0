Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD94C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 10:47:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 968060b4;
	Thu, 30 Jun 2022 10:47:48 +0000 (UTC)
Received: from sonic317-34.consmr.mail.ne1.yahoo.com
 (sonic317-34.consmr.mail.ne1.yahoo.com [66.163.184.45])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 372638ba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656586064; bh=PEO0dXCIEFAv4d67kpCjbDEFWcaD6IDVAwoNx11yBHs=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=EaA+arBNCNaaGwxBORvLj8Z9PhSQfj5qyb9qZn6QNp3Qrh6nYcjQMgu3+f4tdPVTswC8+yvWy8NNp+FoJtKE3ZvsuCIn3d5IzkLrID4yfMrMG6CQ5qiZoA+1BEtsCbzIWwo5S324RnGLj6parK2jLAWt8oX7pFuwLi+Dyqb7s1jYsoXVDhKIqgmvsKuXcKyt53sIGDPPpiJMHT7YM/LmxTSKFp92qT+JXbYykCDSQnyMua6ocoIFx4blnym3ErTstACXGTBgQ7e2YOOSrY3CWPIlgf/0H30ATaLBbUkMmCN5JEXEqUgk3HgllKQU6FO9/3CVLSAGlvew0ttPjg5CAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656586064; bh=4qIzKSkny8uO0ScSLtB/gFQ6WZv5Ayp+OVS5zQw4LeF=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=C+ZlRaj9o4uKyggeoln0cPf+yH3vE0Bknld16HyUcMWdF5I4phpQ4oSt35nO3zUJBDQQM+J3a+2eMG4R1ki7e9DxzHsHSH18P0bWj6qwqUscAwnc/KYmqAW8WG29/J4HKxAwP2FiTc+jtl/mXPp7jZx1tmtpB+Yl6vvAnNiR+nbMKF4q6yAKVLlzcvzE8INscLzKyH59yIw4f+OJImfvS1UzMCMI+mduUo4gIEh0UHTJfKogiCFiW3LobGIMLOxSnnznCx1hTeKKAXAOdHJDAnmgORKt8MlurFaxmPNFpwPvRbgexmrwsQImzMu0LG0FBeLONVWERnUjgVI0kHu61A==
X-YMail-OSG: 3ImfECEVM1leoqLPQchh9nsUW6LDNA6H5EIRLhiOdnrIBMkyNuvVbBLywvPzjoW
 ShPz4CKNL70VU609ACYtvSd_PyDnzHpMRcy1RkpdVATxheGFj6w3SKghXcuOJeH.qPUW7Llx.KC5
 sUueiOtu7Ujmmb2q1jMvjOZrZMQoT.P7hHgGusSHzjI.2fQimarDcSllR32apPMebIy8hXF7lfyB
 Dd.0R_vMTStdbUR4HyMrSZlEwVuHOQQ6vcR7NLL4rHZ8y3JEMmN_azXA_CupxDCGE6qgDaJkVzQD
 OiYONy3Btb6V6tnKWQXOF8C2LejkUVTGeqQCifj5Ps_2vdpQbGC6lp13ThwzXfXOmpT46bZ.JiWG
 mfDq2CzMIaweONIDsYSFWkA9_4Ke0gw5ib3zspw56wjD0Op30FAGKH9Y1Sr7fBS06kze.hJr_Lvg
 MGWO2MOBJjCY7_fkbO9xsb1A6Rrr6hd_Y82TuMEJWiK0ao4nwPrmCqLTmEl4XWTs9sBImawPY5FQ
 DIJ9PlBJehoZiTPWgS1BS4.uQHMdG3lvdK3RsmW.AH1hMm2X03GKGseE.8JPFT.NXgjrW4r1qQ2G
 _i3eXBZna05Lwa2V8f1E5JkV1z5LrowyVf83WUulZfHTZWlD0j7NBXzyEVB.f.1AfFfUw1k96Cxp
 g3Ezh4LbUi8GNwp3LBZ9esHSdt1Ktv6CcDCPGZhjnNnJfxy7zb7.qqC0ZHncMASeJLQuvaB.euoN
 RN4km.ZDJCQh9wvnusOwfLMzr8GPEPhPY9AFxOEuOytr5tKxGnNrb8L1gbdv._cZpXSbwIYMqifF
 .GE8IB9IxMPprf5ZQwMSQZs_pfbK6ijO7EKDeuQ_2kkJ8q.qTftQdk3a1Ze4Xw72Y74YYX5MoEX4
 QifJ9tJkbEGcc4..C0YgaDDT8cmpjNeKnLHvBmYuFvpavoRzJskFcIwXiViv33Sz1w9dEGTabto5
 Han19gMLXq3XnRpCXFF1SL9aqOniKofOoY0ORyG0GzZZMrAZ.dm.H2lNDQgxr9rAD67i97lVmznA
 6sLmNRUH2QDjG5dcT5YYTi5OwsfKhF2R5MlTzPlvLdHhsEZ9XRbRi7pzdK5fB7aTTIWAnVnnuVwm
 24c9eWlOw5xhvEI_zyyT5s8YA8m2l9IT_24HnsbRxC.Kj_QwVn3ZKmoziEebOJcly.NO2QCkjrsQ
 F4u3pV5ilVVdv_KzdgQTTmTKPOHRM8jxIXCR_.ExeVMYDOyx1VQeMO6kkeEONXGaIFo7NH.89H0N
 Kw6smymgaU3zJtpge_4eOqkjBv6P7ev9P0.7Q3XbotTd9_6nScydh.H6OES9mcpMIKpOnjGbX30e
 X5etekrJkB96eliLZzcVIv3C1NGGIv7X_grEE2M4IJq2tZMS7P_COMECF4WzWO0B3cjtZhYIot6j
 BiiAy6kR2.7XAz0xHh6qBlAASeegENFmT68xXfrFHlXPi2VLOVsanmkQN5Slt204hLn_fM7vNlZB
 uGYujWtqPZMGSiDjDJXLq4NYrB24_f1i_knTaMSGzKbJXPjKpI06aHRn6EI.AKotqle8rz8OUVng
 fk.YeggDsVh_M4QUv175xQHTD.xO4njlDXxQiXUqulh9OurwQxDGmUKL1XXC02ycc05YTylvVNNI
 8sjsZI3zB5iRpbKflM_JuzO_OjcoBvYPfKek2qv5xLtcegECyQg1pLeZ4qaqAPSI3z1f0ASPVPfs
 8ns9.Oh9PA95.6rgMbOoKVS74GHkC8j4rrV9BmaVIiI8OEg8lggoHEloBuqyUOhTN4URFWKv7o1x
 u1vTGtEPIM02u.XEOu0jFdZLiBMcD0Aw4t5cuZTC7VgLqRQuEzm2o87_3Zq.DtIrkLNxtU8YVyES
 ByvHZwkNA7otxRQ9fk4KAcYTuQIISf6T83Ca8uyru4h1U2zIkQVxMuCu8HCAMyNa6yS3o167vqcp
 SNdoLr6VsyjGrkesSmpLGNE4b2aPsx8Pz94LRvukbLm2S8kCojCHA_XF4R6D6OFG.5IYw99KRjHL
 dYw.n2r0kZq5.uqiGi27ChZXMpiSIIhth10ClQ7.EPAqN2.pT.nPXQk4V4UJZ2uwDAN6vgGODzQ6
 i8TsEbscioYJjX9dubcmqKi1IMon0_TPuXDzsJyJnQ1nr_hBKitoYZ4Fj7JqUEBSJg0O_tC2tk9w
 MsTxyJumCma.hJu2rSsDC6CkWSNbV8CeHh6E1eloTVWF9cFVD4gBuscFH4XCgbcLGPVZ1Ratb0EZ
 bQXehw.bdGYQ0BgBM
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Thu, 30 Jun 2022 10:47:44 +0000
Received: by hermes--production-gq1-56bb98dbc7-sdhbr (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6fd0c90e8cffb8fe479cffb03b2248f8; 
 Thu, 30 Jun 2022 10:47:40 +0000 (UTC)
Message-ID: <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com>
Date: Thu, 30 Jun 2022 06:47:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: tlhackque <tlhackque@yahoo.com>
To: WireGuard Mailing list <wireguard@lists.zx2c4.com>
Subject: CONFIG_ANDROID
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pQblrej6unyoQBUNfwcKQSIl"
References: <23929467-11c2-cdf2-3841-2a837ba58b51.ref@yahoo.com>
X-Mailer: WebService/1.1.20381
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
--------------pQblrej6unyoQBUNfwcKQSIl
Content-Type: multipart/mixed; boundary="------------saFqirXJrF4dbsgKDdyJ2N7x";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: WireGuard Mailing list <wireguard@lists.zx2c4.com>
Message-ID: <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com>
Subject: CONFIG_ANDROID

--------------saFqirXJrF4dbsgKDdyJ2N7x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RldJVzogSGF2aW5nIHdhdGNoZWQgdGhlIGRpc2N1c3Npb24gYWJvdXQgQ09ORklHX0FORFJP
SUQsIGl0IG9jY3VycyB0byANCm1lIHRoYXQgdGhlcmUncyBhbiBhbHRlcm5hdGl2ZSBmb3Ig
V2lyZUd1YXJkIHRoYXQgc2lkZXN0ZXBzIHRoZSBpc3N1ZS4NCg0KIEZyb20gdGhlIGxhc3Qg
cGF0Y2hlc2V0LCBpdCBzZWVtcyB0aGF0IHRoZSBvbmx5IHVzZSBpbiBXaXJlR3VhcmQgaXMg
dG8gDQphdm9pZCBjbGVhcmluZyBrZXlzIG9uIGV2ZXJ5IHdha2UtdXAuDQoNClNvOiBXaHkg
bm90IHRpbWVzdGFtcCBrZXktY2xlYXIgZXZlbnRzLCBhbmQgZXN0YWJsaXNoIGEgbWluaW11
bSBpbnRlcnZhbD8NCg0KSXQgc2VlbXMgdG8gbWUgdGhhdCB0aGlzIHdvdWxkIG1ha2UgV2ly
ZUd1YXJkIHRvbGVyYW50IG9mIHRoZSBwZWN1bGlhciANCmJlaGF2aW9yIG9mIHRoZSBBbmRy
b2lkIChoYW5kaGVsZCkgcGxhdGZvcm1zLCBhbmQgZXhwcmVzc2VzIHdoYXQgDQpXaXJlR3Vh
cmQgbmVlZHMgLSBhIG1pbmltdW0gdGltZSBiZXR3ZWVuIGtleSBjbGVhcmluZyBldmVudHMu
wqAgSXQncyBhbHNvIA0KY29tcGxldGVseSB1bmRlciBXaXJlR3VhcmQncyBjb250cm9sLCBp
cyBwbGF0Zm9ybSBhZ25vc3RpYywgYW5kIGF2b2lkcyANCmFuIGluZXZpdGFibGUgZGlzY3Vz
c2lvbiBhYm91dCB3aGV0aGVyIDIgc2Vjb25kcyBiZXR3ZWVuIHdha2V1cHMgaXMgDQppbW11
dGFibGUgYW5kIHNhdGlzZmllcyBldmVyeW9uZS7CoCAoSWYgeW91IHdhaXQgbG9uZyBlbm91
Z2gsIGV2ZXJ5IA0KY29uc3RhbnQgZXZlbnR1YWxseSBiZWNvbWVzIGEgdmFyaWFibGUuLi4p
DQoNClRoZW4gV2lyZUd1YXJkIGNhbiB3YXRjaCB0aGUgZHVzdHN0b3JtIG92ZXIgQ09ORklH
X0FORFJPSUQncyBmYXRlIHNldHRsZSANCm91dCBhdCBsZWlzdXJlLg0KDQpJIGhhdmUgbm8g
ZG9nIGluIHRoaXMgZmlnaHQgLSBqdXN0IGFuIG9ic2VydmVyLg0KDQoNCg==

--------------saFqirXJrF4dbsgKDdyJ2N7x--

--------------pQblrej6unyoQBUNfwcKQSIl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmK9f0oFAwAAAAAACgkQ3PhOoB301mZu
8RAAmRuF1ipRaVznnzHmpWGqDi8VJP7GTroqh8DPE9qBryq2aq1DMvtIrrOl2dP9XSp/HtURI5nE
wjihMXGInD9sigN7i0TfgRy1x4Jd9nzLN6CdlywzKV/AUgyVtgHQbKME7z1okmowPcfdaBpUX6Oy
J2oea/gahJ5CGdIYPQhb3QhRFkH/g1Bla64bb92qLUxPjhh4wVzOqUlajC7G3WWoVBqYdWRzuzXz
vrY7vLzoWIz653qGQEju/ENUIAHzCKfj3WzJWMeSnSaQ/Ttu33qKT2t/MlYMvi4p/SC3ePGiAtm/
itm1EX+hslXHu704kwUIL2oc0zeVd0RhQC4xS5QJaEL3GP3SnFW365uXehMFN6ZP0nhCHpkXKDge
FRMSjfvEeQb+NOWH81UwLN3CQmO1vtJpZ+XB4oEcFk79urrzxkWnsVDgoMg6FKNjpibKbs57hl+u
ivfaT/THA8DfaGr75csvviZFej8n5OUdtu0UOwuTtZe89hqUbytRBGoCgR7pNAPP2gMtnxfOVwhj
JJoFyy04zWMssyIPWvS58H0vfo4eO4w+5vx3Sv46C2oNRGpu/3BiPWm/LaPX4kAyUYsSRcF6xbYp
NLPHK8RdaKuW09QBtfJjOSbxY2kkBDrW9/UA9IeGVHn+Etqfshf8aretnXqW6Ta6j5JuR0N70KGh
FeQ=
=oC63
-----END PGP SIGNATURE-----

--------------pQblrej6unyoQBUNfwcKQSIl--
