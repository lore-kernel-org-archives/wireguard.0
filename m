Return-Path: <SRS0=ktKO=BC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD36C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 12:01:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 332F020768
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 12:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="VGLjSiC4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 332F020768
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6a71903;
	Thu, 23 Jul 2020 11:38:55 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a84dfeca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jul 2020 11:38:52 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id E83091002F86; Thu, 23 Jul 2020 14:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1595505696;
 bh=DwekuHwyfMuothnZxmvtz6w6mrw1Xg4uZzinQW38t+I=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=VGLjSiC4zd28qvLo3xtDzGardS8z8fdxogcM/LwKeYl+iE2OZXUgX0N7AmSR2dSqm
 STrDIC2iGEUX6O5iZaQKIoR/DzzXAs2Fp8estLYVPLs2ULMD3cDR1iA787k5zLBNRr
 3sfXDI9NdXKLlTwVgkF9Izq/yOPQpYjTIR4thKcg=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id A5D871002F86;
 Thu, 23 Jul 2020 14:01:34 +0200 (CEST)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0487.000; Thu, 23 Jul 2020 14:02:01 +0200
From: Simon Rozman <simon@rozman.si>
To: Andrew Burkett <burkett.andrew@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: DNS Issues with Wireguard for Windows
Thread-Topic: DNS Issues with Wireguard for Windows
Thread-Index: AQHWWXFFwYRo1nxb9EOEYwXJV+pzOakVHXwQ
Date: Thu, 23 Jul 2020 12:02:00 +0000
Message-ID: <99D61A626FDA8A4B90A270669121BE10D0DE259A@PLANJAVA.amebis.doma>
References: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
In-Reply-To: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
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

