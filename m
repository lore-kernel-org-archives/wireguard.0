Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443EBC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:51:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9F220659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="iGTSZPQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9F220659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8dad175;
	Sun, 5 Apr 2020 21:38:21 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2067.outbound.protection.outlook.com [40.92.20.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b7e1521a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 15:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn1JYLkaGeMgF836eOzQgTPqpozZYb3tGBrynfwXBWrHD34ZXwzDM+63IEM6+SLY/iIehZ4+auiPKa1UgAi5i6vQ04TVV45/ZyMChhO7JfdMHWGpYtqHP48biReT0zcsnz19/WzcKQYQaEeCkj/3lhsA9pFT4ymFK+5pXsjsiO2+3hS4GEY9+DiYhWsQCLb85UeR30t5xrlvGq7oxRePss9E3lnPwOhn4atQSOpazlrpWIlOET4RofylqFyUTH81IsqhRWuKlKGJWhtyrgn0asTrt13fJPmIq259Br3o67YaK4N6FHrTXSBzM1k8bsxqKQ7NlUfO3DLQ+x4OTnXt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvquNlamTZPqU3INVk9NbCRnFwiuEyB4zdGHrrkVZpU=;
 b=cYrr0WvRle7gcZmOMc84ZJUeHTtpnt2WiBZAt5cdL8zdeaSS4XJ9iK2ZaY3miAv6byB9Vwv4YXSccfd9HzRe99InJWRGBt/T/lsWbE9lKolMUH/5Lrs/fjnM/95VqMhy5FNxF9CgD+AM5Y80blZyNGO43932zxcEkjVrqFoyCKCE1StrelBA3tBZ52elJZuhPiHScn6EQ2FSW6Ji5i1V1F0pZbAN+ydyG4iRaZ1VFjWbqXuux/zqw/9W9ZKaQ04vzhVnFZxuWolUQf8R0L3BTWU6A+kK2aq8BEu1CzqQlcAKx5PjTbzbGAaXGrTQFKIn2UbwL8/LpOhBNfEJx2hv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvquNlamTZPqU3INVk9NbCRnFwiuEyB4zdGHrrkVZpU=;
 b=iGTSZPQgqQKddbOiJrPp+STjZdcE21FU1jM6sNrM0tLHLBH1BLFv7Jyp/zUiq569/0VWUArqOc+rH+UzGQsKj93vVs3eDqdcaUhOGDnqsdryo7vaNeeynwUR+Ee+kKRNJ4Tk7GN+kCuGjfc8cP/qiLF2aUTqiK470BFqRuHcCFAz6OaW3uKSllrMtpG8j9VrcjjDcLnv1qiKLbz+C8nEGNtGISicxkie32d9TOndGPmtlZ8gP2SFKvA1/nY4XdHTR0O0gzWcAu6/8zvDr4Yh/BRWlV32M8dYZ2VNq/sG2G/oZfO8fD/3uq4dP4bXvyahrm+/xBj1jEztDL1spdj5sA==
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::46) by
 DM6NAM11HT093.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::285)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Sun, 5 Apr
 2020 15:58:26 +0000
Received: from MWHPR17MB1648.namprd17.prod.outlook.com
 (2a01:111:e400:fc4d::4e) by DM6NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:fc4d::205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Sun, 5 Apr 2020 15:58:26 +0000
Received: from MWHPR17MB1648.namprd17.prod.outlook.com
 ([fe80::8879:2fd8:8297:f28f]) by MWHPR17MB1648.namprd17.prod.outlook.com
 ([fe80::8879:2fd8:8297:f28f%3]) with mapi id 15.20.2878.021; Sun, 5 Apr 2020
 15:58:26 +0000
From: Dana White <danabw@hotmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Potential bug in Android app - Create from scratch flow 
Thread-Topic: Potential bug in Android app - Create from scratch flow 
Thread-Index: AdYLYrRY6Nz9APILSUOIVjrzVM1+AQ==
Date: Sun, 5 Apr 2020 15:58:26 +0000
Message-ID: <MWHPR17MB1648A7DB1266E86F16DC44F8D0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:06B0CC8F230889F275FAAC4409F6C29D84A237684BC294CAC88AE9D9E08E5918;
 UpperCasedChecksum:B42C90CB3AC5EABB753CED3A4F9AAFD18632407082567A5BE84B40C4E273089F;
 SizeAsReceived:6705; Count:42
x-tmn: [D1n9CUhPWkwkc3BHmJkyysv9jAInlqf/]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: b162de97-4bf0-42e9-9396-08d7d97a2d83
x-ms-traffictypediagnostic: DM6NAM11HT093:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gdx1KAbusbe4V3Yc4TwqEr76MIqP6jjrohLoG6Ay79XeGpgdVMKAU1vIlbW4uphnNbqIgSr5XWvfvl50GsBYDkU3Ki9DSVXfXY1Jsjm8aRikTMKXXSzet2og00ts98naQnPKeDRYPk0KuK4Kl5gLF5pzw5WONJ5LyAHTAWPJLzSILZXSfursnuUwyeF9lqJs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR17MB1648.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: krJa6MYtJyauIPMLxnafPK40Iq+Dn112jnRxP3rs52PLFWr2bpTLmGpFVAMrxIgfPT+5r2q7gV7bzXzLON2Gah/ln6ANsVUVY1V7iAPD7IFL16vYMXGvzt17o0QJhvKuGFTA7TmKT/Zr7pYk81qVtg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b162de97-4bf0-42e9-9396-08d7d97a2d83
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2020 15:58:26.8480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT093
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:13 +0200
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

SeKAmXZlIHNwZW50IHR3byBkYXlzIHRyeWluZyB0byBjb25uZWN0IGZyb20gQW5kcm9pZCAoR2Fs
YXh5IFMxMCkgdG8gRWRnZVJvdXRlciAxMiB3L1dpcmVHdWFyZCBhcHAuIA0KDQpJIHdhcyBjcmVh
dGluZyB0aGUgdHVubmVsIGluIHRoZSBhcHAgbWFudWFsbHkgdmlhIHRoZSBDcmVhdGUgZnJvbSBz
Y3JhdGNoIGZsb3cuIENvdWxkIG5vdCBnZXQgaXQgdG8gY29ubmVjdC4NCg0KTm8gcHJvYmxlbXMg
Y29ubmVjdGluZyBmcm9tIFdpbiBsYXB0b3Agdy90aGUgZXhhY3Qgc2FtZSBjb25maWcuIA0KDQpG
aW5hbGx5ICh0aGFua3MgdG8gc29tZW9uZSBvbiAjd2lyZWd1YXJkIGlyYykgSSB0cmllZCBpbXBv
cnRlZCB0aGUgZXhhY3Qgc2FtZSBjb25maWcgaW50byB0aGUgYXBwLCBhbmQgaXQgd29ya2VkIGlt
bWVkaWF0ZWx5Lg0KDQpJdCBsb29rcyBsaWtlIHRoZXJlIG1heSBiZSBhIHByb2JsZW0gdy90aGUg
bWFudWFsIGVudHJ5IHByb2Nlc3MuIEF0IGxlYXN0IHRoYXQgd2FzIG15IGV4cGVyaWVuY2UsIHJl
cGVhdGVkbHkuIEFwcCBpcyBjdXJyZW50IHZlcnNpb24sIGp1c3QgaW5zdGFsbGVkIGZvciB0aGUg
Zmlyc3QgdGltZSB0d28gZGF5cyBhZ28uDQoNClRoYW5rcy4NCg0KRGFuYQ0K
