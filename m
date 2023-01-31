Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6004C636CD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:33:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f23c27f7;
	Tue, 7 Feb 2023 04:29:50 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84855e13
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jan 2023 11:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVhZUmcU2gWw11G5ocuaTcjGCfc/LlbTaghncg1roOg9KuhOSYHLjrb63hu8bHaAlx/DkMmMHKRCjUXH6q4E/8EoiHU/5xZ0w6kEWl8xdy2uzvoibGqE6xKXPfjwFolf1cIy6IF9Bs7w+Ir7RquurlO3uDlAiuRef10CDjlJPz66EbF6/Cd+SIjk2HfKzA257g95pTYHasqzi5PkbmqW8jCd1rpbap4QdyPMkhrr1eL3SM7x8xsYYoZ1tbvw1Bm5juXanTGd8e7uGTxp2lBusBC3ZvrejOGHoDTyHbECpyn/nhFxh0FbsYJs7hc38VkTzxIZjf3Ooku7L7Oz1B69mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9qiFQQao43x3sSlMg3dYQA/3YW8RKQR4MViCoZNXnQ=;
 b=PhwFA1qvGQ+Y8NxeYUUFik8Nl3GJct9cIQ6DUTft0r/yxjlFK+HOciTK5w6qixWxtNk6XuW+4fUO93ZZwioXMoO788uhsbpn6ekKyoPrLVaFTMFXmg3QKksqru9JH7G0/8FVJJuXHqbs+OEUIMoma12CzkMPqsQFMF4RZmTtOe+HcV5E1KirHKuP6UNwrbGisfqQJxlaymn9Yw0HRNV0hebQfUAfClqgk/uQu8A1eGJ3kHRsjMOMn5UsZrDYtdkMe0ooWW6EqmsQYGt7KdGU5A5iWzmZlIAiCa3t7YQZJFGaST03dz6oie8jlmxMuP9fyC+/NMLIywRbyCGIp1QiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericom.com; dmarc=pass action=none header.from=ericom.com;
 dkim=pass header.d=ericom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericom.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9qiFQQao43x3sSlMg3dYQA/3YW8RKQR4MViCoZNXnQ=;
 b=L4R1E2lLm76asH6w2qJ9gsz+cpZN1HpPMUMBAQzQM/agR6IUspQaIjZIQMXJaypafJhrkFQ/NmT0X4AcJIYs9zP/+KO5c4kmTmKvgcPo/xrAbAkVoIqxxABj6T3+raMoUE7fmJAo1M3r4WgodN5zKn/kDFU2pi+5KeMbxOeivpXXB7S203dHGuLE64pJc0/YkBkimcLn6ytQj4tndPQsd/lcGbdDINj6j8hC9ON7kLrd9BVCaljxx+y07HJUEgM3h11002mhEFdVquBV3a+u2S4cCU1hROncBQga2SNFus6uFovQJ8yFWkS0pdepafZc++Przn3GJm5qDKJ56sxhBA==
