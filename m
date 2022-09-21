Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC63ECAAD8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Sep 2022 08:30:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2dd2179f;
	Wed, 21 Sep 2022 08:29:22 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ef401b82
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 08:29:20 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id AF56D18E8787; Wed, 21 Sep 2022 10:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1663748959;
 bh=qRCbveV2126G+LI4rELUHIScU72Y/UL0TxOVWI6NghA=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=B4YqyGeff04b0q4C9seut1Jg1fr4LxTft6PBEN60Pwm58Vtkx0KFsbUOUhPPyjCQa
 Ucp6RhVtpFe1qEGqev3NfSjG31TCDeVMmlnO7KF/9KYgoR0n4tokBNPttMjAUCMINe
 KYMBZdAmUDAAv0njbCaV29IfpJK+bglQjYVYfMUA=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id C5C1918E8787;
 Wed, 21 Sep 2022 10:29:17 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 21 Sep
 2022 10:29:17 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.1118.012;
 Wed, 21 Sep 2022 10:29:17 +0200
From: Simon Rozman <simon@rozman.si>
To: Christoph Loesch <wireguard-mail@chil.at>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: RE: WireGuard App on Android allows only one connection simultaneously
Thread-Topic: WireGuard App on Android allows only one connection
 simultaneously
Thread-Index: AQHYzMnopaH5loPzP0qHTUoHvS7J8q3pji4Q
Date: Wed, 21 Sep 2022 08:29:17 +0000
Message-ID: <30014af580cd42edba0121c0d6b99add@rozman.si>
References: <62cc526e-7b02-3529-d575-87434af15bd3@chil.at>
In-Reply-To: <62cc526e-7b02-3529-d575-87434af15bd3@chil.at>
Accept-Language: en-SI, en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:2dd7:2feb:7daa:559c]
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

SGksDQoNCj4gb24gTGludXggbXVsdGlwbGUgY29ubmVjdGlvbnMgYXQgdGhlIHNhbWUgdGltZSBh
cmUgcG9zc2libGUsIG9uIFdpbmRvd3MNCj4gYWxzby4gSSBkb24ndCBoYXZlIGEgTWFjIHNvIEkg
Y2FuJ3QgdGVzdCB0aGVyZS4NCj4gDQo+IFdoZW4gaGF2aW5nIHR3byB0dW5uZWxzIGNvbmZpZ3Vy
ZWQgaW4gdGhlIEFuZHJvaWQgQXBwLCB3aGlsZSBvbmUgaXMNCj4gY29ubmVjdGVkIGlmIEkgY29u
bmVjdCB0byB0aGUgc2Vjb25kIG9uZSwgdGhlIGZpcnN0IG9uZSBkaXNjb25uZWN0cy4NCj4gDQo+
IElzIHRoZXJlIGFueSByZWFzb24gYXMgd2h5IHRoZSBBbmRyb2lkIEFwcCBvbmx5IGFsbG93cyBv
bmUgY29ubmVjdGlvbiBhdA0KPiB0aGUgc2FtZSB0aW1lPw0KDQpVbmZvcnR1bmF0ZWx5LCB0aGlz
IGlzIGEgbGltaXRhdGlvbiBvZiBBbmRyb2lkIE9TIHN1cHBvcnRpbmcgb25seSAxIChvbmUpIFZQ
TiBjb25uZWN0aW9uIGF0IGEgdGltZS4NCg0KUmVnYXJkcywNClNpbW9uDQo=
