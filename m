Return-Path: <SRS0=Pj6m=44=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DA9C10F25
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Mar 2020 07:39:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C199920873
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Mar 2020 07:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORGFT4046020.onmicrosoft.com header.i=@NETORGFT4046020.onmicrosoft.com header.b="oTunZ7B1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C199920873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=duaneellis.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04ef4925;
	Wed, 11 Mar 2020 07:33:46 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be8f4d2f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Mar 2020 04:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfAQthRtZxZOec+uKbI4vhhKeEHu4s9eM63MDg3g688YWltPFnK73BqJEGeny3NIpFcxBtWRu7bzsfC5wj5urAda+waXlZCjFT/wGodMTHPHSUe4bssKriOOIfuGZ1V2jLBH3vd/IxkTieSF7YTYXv6xQCReQU+Rii7pWO/ZixLykI5YpwVJ3bcPkNQV8cdxUO8BlR7KeJo/kWm965YYl4VcoGEvhH24MrOdGer0HleUAh/SFzEhw+1S+tOnxG0S4nGaghyWgS2d7xxRAhE4rJsnZ5QuHA8Ouj33m4QGKMzy1lWMR+QVqC0y+LgrAnAIHY7Y/G2Lhc7cd3KuEZOweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3168vCvnEDkRKY0LGzLhd22CR16ISHeAE3oiSyGIIiM=;
 b=diDE+1VKtHeg926ekVYAakcS5EO51hMvnSs65tAiHT4bw0v4024QhTjvANSXNRKHgwdZ+srCYGSzwTt7LtmF+7wA3o+BNRBY5Qi3XGWydlRJ5IKuXUlxkQnveaMkoHkZro+R1ToDb2w7e8ysMiLYvVN37yn8GAJql26B8ovT3J5k7itlFcuOCJ3WKIU+jx4aPh0rHob3S/G+CrVmWRDcR9OGTHX0Mo195Uh8S4B0ijVS5JKQpZmFPF1X8YBNUIHbNJ8WcmhyedN6GiZeqwMJEYt0Z9PN+OCw0iCZiAGl7p+kaGVwt/l6pxYH9mr4+Rt4YuXuZjPNqQiBS9uiALdC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duaneellis.com; dmarc=pass action=none
 header.from=duaneellis.com; dkim=pass header.d=duaneellis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT4046020.onmicrosoft.com;
 s=selector2-NETORGFT4046020-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3168vCvnEDkRKY0LGzLhd22CR16ISHeAE3oiSyGIIiM=;
 b=oTunZ7B1rGsRoJh451WxgcRZHnMfRPpNxmls9C3g8Cm4UILjQegizijyVvNVC71LY+Vm29re5+oQOU3NXR35aqm4cr5a0q61Iz0ofBx3j0+JkBfIpbkDgCLCI5s2LI24Bbk9c+h6FO7xYG6BnDKF8atc6Gkl1rN1n9u8Sr3mcFc=
