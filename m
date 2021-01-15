Return-Path: <SRS0=6TfW=GY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18946C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:40:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3810823877
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3810823877
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sec.uni-passau.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8298fc93;
	Thu, 21 Jan 2021 13:40:44 +0000 (UTC)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ad38587
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 19:54:23 +0000 (UTC)
Received: from puremessage.rz.uni-passau.de (puremessage.rz.uni-passau.de
 [132.231.51.54])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 6BF0E124A71C3;
 Fri, 15 Jan 2021 20:54:23 +0100 (CET)
Received: from puremessage.rz.uni-passau.de (localhost.localdomain [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id 5396D10709C_01F2EFB;
 Fri, 15 Jan 2021 19:54:23 +0000 (GMT)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by puremessage.rz.uni-passau.de (Sophos Email Appliance) with ESMTPS id
 36FA6104794_01F2EFF; Fri, 15 Jan 2021 19:54:23 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 30F21124A71C2;
 Fri, 15 Jan 2021 20:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-passau.de;
 s=up-2020-11-19; t=1610740463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/wiFEeSQrhysfguHpVv+CfRnHt001ca4723yD8fKAY=;
 b=kMB4561EZAgfmPLw4y4fa4fBFNXv5zy7gppieq/f3pmVPUGJ9jwMo5kU+7QlU6ynAJAMgV
 LmTr83gvmfjn32nUTDvSoo6kH324SplDeH8L55E8DpshAYIpCqjGWha7aAPLQmO2gj+ANI
 BOgY/cVbEwztulTNlxO6aMqus/qo9KI=
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.15.1)
 (envelope-from <jp@sec.uni-passau.de>)
 id 6001f2ed-0ace-84e733040019-84e70b0db448-3
 for <multiple-recipients>; Fri, 15 Jan 2021 20:54:23 +0100
Received: from smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) by
 smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 15 Jan 2021 20:49:42 +0100
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.010; Fri, 15 Jan 2021 20:49:42 +0100
From: "Posegga, Joachim" <jp@sec.uni-passau.de>
To: Riccardo Paolo Bestetti <pbl@bestov.io>, Maarten de Vries
 <maarten@de-vri.es>, "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: Multiple Clients behind NAT
Thread-Topic: Multiple Clients behind NAT
Thread-Index: Adbp5qcbzZNoNe2aTgWHRjfnTxvB3gAqQCqAACxuzQAAAhphgAAK8e4w
Date: Fri, 15 Jan 2021 19:49:42 +0000
Message-ID: <992cc9f1fb1b4f06ad27bc0a0005033d@smith.sec.uni-passau.de>
References: <275695ad-bc63-01a6-18d0-6e9f410ec352@de-vri.es>
 <C8JU1RTQOKUE.3NQU5QRW2L5VI@enhorning>
In-Reply-To: <C8JU1RTQOKUE.3NQU5QRW2L5VI@enhorning>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [132.231.11.30]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-purgate-ID: 151291::1610740463-00000ACE-CAA05560/0/0
X-purgate-type: clean
X-purgate-size: 1980
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-Mailman-Approved-At: Thu, 21 Jan 2021 00:19:16 +0000
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

