Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E1FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jan 2022 10:52:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 588c710c;
	Mon, 17 Jan 2022 10:51:09 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cb86778a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jan 2022 10:51:07 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 1D04D18E8082; Mon, 17 Jan 2022 11:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1642416667;
 bh=1DALzfGuJP+vMRZoq89iPTOdD7rbNr1Wx5GQIR7et10=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=Vj/JDPlbcnpDl0oJtvCFT5CtbQnVeoXACT+iMgWc9Rlsihy/+mvXPZFMl4UTMCEsF
 uz0xt3a9aAoAyYcJ/0if08vG0YOx7b8idLdvCoVHO/qjqB+TQxFCN/BkiRxG2QSj/o
 5IckY/GCkj6fa/6ekqxAX+B1VWx3axt/joFxIMSw=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 8BEBE18E8784;
 Mon, 17 Jan 2022 11:51:01 +0100 (CET)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 17 Jan
 2022 11:51:01 +0100
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0986.015;
 Mon, 17 Jan 2022 11:51:01 +0100
From: Simon Rozman <simon@rozman.si>
To: Tony Pros <tony@tpro.tech>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Wireguard Windows Service Issues
Thread-Topic: Wireguard Windows Service Issues
Thread-Index: AQHYCx9E30DZMIZgXEWU7b9AocfeL6xnBrMQ
Date: Mon, 17 Jan 2022 10:51:01 +0000
Message-ID: <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
References: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
In-Reply-To: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
Accept-Language: en-SI, en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:dd44:d95e:4473:b64c]
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

