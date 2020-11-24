Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7342C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 12:30:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99EBF206E5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 12:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=FourPeaksLandscape.onmicrosoft.com header.i=@FourPeaksLandscape.onmicrosoft.com header.b="al+IjefL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99EBF206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fourpeakslandscape.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c83e035;
	Wed, 25 Nov 2020 12:24:19 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2120.outbound.protection.outlook.com [40.107.94.120])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8aff892
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Nov 2020 21:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOFEDuvCyh46mFeIqWKt110WbEIJpGMYFAq+cvM5n0G8WYyTz+4M+4NpmGJdygg1vFxoRCOza6J0/b1NBVn1UEG8wRzxr/lG/Anu15WX/1ZkIPBtQiDg8WJ0y0U7I9HN7ubkXub6/yUysd3Ter4+8hu1p66CU7yxcHnsDDX747rg4Z+zMu6TOF7wY3eeLpQ1FND5E2qvpv0n/jHHawiJKuMu1MVYBiGFrs/7A7fBv9i+sAy76U+DHBx/i5K95QVL6r4Z6+qz0srlp8UrZoZb7EsZi+RdTuyGOp+9E5MdAZyzG4OUMriNs/C1qTt3vePyJPafuHKduUHdyDTxCVPXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysgxtaRy8+k6htIGv7tVKc+WEX09jGAafm25zvj0X5I=;
 b=RFif/SODaERNdKwfaWLWnqhyanurWP0M6w46wmAXIK0zfEMgoD/oJNoAAweYp9LfoFeFimCU8rznsiQ6lAofvP0HlhtK/8qErhPVNLm2Ov5V/8CNCu3q4jedDEQszq/Q8xeqMk5o8Izp6VxeXX6Wu2L75I9Mnzoln4ZekUHwKGK1gB6fMWuCckfO4sE9zxtpkXMs5v2E58waMYFnTMfJ9I1D6CZS7NRmptXQvBRkFwQpUI7A14bffwfAVHqEHx543qJ4bhTcTFlLUHl2PcTzTAF+PNoLY8cwzoKCFGFfQIn2bGdcZUBkPdH6YtQLKg8cPtShX2lupdtVH3ZnYSxxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fourpeakslandscape.com; dmarc=pass action=none
 header.from=fourpeakslandscape.com; dkim=pass
 header.d=fourpeakslandscape.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FourPeaksLandscape.onmicrosoft.com;
 s=selector2-FourPeaksLandscape-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysgxtaRy8+k6htIGv7tVKc+WEX09jGAafm25zvj0X5I=;
 b=al+IjefLNmjBIEjhcYaxXDe/xEzg8DxdvO1IzmlsmRCeXlZFibsNsWGUk+g77amVjXn/lzLVOnmM67lnBCoqcDsBUSIZB2dGjZ10ybI4fSYeV2vpjN4+KiCtKuRALNAMQz/FMlqzr0jqWT+NTdSBbu8oqv++bzZ1ziMkTk4QRXA=