VGhhbmtzIGZvciBhbGwgd2hvIHJlc3BvbmRlZC4gVGhlIHNldHVwIGlzIGhhcmQgdG8gZGVidWcs
IHNpbmNlIHRoZSBjbGllbnRzIGJlaGluZCBOQVQgYXJlIG9uIHRoZSBvdGhlciBzaWRlIG9mIHRo
ZSBnbG9iZSBhbmQgSSBhbSBjb25maWd1cmluZyBhbmQgZGVidWdnaW5nIHZpYSBMYXllciA4IDst
KS4NCg0KTWVhbndoaWxlIEkgY3JlYXRlZCB0aGUgY2xpZW50IGNvbmZpZ3VyYXRpb25zIGFuZCBj
b25maWd1cmVkIHRoZSBNaWtyb3RpayBzZXJ2ZXIgZnJvbSBzY3JhdGNoIGFnYWluLCBpdCBub3cg
cHJvdmlkZXMgYSBzZXBlcmF0ZSB3aXJlZ3VhcmQgaW50ZXJmYWNlIGZvciBlYWNoIGNsaWVudDsg
ZWFjaCBjbGllbnQgbm93IHVzZXMgYSBkaWZmZXJlbnQgdGFyZ2V0IHBvcnQgb24gdGhlIHNlcnZl
ci4gSSBoYXZlIHNvbWUgZG91YnRzIGlmIHRoaXMgcmVhbGx5IGFkZHJlc3NlcyB0aGUgc291cmNl
IG9mIHRoZSBwcm9ibGVtLCBhbmQgaXQgaXMgY2VydGFpbmx5IG5vdCB2ZXJ5IGVsZWdhbnQsIGJ1
dCBpdCBkb2VzIHRoZSB0cmljayBmb3Igbm93LiBUaGUgTWlrcm90aWsgaW1wbGVtZW50YXRpb24g
aXMgc3RpbGwgYSBiZXRhLCBzbyB5b3UgY2Fubm90IGV4cGVjdCBhIHN0YWJsZSBzZXJ2ZXIuDQoN
CkJlc3QsDQoJSm9hY2hpbS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJp
Y2NhcmRvIFBhb2xvIEJlc3RldHRpIFttYWlsdG86cGJsQGJlc3Rvdi5pb10gDQpTZW50OiBGcmlk
YXksIDE1IEphbnVhcnksIDIwMjEgMTY6MjINClRvOiBNYWFydGVuIGRlIFZyaWVzOyBQb3NlZ2dh
LCBKb2FjaGltOyB3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tDQpTdWJqZWN0OiBSZTogTXVsdGlw
bGUgQ2xpZW50cyBiZWhpbmQgTkFUDQoNCk9uIEZyaSBKYW4gMTUsIDIwMjEgYXQgMzoyMSBQTSBD
RVQsIE1hYXJ0ZW4gZGUgVnJpZXMgd3JvdGU6DQo+IFdpcmVHdWFyZCBkb2Vzbid0IGhhdmUgdG8g
dXNlIHRoZSBzYW1lIGxvY2FsIHBvcnQgZm9yIGFsbCBjbGllbnRzLiBJbg0KPiBmYWN0LCBpZiB5
b3UgZG9uJ3QgZ2l2ZSBhIExpc3RlblBvcnQgZXhwbGljaXRseSwgYW4gZXBoZW1lcmFsIHBvcnQg
aXMNCj4gYXNzaWduZWQuIFRoaXMgY291bGQgdGhlb3JldGljYWxseSBzdGlsbCBjb25mbGljdCBi
ZXR3ZWVuIGNsaWVudHMgb24NClRoaXMgaXMgY29ycmVjdC4gSSBtaXN0YWtlbmx5IHRob3VnaHQg
dGhhdCwgYnkgZGVmYXVsdCwgV2lyZUd1YXJkIHVzZWQNCnRoZSB0YXJnZXQgcG9ydCBhcyBhIHNv
dXJjZSBwb3J0IGFzIHdlbGwgKHdoZW4gYXZhaWxhYmxlKS4gRXBoZW1lcmFsDQptYWtlcyBtb3Jl
IHNlbnNlICYgaXMgYWxzbyB3aGF0IHJlYWxseSBoYXBwZW5zLg0KDQpTbyB5ZXMsIEpvYWNoaW0g
c2hvdWxkIGJvdGggZml4IHRoZSBOQVQgYW5kIGRyb3AgTGlzdGVuUG9ydCBmcm9tIGhpcw0KY2xp
ZW50cy4NCg0KUmljY2FyZG8NCg0K
