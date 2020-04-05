Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4106C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 23:23:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB8E20659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 23:23:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="d2wkvvxv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB8E20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a31c57a;
	Sun, 5 Apr 2020 23:14:40 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2047.outbound.protection.outlook.com [40.92.20.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b6bb20ac
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 23:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4E0jrwKO6XKl+KpJ+ZejbxC+vM/SzqZknvVjmrzTV8kV5qLukTnYpVMGxBBToJUY8cMfZHJRo1P+9KTeLUUCZtBb4WosNOicWgw4Ulv3uJS8SaH2dj1gcYNqSXF+3vHzmrcCpKx7hLdLxgRzPaByUWZatWdlelyMKBXZayKyhTYBBFTQWdmvVtWCpsdzPCNEnZWC0kM52RNE1GJ0sejNADn4SELPGukAv0nLLd5EnU18VNhdebnsjBpea4Q7FlL0SKSOm3krNiDSSfAz8vQOZpkh6xoUBqDAK4B2kGG2BTRGRPffLzyNlEnE8rg/dRZ6+9eCeAkVEhEoM4LS1zomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwL5qeVhUH+eCHCn3Y2RAEOoDHrZwDtchj5aA2Gm4sU=;
 b=KVxIrrdIL9eNP74RmcoJ5GcrZt9Lm+5elrz+CFMXUwOWstzItWXxo4GnCDr9mhUmtBoofaTer4kQiwCD/VVbZgYqkHkaWmNEuWnvOwXi5Gqateliu+B7L29xHJyThVIRsb3Oi5oAFtzbYcJAcwoAVRAZIZBnj1Rv0ckom7NPEEXBoLufmxJe8Wz8Ar3g1DfVk0UYUmyOLTWWq0kbZe/a7zDVeCWtveFohb+m+h98941UjPEPJ+Ro61BKVp3D0KaVhO+M6ixGuBTBZAZgJcYQi3QcvYgx3U4JEpRbTtxO7mRY/ZjRletMysgYftjzFSyZcy0Wnlo+c51DzL+8+QqAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwL5qeVhUH+eCHCn3Y2RAEOoDHrZwDtchj5aA2Gm4sU=;
 b=d2wkvvxv1yxkwOPv/aOq1ku58acB31FFnPaRGJeYwBCQrfTJszUkgg0aerlnMHRvSczydb/Yk4kZZ0J+JL/UfGDOiwL6DATrm4T9d2xfnBhZ68uJoTtpxygelSukAonji836WkFF9xPxDIZX54RBum3Ba04u6wFq8UFDSfZb8KroEc52mPckrx1dIaOddh98n1AOHgLguf3Qequa+WVoC1H1kk7kQJ9Nk6AwseG0HCiRo75rUUMrwfXm1xs+ZlKg37FmZyhDLd6Biy8EtelQoYEyOrMdVVlNLN+VHnaVwzl5oGOJ0P1+ntfsBVGjxfU50U2tqD53pfW5fu16IFfl3A==
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::53) by
 CO1NAM11HT118.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::337)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Sun, 5 Apr
 2020 23:23:20 +0000
Received: from MWHPR17MB1648.namprd17.prod.outlook.com
 (2a01:111:e400:3861::4c) by CO1NAM11FT056.mail.protection.outlook.com
 (2a01:111:e400:3861::363) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Sun, 5 Apr 2020 23:23:20 +0000
Received: from MWHPR17MB1648.namprd17.prod.outlook.com
 ([fe80::8879:2fd8:8297:f28f]) by MWHPR17MB1648.namprd17.prod.outlook.com
 ([fe80::8879:2fd8:8297:f28f%3]) with mapi id 15.20.2878.021; Sun, 5 Apr 2020
 23:23:20 +0000
From: Dana White <danabw@hotmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Potential bug in Android app - Create from scratch flow
Thread-Topic: Potential bug in Android app - Create from scratch flow
Thread-Index: AdYLYrRY6Nz9APILSUOIVjrzVM1+AQAMfsQAAALfg4A=
Date: Sun, 5 Apr 2020 23:23:20 +0000
Message-ID: <MWHPR17MB164823F1B470B5B30D25BF01D0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
References: <MWHPR17MB1648A7DB1266E86F16DC44F8D0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
 <CAHmME9q0sbmNpYB5-ZWaT2MUQq_SPdsF9jJ9frkbffwN+RvP7w@mail.gmail.com>
In-Reply-To: <CAHmME9q0sbmNpYB5-ZWaT2MUQq_SPdsF9jJ9frkbffwN+RvP7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4BDC7F3182C419275997C9CB49DDD1282FD8B87C67A676AD074241B3ACB46388;
 UpperCasedChecksum:79ACC9E07CB68026D69707781DDEF77F8C98C2B3B340DCC4861C41B95B0DBDD9;
 SizeAsReceived:7033; Count:45
x-tmn: [9NiwwTez8fEjwjkBVrw81I8mfdtxC1S3]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: eb963331-c480-4f54-3a9f-08d7d9b85458
x-ms-traffictypediagnostic: CO1NAM11HT118:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QLKklDl+L4bCu6MhhyRJhNeJ0rv/A+s6zv6UirZlKJ9BJ21iLGqk9kFUU4fdztpz9b7V/Evw2C3o1Vhz+HY58qvOaRsPELqJy81VtLBvp9Iw++xaSog4g94m+w/5U68euS3KdL1tZ/oR2dnYAQfTOV9Yag9c5p2bxizwalqh1kX5GfK6vgbF1QGHagCyjixc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR17MB1648.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: Eoo6cnDywS9hNw7gJfY4L5lkOwqLmf7vbj8ERUuzWxgnVDmbOMryJ+/suZFNcajUsyLQp4syCYpEJHJzEW3Fur4O6fgnRVIUF79X4DfuhiYb1JUTfiXWxfWZQhR8aIJLKsNOe4QFFfvfzub5oVKflw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eb963331-c480-4f54-3a9f-08d7d9b85458
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2020 23:23:20.6983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT118
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

