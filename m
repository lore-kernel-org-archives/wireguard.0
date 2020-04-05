Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C453CC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 22:55:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B342F20672
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 22:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="eu9GD2zg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B342F20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 254646d0;
	Sun, 5 Apr 2020 22:46:21 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092005049.outbound.protection.outlook.com [40.92.5.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af7b7012
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 22:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHq1h/DRU9BVif/QxAVJNNby3eig6llhbIyJivlMGQ9MAbBIR2fGl+sm6g20rv5P0JvAVizMp6V1azjPgy4hAjxk1mp+BGQtpiJkyFneptJiQKCTaei3dYUbiqll8D8OH1pu+i52KM6jtYcrjGkLO8OTy8IaVSulQcm2TBwaVvFnrANcE0jbNn/SCvp11cwTX+R+0uyD4I41DuJzNwvgJfx/L6Iu0TuFiUC8zW6kNCUGiITS24dYeR14hYG1rbOm2z2c/l/FFEbi31X0EsT1jNNpZCp0DlQuLVh6vyHRI3uxIBoK3wOLQ9xS7d4SQQ5KRCxCg6fSWxfYz4aWtIEM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ6ndIYlqi4lYI5jhw3NyojByWfqGL4wl8WxfmRL/fM=;
 b=V3F0aMK5L1JN1aYNOtBEhpTBRp34Mj5NfEOezl0jRui5j7rC84tZmP5Tv3akQQYwvGYphwH7MaA7o7yjCXp3NqS2eyXZuiC0avRqE+dlTUmR2T5xlyRtTg11XgfKWorE7ejUPc66tCTvuv0tUe0FKV2Z55SqUk0jjl8vGDifeuEhHVJ/HmwE/lfaUlv0TqjDbw2mfIwGKASU5Qwkda65RyZPerBI5CwjqDmvxKfiHD64OqHlXjRYTAVsXX+Qzuh/HmZ1ICRP7l4kMJ6pejrK9GSmqWMKn0SlxYh3gV3BEATSOOtJ0iQwhzMduYC1Jlj3y0gRLM2Jy5UTIyzb2xeozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ6ndIYlqi4lYI5jhw3NyojByWfqGL4wl8WxfmRL/fM=;
 b=eu9GD2zg2TT12NgVNDw/OslZ+TveyVZHYR6CbTe9avMnVt2BFs9gu7ihlib5X49lNECAfshSD+xsEsFLZsu+sdsCd7ZbqVHmZ3kDg5RxsjRdy97GzW+7uNc5kiqElNGTrZ/uCMn5yyTwXIeVuF7OIxsmli8kjJ+q+6THVEpubWAHN1ob1i3M6XhCnQE+WfissvdnkP2srRsoJQ52jbJJuIJSORknFMT66snLL/PXjee8+4xaVMkGeG5zFEH8CVGxICcF9tOuPrU4qv3147A5xd5l3bwF6BH6piLNaJcKUwPLUDZBPpTYdf69P/6RUhtisjS/j5h27prJ1PqsZ+L/gg==
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (10.152.72.58) by SN1NAM02HT083.eop-nam02.prod.protection.outlook.com
 (10.152.73.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Sun, 5 Apr
 2020 22:55:01 +0000
Received: from MWHPR17MB1648.namprd17.prod.outlook.com
 (2a01:111:e400:7e44::47) by SN1NAM02FT008.mail.protection.outlook.com
 (2a01:111:e400:7e44::119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Sun, 5 Apr 2020 22:55:01 +0000
Received: from MWHPR17MB1648.namprd17.prod.outlook.com
 ([fe80::8879:2fd8:8297:f28f]) by MWHPR17MB1648.namprd17.prod.outlook.com
 ([fe80::8879:2fd8:8297:f28f%3]) with mapi id 15.20.2878.021; Sun, 5 Apr 2020
 22:55:01 +0000
From: Dana White <danabw@hotmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Potential bug in Android app - Create from scratch flow
Thread-Topic: Potential bug in Android app - Create from scratch flow
Thread-Index: AdYLYrRY6Nz9APILSUOIVjrzVM1+AQAMfsQAAAFGwbA=
Date: Sun, 5 Apr 2020 22:55:01 +0000
Message-ID: <MWHPR17MB16480A2D637D253F9A5BCBBAD0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
References: <MWHPR17MB1648A7DB1266E86F16DC44F8D0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
 <CAHmME9q0sbmNpYB5-ZWaT2MUQq_SPdsF9jJ9frkbffwN+RvP7w@mail.gmail.com>
In-Reply-To: <CAHmME9q0sbmNpYB5-ZWaT2MUQq_SPdsF9jJ9frkbffwN+RvP7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:F15DBB09E2DF3E91D4A29F44A3CA5BB7733AC7D2C670A991563D9BD80DCF2D2A;
 UpperCasedChecksum:3AECD633404289A7C2C8BDF222D06ED41594D8C67DF292055598630616134DD3;
 SizeAsReceived:7008; Count:45
x-tmn: [yrPyX2222f4O9/OmwjvBGBi0hm21mmQg]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 796397ca-792b-42a3-7a75-08d7d9b45f76
x-ms-traffictypediagnostic: SN1NAM02HT083:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dl1qFqlrooRgWxarqtphL5NO+6N0cfW3+1NjvvV2IdbZroMJ/rLClC6FeXRCDZ4RgYnIzgYXCkLtDCW5boNURKChKxUPkiNVQWq6N55sxcGTk94W+PPb5J3D6XlcC/GQrpPwXLsi9XNmhmwYfklfR2q+xNdizP2VWLbcC8PAfWqE6SnD2pC4dzBe+quwuweZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR17MB1648.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: WzjQFHONWMhYC4UdKQZlkQxKNihtmMvVBQ47wYIXIwVt/gkBDPdEn0hZBqSOIWj7wA0dOTx547NUcL9cqlRl3fILwtNpXfiB32FsuCZAIDQ20N280wfTxa++yDycyYf9MbdE5dIdSvLExYq5NfsZlw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 796397ca-792b-42a3-7a75-08d7d9b45f76
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2020 22:55:01.4715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT083
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

VGhhbmtzLiBVc2luZyB0aGUgY29uZmlnIHdhcyBqdXN0IHRvIHRlc3QgdGhlIGltcG9ydCBwcm9j
ZXNzIG9uIEFuZHJvaWQgdy9hIGtub3duIGdvb2QgY29uZmlnLCBkZWxldGVkIHRoZXJlYWZ0ZXIu
IA0KCQ0KRnJvbSB5b3VyIHJlcGx5IHNvdW5kcyBsaWtlIHlvdSBoYXZlbid0IHNlZW4gdGhpcyBp
c3N1ZSB3L3RoZSBjdXJyZW50IHZlcnNpb24gb2YgdGhlIGFwcD8gQXJlIHlvdSBhYmxlIHRvIG1h
bnVhbGx5IGNyZWF0ZSBhbmQgdXNlIGEgbmV3IHR1bm5lbCBvbiB0aGUgQW5kcm9pZCBhcHAgc3Vj
Y2Vzc2Z1bGx5PyANCg0KSSBoYWQgYW5vdGhlciBtZW1iZXIgb2YgdGhlIEVkZ2VSb3V0ZXIgY29t
bXVuaXR5IG5vdGUgdGhhdCBoZSBoYWQgd2hhdCBoZSB0aG91Z2h0IHdhcyBhIHNpbWlsYXIgcHJv
YmxlbSByZWNlbnRseSB3L3RoZSBBbmRyb2lkIGFwcCBidXQgZGlkbid0IHRha2UgdGhlIHRpbWUg
dG8gZm9sbG93IHVwb24gaXQuIA0KDQpJJ2xsIGRvIGFzIHlvdSByZXF1ZXN0IGFuZCBnZXQgYmFj
ay4gDQoNCkRhbmENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphc29uIEEu
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
