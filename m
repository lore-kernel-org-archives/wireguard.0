Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D28C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 11:38:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A268C6103D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 11:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A268C6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18b67fef;
	Mon, 12 Apr 2021 11:38:37 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84cd3f64
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 11:38:35 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 3965F18E8793; Mon, 12 Apr 2021 13:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1618227515;
 bh=8Xyj1bYzE/3jC21Qn4Rv6MDLiDeyI6/w+Uga7KKyJOE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=G3T50v4ORQjzftYQo8WSlnWV5+2Mhbi4OAY2SVhUu3AMGwDDud8r8qNvRDW+fb4re
 gfcuXKoOlql0ZoM4JRBFJpbX3x3rELv/jWjrsGaebaE4T3UzDc0XK3O7cjY7m4NHKF
 BxUeTNFOIqfeAQMWepsHd+Z1TPcJqmTIFu9ex5VY=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 7A9E218E8786;
 Mon, 12 Apr 2021 13:38:30 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Mon, 12 Apr 2021
 13:38:30 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0792.010;
 Mon, 12 Apr 2021 13:38:30 +0200
From: Simon Rozman <simon@rozman.si>
To: Daniel Lenski <dlenski@gmail.com>, David Woodhouse <dwmw2@infradead.org>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Allowing space for packet headers in Wintun Tx/Rx
Thread-Topic: Allowing space for packet headers in Wintun Tx/Rx
Thread-Index: AQHXK6U1nzJARpm0fUegHsStd/bwDaqqs4hggAArpSmAAubqsP//7pcAgABCGoCAAs99AA==
Date: Mon, 12 Apr 2021 11:38:30 +0000
Message-ID: <9940aef2c1064fc785b51ac860020a18@rozman.si>
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
 <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
 <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
 <a1bee48639cb40299118c53d4fa8fe7a@rozman.si>
 <fb3e80d74068cd8464c44f1cb435b71d1170c659.camel@infradead.org>
 <CAOw_LSGV8V9aLg-UdN4SE5s5o7NFfeyH+Q+mWMrvrBYp06aT=w@mail.gmail.com>
In-Reply-To: <CAOw_LSGV8V9aLg-UdN4SE5s5o7NFfeyH+Q+mWMrvrBYp06aT=w@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:3cda:1f64:ee90:a7bc]
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