Received: from BYAPR05MB5797.namprd05.prod.outlook.com (2603:10b6:a03:c3::25)
 by BYAPR05MB6279.namprd05.prod.outlook.com (2603:10b6:a03:ce::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.9; Tue, 10 Mar
 2020 04:41:12 +0000
Received: from BYAPR05MB5797.namprd05.prod.outlook.com
 ([fe80::512d:9b8e:141b:9ed5]) by BYAPR05MB5797.namprd05.prod.outlook.com
 ([fe80::512d:9b8e:141b:9ed5%3]) with mapi id 15.20.2814.007; Tue, 10 Mar 2020
 04:41:12 +0000
From: Duane Ellis <duane@duaneellis.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: WINTUN example user space app?
Thread-Topic: WINTUN example user space app?
Thread-Index: AQHV9pYgHUMif9ui2kC7yKFpqRlYHA==
Date: Tue, 10 Mar 2020 04:41:12 +0000
Message-ID: <8143A5E3-1886-4DA6-BE59-32B1EAAF7D49@contoso.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=duane@duaneellis.com; 
x-originating-ip: [2600:1700:a0f0:3fc0:c92f:c693:9d98:816e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a670d56b-2e03-45e9-3b8b-08d7c4ad42c7
x-ms-traffictypediagnostic: BYAPR05MB6279:
x-microsoft-antispam-prvs: <BYAPR05MB62797A2764C9E93C543BFF61CAFF0@BYAPR05MB6279.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39830400003)(366004)(376002)(346002)(136003)(189003)(199004)(33656002)(86362001)(508600001)(316002)(2906002)(966005)(6916009)(66946007)(8936002)(81156014)(76116006)(71200400001)(5660300002)(6506007)(36756003)(66446008)(66476007)(81166006)(66556008)(8676002)(64756008)(6512007)(186003)(9686003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6279;
 H:BYAPR05MB5797.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: duaneellis.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QXxK+pTtqhlIPl0b4pXisVDLCCc0+3KQtNB5RxVIrDd7OQwovwXqGDUzIhGnGIdUR70uAk+utmfPxBqBm9/kS3BoE6FlpoB6f95fs9sZcyg5pAmBAAqNh4KH9pQFUrrQoCSkdPz+khnvwn3ZITO9lPIPHDSHxGkVpRU/2kT+NPemaHnfjUHTU7C3KlWfzis3LNkIG1vqHC6ikRxDvHfUOBcrucLvg6FFP9M6ErKpZi4uLZoODPlE7+LlGc6/MSAyuJUK+k2A5W1dmGTIpYc1YA3sGkog3PICvTJb2hmdT4R+M057mAzw9z/cEkhH83dPldSRgx3NrtZM1DiqidzBWJgMB2xaO0YbrFXGvlE6xXu4G0pzu9DfNmyjUaay9lKwiXNBq478fGbA3G77HfA3tptfhGbGUraHP7tlFA1eCJfDiGElF2WChFXERMkLOibTIwRP/Ul4JmXQWfPi/4nL/Lz9kGt8NJbh3p98zXwRwn1kJujQjW7Es6pN1jaV0wMYGSsjtSp0lGN5tt6aP2226A==
x-ms-exchange-antispam-messagedata: l76jacS9kNZZT53Yc47FLJGPtHW8NdEFbrUDdMZuyTyeQNMy6xe82JU/hOrHUY8Z+3b0OuDY6iwmA+WIcoEQX4Ul723ItasMBqaYiENcZYId7q5vBAKYGYcgQ27Mjla1+p0UfOp61qaZo09uuvpSGxNLbtcYJzN4E3xm4MqmRVQ3LL+7fAEMxsrteiffBywsVOQW5mwvvVe/nQph8+4Vqw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <760A3C4639FA0B40A142D5E3B39AEB96@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: duaneellis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a670d56b-2e03-45e9-3b8b-08d7c4ad42c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 04:41:12.3344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eef65c93-5cb4-4eae-919c-def928b6dbea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: psQ0h6QnGXt+EVhWG+8qLfhBICF+y8osvRbG+t/7gk7kJHpeo0/GPfDWrwFHXPT6N6wlUnygb9xvAqWQ59yz5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6279
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:33:45 +0100
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

SGkgLSANCg0KSSdkIGxpa2UgdG8gdXNlIFdJTlRVTiBmb3IgYSBwcm9qZWN0IEknbSB3b3JraW5n
IG9uIGJ1dCAtIEknbSBhIGJpdCBzdHVjay4NCg0KSSBrbm93IGhvdyB0byBtYWtlIHRoaW5ncyB3
b3JrIG9uIExpbnV4LCBidXQgSSBkbyBub3Qga25vdyB0aGlzIHBhcnQgb2Ygd2luZG93cyAuDQoN
CkluIG15IGNhc2UsIEkgbmVlZCB0byB0YWtlIHBhY2tldHMgLSBlbmNhcHN1bGF0ZSB0aGVtIGlu
dG8gYSBzZXJpYWwgcHJvdG9jb2wgYW5kIHNlbmQgdGhlbSB0byBhIHJhZGlvLA0KVGhlbiAtIHRh
a2UgcGFja2V0cyBmcm9tIHRoZSByYWRpbyBhbmQgcHVtcCB0aGVtIGJhY2sgaW50byB0aGUgbmV0
d29yayBzdGFjay4NCkl0IGlzIHNvcnQgb2YgbGlrZSBTTElQIC4uLiBidXQgaXRzIG5vdC4uLiAN
Cg0KRm9yIG1lIC0gdGhlIGFib3ZlIGlzIHRyaXZhbCBvbiBMaW51eCwgYnV0Li4gbXkgY2hhbGxl
bmdlIGlzIHRoaXMgc3RhdGVtZW50Og0KDQpTaXRlOiBodHRwczovL2dpdC56eDJjNC5jb20vd2lu
dHVuL2Fib3V0Lw0KDQo+Pj4gQWZ0ZXIgbG9hZGluZyB0aGUgZHJpdmVyIGFuZCBjcmVhdGluZyBh
IG5ldHdvcmsgaW50ZXJmYWNlIHRoZSB0eXBpY2FsIHdheSB1c2luZyBTZXR1cEFQSSwgb3BlbiB0
aGUgTkRJUyBkZXZpY2Ugb2JqZWN0IGFzc29jaWF0ZWQgd2l0aCB0aGUgUG5QSW5zdGFuY2VJZCwg
ZW5hYmxpbmcgYWxsIGZvcm1zIG9mIGZpbGUgc2hhcmluZzoNCg0KVGhlcmUgYXJlIEVORExFU1Mg
d2luZG93cyByYWJiaXQgaG9sZXMsIGFuZCByYXQgaG9sZXMgdG8gZ28gZXhwbG9yaW5nLi4uICBJ
IGp1c3QgZG9uJ3Qga25vdyB0aGUgc2V0dXAgYXBpIHRoYXQgd2VsbC4NCg0KSXMgdGhlcmUgYSAi
ZnVsbCBzaW1wbGUgd2luZG93cyBleGFtcGxlIGFwcCIgIHRoYXQgSSBjYW4gdXNlIGFzIGEgc3Rh
cnRpbmcgcG9pbnQ/DQoNClNvbWV0aGluZyBzaW1wbGlzdGljIHRvIHN0YXJ0IHdpdGgsIGluIEMs
IEMrKyBvciBDIyANCg0KYSkgR2l2ZW4gYW4gbmV0d29yayBpbnRlcmZhY2UgbmFtZSBvbiB0aGUg
Y29tbWFuZCBsaW5lDQpiKSBPcGVucyB0aGF0IGludGVyZmFjZSANCmMpIFByaW50cyB0byBzdGRv
dXQgdGhlIHNvbWUgb2YgdGhlIHBhY2tldHMgaXQgcmVjZWl2ZWQuDQpkKSBQb3NzaWJseSBpbmpl
Y3RzIGEgZmV3IGV4YW1wbGUgcGFja2V0cywgaWU6IHNlbmQgYSBwaW5nIHRvIHNvbWUgYWRkcmVz
cyBsaWtlIFlhaG9vLmNvbSBvciBzb21ldGhpbmc/DQoNCklmIFdJTlRVTiBpcyBub3QgdGhlIHBs
YWNlIEkgc2hvdWxkIGJlIHBsZWFzZSBsZXQgbWUga25vdy4uLg0KDQoNCg0K