V2lyZUd1YXJkIGZvciBXaW5kb3dzIGFkZHMgYSBmaXJld2FsbCBydWxlcyB0byBibG9jayBhbGwg
RE5TIHRyYWZmaWMgZXhjZXB0IHRvIHRoZSBETlMgc2VydmVycyBsaXN0ZWQgaW4gdGhlIFdpcmVH
dWFyZCBjb25maWcuIFRoaXMgaXMgYnkgZGVzaWduIChwcmV2ZW50aW5nIGRhdGEgbGVha2FnZSku
DQoNClJlZ2FyZHMsDQpTaW1vbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFdpcmVHdWFyZCA8d2lyZWd1YXJkLWJvdW5jZXNAbGlzdHMuengyYzQuY29tPiBPbiBCZWhh
bGYgT2YgQW5kcmV3DQo+IEJ1cmtldHQNCj4gU2VudDogU2F0dXJkYXksIEp1bHkgMTEsIDIwMjAg
MTozMSBBTQ0KPiBUbzogd2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbQ0KPiBTdWJqZWN0OiBETlMg
SXNzdWVzIHdpdGggV2lyZWd1YXJkIGZvciBXaW5kb3dzDQo+IA0KPiBJIHdhcyBydW5uaW5nIGlu
dG8gZG5zIGlzc3VlcyB3aXRoIHdpcmVndWFyZCBvbiB3aW5kb3dzIHVzaW5nIHRoZQ0KPiByZWxl
YXNlZCBndWkgYXBwLiBJdCBzZWVtcyBsaWtlIGEgYnVnIHdpdGggd2lyZWd1YXJkLCBidXQgbm90
IHN1cmUgaWYgaXQNCj4gd2FzIGFjdHVhbGx5IHNvbWV0aGluZyBhYm91dCBteSBuZXR3b3JraW5n
IGNvbmZpZ3MgdGhhdCBtZXNzZWQgaXQgdXAuIEkNCj4gd2FzIGFibGUgdG8gd29yayBhcm91bmQg
dGhlIGlzc3VlIGJ5IGNoYW5naW5nIHRoZSB3aXJlZ3VhcmQgY29uZmlnIChpbiBhDQo+IHdheSB0
aGF0IHNlZW1lZCBvZGQgdG8gbWUpLCBidXQgSSB0aG91Z2h0IGl0IG1pZ2h0IGJlIHVzZWZ1bCB0
byBzaGFyZQ0KPiB3aGF0IEkgd2FzIHNlZWluZyBpbiBjYXNlIGl0cyBoZWxwZnVsIHRvIG90aGVy
cyBvciBpZiBpdCBpcyBpbiBmYWN0IGENCj4gYnVnIGluIHdpcmVndWFyZC4gSSdsbCBzaGFyZSB0
aGUgY29uZmlncyBhdCB0aGUgYm90dG9tIG9mIHRoZSBlbWFpbCwgYnV0DQo+IEknbSBqdXN0IGdv
aW5nIHRvIGRlc2NyaWJlIHdoYXQgSSdtIHNlZWluZyBmaXJzdC4NCj4gDQo+IE15IGJhc2ljIHNl
dHVwIGlzIEkgaGF2ZSB3aXJlZ3VhcmQgcnVubmluZyBvbiBhIGxpbnV4IGJveCBmdW5jdGlvbmlu
ZyBhcw0KPiBhIHNlcnZlci9yb3V0ZXIgdG8gYSByZW1vdGUgbmV0d29yay4gSSd2ZSBnb3QgYSB3
aW5kb3dzIGRlc2t0b3ANCj4gY29ubmVjdGluZyB0byB0aGUgbGludXggYm94IHZpYSB3aXJlZ3Vh
cmQuIFRoZXJlIGFyZSBkbnMgc2VydmVycyBvbiB0aGUNCj4gcmVtb3RlIG5ldHdvcmsgdGhhdCBJ
IHdvdWxkIGxpa2UgdG8gdXNlIGZyb20gdGhlIGRlc2t0b3AuIEkgYWRkZWQgdGhlDQo+IGRucyBz
ZXJ2ZXJzIGZyb20gdGhlIHJlbW90ZSBuZXR3b3JrIHRvIG15IGRlc2t0b3Agd2lyZWd1YXJkIGNv
bmZpZy4NCj4gRXZlcnl0aGluZyB3YXMgd29ya2luZyBmaW5lIGZvciBhd2hpbGUuIEF0IHNvbWUg
cG9pbnQsIG15IHdpbmRvd3MgYm94DQo+IHN0YXJ0ZWQgY29tcGxhaW5pbmcgYWJvdXQgbm90IGJl
aW5nIGNvbm5lY3RlZCB0byB0aGUgaW50ZXJuZXQuIEkgd2FzDQo+IGFibGUgdG8gcGlucG9pbnQg
aXQgd2l0aCBzb21lIGNvbmZpZGVuY2UgdG8gZG5zIHJlcXVlc3RzIGZhaWxpbmcgd2hlbg0KPiB3
aXJlZ3VhcmQgd2FzIGNvbm5lY3RlZC4gRXZlbiB0aG91Z2ggd2luZG93cyB3YXMgY29tcGxhaW5p
bmcgYWJvdXQgbm90DQo+IGhhdmluZyBhIG5ldHdvcmsgY29ubmVjdGlvbiwgbXkgYnJvd3NlciBz
dGlsbCB3b3JrZWQgdGhvdWdoIGl0IHNlZW1lZA0KPiBzbG93IHNvIEkgYXNzdW1lZCBpdCB3YXMg
dHJ5aW5nIGEgZG5zIHNlcnZlciBhbmQgdGhlbiBmYWxsaW5nIGJhY2sgdG8gYQ0KPiBkaWZmZXJl
bnQgb25lIGFmdGVyIGEgdGltZW91dCAoYXQgbGVhc3QgdGhhdCB3YXMgbXkgZ3Vlc3MpLiBUaGUg
ImNhdXNlIg0KPiBvZiB0aGUgcHJvYmxlbSB3YXMgYWRkaW5nDQo+IDE5Mi4xNjguNy4xMi8zMiB0
byB0aGUgQWxsb3dlZElQcyBvbiB0aGUgcGVlciAodGhlIHdpcmVndWFyZCBuZXR3b3JrIGluDQo+
IG15IGNhc2UgaXMgMTAuOTguMS4wLzI0IGFuZCB0aGUgcmVzdCBvZiB0aGUgbmV0d29yayBpcyB1
bmRlcg0KPiAxMC4wLlguWCkgQWZ0ZXIgYWRkaW5nIGl0IGFuZCB3YWl0aW5nIGZvciBhIGNvdXBs
ZSBob3VycyB3aW5kb3dzIHdpbGwNCj4gaW5ldml0YWJseSBjbGFpbSB0aGF0IHRoZXJlIGlzIG5v
IGludGVybmV0IGFjY2VzcyBmcm9tIG15IG5ldHdvcmsNCj4gYWRhcHRlci4gU29tZXRpbWVzIG5z
bG9va3VwIGFuZCBwaW5nIHN0aWxsIHdvcmsgZmluZSwgc29tZXRpbWVzIHRoZXkNCj4gc3RhcnQg
dG8gcmVwb3J0IGVycm9ycy4gTXkgc29sdXRpb24gdGhhdCByZWxpYWJseSBmaXhlcyBpdCBpcyB0
byBhZGQgbXkNCj4gbG9jYWwgZG5zIHNlcnZlciAod2hpY2ggaXMgbXkgbG9jYWwgcm91dGVyIGlu
IHRoaXMgY2FzZQ0KPiAxOTIuMTY4Ljg2LjEpIHRvIHRoZSBkbnMgc2VjdGlvbiBvZiB0aGUgd2ly
ZWd1YXJkIGNvbmZpZywgd2hpY2ggc2VlbXMNCj4gbGlrZSBhbiBvZGQgZml4IHNpbmNlIEknbSBu
b3QgYWN0dWFsbHkgc2VuZGluZyBsb2NhbCBkbnMgdHJhZmZpYyB0bw0KPiB3aXJlZ3VhcmQuDQo+
IA0KPiBJIGNvdWxkbid0IGZpZ3VyZSBvdXQgaG93IHRvIHVzZSB3aXJlc2hhcmsgdG8gdmlldyB3
aXJlZ3VhcmQgdHJhZmZpYyBvbg0KPiB3aW5kb3dzIHRvIHNlZSB3aGF0J3MgaGFwcGVuaW5nIHRv
IHRoZSBkbnMgcmVxdWVzdHMsIG5vciBkbyBJIGtub3cgb2YNCj4gYW5vdGhlciB3YXkgdG8gdmll
dyB0cmFmZmljIChJZiBzb21lb25lIHdhbnRzIHRvIHBvaW50IG1lIGF0IGhvdyB0byBkbw0KPiB0
aGF0LCBvciBzb21lIG90aGVyIHdheSB0byB2aWV3IG5ldHdvcmsgdHJhZmZpYyBvbiB3aW5kb3dz
LCBJJ20gaGFwcHkgdG8NCj4gbG9vayBhdCBpdCkuDQo+IA0KPiBBbnl3YXksIHRoYW5rcyBmb3Ig
dGhlIHNvZnR3YXJlLiBJdCdzIHRoZSBiZXN0IHZwbiBzb2Z0d2FyZSBJJ3ZlIHVzZWQgYnkNCj4g
YSBtaWxlLg0KPiANCj4gQW5kcmV3DQo+IA0KPiBNeSBMb2NhbCBHYXRld2F5L0ROUyBpcyAxOTIu
MTY4Ljg2LjENCj4gTXkgTG9jYWwgSVAgaXMgaW4gMTkyLjE2OC44Ni4wLzI0IHN1Ym5ldA0KPiAN
Cj4gV29ya2luZyBDb25maWcgMQ0KPiANCj4gW0ludGVyZmFjZV0NCj4gUHJpdmF0ZUtleSA9IFhY
WFhYDQo+IEFkZHJlc3MgPSAxMC45OC4xLjEwMy8zMg0KPiBETlMgPSAxMC4wLlguWCwgMTAuMC5Z
LlkNCj4gDQo+IFtQZWVyXQ0KPiBQdWJsaWNLZXkgPSBYWFhYWFgNCj4gQWxsb3dlZElQcyA9IDEw
LjAuMC4wLzE2LCAxMC45OC4xLjAvMjQNCj4gRW5kcG9pbnQgPSBYWFhYWFhYDQo+IA0KPiBXb3Jr
aW5nIENvbmZpZyAyDQo+IA0KPiBbSW50ZXJmYWNlXQ0KPiBQcml2YXRlS2V5ID0gWFhYWFgNCj4g
QWRkcmVzcyA9IDEwLjk4LjEuMTAzLzMyDQo+IEROUyA9IDEwLjAuWC5YLCAxMC4wLlkuWSAsIDE5
Mi4xNjguODYuMQ0KPiANCj4gW1BlZXJdDQo+IFB1YmxpY0tleSA9IFhYWFhYWA0KPiBBbGxvd2Vk
SVBzID0gMTAuMC4wLjAvMTYsIDEwLjk4LjEuMC8yNCwgMTk4LjE2OC43LjEyLzMyIEVuZHBvaW50
ID0NCj4gWFhYWFhYWA0KPiANCj4gTm9uV29ya2luZyBDb25maWcNCj4gDQo+IFtJbnRlcmZhY2Vd
DQo+IFByaXZhdGVLZXkgPSBYWFhYWA0KPiBBZGRyZXNzID0gMTAuOTguMS4xMDMvMzINCj4gRE5T
ID0gMTAuMC5YLlgsIDEwLjAuWS5ZDQo+IA0KPiBbUGVlcl0NCj4gUHVibGljS2V5ID0gWFhYWFhY
DQo+IEFsbG93ZWRJUHMgPSAxMC4wLjAuMC8xNiwgMTAuOTguMS4wLzI0LCAxOTguMTY4LjcuMTIv
MzIgRW5kcG9pbnQgPQ0KPiBYWFhYWFhYDQo=