T0ssIG9wZXJhdG9yIGVycm9yIG9uY2UgYWdhaW4gaXMgdG8gYmxhbWUuIA0KDQpNeSByb3V0ZXIg
cHVibGljIGtleSBpbiB0aGUgY29uZmlnIGhhZCBhIHNpbmdsZSBkaWdpdCBtaXNzaW5nLiANCg0K
VGhlIHJlYWxseSBvZGQgcGFydCBpcyB0aGF0IEkgY2FuJ3QgdW5kZXJzdGFuZCBob3cgdGhhdCBo
YXBwZW5lZCwgYXMgSSBjb3B5L3Bhc3RlZCB0aGUgcm91dGVyIHB1YmxpYyBrZXkgZnJvbSBhbiBl
eGlzdGluZyBjb25maWcgKHRoYXQgc3RpbGwgd29ya3MgYW5kIGhhcyB0aGUgZnVsbCBjb3JyZWN0
IGtleSkgYmVjYXVzZSB0aGVyZSB3YXMgbm8gd2F5IEkgd2FzIGdvaW5nIHRvIHR5cGUgb3V0IHNv
bWV0aGluZyB0aGF0IGxvbmcvZGlmZmljdWx0LiBJIGRvIGhhdmUgcHJvYmxlbXMgd2l0aCBteSBt
b3VzZXBhZCBvbiBteSBjb21wdXRlciBzb21ldGltZXMganVtcGluZyB0aGUgY3Vyc29yIGFyb3Vu
ZCB3aGVuIG15IHBhbG0gaGl0cyBpdCBhbmQgc29tZXRpbWVzIG1lc3NpbmcgdXAgd2hhdCBJ4oCZ
bSBkb2luZywgYnV0IG5vIGlkZWEgaG93IHRoYXQgY291bGQgYWNjb3VudCBmb3IgcmVtb3Zpbmcg
YSBsZXR0ZXIgYW5kIG5vdCBsZWF2aW5nIGEgc3BhY2UuIA0KDQpCdXQgZWdnIG9uIG15IGZhY2Ug
aXMgZWdnIG9uIG15IGZhY2UsIHdoYXQgY2FuIEkgc2F5LiANCg0KQm93aW5nIGFuZCBiYWNraW5n
IGF3YXkgaW4gc2hhbWUuIA0KDQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIHRvIGV4cG9ydC9j
b21wYXJlLCB0aGF0IHdhcyB3aGF0IGFsbG93ZWQgbWUgdG8gc2VlIHRoZSBpc3N1ZSBjbGVhcmx5
LiANCg0KRGFuYSANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphc29uIEEu
IERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPiANClNlbnQ6IFN1bmRheSwgQXByaWwgNSwgMjAy
MCAyOjU0IFBNDQpUbzogRGFuYSBXaGl0ZSA8ZGFuYWJ3QGhvdG1haWwuY29tPg0KQ2M6IFdpcmVH
dWFyZCBtYWlsaW5nIGxpc3QgPHdpcmVndWFyZEBsaXN0cy56eDJjNC5jb20+DQpTdWJqZWN0OiBS
ZTogUG90ZW50aWFsIGJ1ZyBpbiBBbmRyb2lkIGFwcCAtIENyZWF0ZSBmcm9tIHNjcmF0Y2ggZmxv
dw0KDQo+IEZpbmFsbHkgKHRoYW5rcyB0byBzb21lb25lIG9uICN3aXJlZ3VhcmQgaXJjKSBJIHRy
aWVkIGltcG9ydGVkIHRoZSBleGFjdCBzYW1lIGNvbmZpZyBpbnRvIHRoZSBhcHAsIGFuZCBpdCB3
b3JrZWQgaW1tZWRpYXRlbHkuDQoNCkRvbid0IHVzZSB0aGUgc2FtZSBjb25maWcgZnJvbSB0d28g
ZGV2aWNlcy4gT25lIGRldmljZSA6OiBvbmUgcHJpdmF0ZSBrZXkuDQoNCj4gSXQgbG9va3MgbGlr
ZSB0aGVyZSBtYXkgYmUgYSBwcm9ibGVtIHcvdGhlIG1hbnVhbCBlbnRyeSBwcm9jZXNzLiBBdCBs
ZWFzdCB0aGF0IHdhcyBteSBleHBlcmllbmNlLCByZXBlYXRlZGx5LiBBcHAgaXMgY3VycmVudCB2
ZXJzaW9uLCBqdXN0IGluc3RhbGxlZCBmb3IgdGhlIGZpcnN0IHRpbWUgdHdvIGRheXMgYWdvLg0K
DQpDcmVhdGUgaXQgbWFudWFsbHksIGFuZCB0aGVuIGV4cG9ydCBpdCB0byBhIHppcC4gTG9vayBp
biB0aGUgemlwIGFuZCBzZWUgaWYgdGhlcmUncyBhbnkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoYXQg
ZmlsZSBhbmQgdGhlIG9uZSB5b3UgaW1wb3J0ZWQgZnJvbSB0aGUgd2luZG93cyBhcHAuDQo=
