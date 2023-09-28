Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A019E732D9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Sep 2023 14:24:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1ffe99c;
	Thu, 28 Sep 2023 14:24:11 +0000 (UTC)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ef53b83
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Sep 2023 14:24:09 +0000 (UTC)
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.47.0)
 (envelope-from <jp@sec.uni-passau.de>)
 id 65158c88-0713-84e733040019-84e70b0d10a0-3
 for <wireguard@lists.zx2c4.com>; Thu, 28 Sep 2023 16:24:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-passau.de;
 s=up-2020-11-19; t=1695911048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mp9OWOSQm7wR6lK371fsbBDFkVF3N0d+GGhZXrUVKU=;
 b=ItKPtcm93Dd/7jUANXHabu/OHIIMOeHgrzTF0LegP2haiNHim7qKIWRpx2aRrf1OK/3sGk
 Lh2bRWHb0OHLxI4kOIYKnsj4D+Buy/pSgbC+8dCMKMAU2jOk8t2OPHitkVl0ash0cBf/CN
 aWvCyR9zOdMrNnt69XUmowB6fLuKw98=
Received: from smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) by
 smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 28 Sep 2023 16:24:08 +0200
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.048; Thu, 28 Sep 2023 16:24:08 +0200
From: "Posegga, Joachim" <jp@sec.uni-passau.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: MAC OS 14 / Sonoma
Thread-Topic: MAC OS 14 / Sonoma
Thread-Index: AQHZ8fIGUEeCe72kQkOnvYu07JttfLAwSvyA
Date: Thu, 28 Sep 2023 14:24:07 +0000
Message-ID: <DFFB9BB9-4C5D-4806-8D0C-54C95B43CAD1@sec.uni-passau.de>
References: <BD851A2D-7FFC-4E84-801D-863F53198E8C@sec.uni-passau.de>
In-Reply-To: <BD851A2D-7FFC-4E84-801D-863F53198E8C@sec.uni-passau.de>
Accept-Language: de-DE, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.77.23091703
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [77.241.232.19]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9285CF02B4F2744692CACA5447F0F464@sec.uni-passau.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-purgate-ID: 151291::1695911048-6F51A9DF-E5B4AD54/0/0
X-purgate-type: clean
X-purgate-size: 638
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-Rspamd-Server: tom
X-Spamd-Result: default: False [0.10 / 15.00]; MIME_BASE64_TEXT(0.10)[];
 DKIM_SIGNED(0.00)[uni-passau.de:s=up-2020-11-19];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 PREVIOUSLY_DELIVERED(0.00)[wireguard@lists.zx2c4.com];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_NO_TLS_LAST(0.00)[];
 TO_DN_EQ_ADDR_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_THREE(0.00)[3]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E5CE41B76371C
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

Li4uLiBzb3JyeSwgdGhpcyB3YXMgZmFsc2UgYWxhcm06DQpUaGUgY3VscHJpdCB3YXMgdGhlIGNv
bmZlcmVuY2UgV0xBTiBpbiBUaGUgSGFndWUgdGhhdCBXQVMgYmxvY2tpbmcgV0ctdHJhZmZpYy4g
SSBkaWQgbm90IGV4cGVjdCBzdWNoIHBhY2tldCBmaWx0ZXJpbmcgaW4gdGhlIE5ldGhlcmxhbmRz
Lg0KDQoJLSBKb2FjaGltLg0KDQrvu79PbiAyOC4wOS4yMywgMTE6NTYsICJQb3NlZ2dhLCBKb2Fj
aGltIiA8anBAc2VjLnVuaS1wYXNzYXUuZGUgPG1haWx0bzpqcEBzZWMudW5pLXBhc3NhdS5kZT4+
IHdyb3RlOg0KDQoNCkhpLA0KDQoNCkkgY2Fubm90IHJvdXRlIHRyYWZmaWMgdGhyb3VnaCBlc3Rh
Ymxpc2hlZCBXRyB0dW5uZWxzIGFmdGVyIHVwZ3JhZGluZyB0byBtYWNPUyAxNC4wIFNvbm9tYSAo
MjNBMzQ0KS4gQW55b25lIGhhdmluZyBzaW1pbGFyIGlzc3Vlcz8NCg0KDQpKb2FjaGltLg0KDQoN
Cg0KDQoNCg==
