Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BFCC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 03:24:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F0464F8B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 03:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F0464F8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=envisia.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a81d1804;
	Wed, 17 Mar 2021 03:24:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e02f9ee1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 21:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJolusUratVrowagWkXCxup0rzPD9d5JXZc2Ya0JLpInY2km9EBn/yUpyyw7XxyJkfNLPKK1JI/HpcjIU46lpb7zU3JhSFvBk811KDdEYjRoyCPLuUbUDn3NygQAUCucNlC9RoR0CfCL0SLQ1nvB01LJneRtf734CRGEr4MJhJ85K3tLrJ5ItqPoPw8ASKeqABKdM4+6bq0OLDcx9YBvKF5IsHGBV+SronpW7yeFHN5BOumMShkS2GDsSjy0Fm3H0XB7kahniBLB7O6/OueBpM0F2btaCktzw8opXWZC8NQN281Nsyi7Pn7CG/O7xre2a4xO2McFYKxtUQilPxlH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRSaPBkxrWagoEOW4UhJBMw7X7ngfhoZhjmLq7ZPpi4=;
 b=KAzssfz5cLBzCYMWoquaTlq4pHRmLbRn6g/lORlC1oVAt3m0MuB1GNa7cXG7zPQEY6uOVo0lLi4JAiwdNF1njLnUnAV6IZGY8f/Tk4g1fNQSqQTn422uAsDM1UBRUUNkOsdVNRWbAVT3W43hAcRm58TsGNlDSiyjCMSz+uR7o0JnLRyOSxkR9k2ZR+p0wIF3DqKeQ2sCO5JlfBMm1rVBlUODOjLGKdYJiqqxkO6A4Hf6rlqiZ85/BILrngY0CgJlc7bj44+xG87ft14J9EWZo5i4LvnNGzgKOwJFThTSX4NVIyoX47knN0DX3nF4JWaDGdCt/aIJ0HTrpAXSpLmP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=envisia.de; dmarc=pass action=none header.from=envisia.de;
 dkim=pass header.d=envisia.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envisia.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRSaPBkxrWagoEOW4UhJBMw7X7ngfhoZhjmLq7ZPpi4=;
 b=L6vFAH/mZ9bfvM2V1sBACVSMhkP4Xrl/5M907lByIYX+qW2XUGeu781slfU2H+Q6+PYF1ipsn9k4ZUqjTY0KOGVWQG4wVm9LJbtNRZy77xK8FLV6yygb2Uv68m5buBECECVEV+GN7mQ3zbU2t2/MPB0dGcGehU8OvrurTSsQGpc=
