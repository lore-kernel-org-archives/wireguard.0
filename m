Return-Path: <SRS0=FBn0=B4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23484C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2478C20706
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="Ws+a7Ta+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2478C20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 717c0a13;
	Tue, 18 Aug 2020 11:10:55 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9928f7fb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Aug 2020 09:34:48 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 4DFD81002FA9; Fri, 14 Aug 2020 12:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1597399223;
 bh=/H9MOttLCUk1Tcxk1+Dlhvd4kcbqNr2vcCoiBM0peuo=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=Ws+a7Ta+tTL25dJHlj5BCCQoyi3qpHOJbjItOWv/mS9wHJNMjY25rH0a6S4yPf2RB
 MXKr4a5vfFsVpyDJU4jsYPn4Ry3v+v/r9s8OGyAFmmy01mmKes7sEMyUP9nVLprtTZ
 /YuZkqvX6vxvxOaVAjgBMc/XmKK7750Yb6g3+ogU=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 2FB801002FA3;
 Fri, 14 Aug 2020 12:00:20 +0200 (CEST)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Fri, 14 Aug 2020 12:00:57 +0200
From: Simon Rozman <simon@rozman.si>
To: Ferad Zyulkyarov <feradz@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: WireGuard on Windows: Unable to create Wintun interface: Error
 registering rings: Error listing NDIS interfaces: no interfaces found
Thread-Topic: WireGuard on Windows: Unable to create Wintun interface: Error
 registering rings: Error listing NDIS interfaces: no interfaces found
Thread-Index: AQHWcNeRI/PRPkjkjEOsMtMNkbOvqqk3X0Xg
Date: Fri, 14 Aug 2020 10:00:56 +0000
Message-ID: <99D61A626FDA8A4B90A270669121BE10D0DF5C6F@PLANJAVA.amebis.doma>
References: <CAARAvpL1PDSm5T_5pE5qUP9b+bMeUi9Td57op9t+OoSLvo9L2A@mail.gmail.com>
In-Reply-To: <CAARAvpL1PDSm5T_5pE5qUP9b+bMeUi9Td57op9t+OoSLvo9L2A@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:ee2:209:164::1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Aug 2020 13:10:55 +0200
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

