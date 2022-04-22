Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EAAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 16:16:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8303756e;
	Fri, 22 Apr 2022 16:16:12 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 98b4d3f4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 16:16:11 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 0D86D18E87DC; Fri, 22 Apr 2022 18:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1650644171;
 bh=5ROwhd3IM3yDlRAAbCNtgtHy4+sH3GoAggXMJB/LAck=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=EYCQxygw6mpj7Id+CNdW8TrDkVJrrSqabwN8fBDNK6nR+6geajrF/YBLlW09xk4MW
 JDUnTnMHsJ10yMAomoaYaLYM7I6eAIWvHmp6AZ7C6X9DDso3dr2E6CoIpPJ0Sq0Fmu
 9H2bq3mw2Dm/vAL7L3A4SKZU7PQeVXkYEA2hHeOU=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 7A93F18E8784;
 Fri, 22 Apr 2022 18:16:05 +0200 (CEST)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 18:16:05 +0200
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0986.022;
 Fri, 22 Apr 2022 18:16:05 +0200
From: Simon Rozman <simon@rozman.si>
To: "lenaghanm@comcast.net" <lenaghanm@comcast.net>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: Wireguard Windows Client questions
Thread-Topic: Wireguard Windows Client questions
Thread-Index: AQC4vxNFHYpMIJzyNmOonMo2i40GLq8cBsgwgB9AF8A=
Date: Fri, 22 Apr 2022 16:16:05 +0000
Message-ID: <edcc7e971a0a4233a9009e9f477d7ef5@rozman.si>
References: <004a01d846c2$896fe0c0$9c4fa240$@comcast.net>
In-Reply-To: <004a01d846c2$896fe0c0$9c4fa240$@comcast.net>
Accept-Language: en-SI, en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:9556:65b5:a12a:25e7]
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