Received: from AM0PR03MB4786.eurprd03.prod.outlook.com (2603:10a6:208:106::32)
 by AM0PR03MB5970.eurprd03.prod.outlook.com (2603:10a6:208:15b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 21:28:36 +0000
Received: from AM0PR03MB4786.eurprd03.prod.outlook.com
 ([fe80::100:83f:a3e7:3acc]) by AM0PR03MB4786.eurprd03.prod.outlook.com
 ([fe80::100:83f:a3e7:3acc%5]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 21:28:35 +0000
From: Christian Schmitt <c.schmitt@envisia.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: dynamic peer configuration over socket?
Thread-Topic: dynamic peer configuration over socket?
Thread-Index: AQHXGqtSl6sfJ5m1W0m8DOY6G7Eu5A==
Date: Tue, 16 Mar 2021 21:28:35 +0000
Message-ID: <4fa1c016-9fcb-b1ab-2df6-be774ac6344d@envisia.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none; lists.zx2c4.com; dmarc=none action=none header.from=envisia.de; 
x-originating-ip: [80.136.105.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6037a8bb-6ac1-4458-287e-08d8e8c27528
x-ms-traffictypediagnostic: AM0PR03MB5970:
x-microsoft-antispam-prvs: <AM0PR03MB5970D5A0260745F2885C799D8B6B9@AM0PR03MB5970.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VTpqm2HVIae+vaRSDksN45XiiTpUUeuyOxhEQKF02BMCFCHXKtBEZamcxM21GtcdQs92zjNPcLx5oYVf6EH7vCJrtkMn9KsaqbbGGxSokqJ1yOw6esEdFdjKKJyl5VbIQhbBl9xYp/NKYX7QmZHnwTEboobmOuFfH8hpIzAu/r2qJhIOcFWSSmjetPDcTFUJSQiNhU2oaOYQhvgHxFxJK0Ke/E9xdjsglgnTZ2Jt+ccJ6cVstxdGI/ht+A3hqz6EALLiKoBq42dMoFWAnkVIAJ4a9AxruOzx7vTTiwGh+nJuSVpDI4CBkyeq0Y9byVY0Ea8IR///yxHHLlN6EVqN93G+rkRL7TIMu+hXbREwCyR0smyGfXfhLTwmiMXyeNG3zRTUldRwr7oROpd06MY3plAmM7/9MvamSH3dkkgXgGJE9Bnz25QM/QC4G1oT998aTQoDFlUulS3EUi3/CH7JvTeyNWnx6WT5o4AgbzKzPAkOy1nN/kpHrTzcABgs67Hr982xBVKqH1CsYN7I+orZ5ADuCQB3iU9rtyEQpuYrUfiHfIiLKatRORPRVZuEwnr3hweqBUuboUXdAXhWR07IXodFRQwdaE9KNxIoHKD+IwOJWE3oKprwb2uOFkevbvEXs0NPr3aVplDf3OMb4ddE+Yz6ke4GgcovOfP7zPeTl9aleLXT9uEy4vn23sWqaSZR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB4786.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(376002)(396003)(136003)(346002)(366004)(6486002)(64756008)(86362001)(6916009)(5660300002)(66556008)(8676002)(76116006)(8936002)(66476007)(66446008)(478600001)(316002)(66946007)(6512007)(71200400001)(31696002)(2616005)(31686004)(2906002)(26005)(36756003)(6506007)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NzU2MjY4OXUvWGd6cWVqc0dvZTJ5Z1MvWGl2SVVHaTRGbWFFMldlcjd2blBU?=
 =?utf-8?B?SmtuNlpKcjBqVWZqVEVDdnVzQ1l5OVJYV2lqc2YxTkZOUW4vOGp5SFUxTmk1?=
 =?utf-8?B?MndQcGlxalhZN0NmWlFQOEdnUm9GNjRLVFcvWUE2WjE2WXRaRlR6L0pOZXRQ?=
 =?utf-8?B?VEx6bi9odjZtOXZTcEFxSTRDeUh5KzEvZHFtVjArUXJRc252aUJLenRrbTVV?=
 =?utf-8?B?dHg5ZXp5Umgzd3NGUFM4TitGb09oRENNL3Vrb0xyS1d4WWJ0MEluSFdLWDY2?=
 =?utf-8?B?T1VSa3U1VXFGS29icXBQd21ETm1hUE42eXRjdEpNTWtReTZMRFJEU2dvSzFO?=
 =?utf-8?B?MUg0RzJJMUZhSUdhb1ZvRzZGUElCZHVRMEN4cVdvSDZPK2gvMmNIVEtQK1Ix?=
 =?utf-8?B?bHE5TVJPWDAxb3pXZ3FHOUwwYXE4ZnZUZ3ZoMnVoR3lyb0JtVUFwT3p5WnZu?=
 =?utf-8?B?K0F6bERGbndOOUJqVW5yYVdNRG14TGRsTlpLTEhFTUNuSUE1c3lJWDhoamI4?=
 =?utf-8?B?clZzZXBYSEpYNllDK3QxbTBQVHc1M2N6Um1TQTc0WU40aWdvbDFSdWxHcTIx?=
 =?utf-8?B?NHNkY3ZNbU9WUFhIZ2hGbUEyaTlPejhZd3FGZEV3bFk0bmFmOFhiQU5ZTEMx?=
 =?utf-8?B?Ti9uOU9qRmx4NUtGT21ET3lLdXN0R2xRSlhIMVRLZGZaUTFGek5vQTNtd1NZ?=
 =?utf-8?B?WWVMZkREaUZlN3hqNllIYktDODZjNDk0R2MrbHRQU05oMCs5Nmg0VE0zYVRp?=
 =?utf-8?B?NHRCUWltM3dveURGV1haNkx1Sm16NTJ2WG9iY3pSTEVKT2crdTQzZEhLNUlp?=
 =?utf-8?B?a3NWOXBUbTE3NUVPeFd5c011OFlZSGphdXY5WmtaZk5PRTNaTVdWemFmSUVl?=
 =?utf-8?B?ay80cXlPZVFsSUhTemJSQzQ3NE4vNjZvdXdyZGUvSU1sSG1sSEFBL1ZCTFMy?=
 =?utf-8?B?Z09QelduNTh2b1VOdlRxZkF1YkpwMk1hWW5iMXp1Tk9ZbEsrdkI5UFpMS3Zl?=
 =?utf-8?B?ekFKZFBDZTRLWmNnbDNiVngxUThXdmd3NG5tK1U0eGNsa09nTWRoZldRNFBK?=
 =?utf-8?B?Z0p2VTFoZU9SL0QyTVNacjF6c3YzOUxjVFI3OGowSzhLWm5Zc0ZVbi9wSGdy?=
 =?utf-8?B?Q2ZRRWJES3VXVnEyb09xUEdXcG84a1VKbW1WS3ZodnUrU2JraG5ZUG02ZGNr?=
 =?utf-8?B?NTdrczB2UXNHc0FBNXlrTkRDWDhScklVZFpSZ09QdE5qbFBmZURzNHJkbDUx?=
 =?utf-8?B?eS90VkZXY2g2Q2tGZCs4OC9sbHFmQlZoc0x4ZlRwRnZOem9Yd2M4Yy9BN3Zu?=
 =?utf-8?B?ak15OXpuMldpYWk1LzJMeFptNDlOVm1PN3ZYQTR3R0Vub0FQeDhBTG9WWEEw?=
 =?utf-8?B?bHhQZXp1M3ZxOXdMc3M1enAyZEJBWXl1Ry9sZ1k0bVFOb21ybFVNVGU2a2sw?=
 =?utf-8?B?MnN2UW93eWlIUWhDVk1DZGVJcHlVb0xQN2FadUk0dUhORGJ5a0xmT3RQbTFU?=
 =?utf-8?B?amROTjRoUFhBRXRDcEF5QlpzeVE2ZVFCUDRlSWV6M2d2N2huZW9kRzVGRlJB?=
 =?utf-8?B?eU8xcVUvUE0wWFlRd0ZhR3M5SDNyajJ1WHZEZk90aEJnOVVrQzJEVnpKeWFl?=
 =?utf-8?B?VjU1aWdBaE9HQzRMRmdyYmlqQTJreGhvMjcwV3hrSmZqN3lLbVY0cnBmMGdp?=
 =?utf-8?B?V29id01qZUlMcDFVMVJ6VzIvSlNiTnhMdHIyZEtFalVvMXk1QVRYRWFaRzVJ?=
 =?utf-8?Q?k+OKMAUX5Xr31KHAyA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <177A3B908F17E2478CF5F2B2FA90E5F5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: envisia.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4786.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6037a8bb-6ac1-4458-287e-08d8e8c27528
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 21:28:35.8641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c3c90a1-d144-4745-981e-9d39dcbf30f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HONee8Us+dp16VEk8bGZZnZcFuosrBg93QORZzXmR5JmoYN6xW9MMyI7Qby6ISb0NJX50MBRvQ8wAWeUESv9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5970
X-Mailman-Approved-At: Wed, 17 Mar 2021 03:24:20 +0000
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

SGVsbG8sDQoNCmN1cnJlbnRseSBJJ20gdG95aW5nIGEgbGl0dGxlIGJpdCB3aXRoIHdpcmVndWFy
ZCBhbmQgZm91bmQgdGhlIA0KY29uZmlndXJhdGlvbiByZWFsbHkgcmVhbGx5IHNpbXBsZS4NCg0K
YXQgdGhlIG1vbWVudCBJJ20gdXNpbmcgb3BlbnZwbiBhbmQgd2FudCB0byByZXBsYWNlIGl0LiB3
aXRoIG9wZW52cG4gd2UgDQpkeW5hbWljYWxseSBhZGQgcGVlcnMgYnkgdXNpbmcgdGhlIG1hbmFn
ZW1lbnQgYXBpLg0KDQp3ZSBoYXZlIGEgd2F0Y2hlciBwcm9ncmFtIHRoYXQgbGlzdGVucyB0aGUg
bWFuYWdlbWVudCBzb2NrZXRzIGFuZCANCndhdGNoZXMgdW50aWwgb3BlbnZwbiBzZW5kcyB1cyBz
b21ldGhpbmcgbGlrZSANCihodHRwczovL29wZW52cG4ubmV0L2NvbW11bml0eS1yZXNvdXJjZXMv
bWFuYWdlbWVudC1pbnRlcmZhY2UvIA0KLS1tYW5hZ2VtZW50LWNsaWVudC1hdXRoKToNCg0KID4g
TUdNVDogY29ubmVjdCBjbGllbnQ6DQoNCndlIHRoYW4gbmVlZCB0byByZXNwb25kIHdpdGggZWl0
aGVyIGNsaWVudC1raWxsIG9yIGNsaWVudC1hdXRoIA0KKGFzeW5jaHJvbm91c2x5KS4NCg0KDQp0
aGlzIGlzIGV4dHJlbWx5IGhlbHBmdWwgYmVjYXVzZSBpdCBtZWFucyB3ZSBjYW4gaGF2ZSBhIGRh
dGFiYXNlIHdoZXJlIA0KYWxsIG91ciBwZWVyIGNvbmZpZ3VyYXRpb24gaXMgaGVsZCBhbmQgb3Bl
bnZwbiBhc2tzIGlmIHRoZSBjbGllbnQgYWxsb3dlZC4NCg0KSSBjb3VsZCBub3QgZmluZCBzb21l
dGhpbmcgbGlrZSB0aGF0IHdpdGggd2lyZWd1YXJkLCB0aGUgb25seSB3YXkgSSANCndvdWxkIGZp
bmQsIGlmIG91ciBzZXJ2aWNlIHdvdWxkIHBvbGwgZm9yIG5ldyBjb25maWd1cmF0aW9uIGFuZCBh
cHBseSBpdCANCmlmIHdpcmVndWFyZCBkb2VzIG5vdCBrbm93IHRoZSBwZWVyLCBidXQgdGhpcyBp
cyBlcnJvciBwcm9uZSBhbmQgZG9lcyANCm5vdCB3b3JrIGluIG15IGhhIHRvcG9sb2d5IHRoYXQg
d2VsbC4gaXMgdGhlcmUgc29tZXRoaW5nIHBsYW5uZWQgdG8gbWFrZSANCnRoYXQgaGFwcGVuPyBp
dCdzIGJ0dy4gYWxzbyBwYWluZnVsIHRvIG1hbmFnZSBzdWNoIGEgYmlnIGNvbmZpZyB3aXRoIA0K
aHVuZHJlZHMgb2YgY2xpZW50IHBlZXJzLg0KDQoNCkJlc3QgUmVnYXJkcw0KDQogwqBDaHJpc3Rp
YW4NCg0K
