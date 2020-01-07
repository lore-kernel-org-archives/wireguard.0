Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5A0C33CA1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:05:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32EE20721
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.usask.ca header.i=@mail.usask.ca header.b="ooX/Q5P8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B32EE20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=usask.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 691f0061;
	Thu, 9 Jan 2020 06:02:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00389399
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2020 23:57:19 +0000 (UTC)
Received: from CAN01-TO1-obe.outbound.protection.outlook.com
 (mail-eopbgr670100.outbound.protection.outlook.com [40.107.67.100])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7467feb9
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2020 23:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKGgqSoxLYiP5OHBCFvIzAj0kJd1U6zZ6PDf3BUwxKxw0CRtSXeMvz4hPQE/TTcsL/5iHqQcTO/QXaX2vvvqZYglMZCYhT6C0ciq5jqCbKNT3gszt/XU17I/QW5Lw+7wraF1GsyZjnTKXQyBvzMbLgh1Kk7g8VBenHgeTLv9ZeWXju79SmPsbx/OeRz9YyfbW25qTwUi5I2lQVHw9dlEEPuZBNoTa12tTNMjRMKBbsnBh8igs454gUsjuE4gnGOjnNSEt35aD5A4uu52qslppB1kJ9B3W9GHQ9yfzISC1eO7c9TAKex5sJzhRKpgy5T4vnTEmnrrjBA2+u3rRwwvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTBm6EUoItAQBIQFisz0R35nBCbtfGdeCUDd377/G5c=;
 b=EOp/LZsEU6i2s7cX1a67Pl34AferWPee0qIvU4Nmv2DxGcR2OvWCorYGrWL5dRbuU9X7yCyVaunknpb2WKt/QdztexFHndsqACnRz0d4sjcIG7PxlZFEWyaYUvmddLtV1YeKfyr3ROOt2sDAH22due61k8klgPfP0rSN4uNDFzBdVfgTiZsan0eZkqspB3BDFds0bGIFiQ5GKeQiA4JTrXwyI6CT0fwh6IpCcEvH5qmT5qMFcZub5H13MwzS0r6yK/OOEt3kfx14jUiiDj+Ygi3UWYLnK5ZSLBpAnTfZuYodbybJP0tsiCTUwKoaq+gi+Bb798brWVW7eMXaZY+zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.usask.ca; dmarc=pass action=none header.from=usask.ca;
 dkim=pass header.d=usask.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.usask.ca;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTBm6EUoItAQBIQFisz0R35nBCbtfGdeCUDd377/G5c=;
 b=ooX/Q5P8AqGUqHELmgPre7IX+ATFd0wHyt0HqQRE1BTeDKzc1OoKvfpF0FgM+ubqb0VG+4QaHuY4Q5MR/Ehg6qM76G+9qmbgE3uwSa7OdH0AebWh1SOmYA12DhLPjbgI1RdtDP1N6i9AtVCiSplixMYU8Lh7xKg/5YMZM+fJmO4=
Received: from YQBPR0101MB1922.CANPRD01.PROD.OUTLOOK.COM (52.132.72.158) by
 YQBPR0101MB1923.CANPRD01.PROD.OUTLOOK.COM (52.132.71.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Tue, 7 Jan 2020 23:57:18 +0000
Received: from YQBPR0101MB1922.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::b4dc:55c5:7a82:c04]) by YQBPR0101MB1922.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::b4dc:55c5:7a82:c04%3]) with mapi id 15.20.2602.016; Tue, 7 Jan 2020
 23:57:18 +0000
Received: from [192.168.0.11] (70.64.4.215) by
 YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Tue, 7 Jan 2020 23:57:17 +0000
