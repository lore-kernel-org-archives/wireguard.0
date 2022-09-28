Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C57BC04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 17:26:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f21f2e33;
	Wed, 28 Sep 2022 17:23:36 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a0ec2956
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 17:23:35 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id A5B0918E8782; Wed, 28 Sep 2022 19:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1664385814;
 bh=uxEDlaZ2nkLKNHqFQLHZkBYVfxEVa1JA3LqV25BtRNE=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=kut0YiIwecMnF5iFpq1jR6FWQRrvbnf2m8UZtb4QOkNsFRuyzE0zm84BLW6lrNeCu
 oB/f0RH7l6/RerusDHhuBvuXOe1BhIIddelZ9ceuzbhRu2zwV9+D0TMH77tmcJxiPl
 j68W6TaUJW5Oj6yLZjgP1DpOc4pbeQ/CiCdansmE=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id CAF2418E8780;
 Wed, 28 Sep 2022 19:23:32 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 28 Sep
 2022 19:23:32 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.1118.012;
 Wed, 28 Sep 2022 19:23:32 +0200
From: Simon Rozman <simon@rozman.si>
To: Jan Petrischkeit <jan.petrischkeit@hochschule-stralsund.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: wireguard-windows: Wireguard does not start a previously
 activated tunnel from time to time
Thread-Topic: wireguard-windows: Wireguard does not start a previously
 activated tunnel from time to time
Thread-Index: AQHY0yZ6MD7GeT8XIEyWnRHRjrlx8q31FJ8Q
Date: Wed, 28 Sep 2022 17:23:32 +0000
Message-ID: <03b8866a0f8249c8883d9a0244ddea1b@rozman.si>
References: <4e093a02-723d-22ff-fd33-f220ac24e19e@hochschule-stralsund.de>
In-Reply-To: <4e093a02-723d-22ff-fd33-f220ac24e19e@hochschule-stralsund.de>
Accept-Language: en-SI, en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:140a::f]
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

SGksDQoNCj4gRXZlbnQgNzAyMywgU2VydmljZUNvbnRyb2xNYW5hZ2VyOiBUaGUgc2VydmljZSAi
V2lyZUd1YXJkVHVubmVsJEhPU1QtDQo+IFdHMiIgd2FzIHRlcm1pbmF0ZWQgd2l0aCB0aGUgZm9s
bG93aW5nIGVycm9yOiBUaGUgcmVxdWVzdGVkIG5hbWUgaXMgdmFsaWQsDQo+IGJ1dCBubyBkYXRh
IG9mIHRoZSByZXF1ZXN0ZWQgdHlwZSB3YXMgZm91bmQuDQoNClRoZSBlcnJvciBtZXNzYWdlIHlv
dSBhcmUgbWVudGlvbmluZyBpcyBXU0FOT19EQVRBIDExMDA0IHdoaWNoIGlzIHJlbGF0ZWQgdG8g
RE5TIHJlc29sdXRpb24gcHJvYmxlbXMuIFdoaWNoIGlzIGtpbmQgb2YgZXhwZWN0ZWQgZWFybHkg
aW4gdGhlIGJvb3QgcHJvY2VzcyB3aGVuIHRoZSBEbnNjYWNoZSBzZXJ2aWNlIGlzIHN0YXJ0aW5n
IGFuZC9vciBEaGNwIHNlcnZpY2UgbWlnaHQgbm90IHlldCBjb25maWd1cmVkIHRoZSBETlMuDQoN
CkkgcHJlc3VtZSBjaGFuZ2luZyB0aGUgRW5kcG9pbnQ9IGxpbmVzIG9mIHBlZXJzIHRvIGNvbnRh
aW4gSVBzIHJhdGhlciB0aGFuIGhvc3RuYW1lcyBjb3VsZCBzb2x2ZSB5b3VyIHByb2JsZW0uDQoN
ClNlZSBpZiBpdCBoZWxwcy4NCg0KSWYgeW91IGNhbiBjb25maXJtIGl0LCBtYXliZSB3ZSBjYW4g
YWRkIHNvbWUgcmV0cnkgb24gV1NBTk9fREFUQSBpbiB0aGUgd2lyZWd1YXJkLXdpbmRvd3MuIChQ
ZXJzb25hbGx5LCBJIHdvdWxkIGF2b2lkIGFkZGluZyBoYXJkIGRlcGVuZGVuY3kgb24gRG5zY2Fj
aGUgYW5kIERoY3Agc2VydmljZXMuIEFzIHRoZXJlIGFyZSBzaXR1YXRpb25zIHdoZXJlIHRoZXkg
Y2FuIGJlIGRpc2FibGVkLCBwcmV2ZW50aW5nIHRoZSBXaXJlR3VhcmQgdHVubmVsIHNlcnZpY2Ug
c3RhcnR1cCB0aGVuLikgDQoNClJlZ2FyZHMsDQpTaW1vbg0K
