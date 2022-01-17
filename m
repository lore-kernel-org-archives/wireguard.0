Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671BAC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jan 2022 12:47:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id da5170be;
	Mon, 17 Jan 2022 12:47:12 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6d3bc409
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jan 2022 12:47:10 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 72E1618E8083; Mon, 17 Jan 2022 13:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1642423629;
 bh=zkwmL2ES1SDiSN+bv7lmV1EbA7RJN/nGe0Dsnn9XX5E=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=J90Vl2LUcJRcapEv6xF/SqFq46qBXv28IQPedoWCvxDup0hRnDCBt0olfNbayY8GF
 rvxZktkMbWcFRTdOouXNuTDm8RPGbzr7Cm45AVozXFNTP4bl14tRn88PJqJ+8sqOY7
 uNr7XzP/AzMeAk6pQPRrGvKoAz3aTLldjM2Iu1V0=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 9F59518E8784;
 Mon, 17 Jan 2022 13:47:07 +0100 (CET)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 17 Jan
 2022 13:47:07 +0100
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0986.015;
 Mon, 17 Jan 2022 13:47:07 +0100
From: Simon Rozman <simon@rozman.si>
To: tlhackque <tlhackque@yahoo.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Wireguard Windows Service Issues
Thread-Topic: Wireguard Windows Service Issues
Thread-Index: AQHYCx9E30DZMIZgXEWU7b9AocfeL6xnBrMQ///6UoCAACOowA==
Date: Mon, 17 Jan 2022 12:47:07 +0000
Message-ID: <022c115a7c254bec99bb67a12f9d59f4@rozman.si>
References: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
 <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
 <56d2209f-f655-6302-df6d-bce587c8368d@yahoo.com>
In-Reply-To: <56d2209f-f655-6302-df6d-bce587c8368d@yahoo.com>
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