From: Nicholas Kinar <n.kinar@usask.ca>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Cannot build Wireguard for ARM embedded Linux 32-bit Tinkerboard
Thread-Topic: Cannot build Wireguard for ARM embedded Linux 32-bit Tinkerboard
Thread-Index: AQHVxbYxsADximje20mqwTdLee7GCA==
Date: Tue, 7 Jan 2020 23:57:18 +0000
Message-ID: <94a4b886-b7f1-ec54-c5ff-d2447ca08d3a@usask.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::14) To YQBPR0101MB1922.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:11::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=njk024@mail.usask.ca; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [70.64.4.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 353e7770-9af2-415c-3575-08d793cd53f3
x-ms-traffictypediagnostic: YQBPR0101MB1923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <YQBPR0101MB1923941BA8658F891E89CE28D73F0@YQBPR0101MB1923.CANPRD01.PROD.OUTLOOK.COM>
x-uofs-origin: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(66556008)(66446008)(64756008)(52116002)(26005)(966005)(31686004)(186003)(16526019)(66476007)(478600001)(786003)(16576012)(6916009)(5660300002)(71200400001)(66946007)(2906002)(8676002)(31696002)(956004)(36756003)(2616005)(8936002)(316002)(81166006)(81156014)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:YQBPR0101MB1923;
 H:YQBPR0101MB1922.CANPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mail.usask.ca does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KpYMMIESPs0JfnvSofxJO5o4J6t8AXQRTbj8NMJ7MFuHkGt1QM5YvMusSMGzPDMS0AY/RwifGsfhjI6JMXzzf924BeljocTbO2yfwm7ycufCNhIONjUSTfZIHV+8X7FBwBhyd5l1aSRTm82327jrgrth8M2vuRV+yscJmxKIoXxucokOdBpI6Gv54G5WrWZtrW8zxQDjx3PKlAWeZ5jtwt7RZWLsdmWLjKwmPiy/xrJj/F9PnM7ftepyrOcynADjUquTUlwCGTVrxaL42FqImZ76z6qxMEmdVe5Ql2954sZ2ESM1BIG7OvN/D+4J+Yh0dcVRECepZuvCyBOhOZmqeCH+zLgvWS4fUdrrQJfBN6IQXCI3YN94ZntyVyLLwynZ6EUdG61rj9CgnaWkf7PnGJEr+9V2cC8QG6NgtTEUlvmWgLtHUX6G56e5CQVQ9USdxQ4TRjdkYvOqMsfgdMR+lpMq2RU1e6SKo5rA9tbYAHg=
Content-ID: <1864C87CDDEF8844B93B8E60C9021638@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: usask.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 353e7770-9af2-415c-3575-08d793cd53f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 23:57:18.4279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 24ab6cd0-487e-4722-9bc3-da9c4232776c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxJMaXiJuFPdfcFP4AT6HlH4TiJcKQBxumIquIbL2YvPnLR8Ki28ymsF/OWnZuQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB1923
X-Mailman-Approved-At: Thu, 09 Jan 2020 07:02:19 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGVsbG8sDQoNCkkndmUgYXR0ZW1wdGVkIHRvIGJ1aWxkIFdpcmVndWFyZCBvbiBhbiBBc3VzIFRp
bmtlcmJvYXJkIFMgcnVubmluZyANCmVtYmVkZGVkIExpbnV4LsKgIFRoZSBib2FyZCB3YXMgaW5p
dGlhbGx5IGZsYXNoZWQgd2l0aCBUaW5rZXIgT1MgKERlYmlhbiANClN0cmV0Y2gpLCBidXQgSSB1
cGRhdGVkIHRvIHRoZSBtb3JlIHJlY2VudCB2ZXJzaW9uIG9mIERlYmlhbiBidXN0ZXIgDQp1c2lu
ZyBhcHQtZ2V0LsKgIFRoaXMgaXMgYSAzMi1iaXQgcHJvY2Vzc29yLg0KDQpPcGVyYXRpbmcgU3lz
dGVtOiBEZWJpYW4gR05VL0xpbnV4IDEwIChidXN0ZXIpDQpLZXJuZWw6IExpbnV4IDQuNC4xMzIr
DQoNCmxpbmFyb0BjbGF2ZXQtc2VydmVyOn4kIHVuYW1lIC1hDQpMaW51eCBjbGF2ZXQtc2VydmVy
IDQuNC4xMzIrICMxIFNNUCBXZWQgQXVnIDIxIDE5OjE1OjU1IENTVCAyMDE5IGFybXY3bCANCkdO
VS9MaW51eA0KDQpJJ3ZlIGZvbGxvd2VkIHRoZSBpbnN0YWxsYXRpb24gYW5kIGJ1aWxkIGluc3Ry
dWN0aW9ucyBvbiB0aGUgb2ZmaWNpYWwgDQp3ZWJzaXRlLsKgIFRoZSBrZXJuZWwgbW9kZWwgZG9l
cyBub3QgaW5zdGFsbCBub3IgYnVpbGQgZHVlIHRvIGEgY29tcGlsZXIgDQpmbGFnIHRoYXQgaXMg
bm90IHN1cHBvcnRlZC7CoCBBcHBhcmVudGx5IHRoaXMgZmxhZyBpcyBmb3IgYSA2NC1iaXQgDQpi
dWlsZC7CoCBJJ3ZlIGFsc28gdHJpZWQgdG8gZG8gaW5zdGFsbGF0aW9uIHVzaW5nIHRoZSBnaXQg
dmVyc2lvbiBhbmQgdGhlIA0Kc2FtZSBidWlsZCBmYWlsdXJlIG9jY3Vycy7CoCBIZXJlIGlzIHRo
ZSBvdXRwdXQgb2YgdGhlIG1ha2UubG9nLg0KDQpES01TIG1ha2UubG9nIGZvciB3aXJlZ3VhcmQt
MC4wLjIwMTkxMjE5IGZvciBrZXJuZWwgNC40LjEzMisgKGFybXY3bCkNClR1ZSBKYW7CoCA3IDIy
OjI0OjA4IFVUQyAyMDIwDQptYWtlOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL2xpbnV4
LWhlYWRlcnMtNC40LjEzMisnDQogwqAgTETCoMKgwqDCoMKgIC92YXIvbGliL2RrbXMvd2lyZWd1
YXJkLzAuMC4yMDE5MTIxOS9idWlsZC9idWlsdC1pbi5vDQogwqAgQ0MgW01dwqAgL3Zhci9saWIv
ZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1aWxkL21haW4ubw0KIMKgIENDIFtNXcKgIC92
YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE5MTIxOS9idWlsZC9ub2lzZS5vDQogwqAgQ0Mg
W01dwqAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1aWxkL2RldmljZS5v
DQogwqAgQ0MgW01dwqAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1aWxk
L3BlZXIubw0KZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24g4oCY
LW1nZW5lcmFsLXJlZ3Mtb25seeKAmQ0KZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQg
bGluZSBvcHRpb24g4oCYLW1nZW5lcmFsLXJlZ3Mtb25seeKAmQ0KZ2NjOiBlcnJvcjogdW5yZWNv
Z25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24g4oCYLW1nZW5lcmFsLXJlZ3Mtb25seeKAmQ0KbWFr
ZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI3NzogDQovdmFyL2xpYi9ka21zL3dp
cmVndWFyZC8wLjAuMjAxOTEyMTkvYnVpbGQvbWFpbi5vXSBFcnJvciAxDQptYWtlWzFdOiAqKiog
V2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVk
IGNvbW1hbmQgbGluZSBvcHRpb24g4oCYLW1nZW5lcmFsLXJlZ3Mtb25seeKAmQ0KbWFrZVsxXTog
KioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI3NzogDQovdmFyL2xpYi9ka21zL3dpcmVndWFy
ZC8wLjAuMjAxOTEyMTkvYnVpbGQvbm9pc2Uub10gRXJyb3IgMQ0KbWFrZVsxXTogKioqIFtzY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkOjI3NzogDQovdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAx
OTEyMTkvYnVpbGQvZGV2aWNlLm9dIEVycm9yIDENCm1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtl
ZmlsZS5idWlsZDoyNzc6IA0KL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1
aWxkL3BlZXIub10gRXJyb3IgMQ0KbWFrZTogKioqIFtNYWtlZmlsZToxNDcxOiANCl9tb2R1bGVf
L3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTkxMjE5L2J1aWxkXSBFcnJvciAyDQptYWtl
OiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbGludXgtaGVhZGVycy00LjQuMTMyKycNCg0K
V2hhdCBkbyBJIGhhdmUgdG8gZG8gdG8gY29tcGlsZSBXaXJlZ3VhcmQgb24gdGhpcyBzeXN0ZW0/
wqAgSSd2ZSB0cmllZCB0byANCmFkZCB2YXJpb3VzIGxpYnJhcmllcyAoYXMgcGVyIA0KaHR0cHM6
Ly9kZXZ0YWxrLm52aWRpYS5jb20vZGVmYXVsdC90b3BpYy85MDY5NDIvamV0c29uLXR4MS9mYWls
ZWQtdG8tY29tcGlsZS1rZXJuZWwtbW9kdWxlLWdjYy1jYW5ub3QtcmVjb2duaXplLWFhcmNoNjQt
b3B0aW9uLW1nZW5lcmFsLXJlZ3Mtb25seS0vKSwgDQpidXQgdGhlIHNhbWUgcHJvYmxlbSBvY2N1
cnMuDQoNCldpcmVndWFyZCB3b3JrcyBncmVhdCBvbiBhbGwgb2YgbXkgNjQtYml0IHNlcnZlcnMg
YW5kIGl0IGlzIGJlaW5nIHVzZWQgDQp0byBjcmVhdGUgcmVzZWFyY2ggbmV0d29ya3MuwqAgVGhh
bmtzIHNvIG11Y2ggZm9yIGNyZWF0aW5nIHRoaXMgZ3JlYXQgdG9vbC4NCg0KTmljaG9sYXMNCg0K
LS0gDQpEci4gTmljaG9sYXMgSi4gS2luYXIsIFBoRA0KUmVzZWFyY2ggU2NpZW50aXN0IHwgR2xv
YmFsIFdhdGVyIEZ1dHVyZXMNCkFzc2lzdGFudCBEaXJlY3RvciB8IFNtYXJ0IFdhdGVyIFN5c3Rl
bXMgTGFiDQpVbml2ZXJzaXR5IG9mIFNhc2thdGNoZXdhbg0KMzA2LTk2Ni0yMDkyIHwgbi5raW5h
ckB1c2Fzay5jYQ0KaHR0cDovL3d3dy51c2Fzay5jYS9oeWRyb2xvZ3kNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlz
dApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxt
YW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
