Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212DEC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 11:05:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdb7eb9c;
	Wed, 21 May 2025 07:25:55 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [2a01:260:4101:1464::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 32dc1831
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 07:25:54 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id EDFC618E87C8; Wed, 21 May 2025 09:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1747812353;
 bh=Ucsec2gd8lzyDsCx2mlZC1kDGj0pIEL52vZNDSmo7hs=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=Q0IFaCz/o2aLrgyLjt7IDBeXPW42FOFbp7TRpDC4lAnHyLzw8WL3LDziC/U1ot5F6
 RR5C67i8raVVuG5CAxs4kYabKfTzk3BE0ySb49cTU8BK/nyquicERqHSX3tx3xoKzR
 7mAXlzjTPxTLrnPDCi3EnKrCQs6rtjZUkjluJ9FY=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id C417718E87B4;
 Wed, 21 May 2025 09:25:51 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 May
 2025 09:25:51 +0200
Received: from Konj.amebis.doma ([fe80::19ea:b29a:a02a:629b]) by
 Konj.amebis.doma ([fe80::19ea:b29a:a02a:629b%9]) with mapi id 15.02.1118.040; 
 Wed, 21 May 2025 09:25:51 +0200
From: Simon Rozman <simon@rozman.si>
To: Anthony Paul <anthonypaul@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Crash on Windows ARM64 when Import and potential fix
Thread-Topic: Crash on Windows ARM64 when Import and potential fix
Thread-Index: AQHbyfX5AzIQ+AWITU6PiIji6LpDtbPcrkHA
Date: Wed, 21 May 2025 07:25:51 +0000
Message-ID: <d19c02a02c61469499c5f8183ce0f079@rozman.si>
References: <CAA+FdXqkOP3rxOOdVY6Q28g7eDsmqkwg38PzZ+rKbdG8DZs0KA@mail.gmail.com>
In-Reply-To: <CAA+FdXqkOP3rxOOdVY6Q28g7eDsmqkwg38PzZ+rKbdG8DZs0KA@mail.gmail.com>
Accept-Language: en-SI, en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4068:1001::d]
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

SGksDQoNCj4gVGhlcmUgYXJlIG51bWVyb3VzIHJlcG9ydHMgdGhhdCB0aGUgaW1wb3J0IGZ1bmN0
aW9uIGNhdXNlcyBhIGNyYXNoIG9uDQo+IFdpbmRvd3MgQXJtNjQuICAoSSBiZWxpZXZlIGl0IGlz
IGFjdHVhbGx5IHRoZSBmaWxlIHNlbGVjdG9yIHRoYXQgY2F1c2VzDQo+IHRoZSBjcmFzaCkNCj4g
DQo+IGh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9XaXJlR3VhcmQvY29tbWVudHMva3dxbmI1L3dp
cmVndWFyZF9jbGllbnRfY3Jhcw0KPiBoZXNfd2hlbl90cnlpbmdfdG9fYWRkLw0KPiANCg0KVGhh
bmtzIGZvciByZWFjaGluZyBvdXQuDQoNCldlIGFscmVhZHkgaGF2ZSBhIHBhdGNoIGZvciB0aGlz
IGluIHRoZSB3aXJlZ3VhcmQtd2luZG93cyByZXBvOg0KaHR0cHM6Ly9naXQuengyYzQuY29tL3dp
cmVndWFyZC13aW5kb3dzL2NvbW1pdC8/aWQ9OGU2NTU4ZWJhNjY2NWI1MWRlMzU3NzliZmZhNDY4
MDNkYmM0YzEwZA0KDQpJdCBpcyBwZW5kaW5nIHJldmlldyBhbmQgb2ZmaWNpYWwgcmVsZWFzZS4N
Cg0KQmVzdCByZWdhcmRzLA0KU2ltb24NCg==