SGksDQoNCj4gSSBiZWxpZXZlIHRoZXJlJ3MgYSBidWcgaW4gdGhlIFdpbmRvd3Mgc2VydmljZSBp
bXBsZW1lbnRhdGlvbiwgaWYgdGhpcw0KPiBpc3N1ZSBpcyBieSBkZXNpZ24sIGl0J3MgcHJvYmxl
bWF0aWMuDQo+IA0KPiBJIGhhdmUgbm9uLWFkbWluIHVzZXJzIHdlcmUgd2hlbiBJIGluaXRpYWxs
eSBzZXQgdGhlbSB1cCB3aXRoIHdpcmVndWFyZCwNCj4gSSBjb25maWd1cmVkIGl0IHRvIHVzZSB0
aGUgc2VydmljZSwgdXNpbmcgdGhlIGNvbW1hbmQ6DQo+IA0KPiB3aXJlZ3VhcmQgL2luc3RhbGx0
dW5uZWxzZXJ2aWNlICJDOlxQcm9ncmFtDQo+IEZpbGVzXFdpcmVHdWFyZFxEYXRhXENvbmZpZ3Vy
YXRpb25zXHZwbi5kb21haW4ub3JnLmNvbmYuZHBhcGkiDQo+IA0KPiBUaGUgdHVubmVsIHdvcmtl
ZCBmaW5lIHRoZSBmaXJzdCB0aW1lLiBUaGVuIHRoZSB1c2VyIHJlYm9vdHMgdGhlIGxhcHRvcCwN
Cj4gb3IgY2xvc2VzIGl0IG9yIGxlYXZlcyB3aGF0ZXZlciBjb2ZmZWUgc2hvcCB0aGV5IHdlcmUg
YXQgYW5kIGdldA0KPiBkaXNjb25uZWN0ZWQgZnJvbSB0aGUgd2lyZWxlc3MgbmV0d29yayB0aGV5
IHdlcmUgdXNpbmcuIFdoZW4gdGhpcw0KPiBoYXBwZW5zLCBmb3Igc29tZSByZWFzb24sIHRoZSB3
aXJlZ3VhcmQgc2VydmljZSB0aGVuIGdldHMgdG9ybiBkb3duDQo+IG5ldmVyIHRvIGNvbWUgYmFj
ayBhZ2FpbiB1bnRpbCBJIGlzc3VlIHRoZSBjb21tYW5kIGZyb20gbXkgYWRtaW4gYWNjb3VudA0K
PiBhZ2Fpbi4NCg0KQ2FuIHlvdSBkbyB0aGUgd2lyZWd1YXJkIC9kdW1wbG9nID4gd2lyZWd1YXJk
LmxvZyBhbmQgaW52ZXN0aWdhdGUuDQoNCj4gVGhlcmUgd2FzIGFuIGlzc3VlIHdpdGggc29tZSB1
c2VycyBpbml0aWFsIGNvbmZpZ3VyYXRpb24gaW4gdGhhdCB0aGV5DQo+IGNvdWxkIG5vdCBxdWVy
eSBob3N0bmFtZSB2aWEgRE5TLCBzbyB0aGF0IGVudGVyaW5nIHRoZSBjb21tYW5kIHRvDQo+IGlu
c3RhbGxzZXJ2aWNlIHdvdWxkIG5vdCBldmVuIGNyZWF0ZSB0aGUgc2VydmljZS4NCg0KV2lyZUd1
YXJkIHNlcnZpY2VzIHN0YXJ0IGVhcmx5IG9uIGJvb3QgLSBzb21ldGltZXMgZXZlbiBiZWZvcmUg
dGhlIEROU0NhY2hlIChETlMgQ2xpZW50KS4gSWYgdGhlIHNlcnZpY2UgY2FuJ3QgcmVzb2x2ZSBo
b3N0bmFtZXMgdXNlZCBpbiB0aGUgY29uZmlnIGZpbGUsIGl0IHdpbGwgc3RvcC4gQnV0IGl0IHdp
bGwgbG9nIHRoaXMuIFJlc29sdXRpb24gdG8gdGhpcyBwcm9ibGVtIGlzOg0KLSBVc2UgSVBzIHJh
dGhlciB0aGFuIGhvc3RuYW1lcy4NCi0gQWRkIGhvc3RuYW1lcyB5b3UgdXNlIGluIHlvdXIgLmNv
bmYgZmlsZSB0byBDOlxXaW5kb3dzXHN5c3RlbTMyXGRyaXZlcnNcZXRjXGhvc3RzLg0KLSBBZGQg
RE5TQ2FjaGUgZGVwZW5kZW5jeSB0byB0aGUgV2lyZUd1YXJkVHVubmVsJDx5b3VyIHR1bm5lbCBu
YW1lPiBzZXJ2aWNlLg0KDQpJIHBlcnNvbmFsbHkgd291bGQgcGljayBvbmUgb2YgdGhlIGZpcnN0
IHR3byBvcHRpb25zIGFib3ZlLiBEb24ndCBsaWtlIHRoZSBpZGVhIG15IGxhcHRvcCBpcyBhc2tp
bmcgYSBjb2ZmZWUgc2hvcCdzIEROUyB3aGF0IGlzIG15IFZQTiBlbmRwb2ludCBJUCBhZGRyZXNz
Lg0KDQo+IEhlcmUncyBhIGZldyBub3RlcyB0aGF0IG1pZ2h0IGhlbHAgd2l0aCB1bmRlcnN0YW5k
aW5nLg0KPiAtIFVzZXJzIG11c3QgaGF2ZSB0aGUgVlBOIGVzdGFibGlzaGVkIGJlZm9yZSB0aGV5
IGxvZyBpbnRvIHRoZSBhY3RpdmUNCj4gZGlyZWN0b3J5IHNlcnZlcnMgb24gdGhlIHJlbW90ZSBu
ZXR3b3JrIHNvIHRoYXQgdGhleSBjYW4gZ2V0IGFsbCBvZg0KPiB0aGVpciBHUE8gZGlyZWN0aXZl
cy4NCj4gLSBXaXJlZ3VhcmQgU2VydmljZSBzaG91bGQgc3RheSB1cCBzbyB0aGF0IGFueSB0aW1l
IGEgdXNlcnMgY29ubmVjdHMgdG8NCj4gYW55IG5ldHdvcmssIHRoZSBWUE4gaXMgZXN0YWJsaXNo
ZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhhdC4NCj4gLSBUaGUgV2lyZWd1YXJkIHNlcnZpY2Ugc2hv
dWxkIGFsc28gc3RheSBiZWNhdXNlIG5vbi1hZG1pbiB1c2VycyBjYW5ub3QNCj4gY3JlYXRlIGEg
bmV3IHNlcnZpY2UNCg0KSSB1bmRlcnN0YW5kLiBUaGF0IGlzIGV4YWN0bHkgaG93IHdlIHVzZSBX
aXJlR3VhcmQgaW4gb3VyIGNvbXBhbnkuDQoNCj4gSWYgdGhpcyBpc3N1ZSBpcyBob3cgdGhpbmdz
IHdpbGwgc3RheSwgYW5kIHRoaXMgaXMgbm90IGNvbnNpZGVyZWQgYSBidWcsDQo+IGhvdyB3b3Vs
ZCB5b3UgY29uZmlndXJlIHdpbmRvd3Mgbm9uLWFkbWluIHVzZXJzIHRvIHR1bm5lbCB0byBhbg0K
PiBlbnRlcnByaXNlIG5ldHdvcmsgYmVmb3JlIGxvZ2luIHZpYSBXaXJlR3VhcmQgYW5kIHRvIGNv
bnRpbnVvdXNseSB0cnkgdG8NCj4gZXN0YWJsaXNoIHRoZSB0dW5uZWwgd2hpbGUgdGhlIHVzZXIg
aXMgbm90IGNvbm5lY3RlZCB0byBhIG5ldHdvcms/DQoNCkxldCBtZSBhc3N1cmUgeW91LCB0aGUg
YmVoYXZpb3IgeW91IGFyZSBleHBlY3RpbmcgaXMgZGVmaW5pdGVseSBwYXRob2xvZ2ljYWwuIFBs
ZWFzZSBpbnZlc3RpZ2F0ZSB0aGUgbG9nIGZpbGUgd2h5IHRoZSB0dW5uZWwgc2VydmljZSBkb2Vz
IG5vdCBwZXJzaXN0IGFzIGl0IHNob3VsZC4NCg0KQmVzdCByZWdhcmRzLA0KU2ltb24NCg==