SGksDQoNCj4gSSBoYXZlIGluc3RhbGxlZCBXaXJlR3VhcmQgb24gV2luZG93cyBzZXJ2ZXIgMjAx
Ny4gV2hlbiBJIG1hbnVhbGx5DQo+IGFjdGl2YXRlIHRoZSB0dW5uZWwgdGhyb3VnaCB0aGUgY2xp
ZW50IGFwcGxpY2F0aW9uIChtYW5hZ2VyKSBhbGwgd29ya3MNCj4gZmluZS4gQWZ0ZXIgSSByZXN0
YXJ0IHRoZSBjb21wdXRlciwgV2lyZUd1YXJkIGZhaWxzIHRvIHN0YXJ0DQo+IGF1dG9tYXRpY2Fs
bHkuIFRoZSBsb2cgY29udGFpbnMgdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4gDQo+IFt0dW5dIFt3
ZzBdIFVuYWJsZSB0byBjcmVhdGUgV2ludHVuIGludGVyZmFjZTogRXJyb3IgcmVnaXN0ZXJpbmcN
Cj4gcmluZ3M6IEVycm9yIGxpc3RpbmcgTkRJUyBpbnRlcmZhY2VzOiBubyBpbnRlcmZhY2VzIGZv
dW5kDQo+IA0KPiBJIGNhbiBleHBsaWNpdGx5L21hbnVhbGx5IGFjdGl2YXRlIHRoZSB0dW5uZWwg
dGhyb3VnaCB0aGUgY2xpZW50DQo+IGFwcGxpY2F0aW9uIGJ1dCBJIG5lZWQgdGhlIHR1bm5lbCB0
byBzdGFydCBhdXRvbWF0aWNhbGx5IGlmIHRoZSBtYWNoaW5lDQo+IHJlc3RhcnRzLg0KPiANCj4g
SSBoYXZlIGl0IGluc3RhbGxlZCBpbiBvdGhlciBXaW5kb3dzIFNlcnZlciAyMDE3IG1hY2hpbmVz
IGFuZCBvbiB0aG9zZQ0KPiBtYWNoaW5lcyBXaXJlR3VhcmQgc3RhcnRzIGF1dG9tYXRpY2FsbHkg
d2hlbiB0aGUgc3lzdGVtIGJvb3RzLg0KPiANCj4gSSB3b3VsZCBhcHByZWNpYXRlIHlvdXIgaGVs
cCBpbiBhZGRyZXNzaW5nIHRoZSBwcm9ibGVtIG9mIFdpcmVHdWFyZCBhdXRvDQo+IHN0YXJ0IHdo
ZW4gdGhlIG1hY2hpbmUgYm9vdHMuDQoNCkxvb2tzIGxpa2UgdGhlIFdpcmVHdWFyZCB0dW5uZWwg
c2VydmljZSBpcyBzdGFydGVkIHRvbyBlYXJseSBvbiB0aGlzIHBhcnRpY3VsYXIgY29tcHV0ZXIg
LSBldmVuIGJlZm9yZSBXaW5kb3dzIG5ldHdvcmtpbmcgKE5ESVMpLg0KDQpXZSBuZWVkIHRvIGlu
dmVzdGlnYXRlLCB3aGljaCBhZGRpdGlvbmFsIHNlcnZpY2Ugb3IgcmVzb3VyY2Ugd2UgbmVlZCB0
byBtYWtlIHRoZSBXaXJlZ3VhcmQgdHVubmVsIHNlcnZpY2VzIGRlcGVuZCBvbi4NCg0KSSB3b3Vs
ZCBzdWdnZXN0IHlvdSB0byBjaGFuZ2UgdGhlIFdpcmVHdWFyZCBNYW5hZ2VyIGFuZCBUdW5uZWwg
c2VydmljZXMgc3RhcnR1cCB0byBBdXRvbWF0aWMgKERlbGF5ZWQpLCBidXQgSSBhbSBhZnJhaWQg
dGhlIFdpcmVHdWFyZCBNYW5hZ2VyIHNlcnZpY2UgZGVsZXRlcyB0aGUgdHVubmVsIHNlcnZpY2Vz
IG9uIGVhY2ggc2h1dGRvd24gYW5kIHJlY3JlYXRlcyB0aGVtIG9uIHN0YXJ0dXAuDQoNCkZ1cnRo
ZXJtb3JlLCBkZWxheWVkLXN0YXJ0ZWQgc2VydmljZXMgY29tZSB1cCB3YXkgYWZ0ZXIgdGhlIEdy
b3VwIFBvbGljeSBDbGllbnQgc2VydmljZS4gSWYgeW91IHVzZSBXaXJlR3VhcmQgdG8gcmVtb3Rl
bHkgY29ubmVjdCB0aGlzIGNvbXB1dGVyIHRvIHlvdXIgQWN0aXZlIERpcmVjdG9yeSwgdGhlIGJv
b3QtdGltZSBHcm91cCBQb2xpY2llcyB3b24ndCBhcHBseS4NCg0KU28sIGFueXdheSB5b3Ugc2xp
Y2UgaXQuLi4gd2UgbmVlZCB0byBmaXggdGhpcyBpbiBXaXJlR3VhcmQgc2VydmljZSBkZXBlbmRl
bmNpZXMgKG9yIGFkZCBhIHJldHJ5IGxvb3Agb24gYm9vdCBhcyBhIGxhc3QgcmVzb3J0KS4gU3Rh
eSB0dW5lZC4NCg0KUmVnYXJkcywNClNpbW9uDQoNCg==
