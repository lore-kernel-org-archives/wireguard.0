Return-Path: <SRS0=Ms3O=GR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B18C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 10:36:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BA223A01
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 10:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BA223A01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sec.uni-passau.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745bb604;
	Thu, 14 Jan 2021 10:36:10 +0000 (UTC)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5a32060f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 20:19:26 +0000 (UTC)
Received: from puremessage.rz.uni-passau.de (puremessage.rz.uni-passau.de
 [132.231.51.54])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id B0C4612465F10
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 21:19:26 +0100 (CET)
Received: from puremessage.rz.uni-passau.de (localhost.localdomain [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id 994A610708D_FFF55CEB
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 20:19:26 +0000 (GMT)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by puremessage.rz.uni-passau.de (Sophos Email Appliance) with ESMTPS id
 9304D104794_FFF55CEF
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 20:19:26 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 775B412465F0E
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 21:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-passau.de;
 s=up-2020-11-19; t=1610569166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=idrSKHRvl8JEd6ovLnf9aDdhapzFaMeCcW4+zOuNw/4=;
 b=5Ud/zBJhCIoNsDZP7KpGRz0p1BxUjmaYLQVob+YL8V3gRhZQaCTLXrsIzPXX2KOmnRIwvm
 v5qagEPoYAygKPywTBAVFHEHlUCwdfuDjJjiqT8wrXLZQ4Yo37vGiiA7Wp+t7BNPJJwx0I
 Xps0Y+so1ZThcttdYShNanuEbTheVSM=
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.15.1)
 (envelope-from <jp@sec.uni-passau.de>)
 id 5fff55ce-0ace-84e733040019-84e70b0dbaea-3
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 21:19:26 +0100
Received: from smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) by
 smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 21:14:47 +0100
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.010; Wed, 13 Jan 2021 21:14:47 +0100
From: "Posegga, Joachim" <jp@sec.uni-passau.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Multiple Clients behind NAT
Thread-Topic: Multiple Clients behind NAT
Thread-Index: Adbp5qcbzZNoNe2aTgWHRjfnTxvB3g==
Date: Wed, 13 Jan 2021 20:14:46 +0000
Message-ID: <f785012b2c5a49c7ba7f48f40b6ce62f@smith.sec.uni-passau.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [132.231.11.34]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-purgate-ID: 151291::1610569166-00000ACE-AA141904/0/0
X-purgate-type: clean
X-purgate-size: 1192
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-Mailman-Approved-At: Thu, 14 Jan 2021 10:36:08 +0000
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

RGVhciBhbGwsDQoNCkkgYW0gdHJ5aW5nIHRvIGNvbm5lY3QgbXVsdGlwbGUgd2lyZWd1YXJkIGNs
aWVudHMgYmVoaW5kIHRoZSBzYW1lIE5BVC1HYXRld2F5IHRvIGEgTWlrcm90aWsgIHNlcnZlciB3
aXRoIGEgcHVibGljIElQLiBJIGFtIG5vdCB5ZXQgc3VyZSB3aGVyZSBleGFjdGx5IHRoZSBwcm9i
bGVtIGlzLCBidXQgaXQgc2VlbXMgdGhhdCBvbmx5IG9uZSBjbGllbnQgYXQgYSB0aW1lIGNhbiBl
c3RhYmxpc2ggYSB0dW5uZWwuIA0KDQpJcyB0aGlzIGEga25vd24gcHJvYmxlbSBkdWUgdG8gdGhl
IFVEUCB0cmFuc3BvcnQsIG9yIHNob3VsZCBtdWx0aXBsZSBjbGllbnRzIGJlaGluZCBhIE5BVCB3
b3JrIGluIHByaW5jaXBsZT8gDQoNCkkgdW5kZXJzdGFuZCBmcm9tIHRoZSBkb2N1bWVudGF0aW9u
IHRoYXQgdGhlIHNlcnZlciBsb29rcyBhdCB0aGUgcHVibGljIGtleSBvZiB0aGUgaW5jb21pbmcg
cGFja2V0IGFuZCBpZGVudGlmaWVzIHRoZSBjbGllbnQuIFRoZSByZXNwb25zZSBzZW50IGJhY2sg
ZnJvbSB0aGUgc2VydmVyIHRoZW4gYXJyaXZlcyBhdCB0aGUgTkFUIGdhdGV3YXksIGFuZCBpdCBz
aG91bGQgbWFwIHRoZSB0YXJnZXQgcG9ydCB0byB0aGUgY29ycmVjdCBjbGllbnQgYW5kIGZvcndh
cmQgaXQuIEhvd2V2ZXIsIEkgYW0gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCBVRFAgb3ZlciBOQVQs
IHNvIEkgYW0gd29uZGVyaW5nIGlmIHRoaXMgdXN1YWxseSB3b3JrcyB3aXRob3V0IHByb2JsZW1z
LiBJZiB0aGlzIGlzIHRoZSBjYXNlLCBJIHdvdWxkIGtub3cgdGhhdCB0aGUgcHJvYmxlbSBpcyBt
b3N0IGxpa2VseSBvbiB0aGUgc2lkZSBvZiB0aGUgTWlrcm90aWsgc2VydmVyLg0KDQpUaGFua3Ms
DQoJSm9hY2hpbS4NCg==