SGksDQoNCj4gIEZyb20gdGhpcyBkZXNjcmlwdGlvbiwgaXQgc2VlbXMgdGhhdCB0aGVyZSdzIHJv
b20gZm9yIGltcHJvdmVtZW50Lg0KPiANCj4gSXQgZG9lc24ndCBzZWVtIHJlYXNvbmFibGUgZm9y
IHRoZSBXaXJlR3VhcmQgc2VydmljZSB0byBzdG9wLiBMb2cgYW5kDQo+IHBlcmhhcHMgZGlzcGxh
eSBhbiBlcnJvciwgc3VyZS7CoCBCdXQgc3RvcHBpbmcgc2VlbXMgaGFyc2gsIGFuZCB3b3VsZA0K
PiBwcmV2ZW50IG90aGVyIHR1bm5lbCBlbmRwb2ludHMgZnJvbSB3b3JraW5nIC0gbm90IGEgZ29v
ZCB1c2VyDQo+IGV4cGVyaWVuY2UuDQo+IA0KPiBJdCB3b3VsZCBzZWVtIGJldHRlciBmb3IgdGhl
IHNlcnZpY2UgdG8gc2V0IGEgdGltZXIgYW5kIHJldHJ5IGZhaWx1cmVzDQo+IHBlcmlvZGljYWxs
eSAtIG1hbnkgRE5TIGlzc3VlcyBhcmUgdHJhbnNpZW50Lg0KPiANCj4gSXQgYWxzbyBzZWVtcyB0
byBtZSB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciBmb3IgdGhlIGRlZmF1bHQgdG8gYmUgb3B0aW9u
DQo+IDMgLSBtYWtlIGFsbCB0dW5uZWxzIGRlcGVuZGVudCBvbiBETlNDYWNoZSB3aXRob3V0IHJl
cXVpcmluZyBhbnkNCj4gdXNlci9hZG1pbiBhY3Rpb24uwqAgT25lIGNvdWxkIGNvbmRpdGlvbiB0
aGlzIG9uIGFuIGVuZHBvaW50IGJlaW5nDQo+IHNwZWNpZmllZCBhcyBhIGhvc3RuYW1lLCBidXQg
dGhhdCBkb2Vzbid0IHNlZW0gd29ydGggdGhlIGVmZm9ydC7CoCBQcmV0dHkNCj4gbXVjaCBhbnkg
dXNlIG9mIGEgdHVubmVsIG5lZWRzIG5hbWUgcmVzb2x1dGlvbi7CoCBFdmVuIGlmIHlvdXIgcmVz
b2x2ZXJzDQo+IGFyZSBhdCB0aGUgb3RoZXIgZW5kIG9mIHRoZSB0dW5uZWwsIHN0YXJ0aW5nIHRo
ZSBjbGllbnQgYmVmb3JlIGl0J3MgdXANCj4gaXMgaGFybWxlc3MuDQo+IA0KPiBBbnlvbmUgY29u
Y2VybmVkIGFib3V0IEROUyBzbm9vcGluZyBvbiBuYW1lIHJlc29sdXRpb24gb2YgdGhlIGVuZHBv
aW50cw0KPiBjYW4gYXZvaWQgaXQgYnkgdXNpbmcgZWl0aGVyIG9mIHRoZSBvdGhlciB0d28gb3B0
aW9uczogaGFyZGNvZGVkIElQIGluDQo+IHRoZSBjb25maWd1cmF0aW9uLCBvciBhbiBlbnRyeSBp
biAiaG9zdHMiLg0KPiANCj4gIkl0IGp1c3Qgd29ya3MiIHNlZW1zIG11Y2ggbW9yZSBkZXNpcmFi
bGUgdGhhbiBteXN0ZXJ5IHNlcnZpY2Ugc3RvcHMuwqAgQQ0KPiBVSSBzdGF0dXMgIndhaXRpbmcg
Zm9yIGhvc3RuYW1lIHJlc29sdXRpb24iIHdvdWxkIGJlIGlkZWFsLg0KDQpUaGUgRE5TQ2FjaGUg
c2VydmljZSBpcyBvcHRpb25hbCBvbiBXaW5kb3dzIDcvOC84LjEvU2VydmVyIDIwMDhSMi8yMDEy
UjIgYW5kIG1heSBiZSBldmVuIGRpc2FibGVkLiAoQW5kIHRoZSByZXNvbHV0aW9uIHdvdWxkIHdv
cmsganVzdCBmaW5lLikgU2luY2UgU0NNIHRyZWF0cyBhbGwgc2VydmljZSBkZXBlbmRlbmNpZXMg
YXMgImhhcmQiIGRlcGVuZGVuY2llcywgdGhhdCB3b3VsZCByZW5kZXIgYWxsIFdpcmVHdWFyZCB0
dW5uZWwgc2VydmljZXMgZmFpbCB0byBzdGFydC4gSXQncyBhIGZhaXJseSByYXJlIHVzZSBjYXNl
LCBidXQgYSBkZW1vbnN0cmF0aW9uIFNDTSBzZXJ2aWNlIGRlcGVuZGVuY2llcyBtdXN0IGJlIGF1
dGhvcmVkIHdpdGggZXh0cmVtZSBjYXJlLg0KDQpJJ2QgcmF0aGVyIHN1Z2dlc3QgcHVyc3Vpbmcg
dGhlIG1hY09TIGFwcHJvYWNoIHdoZXJlIHNlcnZpY2VzIGRvbid0IGhhdmUgYW55IGRlcGVuZGVu
Y2llcyB0byBmb3JjZSBkZXZlbG9wZXJzIGVuZ2luZWVyIHRoZWlyIHNlcnZpY2VzIHRvIHNsZWVw
IGFuZCByZXRyeSB1bnRpbCB0aGVpciBkZXBlbmRlbmNpZXMgZ2V0IGF2YWlsYWJsZS4gQXMgeW91
IHN1Z2dlc3RlZCBmaXJzdC4gSG93ZXZlciwgV2lyZUd1YXJkIGZvciBXaW5kb3dzIGFscmVhZHkg
aGFzIEROUyByZXNvbHV0aW9uIHJldHJ5aW5nIGxvb3AuIE1heWJlIGl0IG5lZWRzIGltcHJvdmVt
ZW50PyBMZXQncyB3YWl0IHRvIHNlZSB3aGF0IE9QJ3MgbG9nIHNheXMuDQoNClJlZ2FyZHMsDQpT
aW1vbg0K