PiAxLiBUaGUgZG9jdW1lbnRhdGlvbiBpbXBsaWVzIHRoYXQgaWYgSSBleGVjdXRlZCB0aGUgZm9s
bG93aW5nIGNvbW1hbmQNCj4gZnJvbSBhIGNvbW1hbmQgbGluZSAid2lyZWd1YXJkLmV4ZSIgdGhh
dCBpdCB3aWxsIHN0YXJ0IHRoZSBNYW5hZ2VyDQo+IFNlcnZpY2UgYW5kIHNob3cgdGhlIFVJLiBJ
dCB0aGVuIHN0YXRlcyB0aGF0IGNhbGxpbmcgd2lyZWd1YXJkLmV4ZQ0KPiAvaW5zdGFsbG1hbmFn
ZXJzZXJ2aWNlIGlzIHN1aXRhYmxlIGZvciBzaWxlbnQgaW5zdGFsbGF0aW9uIGJ1dCB3aGF0IEkN
Cj4gZmluZCBpcyB0aGF0IHRoZSBNYW5hZ2VtZW50IEdVSSBpcyBzdGlsbCBhY3RpdmF0ZWQgYW5k
IHNob3duIG9uIHRoZQ0KPiBkZXNrdG9wLg0KPiBJcyB0aGVyZSBhbnl3YXkgdG8gc3RhcnQgdGhl
IHNlcnZpY2Ugd2l0aG91dCB0aGUgR1VJIHdpbmRvdyBhcHBlYXJpbmc/DQo+IEFuZCBpcyB0aGVy
ZSBhbnl3YXkgdG8gcHJldmVudCB0aGUgVUkgaW4gdGhlIHN5c3RlbSB0cmF5IGZyb20gYmVpbmcN
Cj4gaW5zdGFsbGVkPw0KDQpUcnkgd2lyZWd1YXJkLmV4ZSAvaW5zdGFsbHR1bm5lbHNlcnZpY2Ug
bXl0dW5uZWwuY29uZiBhbmQgd2lyZWd1YXJkLmV4ZSAvdW5pbnN0YWxsdHVubmVsc2VydmljZSBt
eXR1bm5lbC5jb25mLg0KDQo+IDIuIElmIGZvciBhbnkgcmVhc29uIHRoZSBXaXJlZ3VhcmQgcGVl
ciBpcyBub3QgcmVhY2hhYmxlIHRoZW4gdGhlDQo+IEhhbmRzaGFrZSBkb2VzIG5vdCBjb21wbGV0
ZS4gV2hlbiB1c2luZyB0aGUgR1VJIHRoZSB0dW5uZWwgaXMgc2hvd3MNCj4gQWN0aXZlIGJ1dCBp
dCBpcyB0aGUgdHVubmVsc2VydmljZSB0aGF0IGlzIGFjdGl2ZSBub3QgdGhlIGNvbm5lY3Rpb24u
IElzDQo+IHRoZXJlIGEgd2F5IHRvIGxpbWl0IHRoZSBudW1iZXIgb2YgaGFuZHNoYWtlIHJldHJp
ZXMgYmVmb3JlIGdpdmluZyB1cCBvbg0KPiB0cnlpbmcgdG8gY29ubmVjdD8NCg0KV2lyZUd1YXJk
IGlzIGNvbm5lY3Rpb24tbGVzcy4gT25seSBhZnRlciB0aGVyZSBpcyBhIHBhY2tldCBmb3IgYSBw
ZWVyLCBpdCdsbCBwZXJmb3JtIGhhbmRzaGFrZSB3aXRoIHRoZSBwZWVyIGFuZCBzZW50IHRoZSBw
YWNrZXQgdG8gaXQuIFNlZSBpdCBhcyBvbi1kZW1hbmQgY29ubmVjdGlvbi4gTm93LCBpZiB5b3Ug
aW5zaXN0IG9uIHZlcmlmeWluZyBpZiB0aGUgY29ubmVjdGlvbiBpcyBwb3NzaWJsZSBvdmVyIHRo
ZSBWUE4gdHVubmVsLCBzZW5kIGEgcGluZyB0aHJ1IHRoZSB0dW5uZWwgYW5kIHNlZSBpZiB0aGUg
aGFuZHNoYWtlIG9jY3VycyBhbmQgc3VjY2VlZHMuDQoNCj4gMy4gRnJvbSB0aW1lIHRvIHRpbWUg
dGhlIGVuZHBvaW50IGFkZHJlc3Mgb2YgdGhlIHBlZXIgc3lzdGVtIG1heSBoYXZlDQo+IGNoYW5n
ZWQgKEkgZG8gbm90IHVzZSBhIGR5bmFtaWMgRE5TIHNlcnZpY2UpIHNvIHdoZW4gdHJ5aW5nIHRv
IGNvbm5lY3QgSQ0KPiBoaXQgdGhlIHByb2JsZW0gZGVzY3JpYmVkIGluIDIgYWJvdmUuIEkga25v
dyB3aGF0IHRoZSBuZXcgZW5kcG9pbnQNCj4gYWRkcmVzcyBpcyBhbmQgY2FuIHNldCBpdCBkeW5h
bWljYWxseSB1c2luZyB0aGUgd2cgc2V0IGNvbW1hbmQgYW5kIHRoZQ0KPiBjb25uZWN0aW9uIGlz
IHRoZW4gbWFkZS4gSSB3b3VsZCBsaWtlIHRvIGJlIGFibGUgdG8gcHJvZ3JhbW1hdGljYWxseQ0K
PiBzYXZlIHRoaXMgY2hhbmdlIHdpdGhvdXQgaGF2aW5nIHRvIG1hbnVhbGx5IGVkaXQgdGhlIGNs
aWVudCBjb25maWcNCj4gZmlsZXMuIEkgdHJpZWQgdXNpbmcgd2cgc3luY2NvbmYgYnV0IGdldCBh
IHBlcm1pc3Npb25zIGVycm9yIGJlY2F1c2Ugb2YNCj4gdGhlIHByb3BlcnRpZXMgYXJvdW5kIHRo
ZSBkcGFwaSBjb25maWcgZmlsZXMuDQo+IElzIHRoZXJlIGFuIGFsdGVybmF0aXZlIHdheSB0byBk
b2luZyB0aGlzIHNob3J0IG9mIGRlbGV0aW5nIHRoZSBleGlzdGluZw0KPiBkcGFwaSBmaWxlIGFu
ZCBhZGRpbmcgYSBuZXcgLmNvbmYgZmlsZSBhbmQgaGF2ZSB0aGUgbWFuYWdlciBzZXJ2aWNlDQo+
IGVuY3J5cHQgaXQgYnV0IHRoYXQgYXBwcm9hY2ggbWVhbnMgSSBuZWVkIHRvIGtlZXAgdGhlIHBy
aXZhdGUga2V5IGluIHRoZQ0KPiBjbGVhciBzb21ld2hlcmUgaW4gb3JkZXIgdG8gY3JlYXRlIHRo
ZSBuZXcgY29uZiBmaWxlLlwNCg0KSmFzb24gc3VnZ2VzdGVkIG1lIHRvIGFkZCBhIFNjaGVkdWxl
ZCBUYXNrIHRvIGNhbGwgd2cuZXhlIHNldCBteXR1bm5lbCBwZWVyIHB1YmtleSBlbmRwb2ludCAx
LjIuMy40OjExMTExIG9uIGEgZmV3IG1pbnV0ZSBiYXNpcy4gSXQgd29ya3MgbGlrZSBhIGNoYXJt
IHdoZW4gcm9hbWluZyBiYWNrIGFuZCBmb3J0aCBiZXR3ZWVuIGxvY2FsIGFuZCByZW1vdGUgbmV0
d29ya3MuDQoNCkl0J3Mgd2F5IG1vcmUgZWZmaWNpZW50IHRoYW4gZGVhY3RpdmF0aW5nIHRoZSB0
dW5uZWwsIHVwZGF0aW5nIGNvbmZpZyBhbmQgcmVhY3RpdmF0aW5nIHRoZSB0dW5uZWwuDQoNCj4g
NC4gVGhlcmUgYXJlIDIgb3B0aW9uIGxpc3RlZCB1bmRlciB3aXJlZ3VhcmQgY29tbWFuZCBsaW5l
IG9wdGlvbnMgbmFtZWx5DQo+IC9tYW5hZ2Vyc2VydmljZSBhbmQgL3R1bm5lbHNlcnZpY2UgQ09O
RklHX1BBVEggLSBjYW4gc29tZW9uZSB0ZWxsIG1lDQo+IHdoYXQgdGhleSBhcmUgc3VwcG9zZWQg
dG8gZG8gZXZlcnkgdGltZSBJIHRyeSBydW5uaW5nIG9uZSBvZiB0aGVtIEkgZ2V0DQo+IGFuIGVy
cm9yIHBvcHVwIHRoYXQgc2F5cyAtIFRoZSBzZXJ2aWNlIHByb2Nlc3MgY291bGQgbm90IGNvbm5l
Y3QgdG8gdGhlDQo+IHNlcnZpY2UgY29udHJvbGxlci53aXJlZ3VhcmQNCg0KVGhvc2Ugb3B0aW9u
cyBhcmUgdG8gYmUgdXNlZCBieSBXaW5kb3dzIFNDTSB3aGVuIHdpcmVndWFyZC5leGUgcnVucyBh
cyBhIHNlcnZpY2UuDQoNCklmIHlvdSBhcmUgZmFtaWxpYXIgd2l0aCBwcm9ncmFtbWluZywgeW91
IG1pZ2h0IHdhbnQgdG8gdGFrZSBhIGxvb2sgaW50byB0aGUgZW1iZWRkYWJsZS1kbGwtc2Vydmlj
ZSBmb2xkZXIgaW4gdGhlIHdpcmVndWFyZC13aW5kb3dzIHJlcG8uDQoNClJlZ2FyZHMsDQpTaW1v
bg0KDQo=