Received: from DM6PR04MB6155.namprd04.prod.outlook.com (2603:10b6:5:124::22)
 by CY4PR04MB0838.namprd04.prod.outlook.com (2603:10b6:903:e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 11:43:03 +0000
Received: from DM6PR04MB6155.namprd04.prod.outlook.com
 ([fe80::b0da:abdb:b398:b5ad]) by DM6PR04MB6155.namprd04.prod.outlook.com
 ([fe80::b0da:abdb:b398:b5ad%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 11:43:03 +0000
From: David Leib <David.Leib@ericom.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [PATCH] handle a network adapter ending in a space character
Thread-Topic: [PATCH] handle a network adapter ending in a space character
Thread-Index: Adk1aR9TB1j1LuM1TDmLC+mjZk9x1w==
Date: Tue, 31 Jan 2023 11:43:02 +0000
Message-ID: <DM6PR04MB6155B09AAC361275C059DF1EF8D09@DM6PR04MB6155.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericom.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6155:EE_|CY4PR04MB0838:EE_
x-ms-office365-filtering-correlation-id: b95549ff-5672-4f02-eebd-08db03804fa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7UBhcVMVfKJ00fBV1J2GaURm712z5yses6IvueWFJ4lyKXRHZXfXuidkam8VTtB2+Bwv8/8+e/vcWkvb6zr8rb1i9SauuThK66WetNnEDzpj73R8nG2NsXSj1QwZcJ16AnlvCsDAJhzJlK/wG8OHYyJ7vn4R1+oxOVzUO7tOwzo9T7/DMxipO6YsL8fA/zfQOqiZEaD3aHPOSm3Vxvd3o8W2d/M+zhuQlXFVxpW81UV1NWD9v0OS5SNSHYw0hpS8e5pUb3uXw4askgKFrbHc8x6esYQMLLImmDaEgotAx4wvcKFwGj7nvV8DWKrtWvQK6JiFWayL4Gyr9hImSHPaGE3ZdI5r2t1rG+41Ns0CY3eDCebmkVntamXTPlUSdXYERG2Wn/+tEMLoAmyLK4zcdd+3+hViYzE91oK30UN+YVHnddKCTGX9Ju205junAIaPoRKk+zWXe0fDJ7F2ssK8fB1vdAofboiHwhaKmUQOpoRIXHFL1p5fWgN6GzvTYVZYwirZ8GZnqRgJ0F/LPRRUVNeqeIRfNtq6M4iFDW5ezGLjWOEJS7pSUPyerYLtHBwVQ1mVTdx9K7uRs/YO+tSpp8O8L1FQxJl1t3rxKwN1QS7kwRhgZ4N9hC9tZ0piOFplCJX9L8Pim/W1NXW80F/3lbtW+rsFJ9hHdQdUzdShY635rGd4P20OyJEKuSsXE/UflJGkQUFv0I+I4V7taulzBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6155.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39840400004)(136003)(376002)(366004)(346002)(451199018)(83380400001)(6506007)(478600001)(186003)(9686003)(26005)(33656002)(86362001)(38070700005)(38100700002)(122000001)(316002)(55016003)(8676002)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(71200400001)(7696005)(6916009)(41300700001)(52536014)(5660300002)(8936002)(2906002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OC9wdDNsMzNCWFNndGdneE5DTUd5andLYkMvQjVzOE9URTdOUGowSU0zNVVK?=
 =?utf-8?B?Mkh5RERkYnZhQUttdnpmWUlmbjhzQ2p2QWcyc2tLVjV0eEg4TWJZMExtem5p?=
 =?utf-8?B?djBNYW42UVZqWDFIcm1FemhLRkREL1JWanI4aFBmMmp4SkJFWVl0VTVNald5?=
 =?utf-8?B?ZkhwR3VnY3UyZDAxaHlDeHhVZTJvM09Zdm1rcUQ5aXBDQXM0U01EQlBrY3Jz?=
 =?utf-8?B?bjZuSFI3TGhtZ2RRYXdVT3gvZFRUVXZ6bk80TU9COXFUN3JrZHpYL09RRG9R?=
 =?utf-8?B?L3VxN0tSSzhhSWRXNTNHTXR2Uy9UT3F2ZHJGajZKeE9uS1RWMFVQQzJGY2p4?=
 =?utf-8?B?ejVNZmU5L1NRU0tBeDJRV0RXcEo5bmUydENPMm10SjRISUMzcTR6QVlXZDg2?=
 =?utf-8?B?d29NWGFuTnJjSmlGb0t4WGU0TU1WcDNJVklBY1V4SFBtczY4KzY0dDR4Z1VZ?=
 =?utf-8?B?S090cFlLR3dhVGxzUTRHc3NycVlYVUZsZmpBV2xQMHVJL1ZpS0xzTDkwVnB3?=
 =?utf-8?B?alFqRHpYb3hKNU9rQUVhdmI5ZUNTRGlZcnM1d1AvQlZzWlNibW1WS2kzbEJm?=
 =?utf-8?B?RnRBOXpUWkhUdEcwQ2daZE85NXJ1WklacGFtRWRIblhUeVRZeWY4UFQ1WjBk?=
 =?utf-8?B?eGlkbzdtM0RsWmsvUlY0ZGVsblN3TjkzZkdtSkNnQllsVGdTSnFPbUJPM01w?=
 =?utf-8?B?aHEvN05kRXc1alRVY2RFVWt0ZTJQYk1IakNCY1ErRDB0Q3VFcDRqWFJ2NWJU?=
 =?utf-8?B?TmZBNnBOZGRTL2M1RnRvcExxT0p6bWlTVkZmaVpBQTVUdVk4NndiblJBUXV5?=
 =?utf-8?B?UWxWdG81eHc5Wk10Y1dPbGJWL0lFb3NlYTRGdmFJTEl0TURYOEhad3ZIK1JP?=
 =?utf-8?B?RUdHQ1lTWjZWcjlvUW9CSTBSd3lEQkVVV1JtY1JYT3dZd2VpQlRhSG5jd2p3?=
 =?utf-8?B?WWdXZVIwYndYUXdOZlFiYkRCbzlKMysxZlBzS084WHQrNnN2U3ZpdjIxdmFk?=
 =?utf-8?B?NHFHQ0UxN3R1emVvaVNKeDExdXMrM0hxdlJ5VmswWWJHSHYxak02SUZxY29y?=
 =?utf-8?B?MVVBdGdyZkJ5R1FSdmJHMGNlcXljQjlueGc2VklEQWxlQkFtS0NRM1BZWWp5?=
 =?utf-8?B?OE96WVpFWjVOUTVad2ovYXZBL0ZiSnNtemVmMjZyM2ZQRlRyUkc4VVYvVVdC?=
 =?utf-8?B?dVdEQ2s1RHFKd2k3WEtuS3JvQmxXaDBacm1ISWhjNXFEK0NGZ2V2a3NpcXpS?=
 =?utf-8?B?d3JURytNVUM4cHJGRGpLM21meCt4Yjhod2hxbTUxSGErYmo1ZkVMUUdyTjUv?=
 =?utf-8?B?UWlnK3F6NTlkcnhRaStiMHNJSEtYY0w0TGo1d2ZRREZxQTlWQ05uem1FMXBS?=
 =?utf-8?B?bDF4QUNJKzNicVBlUTI2TkkrNWUwVlYrVnAwRzd4UVcwa28yK3dtcjQ5eWJY?=
 =?utf-8?B?MEQvM29FZXkzcEtJdy9mRGpQNHYyOFBzcGRXZGhDRGNMUzR5UUxHclM5cmRG?=
 =?utf-8?B?QnFkU1IrRy9MT0VkWGFSc3dQY3Q2eVBVcUtUbVpSYlBnOGtsSU1rY2FEV3hk?=
 =?utf-8?B?d3pNYnl5akJYcUZaV1NFdCtIMFl4VW5jeUkxOExxUFZ1UHhmeDFxRStEeU8z?=
 =?utf-8?B?azE1Y1N1U1FOTUZqMlZhcWQ5QnhlRHBiY0tEa25VWnBQZVhNR093UW9Cbk5j?=
 =?utf-8?B?REYyY0FIT1JKWFZBTjl6Zm96SzNqUmZGenJVbVFPdllVY1FMM1VTV2poTWEx?=
 =?utf-8?B?UjVxK09MQmJndXUxMUpZSXJjMFJFSTJON0lldk4vT0FXcjl3dmFIaDc0WjF2?=
 =?utf-8?B?VWRRSUgxQlpYRFVlM0llOGErS1BKT0E0RFZlY0N0YlAyU2Z1cjVnT21JeVhN?=
 =?utf-8?B?ZkkxQ3grSW5PRVpheVJGM0pJR3Q1bWI2Mm9qYlVpdG0rcUdzUnhyYVJjbi9X?=
 =?utf-8?B?K2l1MCtYbzlWSVd2SUpDbzNIUEYzOFcxbEVNZlYrZFJKOXF2Y3R0YTdrK3J5?=
 =?utf-8?B?Wlh3eWI3MGpHaFN1YzBpU3pzWmdTYmdZbjQvQ2p4QzNVM1hXNUVQdXhCMm54?=
 =?utf-8?B?NXg4S0NWOFlLQXVMWUppeVp0bml2UXNtNDdqTkJzbkR3SnljQ3k0ZVhtLzBI?=
 =?utf-8?Q?pdO4rKXb+NJ3Q7AZrgrSnfbTh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6155.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95549ff-5672-4f02-eebd-08db03804fa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 11:43:02.9650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a875245-59d8-4860-b48e-6dd959db567c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: meW5zcWKhHQm0ySTmydX5uY0CSxH7PenEaWekyc3ue3AsXHa0yhUCQtalExhpMopjYc2sJX1R2+VDsiovTaYUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0838
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

RHVlIHRvIGEgYnVnIGluIGEgZHJpdmVyLCBhIG5ldHdvcmsgYWRhcHRlciBoYWQgYSBzcGFjZSBj
aGFyYWN0ZXIgYXQgdGhlIGVuZCBvZiB0aGUgbmFtZS4gVGhpcyBwYXRjaCBzaG91bGQgYWxsb3cg
dGhlIHNjcmlwdCB0byBjb3JyZWN0bHkgcmVhZCB0aGUgbmFtZSBvZiB0aGUgYWRhcHRlci4NCg0K
LS0tDQpzcmMvd2ctcXVpY2svZGFyd2luLmJhc2ggfCAyICstDQoxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3NyYy93Zy1xdWljay9k
YXJ3aW4uYmFzaCBiL3NyYy93Zy1xdWljay9kYXJ3aW4uYmFzaA0KaW5kZXggOGU0NjgxOC4uYjZi
YjVkYyAxMDA3NTUNCi0tLSBhL3NyYy93Zy1xdWljay9kYXJ3aW4uYmFzaA0KKysrIGIvc3JjL3dn
LXF1aWNrL2Rhcndpbi5iYXNoDQpAQCAtMjIwLDcgKzIyMCw3IEBAIGRlY2xhcmUgLUEgU0VSVklD
RV9ETlNfU0VBUkNIDQpjb2xsZWN0X25ld19zZXJ2aWNlX2RucygpIHsNCiAgICAgICAgICAgICAg
IGxvY2FsIHNlcnZpY2UgZ2V0X3Jlc3BvbnNlDQogICAgICAgICAgICAgICBsb2NhbCAtQSBmb3Vu
ZF9zZXJ2aWNlcw0KLSAgICAgICAgICAgICAgeyByZWFkIC1yIF8gJiYgd2hpbGUgcmVhZCAtciBz
ZXJ2aWNlOyBkbw0KKyAgICAgICAgICAgICB7IHJlYWQgLXIgXyAmJiB3aGlsZSBJRlM9IHJlYWQg
LXIgc2VydmljZTsgZG8NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbWyAkc2Vydmlj
ZSA9PSAiKiIqIF1dICYmIHNlcnZpY2U9IiR7c2VydmljZToxfSINCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmb3VuZF9zZXJ2aWNlc1siJHNlcnZpY2UiXT0xDQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgW1sgLW4gJHtTRVJWSUNFX0ROU1siJHNlcnZpY2UiXX0gXV0gJiYg
Y29udGludWUNCi0tIA0KMi4zMi4wLndpbmRvd3MuMQ0K
