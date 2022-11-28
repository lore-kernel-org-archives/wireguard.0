Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CA1C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Nov 2022 17:58:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f7bddac;
	Mon, 28 Nov 2022 17:56:10 +0000 (UTC)
Received: from dubhe.uberspace.de (dubhe.uberspace.de [185.26.156.47])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bbe6d85e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Nov 2022 17:56:05 +0000 (UTC)
Received: (qmail 4414 invoked by uid 987); 28 Nov 2022 17:56:05 -0000
Authentication-Results: dubhe.uberspace.de;
	auth=pass (plain)
Message-ID: <15709745-61e4-5aef-200d-4e3802718c7b@noc23.de>
Date: Mon, 28 Nov 2022 18:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: Wireguard - no logs iOS 16.1
To: wireguard@lists.zx2c4.com
References: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
Content-Language: de-DE
From: Ulrich Kalloch <ulli@noc23.de>
Autocrypt: addr=ulli@noc23.de; keydata=
 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 dGI=
In-Reply-To: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ercpKQJRc5tFsggB1mrh7rDW"
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.993696) MIME_GOOD(-0.2)
 MIME_BASE64_TEXT_BOGUS(1) MIME_BASE64_TEXT(0.1) SIGNED_PGP(-2)
 MIME_UNKNOWN(0.1)
X-Rspamd-Score: -3.993696
Received: from unknown (HELO unkown) (::1)
 by dubhe.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Mon, 28 Nov 2022 18:56:05 +0100
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
--------------ercpKQJRc5tFsggB1mrh7rDW
Content-Type: multipart/mixed; boundary="------------jIXFojqif3bD3L1tpKNonFqo";
 protected-headers="v1"
From: Ulrich Kalloch <ulli@noc23.de>
To: wireguard@lists.zx2c4.com
Message-ID: <15709745-61e4-5aef-200d-4e3802718c7b@noc23.de>
Subject: Re: Wireguard - no logs iOS 16.1
References: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
In-Reply-To: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>

--------------jIXFojqif3bD3L1tpKNonFqo
Content-Type: multipart/mixed; boundary="------------Enjpd0cOk71tm3E7aXSvJQTI"

--------------Enjpd0cOk71tm3E7aXSvJQTI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMDUuMTEuMjIgdW0gMjM6MjAgc2NocmllYiBPbWtoYXIgQXJhc2FyYXRuYW06DQo+IFdp
cmVndWFyZCAxLjAuMTUgKDI2KQ0KPiBXaXJlZ3VhcmQgR28gYmFja2VuZCAyZWYzOWQ0Nw0K
PiANCj4gSSBhbSB1bmFibGUgdG8gdmlldyBsb2dzLiBDbGlja2luZyBvbiB0aGUgdmlldyBs
b2cgYnV0dG9uIG1vbWVudGFyaWx5DQo+IHJlbmRlcnMgdGV4dCwgdGhlbiBpdCBnb2VzIGJs
YW5rLiBUcmllZCB0aGlzIG9uIHR3byBkaWZmZXJlbnQgcGhvbmVzDQo+IChpUGhvbmUgMTEg
cHJvIG1heCwgaVBob25lIDEzIFBybykNCj4gDQo+IC0tb2ENCg0KU2FtZSBoZXJlLg0KDQpC
dXQgU2F2ZSBhbmQgUmVhZCBpbiBOb3RlcyBXb3Jrcy4NCg0KQmVzdA0K
--------------Enjpd0cOk71tm3E7aXSvJQTI
Content-Type: application/pgp-keys; name="OpenPGP_0x44BE4EB74E7625C8.asc"
Content-Disposition: attachment; filename="OpenPGP_0x44BE4EB74E7625C8.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
LqCLuJwb+pOcyMk9dGI=3D
=3D6aBH
-----END PGP PUBLIC KEY BLOCK-----

--------------Enjpd0cOk71tm3E7aXSvJQTI--

--------------jIXFojqif3bD3L1tpKNonFqo--

--------------ercpKQJRc5tFsggB1mrh7rDW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENG5AQe49g8SDl9CNRL5Ot052JcgFAmOE9jIFAwAAAAAACgkQRL5Ot052Jcjl
hw//XALujJyBaJQtdyxYMHX5BoBdiOlIgkBRM0Fi0ErHm2xjd2p4dRPCMxT0sVeTGV7nr7kjahfr
yDHZ8zIRfkVpTnncPIebGsnDtzk/j3Ag/gGAqrqV+I9FWAFpyh1McKuvhACXThbjdWL3VK6nNBdc
xMevhPyDcr1S/0GO1Oe1CP9xZlGjzoU9aWUmA18W4FEAkGUDxt3ojPoTsTx/a0YRHUK1aVEjK4zm
jT6UPeqyy6+6YHnOa2ghEZtRU95kY/1jEzYrcx0s9xgEv5+DAm3ol/TvNGTg50piCo8whdZqyI8/
EdtAc2KZqybFm3xbkjJwUOyG9KnxNmeXtMEuuddzjFW4l48MXBk4M4t8oNCJoF4/r3s7VNBFw1dZ
TpaLGqPXdYpEYfzSVbtllXPNLB3lMzmCyu1qyxMmaPVuPQvgGPnnzTz0QJFzpNjM77SpgGW6G2nN
BVa6f3sO/kwA/NClaII6jUIHeulEYcehN1SetIZnn+qGb6HaO+B6g8NCpBrAaqdA/P+PoVYyYpMW
gITIbulqPBjQ8eDB84fed930B8ivjY70+vYKxoLzZmEz09LFA0K29LAOexltEEaWv1Lp8Sp7C0Oi
/44DeIRfkd+dq8v5lseE1zBjFheyV69FI0y1/EXRywey8+MhE22t2/UT1VDLejXN4U4PwpcLSx4M
opc=
=+Mz4
-----END PGP SIGNATURE-----

--------------ercpKQJRc5tFsggB1mrh7rDW--
