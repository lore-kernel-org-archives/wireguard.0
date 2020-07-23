Return-Path: <SRS0=ktKO=BC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AC6C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 12:29:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5D020792
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 12:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="tKdHOn9X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F5D020792
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49b6cdf4;
	Thu, 23 Jul 2020 12:05:56 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [2a00:ee2:209:164::f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1721a0e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jul 2020 12:05:53 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 404161002F86; Thu, 23 Jul 2020 14:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1595507318;
 bh=hJLBiITwNN+aQP0+xhXrTkMdldpqyyXM8Z/pVtDFp9U=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=tKdHOn9XHV6+sczXTptOlmoQWhIYobsTeIDCNExpABZpcB9tJDeNPhV5uN1qXlU50
 wfoU4s/Dby6NbspUSxOgtc90/xeiK38P+UK56bhPip6OEexIIJY6H5pv7QMFba6w4y
 iwisFtBUrJ+tlEiE9mF3yuYUmgSg6f8PRgSGVbyc=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 0A7F31002F86;
 Thu, 23 Jul 2020 14:28:36 +0200 (CEST)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Thu, 23 Jul 2020 14:29:02 +0200
From: Simon Rozman <simon@rozman.si>
To: Markus F <hybrid87@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: WINTUN: Error registering rings (Error 87, INVALID_ARGUMENT)
Thread-Topic: WINTUN: Error registering rings (Error 87, INVALID_ARGUMENT)
Thread-Index: AQHWWXFDDMXb+wZdKkiHc1vKfBP596kVI9qA
Date: Thu, 23 Jul 2020 12:29:02 +0000
Message-ID: <99D61A626FDA8A4B90A270669121BE10D0DE25F6@PLANJAVA.amebis.doma>
References: <CALvS7dHi_pOtLB6rvNuM8Lu9jQ73ijzihrXZ_WUptkbhNWUGkQ@mail.gmail.com>
In-Reply-To: <CALvS7dHi_pOtLB6rvNuM8Lu9jQ73ijzihrXZ_WUptkbhNWUGkQ@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:ee2:209:164::1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

SGksDQoNCj4gSSBhbSBjdXJyZW50bHkgdHJ5aW5nIHRvIGNyZWF0ZSBhIHRlc3R0b29sIHVzaW5n
IHRoZSBXSU5UVU4gZHJpdmVyIHRvDQo+IGVzdGFibGlzaCBhIDE6MSBjb25uZWN0aW9uIHRvIGFu
b3RoZXIgY2xpZW50IGFuZCBzZWUgd2hhdCB3aW50dW4gaXMNCj4gY2FwYWJsZSBvZi4gVW5mb3J0
dW5hdGVseSBJIGNhbm5vdCBnZXQgdGhlIHJpbmdzIHRvIHJlZ2lzdGVyLiBJIGhhdmUNCj4gd3Jp
dHRlbiBhIHNtYWxsIHRlc3Rwcm9ncmFtIGluIG9yZGVyIHRvIHJlcHJvZHVjZSB0aGlzLg0KPiAN
Cj4gICAgICNpbmNsdWRlIDx3aW5kb3dzLmg+DQo+ICAgICAjaW5jbHVkZSA8d2luaW9jdGwuaD4N
Cj4gICAgICNpbmNsdWRlIDxJUEhscEFwaS5oPg0KPiAgICAgI2luY2x1ZGUgPG5kaXNndWlkLmg+
DQo+ICAgICAjaW5jbHVkZSA8VGxIZWxwMzIuaD4NCj4gICAgICNpbmNsdWRlIDx0Y2hhci5oPg0K
PiAgICAgI2luY2x1ZGUgPHNlY3VyaXR5YmFzZWFwaS5oPg0KPiAgICAgI2luY2x1ZGUgPGNmZ21n
cjMyLmg+DQo+IA0KPiAgICAgI2luY2x1ZGUgPHN0ZGludC5oPg0KPiAgICAgI2luY2x1ZGUgPHN0
ZGlvLmg+DQo+ICAgICAjaW5jbHVkZSA8c3RyaW5nPg0KPiAgICAgI2luY2x1ZGUgPGFzc2VydC5o
Pg0KPiANCj4gICAgICNwcmFnbWEgcGFjayhwdXNoLCAxKQ0KDQpSZW1vdmUgdGhlICNwcmFnbWEg
cGFjayhwdXNoLCAxKSEhIQ0KDQo+ICAgICB0eXBlZGVmIHN0cnVjdCBfVFVOX1BBQ0tFVF9QUk9U
TyB7DQo+ICAgICAgICAgVUxPTkcgU2l6ZTsNCj4gICAgICAgICBVQ0hBUiBEYXRhW107IC8vIG1h
eCBwYWNrZXQgc2l6ZSBhcyBkZWZpbmVkIGJ5IHRoZSBkcml2ZXIuDQo+ICAgICB9IFRVTl9QQUNL
RVRfUFJPVE87DQo+IA0KPiAgICAgdHlwZWRlZiBzdHJ1Y3QgX1RVTl9SSU5HX1BST1RPIHsNCj4g
ICAgICAgICB2b2xhdGlsZSBVTE9ORyBIZWFkOw0KPiAgICAgICAgIHZvbGF0aWxlIFVMT05HIFRh
aWw7DQo+ICAgICAgICAgdm9sYXRpbGUgTE9ORyBBbGVydGFibGU7DQo+ICAgICAgICAgVUNIQVIg
RGF0YVtdOw0KPiAgICAgfSBUVU5fUklOR19QUk9UTzsNCg0KLg0KLg0KLg0KDQo+ICAgICB0eXBl
ZGVmIHN0cnVjdCBfVFVOX1JJTkcgew0KPiAgICAgICAgIHZvbGF0aWxlIFVMT05HIEhlYWQ7DQo+
ICAgICAgICAgdm9sYXRpbGUgVUxPTkcgVGFpbDsNCj4gICAgICAgICB2b2xhdGlsZSBMT05HIEFs
ZXJ0YWJsZTsNCj4gICAgICAgICBVQ0hBUiBEYXRhW1dJTlRVTl9SSU5HX0NBUEFDSVRZICsgKFRV
Tl9NQVhfUEFDS0VUX1NJWkUtDQo+IFRVTl9BTElHTk1FTlQpXTsNCj4gICAgIH0gVFVOX1JJTkc7
DQo+IA0KPiAgICAgdHlwZWRlZiBzdHJ1Y3QgX1RVTl9QQUNLRVQgew0KPiAgICAgICAgIFVMT05H
IFNpemU7DQo+ICAgICAgICAgVUNIQVIgRGF0YVtXSU5UVU5fTUFYX1BBQ0tFVF9TSVpFXTsgLy8g
bWF4IHBhY2tldCBzaXplIGFzDQo+IGRlZmluZWQgYnkgdGhlIGRyaXZlci4NCj4gICAgIH0gVFVO
X1BBQ0tFVDsNCj4gDQo+ICAgICB0eXBlZGVmIHN0cnVjdCBfVFVOX1JFR0lTVEVSX1JJTkdTIHsN
Cj4gICAgICAgICBzdHJ1Y3Qgew0KPiAgICAgICAgICAgICBVTE9ORyBSaW5nU2l6ZTsNCj4gICAg
ICAgICAgICAgVFVOX1JJTkcgKlJpbmc7DQo+ICAgICAgICAgICAgIEhBTkRMRSBUYWlsTW92ZWQ7
DQo+ICAgICAgICAgfSBTZW5kLCBSZWNlaXZlOw0KPiAgICAgfSBUVU5fUkVHSVNURVJfUklOR1M7
DQo+ICAgICAjcHJhZ21hIHBhY2socG9wKQ0KDQpSZW1vdmUgI3ByYWdtYSBwYWNrKHBvcCkNCiAN
Cj4gSSBjYW5ub3QgZmlndXJlIG91dCB3aGF0IEkgYW0gZG9pbmcgd3JvbmcuIENhbiBzb21lYm9k
eSBwb2ludCBvdXQgdGhlDQo+IGVycm9yIGZvciBtZT8gVGhhbmtzIQ0KDQpXaXRoIHRoZSAjcHJh
Z21hIHJlbW92ZWQsIHlvdXIgdGVzdCBwcm9ncmFtIGtpbmQgb2Ygd29ya3M6DQoNCk91dHB1dCB3
aXRoICNwcmFnbWEgcGFjazoNCk9wZW5lZCB3aW50dW4gZGV2aWNlLg0KQ291bGQgbm90IHJlZ2lz
dGVyIHJpbmcgYnVmZmVycyAoODcpLg0KRXhwZXJpbWVudCBmYWlsZWQuDQpTaXplIFRVTlJJTkc6
IDg0NTQxNTYgKDg0NTQxNTYpDQpDYXBhY2l0eTogODM4ODYwOA0KDQpPdXRwdXQgd2l0aG91dCAj
cHJhZ21hIHBhY2s6DQpPcGVuZWQgd2ludHVuIGRldmljZS4NClNpemUgVFVOUklORzogODQ1NDE1
NiAoODQ1NDE1NikNCkNhcGFjaXR5OiA4Mzg4NjA4DQoNCkFuZCBvbmUgbW9yZSB0aGluZy4uLiBN
YXJrdXMsIHBsZWFzZTogd2h5IGFsbCB0aGUgcHJvZmFuaXR5IGluIHlvdXIgY29kZT8gQ29kZSBp
cyBhIHdvcmsgb2YgYXJ0LiBBIHBvZXRyeS4gSSB1bmRlcnN0YW5kIE1pY3Jvc29mdCBpcyBzaWxs
eSBhIGxvdCBvZiB0aW1lcyBhbmQgZGlmZmljdWx0IHRvIGdvIGFsb25nIHdpdGguIEJ1dCBkb24n
dCBsZXQgdGhhdCB0dXJuICp5b3UqIGludG8gYSBzaWxseSBncnVtcHkgZ2Vlay4gOikNCg0KUmVn
YXJkcywNClNpbW9uDQoNCg==
