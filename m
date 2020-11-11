Return-Path: <SRS0=sOGU=ER=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4933BC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 13:24:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7EFA206CA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 13:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="QfElM84v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7EFA206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 605196a6;
	Wed, 11 Nov 2020 13:20:10 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3bc31f9b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Nov 2020 13:20:09 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id A81AB18E87AD; Wed, 11 Nov 2020 14:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1605101036;
 bh=tfFxpr71+vJy5ncHGURzSWuJO9deGzOiluaZG3Fr+yU=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=QfElM84vpHQgD1bEJj4PYsVIbeYWCc5JZMHmr0B3jsGm0lFpqLBvmpwSns9RWAa5M
 TlpbVeg9Yoxw4lUsMILKzxYrRweVhQiDo9n4fANISzCoslmHAEaHatlGNbBQ/7ckf8
 9jQ4gQbKQZ6DtLl9TjP77F3dc7VJU/0ASRnD9pS8=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id BC62718E87AB;
 Wed, 11 Nov 2020 14:23:54 +0100 (CET)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4; Wed, 11 Nov 2020
 14:23:54 +0100
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0659.007;
 Wed, 11 Nov 2020 14:23:54 +0100
From: Simon Rozman <simon@rozman.si>
To: Stefan Puch <s.puch@web.de>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Actual plans for Windows client: PostUp/PreDown possible?
Thread-Topic: Actual plans for Windows client: PostUp/PreDown possible?
Thread-Index: AQHWt2KYv/neyyhZRUi8YHTPROFywanCbPIAgAAzvoCAAEU9AA==
Date: Wed, 11 Nov 2020 13:23:54 +0000
Message-ID: <224c7eee418740ccb94cc6839aadbbfe@rozman.si>
References: <b2a38e9f-9e79-b821-b80c-4cff284f8f6b@web.de>
 <B14F0F93-B5E5-4224-A49B-F53E7A4B105B@rozman.si>
 <b75d1ae6-9c37-99ec-1ef2-1166df108be6@web.de>
In-Reply-To: <b75d1ae6-9c37-99ec-1ef2-1166df108be6@web.de>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:260:4101:1464:9c56:1af4:2f3d:2469]
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