SGksDQoNCj4gPiBMb29rcyBnb29kIHRvIG1lOyB0aGFua3MuIEp1c3QgbmVlZCB0byB3b3JrIG91
dCBob3cgdG8gY3Jvc3MtYnVpbGQgaXQNCj4gPiAoSSBjYW4gbXVzdGVyIHVwIGEgV2luZG93cyBW
TSBmb3IgdGVzdGluZywgYnV0ICpidWlsZGluZyogb24gaXQgaXMNCj4gPiBiZXlvbmQgbXkgdG9s
ZXJhbmNlIG9mIFdpbmRvd3MgZm9yIG5vdykuDQo+IA0KPiArMSB0byBhbGwgdGhhdC4NCg0KRG9u
J3Qgd29ycnkuIE9uY2UgSmFzb24gaXMgYmFjaywgcmV2aWV3cyBhbmQgKGhvcGVmdWxseSkgYXBw
cm92ZXMgdGhlIGNoYW5nZXMsIHdlIHNoYWxsIHByZXBhcmUgYW4gb2ZmaWNpYWwgcmVsZWFzZSBm
b3IgeW91Lg0KDQo+ID4gV2UnbGwgYWxzbyBuZWVkIHRvIGJlIGFibGUgdG8gV2ludHVuQWxsb2Nh
dGVTZW5kUGFja2V0KCkgb2YgdGhlIGZ1bGwNCj4gPiBwb3NzaWJsZSBNVFUsIHRoZW4gcmVjZWl2
ZSBhbmQgZGVjcnlwdCBpbnRvIHRoYXQsIGFuZCBzZW5kIG9ubHkgdGhlDQo+ID4gYWN0dWFsIHNp
emUgb2YgdGhlIHBhY2tldCB3ZSByZWNlaXZlZC4NCg0KSG93IGFib3V0IHRoaXM6IGh0dHBzOi8v
Z2l0Lnp4MmM0LmNvbS93aW50dW4vY29tbWl0Lz9pZD0wM2I2Y2Q0MTBjODk2M2QxODg4OTY2ZWRm
MzFmZGMzNWE0YzhiNTIzDQoNClNob3VsZCBiZSBiYWNrd2FyZCBjb21wYXRpYmxlLiBUZXN0ZWQg
d2l0aCB0aGUgZXhpc3Rpbmcgc3RhYmxlIHdpcmVndWFyZC13aW5kb3dzIHJlbGVhc2UgMC4zLjEw
Lg0KDQo+IFRoZXJlIGFyZSB0d28gY2FzZXMgd29ydGggY29uc2lkZXJpbmcgd2hlcmUgdGhlIHBh
Y2tldCBzaXplIGNvdWxkDQo+IGFjdHVhbGx5ICpleHBhbmQqOg0KPiANCj4gMSkgU29tZSBWUE4g
cHJvdG9jb2xzIHN1cHBvcnQgY29tcHJlc3Npb24gb2YgdGhlIHR1bm5lbGVkIHBhY2tldHMuIEl0
DQo+IHdvdWxkIGJlIGJhZCBiZWhhdmlvciB0byB1c2UgdGhpcyB0byBzdHVmZiBhIHBhY2tldCBv
ZiA+KGFkdmVydGlzZWQNCj4gTVRVKSBieXRlcyBpbiA8KGFkdmVydGlzZWQgTVRVKSBieXRlcywg
YnV0IGl0IHdvdWxkbid0IHN1cnByaXNlIG1lIGlmIGl0DQo+IGV4aXN0cyBpbiB0aGUgd2lsZC4g
V2Ugbm93IGRlYWwgd2l0aCByZWNlaXB0IG9mIGxhcmdlci10aGFuLWV4cGVjdGVkLU1UVQ0KPiBw
YWNrZXRzIGluIE9wZW5Db25uZWN0IGluIGEgcmVsYXRpdmVseSB1bmlmb3JtIHdheTogYWxsb2Nh
dGUgTUFYKG10dSwNCj4gMTYzODQpIGJ5dGVzIGZvciBwYWNrZXRzIGNvbWluZyBmcm9tIHRoZSBW
UE4gKGlmIHVzaW5nIFRMUyB0cmFuc3BvcnQpIG9yDQo+IE1BWChtdHUsIDIwNDgpIGlmIHVzaW5n
IERUTFMuDQo+IDIpIFNvbWUgVlBOIHByb3RvY29scyBjb25jYXRlbmF0ZSBtdWx0aXBsZSBwYWNr
ZXRzIGludG8gYSBzaW5nbGUNCj4gYWdncmVnYXRlIG9uIHRoZSB3aXJlLiBPbiBMaW51eCB3ZSBj
YW4gZGVjcnlwdCwgdHJ1bmNhdGUsIGFuZCBzZW5kIHRvDQo+IHRoZSB0dW5uZWwgaW50ZXJmYWNl
IHdpdGhvdXQgZnVydGhlciBjb3B5aW5nLg0KPiANCj4gQ2FzZSAoMSkgY2FuIGJlIGhhbmRsZWQg
d2l0aCBvdmVyYWxsb2NhdGUtYW5kLXNocmluay4gQ2FzZSAoMikgaXMgcHJldHR5DQo+IHJhcmUg
YW1vbmcgdGhlIHByb3RvY29scyB0aGF0IE9wZW5Db25uZWN0IHN1cHBvcnRzLCBzbyBmYWxsYmFj
ayB0bw0KPiBtZW1jcHkgc2VlbXMgZmluZS4NCg0KUGhldyEgVGhhbmtzLiA6KQ0KDQpSZWdhcmRz
LA0KU2ltb24NCg==
