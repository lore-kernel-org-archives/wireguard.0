Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD9CCE7B10
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Sep 2023 09:56:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8473e6b5;
	Thu, 28 Sep 2023 09:56:33 +0000 (UTC)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 314edd08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Sep 2023 09:56:31 +0000 (UTC)
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.47.0)
 (envelope-from <jp@sec.uni-passau.de>)
 id 65154dce-0713-84e733040019-84e70b0dc5cb-3
 for <wireguard@lists.zx2c4.com>; Thu, 28 Sep 2023 11:56:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-passau.de;
 s=up-2020-11-19; t=1695894990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LeOwNrI+YcIToX5KRkqueG0ZDpaf5oW/VBN4oTqkqqk=;
 b=ECtKHeeDtBlbIqMdeWakGX7JVFGQfAhzSM0OYth3t0sC4bzjSe4cn4c16WTPLOJG+Jeg1z
 Rt2VFNvt6t6CRR9+Okd2SulLHYayBi32cb19CIgvCH6LCl097x7lLtDRPnOg+FJYCG/6Rk
 GPHLaDzVR80O50CxX1aa7tnQ772svBE=
Received: from smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) by
 smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 28 Sep 2023 11:56:18 +0200
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.048; Thu, 28 Sep 2023 11:56:18 +0200
From: "Posegga, Joachim" <jp@sec.uni-passau.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: MAC OS 14 / Sonoma
Thread-Topic: MAC OS 14 / Sonoma
Thread-Index: AQHZ8fIGUEeCe72kQkOnvYu07JttfA==
Date: Thu, 28 Sep 2023 09:56:17 +0000
Message-ID: <BD851A2D-7FFC-4E84-801D-863F53198E8C@sec.uni-passau.de>
Accept-Language: de-DE, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.77.23091703
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [185.43.213.157]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8CFCC221C52974DA13ED1940D7A1408@sec.uni-passau.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-purgate-ID: 151291::1695894990-735229DF-8AA88B31/0/0
X-purgate-type: clean
X-purgate-size: 214
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-Rspamd-Server: tom
X-Spamd-Result: default: False [1.10 / 15.00]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 MIME_BASE64_TEXT(0.10)[];
 DKIM_SIGNED(0.00)[uni-passau.de:s=up-2020-11-19];
 RCPT_COUNT_ONE(0.00)[1]; FROM_EQ_ENVFROM(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[wireguard@lists.zx2c4.com];
 RCVD_NO_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_EQ_ADDR_ALL(0.00)[]; RCVD_COUNT_THREE(0.00)[3]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D0B141B759A50
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

SGksDQoNCkkgY2Fubm90IHJvdXRlIHRyYWZmaWMgdGhyb3VnaCBlc3RhYmxpc2hlZCBXRyB0dW5u
ZWxzIGFmdGVyIHVwZ3JhZGluZyB0byBtYWNPUyAxNC4wIFNvbm9tYSAoMjNBMzQ0KS4gQW55b25l
IGhhdmluZyBzaW1pbGFyIGlzc3Vlcz8NCg0KICBKb2FjaGltLg0KDQo=