Received: from BY5PR17MB3617.namprd17.prod.outlook.com (2603:10b6:a03:1c0::27)
 by BYAPR17MB3048.namprd17.prod.outlook.com (2603:10b6:a03:ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 22:04:10 +0000
Received: from BY5PR17MB3617.namprd17.prod.outlook.com
 ([fe80::bcb1:a8df:cbb6:ab6d]) by BY5PR17MB3617.namprd17.prod.outlook.com
 ([fe80::bcb1:a8df:cbb6:ab6d%4]) with mapi id 15.20.3611.021; Tue, 24 Nov 2020
 22:04:10 +0000
From: Dennis IT SysAdmin <it@fourpeakslandscape.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: WireGuard 0.3.1 Potential Bug #AddConf
Thread-Topic: WireGuard 0.3.1 Potential Bug #AddConf
Thread-Index: AQHWwqqjAGBgxYHu2k+yf6sweM1hiqnX1Xlc
Date: Tue, 24 Nov 2020 22:04:10 +0000
Message-ID: <BY5PR17MB36173DFB2D19C80A9798729EA9FB0@BY5PR17MB3617.namprd17.prod.outlook.com>
References: <BY5PR17MB36175E4EB9A88CE42A2D1D86A9FB0@BY5PR17MB3617.namprd17.prod.outlook.com>
In-Reply-To: <BY5PR17MB36175E4EB9A88CE42A2D1D86A9FB0@BY5PR17MB3617.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=fourpeakslandscape.com;
x-originating-ip: [70.177.6.89]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 827fad40-af48-47f7-3d26-08d890c4df42
x-ms-traffictypediagnostic: BYAPR17MB3048:
x-microsoft-antispam-prvs: <BYAPR17MB3048F0D7812D609E3250B985A9FB0@BYAPR17MB3048.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W5xZk0Bsz95zf5ojFWn2RRPxpqeQ1k2h30IJkeplaex0cSCEoohONDC/tTkUrbRhLIfwa3td8nG6Bl7Z1Hv3gE7MucKRqwdS6Zv6t+NEI4Hf4yLXEE4cdLb39/QDv8BWuYrpkVfUeJDhw51L2yqlHq2NgB2yhWuIp9bmJZcbshaAXGwIbjffs3tJ+1606aoFaIFE8HKS3cLqnAdeLJNfeesFd7QXOQc0exLC6FVJxW2D71V2b16Oxec8vhWSbz11bt4QyHHNQ8FW66BfsTEoOaaIAs8bJjDnLTHpfhecI4beNryLx+EhhzUXetrqOJInN411IeZ+NsTDkcFC2t08i9HpkiQyMv3M/uqTZDNYPUXWoak9T68KBe3MAxWN8OUC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR17MB3617.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(39830400003)(396003)(136003)(2906002)(33656002)(6916009)(76116006)(2940100002)(66946007)(66476007)(52536014)(478600001)(66446008)(66556008)(64756008)(71200400001)(26005)(6506007)(8676002)(5660300002)(9686003)(7696005)(86362001)(186003)(316002)(55016002)(83380400001)(8936002)(460985005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UmlVVmowZS9abHExazE4QU03QzBQU3NRV2xINzMxanRBdEVTb0llUkZ3bGlG?=
 =?utf-8?B?dTZaZy94c2JJczNoN0pUMXNGc1ArV0RUK3NPWmlGZ2hFdmFSN25KUi9kUm83?=
 =?utf-8?B?RkljVnVtM2ZKZUg2VzYrWXZkUktxdXRyRGcxb2h1L2dpVjNJWktSRnptMTNo?=
 =?utf-8?B?VjdVeEE3Wk5sTmN0azBCeTVIM3NzbUUzMFUrM2k3OUptb2VKU3RtbFBXOFBM?=
 =?utf-8?B?TitTa2JHOERTc2FLd0dKVitUU2p4VmVJbWhmU2ZuU1NpOVEzVmdud2wrU21Z?=
 =?utf-8?B?ckFHNW4ybTdOb2xkODB1RnhucFd2dW1BWUpwVzNhR01pU1I5UmdId0xFVk5h?=
 =?utf-8?B?ZytZRFd5dGkzMU5oMEhqdUF4OHV0eWFSRVJ0YXV6anFySFFETmF3R3VyRkd4?=
 =?utf-8?B?UVFMNUE3YVIzOHdtcHp2WHZpWkRQL2tWZjF1a2F1S3EyM3ZBRit3S3lXT2RO?=
 =?utf-8?B?NmpkdmlVWXZoYzB4ZnRrVk1PSGxVUEN2Z3hZeUFUZXc5RU9OMytXYnM0ZHNB?=
 =?utf-8?B?Nk8zZDA1aFZ3M3ZEeVlFQm9Pc0NkQ3FIN3hOaUU3YzR1UXI5YlBjaHNyNW9M?=
 =?utf-8?B?M3grMGo5cWdValFkWlFtMnFVRG4wZW9MQzRoVG1xS0FBQWxicEdOaDBEV2g3?=
 =?utf-8?B?WFVvcnF0Qmg4RzhqK1Zuc3pMckV4TGNTcEdSeFljRnkvd2tqWUhLY0VZcTlC?=
 =?utf-8?B?UTBKbC91anBhZWw5ajZ6OHYzK0tHTjQ1T1k5Zmxod3ZXcFR1YjZFejI3RklK?=
 =?utf-8?B?NVg5b2dGMS9GV0tUWUhhSjRhZ0RNKzNPdWttNHpPaVJQSXNGU2REY1g5TzlY?=
 =?utf-8?B?TEFKTXlVdkg4SEJYU1MzVW9lU0FVeDhOSDlMRU5CUHhMUURNR3lEekV0em1v?=
 =?utf-8?B?a0dXUENIbUN4M0ZFOEc3alM3QStWVzdHY040QkI0eTlJeWRtUU5DN003WlNk?=
 =?utf-8?B?QzIvcDFJVjZvL2c2Z3RaN1FTSFQ1U2F2YVdJODl2VXREd20xa3N0OU9pU3JG?=
 =?utf-8?B?Zkg4T1FjRzI5Z094ZXE0NDJ5UlZwTXNPVzQ4K0VNSW5qY29aeHdicVNRSFA3?=
 =?utf-8?B?Y1BJcUJmeXNKNmcvb3ZkdEdGSlhhNlRFUHV2d1E3OFlaU1U1aXhkUDdhTkRX?=
 =?utf-8?B?OU5FOU1tT292dXVDY2RhWm9hQXExUnNWa01pWng4MjViM3ZnNGtDME1UL0Rh?=
 =?utf-8?B?WkprMW1sajJYVG12ZkFnVTlFcE9CMHJuSDdrelZqQU9WVTFySFRzNG9ZUmIv?=
 =?utf-8?B?SmRYVzZONE9LelpPV3FrOEFoWEtlQ2JEenQ3QVowUHZOUVdDdmkwTWh1R1lt?=
 =?utf-8?Q?1xq93sRarPQmc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fourpeakslandscape.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR17MB3617.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827fad40-af48-47f7-3d26-08d890c4df42
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 22:04:10.4846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f86d598a-53c7-4611-9718-2bbe7841079b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvz5Piw0eiNWfN9gNXdgwkBs7+0eShBO39WnPIGczI8hzjHgaqALcXgas+PWws5cNoVPdQCckpvwxCQUPI+GJwP62e+oq4SAHI+drzGad9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR17MB3048
X-Mailman-Approved-At: Wed, 25 Nov 2020 13:24:18 +0100
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

CldoaWxlIHNldHRpbmcgdXAgdGhlIFZQTiBhbmQgYWxzbyB3b3JraW5nIG9uIGNyZWF0aW5nIGEg
cG93ZXJzaGVsbCBtb2R1bGUgZm9yIHNldHVwLCBJIHdlbnQgdGhyb3VnaCB0byB0ZXN0IHRoZSBj
b21wb25lbnRzIGluIHdnLmV4ZSwgYW5kIEkgbm90aWNlZCBhbiBpc3N1ZSB3aXRoIGFkZGNvbmYg
d2hpY2ggaXMgc3VwcG9zZWQgdG8gYWxsb3cgYXBwZW5kaW5nIHRvIGEgY3VycmVudCBjb25maWd1
cmF0aW9uOgoKU2V2ZXJhbCBzY2VuYXJpb3MgdGVzdGVkLQoKCgoKV2luZG93cyAoIFVuZGVyIGFu
IGFkbWluIChub3Qgc3lzdGVtKSBhY2NvdW50IHdoZXJlIGNvbmZpZyB3YXMgY3JlYXRlZCAobm90
IGNyZWF0ZWQgdXNpbmcgc3lzdGVtIGFjY291bnQpOgpbCgpQUyBDOlxQcm9ncmFtIEZpbGVzXFdp
cmVHdWFyZD4gICAgICB3ZyBhZGRjb25mIFdpcmVHdWFyZCAnQzpcUHJvZ3JhbSBGaWxlc1xXaXJl
R3VhcmRcRGF0YVxDb25maWd1cmF0aW9uc1xXaXJlR3VhcmRWUE4uY29uZi5kcGFwaScKCmZvcGVu
OiBQZXJtaXNzaW9uIGRlbmllZAoKXQoKCgpXaW5kb3dzICggVW5kZXIgU1lTVEVNIGFjY291bnQg
d2hlcmUgY29uZmlnIHdhcyBOT1QgY3JlYXRlZCAodXNpbmcgUFNUb29scyB0byBnZXQgaW50byBT
WVNURU0gZW52aXJvbm1lbnQpOgpbCgpQUyBDOlxQcm9ncmFtIEZpbGVzXFdpcmVHdWFyZD4gICAg
d2cgYWRkY29uZiBXaXJlR3VhcmQgJ0M6XFByb2dyYW0gRmlsZXNcV2lyZUd1YXJkXERhdGFcQ29u
ZmlndXJhdGlvbnNcV2lyZUd1YXJkVlBOLmNvbmYuZHBhcGkn4oCLIAoKTGluZSB1bnJlY29nbml6
ZWQ6IGABJwpDb25maWd1cmF0aW9uIHBhcnNpbmcgZXJyb3IKCl0KCgoKRGViaWFuU2VydmVyICgg
VW5kZXIgU1UgYWNjb3VudCB3aGVyZSBjb25maWcgd2FzIGNyZWF0ZWQgJiB1bmRlciBVU0VSIGFj
Y291bnQgd2hlcmUgY29uZmlnIHdhcyBOT1QgY3JlYXRlZCAtIFNhbWUgcmVzdWx0ICk6CgpbCnJv
b3RAdW5peDovaG9tZS9zeXN0ZW0jICAgICB3ZyBhZGRjb25mIFdpcmVHdWFyZCAvZXRjL3dpcmVn
dWFyZC93ZzAuY29uZiAKCkxpbmUgdW5yZWNvZ25pemVkOiBgQWRkcmVzcz0xNzIuMTAuMTAuMS8y
NCcKQ29uZmlndXJhdGlvbiBwYXJzaW5nIGVycm9yCgpdCgoKCgoKCgoKCgoKCgoKClRoYW5rcywK
CkRlbm5pcyBGYWlywqDCoHzCoMKgSS5UIFN5c3RlbXMgQWRtaW4KRm91ciBQZWFrcyBMYW5kc2Nh
cGUgTWFuYWdlbWVudApwOsKgNDgwLTk2Ny0wMzc2wqDCoHzCoMKgZjrCoDQ4MC05NjctMDQwNgpt
OsKgNDgwLTMxOS01MzQ1CmU6wqBpdEBmb3VycGVha3NsYW5kc2NhcGUuY29tCgo=