SGksDQoNClN0ZWZhbiwgeW91ciBmZWVkYmFjayBpcyBncmVhdGx5IGFwcHJlY2lhdGVkLg0KDQo+
IFdoaWxlIEkgbGlrZSB5b3VyIHN1Z2dlc3RlZCAiYWx3YXlzLW9uIiBzb2x1dGlvbiBmb3IgZml4
ZWQgZGVza3RvcCBQQ3MgSQ0KPiBkb24ndCBsaWtlIHRoZSAid29yay1hcm91bmQiIGZvciBjbGll
bnQgbGFwdG9wcy4gQSBUYXNrIFNjaGVkdWxlciB3aGljaA0KPiBpcyB0cnlpbmcgZXZlcnkgMyBt
aW51dGUgdG8gc2V0IGEgd2lyZWd1cmFkIHR1bm5lbCB3aGVuIHlvdSBhcmUgc2l0dGluZw0KPiBp
biBhIHRyYWluIHVzaW5nIGEgbW9iaWxlIGNvbm5lY3RpbmcgaXMgbm90aGluZyBJJ2QgbGlrZSB0
byBzZWUuDQoNClRoZSAid2cgc2V0IHBlZXIgZW5kcG9pbnQiIGlzIHZlcnkgbGlnaHR3ZWlnaHQg
YW5kIG1ha2VzIG5vIG5ldHdvcmsgcmVxdWVzdHMuIE5vciBpdCBidXJucyBDUFUvYmF0dGVyeS4g
SXQgbWVyZWx5IHJlc2V0cyBhbiBJUCBhZGRyZXNzICg0IGJ5dGVzIGZvciBJUHY0LCAxNiBmb3Ig
SVB2NikgaW5zaWRlIHRoZSBXaXJlR3VhcmQgdHVubmVsIHBlZXIgbGlzdC4gV291bGQgaGF2ZSBi
ZWVuIGV2ZW4gbmljZXIgaWYgVGFzayBTY2hlZHVsZXIgY291bGQgaGF2ZSBhIHRyaWdnZXIgIm5l
dHdvcmsgY29ubmVjdGlvbiBjaGFuZ2VkIi4gDQoNCj4gSSB0aGluaw0KPiB0aGVyZSBhcmUgYWxz
byBvdGhlciBzY2VuYXJpb3Mgd2hlcmUgeW91IGp1c3Qgd2FudCB0byAiY2xpY2sgQ29ubmVjdA0K
PiBidXR0b24iIG9uIGRlbWFuZC4gRS5nLiB3aGVuIHlvdXIgY29tcGFueSBoYXMgbXVsdGlwbGUg
bG9jYXRpb25zIGFuZCB5b3UNCj4gZG9uJ3Qgd2FudCAob3IgY2Fubm90KSB1c2UgbXVsdGlwbGUg
VlBOIGNvbm5lY3Rpb25zIGEgdGhlIHNhbWUgdGltZSB5b3UNCj4gd2lsbCBhbHdheXMgaGF2ZSB0
aGUgInNvbWV3aGF0IGJyb2tlbiINCj4gbmV0d29yayBkcml2ZXMgaW4gdGhlIHdpbmRvd3MgZXhw
bG9yZXIgdG9vLCBzaW5jZSB0aGV5IHdlcmVuJ3QNCj4gZGlzY29ubmVjdGVkIHdpdGhpbiBhIFBy
ZURvd24gc2NyaXB0Lg0KDQpFYWNoIFdpcmVHdWFyZCB0dW5uZWwgc3VwcG9ydHMgbXVsdGlwbGUg
cGVlcnMgKGkuZS4gbXVsdGlwbGUgY29tcGFueSBlbmRwb2ludHMpLiAxMC4wLjAuMC8xNiBpcyBv
ZmZpY2UgQSwgMTAuMS4wLjAvMTYgaXMgb2ZmaWNlIEIsIGV0Yy4gSnVzdCBsaXN0IHRoZW0gYWxs
IGluIHlvdXIgdHVubmVsIGNvbmZpZyBhbmQgeW91ciBsYXB0b3Agc2hvdWxkIHJlYWNoIGFsbCB0
aG9zZSBuZXR3b3Jrcy4NCg0KTWF5YmUgInR1bm5lbCIgaXMgbm90IHRoZSBiZXN0IHdvcmQgdG8g
ZGVzY3JpYmUgaXQuIEltYWdpbmUgaXQgYXMgYSAibmV0d29yayIsIG9yIGEgIm1lc2giLg0KDQo+
IEFub3RoZXIgcHJvYmxlbSAod2hpY2ggSSBza2lwcGVkIHNvIGZhcikgaXMgcmVsYXRlZCBpbiBw
b2ludCA0LiBvZiB5b3VyDQo+IHN1Z2dlc3Rpb24gYW5kIGFzIEkgc2VlIHRoaXMgYSBhbHNvIGRp
c2N1c3NlZCB3aXRoaW4gYW5vdGhlciB0aHJlYWQgaGVyZQ0KPiBvbiB0aGUgbWFpbGluZ2xpc3Qu
IFdoaWxlIGEgc2ltcGxlIG5ldHdvcmsgZHJpdmUgY2FuIG9mIGNhdXNlIGJlIHNldHAgdG8NCj4g
YSBmaXhlZCBJUCBhZHJlc3MgdG8gZHJpdmUgejogdXNpbmcgZml4ZWQgYWRyZXNzZSBpcyBJTUhP
IG5vdCBhIGdvb2QNCj4gc29sdXRpb24uDQo+IExpa2UgWXZlcyBHb2VyZ2VuIHBvaW50ZWQgb3V0
IGluIHRoZSB0aHJlYWQgIkFkZCBsb2NhbCBETlMgZm9yd2FyZGVyIHRvDQo+IFdpbmRvd3MgY2xp
ZW50IiBJJ2QgbGlrZSBhbiBvcHRpb24gdG8gYWRkIHRoZSByZW1vdGUgRE5TIHNlcnZlciB0byB0
aGUNCj4gc2VyYWNoIGxpc3Qgc28gdGhhdCB0aGF0IEkgZG9uJ3QgaGF2ZSB0byBrZWVwIElQIGFk
cmVzc2VzIGluIG1pbmQuIEJ1dCBJDQo+IHRoaW5rIHRoaXMgZGlzY3Vzc2lvbiBzaG91bGQgYmUg
c2hpZnRlZCB0byB0aGUgb3RoZXIgdGhyZWFkLg0KDQpZb3UgbWF5LiBCdXQgb25jZSB5b3UgZG8g
YWRkIEROUyBsaW5lIHRvIHlvdXIgdHVubmVsIGNvbmZpZywgeW91ciBjbGllbnQgd2lsbCBleGNs
dXNpdmVseSB1c2UgdGhhdCBETlMuIEFsbCBsb2NhbCBhbmQgb3RoZXJzIGFyZSBibG9ja2VkLiBJ
ZiB5b3VyIGNvbXBhbnkgRE5TIHNlcnZlciBkb2VzIHRoZSBmb3J3YXJkaW5nIHRvbywgdGhpcyBz
aG91bGRuJ3QgYmUgYSBwcm9ibGVtLiBUaGUgZG93biBzaWRlIGlzLCB5b3UgY2Fubm90IGFjY2Vz
cyBsb2NhbCBMQU4gcmVzb3VyY2VzIGJ5IG5hbWUuIEJ1dCB0aGF0IGlzIGRpc2N1c3NlZCBpbiBh
bm90aGVyIHRocmVhZCwgaW5kZWVkLg0KDQpSZWdhcmRzLA0KU2ltb24NCg0K
