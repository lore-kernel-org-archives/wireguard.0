Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78F8C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 17:21:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2422226A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 17:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2422226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eagleeyet.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ec09d9c;
	Tue, 5 Jan 2021 17:14:20 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab7ce5b2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 11:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7HgPdqoUWZHpS3tN4Xxv1V70beqh+elEyaqj9rinIv4X5miLarPETANTAyOBz//nBfLpOFw9ukD/kgL60rwfcTl3Sos4Aqo0GIu0bs0QxWUjasocUwK1RI1qrdejnHteNDy8fQR5Hz/WDNGfDCgi8khztUsRtEWoIdi8sp6xB+jCz+SO9pG/vGimlNPd6B2HHmDuXnnKwBNx+rd5K4zTBl4qmK4C34/KUHL0TKWX8EAnWFPFV/IOCmweKOKKNKavzycnSCNWmRHPDj6hHq0Wpi8VBbjrPBSObPFzI1yLG0DvoI26VgBdTt0kiwHpk+p5Nxk2vLIDwUSRkGHLVejjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp/O63tgHpJ++wP740En1aK4m4MrrxGW7xgztC63rxs=;
 b=SzGhbVZoORK5A19PfyXGUPehrL/NNRtlVgBRy86MFt36tjYXWhX2Oo2AXNvsjRxxVZA3UpeB2j5VrOrDm5eYaNgXIVAg9Yw6kbtrgrD3Mqfnzw1ybGv7g4iNjlvZO/lIsLA8kfZVlGeo1fGHof0/2MQpKFxguwtlHaHrwBkqMiivKFog/W/UJBhBym8wY1NPmk//mpcqnnjA/7s23JXQZlicJku8WNi4Q2EoDH52d/Q/o6/yNJI3WyCTYuyf4s5tca+EWceDJAnehrlODajrXpVviX+Bgj5QsJkLkbAyuEsidEO5/6tmYTXnNGrZk9NMWEyQViF7MLB8QCb5TBD1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eagleeyet.net; dmarc=pass action=none
 header.from=eagleeyet.net; dkim=pass header.d=eagleeyet.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eagleeyet.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp/O63tgHpJ++wP740En1aK4m4MrrxGW7xgztC63rxs=;
 b=MJYttDRVwZwxjynUBxYX8yhK/UrtItuEU9BbnQ9IiB4aBowkL4qOaq7oWjgtH2vr+SmijlDFg5FXRXb57kZZXUfAoL8G0D2SQyzeZ03wrM0sPfsPLxpTAJRol0xzMlzZ0cdc1fyvL4wl0z8/QFTQe40lZ8mW/6HUr0z2cOoJMuU3IErT10laVNQFHbLR/XYEn8zj9HYiFbhNba6jHdfoxf8UOiluqOs0YXEanRf0KDmBtr6CczIEKMduiuCslM9Av6ETBfBpDJR8yUmn8BNz62oBxYZSuIlG/fOreOdcxnhYD79XyNKtCNGFDdElzigRnONj1ycnQedMywcvS0JEhQ==
Received: from VE1PR08MB5837.eurprd08.prod.outlook.com (2603:10a6:800:1a9::23)
 by VE1PR08MB4719.eurprd08.prod.outlook.com (2603:10a6:802:a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 11:25:59 +0000
Received: from VE1PR08MB5837.eurprd08.prod.outlook.com
 ([fe80::bdae:c261:cb1d:18ad]) by VE1PR08MB5837.eurprd08.prod.outlook.com
 ([fe80::bdae:c261:cb1d:18ad%3]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 11:25:59 +0000
From: Jonathan Aquilina <jaquilina@eagleeyet.net>
To: "noloader@gmail.com" <noloader@gmail.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RE: Wireguard not available for CentOS Stream
Thread-Topic: Wireguard not available for CentOS Stream
Thread-Index: AQHW4g2S+ZhpeXHftEaPQFasgfiZ0KoWrIiAgAC+zICAAJkgAIAA4a/g
Date: Tue, 5 Jan 2021 11:25:42 +0000
Deferred-Delivery: Tue, 5 Jan 2021 11:25:00 +0000
Message-ID: <VE1PR08MB5837188C79F58A014916E123A0D10@VE1PR08MB5837.eurprd08.prod.outlook.com>
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
In-Reply-To: <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=eagleeyet.net;
x-originating-ip: [83.142.248.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 775e1a67-bbb9-48f0-5efd-08d8b16cad68
x-ms-traffictypediagnostic: VE1PR08MB4719:
x-microsoft-antispam-prvs: <VE1PR08MB47194E4F179C188067F4D3B1A0D10@VE1PR08MB4719.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zM9pz/MwjW5Q0Y6B6bLx6kZYdtGQZTuu5eUKAxRfkNIVTCEkkhknrEdJ++1vtx8qKNSmlc0uX6IEFdHk3VVRET/IpFhr5JjluVXlPCR1WeRlEMyX7S4wtQU424EvmENUYNnrkQCsQK/Y60Q0qaVYIhwgUEzx5U2nsXuTGv66cee7lutRxjpKsrELf2Q0G/r+tx+LHaZmtsHUng4BoLgOravAFxKhf1rBUDvu89rYsN8FjcGmqa/xO0vJkDykPXlJym/374CHC1HEPdVQZekGdG9/XvKNl3kOE6QS9Wf8RunEVt5Zq1PTh7XRkmGe2BHiNNQVesz6uPcdhRlvqOtqiUdYm0j7KD0r7Zo81MkEFy7uewG5duLc1AkwIqyK8HYm+i5ILN2gpMaft1EysfFU1SL1N5qk9xIrvRsje/t1HcSQe2T6WgtyFJk2rZjNfzEzcMz10FrZfRh3D+ZwqX1BSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB5837.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(5660300002)(55016002)(186003)(53546011)(508600001)(6666004)(6506007)(71200400001)(9686003)(4326008)(110136005)(966005)(2906002)(66446008)(33656002)(8936002)(8676002)(64756008)(52536014)(26005)(66556008)(66476007)(7696005)(83380400001)(66946007)(76116006)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?b0NkcTh0TW95MXJwamI5OUs1bHlLbldyN2V1MHE5Z2dvMUlsNjZlWFV2MWpH?=
 =?utf-8?B?Rm12SDQ1MkxQNXVUOXpOQWpnYVVTMDlVaUV6SmRUTWJLeXJzaUZIWnBGODBK?=
 =?utf-8?B?RC8wK2ZLSjUvZUtHNTFTRXJPbWN0eXFWYzZxNVlDMXBNTS95Nyt0eGJvMnFn?=
 =?utf-8?B?YWoyVkRGZVowaHFBbjFLUlR1NEVURmJuS2Q0VUNudk1FbENvbkNsUGJkaHhZ?=
 =?utf-8?B?a2tMMFI4YzVxK1RJTWZKcFNiLzg0M25kUGJjS3YvZjhJWFR1Vnc0VTFEaldm?=
 =?utf-8?B?S2J6S2JUbzUzWjFSUmx2SmxTTFBkaFFpbDAxR1RFWld4MjB5K1lVNmxKRWNz?=
 =?utf-8?B?SWhZVTh6REZKRytNN1l4a3hqRGppejA2WDBtWExtbDIwSDlFdjFOeXNXdEVY?=
 =?utf-8?B?R3E1NXhkVWNjZFQyczdTOTNwQmdKaS8yeWw4VjdMMzVBT24zRTlWZ28za3lV?=
 =?utf-8?B?Rzd2dm5JbHBlQXBUaGxNMFVlTWVJNUlwdzJGWmdNSjZmaXQ3OE9ncGdCSlRt?=
 =?utf-8?B?OG1BU3R0Qm5pWnNZR2RmRmpCN3c1bkFZL1dhUGFmWUVRaTBtc0dEUktCaHcx?=
 =?utf-8?B?MXdqdWZnR1RoTzNGL3BqVGVRKzBxbFZhY2FvRUxKay9aVTVLMVgvbXNoT3h6?=
 =?utf-8?B?QjN6ZUF4Mkk4SGdzWitMcG1CY2Z0VUF3MDJhY1Fpak5IaU92VTVTb1JlSm9m?=
 =?utf-8?B?RUQ4a1ZqSSt0bGgvMmI3bGo0Qk5JbWlISFNQVU5LWExib3VOc1RKOCtpbE8v?=
 =?utf-8?B?enZrSXh5TjdXUVd1VUFkNlgwdnVCc2xCS25mM0psZnZIZ0FKdGhvZTQ4OHQr?=
 =?utf-8?B?WXVoOTlXazFRYThpWFo3SXRwbFc2bHNKSTFORzNIUTFCNW1meGFoZ3EyNDJy?=
 =?utf-8?B?ODRDREhCQVFURm9WOTVqK0FzVmo3amRtVXdTMGJPd1RYa0RiNGhncHAwRklk?=
 =?utf-8?B?WHQrOGRuUFhBNjhTaVE3TFFWdldrYnVaRzlEQncwcmh3dzVPZlRvYWxtTHdr?=
 =?utf-8?B?bmVzVUN5dXd6WU9TdkREaHVCVHdoQlBoSVMrTUE4NzFJVTgvUXNsdW9mWFdJ?=
 =?utf-8?B?VkRyNWZwZXEzSCtzQTlCTnNIUEVQeXh4Q052NDU5K3ZBalFrOWlmaFZ0QVVi?=
 =?utf-8?B?LzZDQzdhMURjSEJFVnpEdVk3K2pGd3FYa0QxeXA5WGZ0MjQ1YVphTkxubUp5?=
 =?utf-8?B?SXVBVVFPZWQwQkh6Q3M5bmJqRTNKYm9Lb3BKR0tCWnNrZ3RMT3JDdlJmVUpQ?=
 =?utf-8?B?VmtyMmxlZHFyY0ZYakx4M01ib0hiSUVEVjZaWUZ0RWpxTnBSamVNWkVabjhr?=
 =?utf-8?Q?nxUCZAP16b4ho=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eagleeyet.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5837.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775e1a67-bbb9-48f0-5efd-08d8b16cad68
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 11:25:59.5882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 689fcbc3-edb4-45aa-9f50-cf9ecb3e505a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjeO5y6vnhA/HWhyCg351jpg50/8NbFfqKE3rADj1VpzzziRUi7uTvg/wfw8EJl7dn4uhy9aYTaaUzztDXrybQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4719
X-Mailman-Approved-At: Tue, 05 Jan 2021 17:14:15 +0000
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

SGksDQoNCklzIEZlZG9yYSBhIHJvbGxpbmcgcmVsZWFzZSBzbyB0byBzcGVhaz8gSSByZW1lbWJl
ciB0aGV5IHVzZWQgdG8gY2FsbCBmZWRvcmEgdGhlIGJsZWVkaW5nIGVkZ2UgZGlzdHJvIG5vdCBy
ZWFsbHkgZ2VhcmVkIGZvciBwcm9kdWN0aW9uIGVudmlyb25tZW50cyBpcyB0aGF0IHN0aWxsIGFj
Y3VyYXRlLiBJIGhhdmUgb25seSB1c2VkIGl0IGFzIGEgd29yayBzdGF0aW9uIGRlc2t0b3Agd2l0
aCBLREUgaW5zdGFsbGVkLg0KDQpSZWdhcmRzLA0KSm9uYXRoYW4NCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFdpcmVHdWFyZCA8d2lyZWd1YXJkLWJvdW5jZXNAbGlzdHMuengy
YzQuY29tPiBPbiBCZWhhbGYgT2YgSmVmZnJleSBXYWx0b24NClNlbnQ6IDA0IEphbnVhcnkgMjAy
MSAyMjo1NQ0KVG86IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPg0KQ2M6IFdp
cmVHdWFyZCBtYWlsaW5nIGxpc3QgPHdpcmVndWFyZEBsaXN0cy56eDJjNC5jb20+DQpTdWJqZWN0
OiBSZTogV2lyZWd1YXJkIG5vdCBhdmFpbGFibGUgZm9yIENlbnRPUyBTdHJlYW0NCg0KT24gTW9u
LCBKYW4gNCwgMjAyMSBhdCA3OjQ4IEFNIEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQu
Y29tPiB3cm90ZToNCj4NCj4gT24gTW9uLCBKYW4gNCwgMjAyMSBhdCAyOjI0IEFNIEpvZSBEb3Nz
IDxqb2VAc29saWRhZG1pbi5jb20+IHdyb3RlOg0KPiA+DQo+ID4gaHR0cHM6Ly9jb3ByLmZlZG9y
YWluZnJhY2xvdWQub3JnL2NvcHJzL2pkb3NzL3dpcmVndWFyZC8NCj4gPg0KPiA+IFRoZSBvZmZp
Y2lhbCBES01TIGluc3RhbGwgbWV0aG9kIGZvciBDZW50T1MgaGFzIGEgU3RyZWFtIHJlcG8gDQo+
ID4gZW5hYmxlZC4gSXQgc2hvdWxkIHdvcmsgZmluZS4gTGV0IHVzIGtub3cgaWYgeW91IGhhdmUg
YW55IGlzc3Vlcy4NCj4NCj4gSXQncyBhY3R1YWxseSBwcmVzZW50bHkgYnJva2VuLiBJJ3ZlIGZp
eGVkIGl0IGluIHRoZSBtYXN0ZXIgYnJhbmNoIHdpdGg6DQo+IGh0dHBzOi8vZ2l0Lnp4MmM0LmNv
bS93aXJlZ3VhcmQtbGludXgtY29tcGF0L2NvbW1pdC8/aWQ9ZjdmNTU0NjRhMTU2ZTENCj4gMTgx
ZmE3NmQ5YzdlMmZjMGQ0OTVmMjM1N2UNCj4NCj4gQnV0IFJlZCBIYXQgc3RpbGwgaGFzIG5vdCBm
aXhlZCBvdGhlciBidWdzIHRoYXQgd2lsbCBlbmFibGUgb3VyIENJIHRvIA0KPiBjb250aW51ZSwg
YW5kIEkgd29uJ3QgcmVsZWFzZSBmb3IgUkhFTCBhbG9uZSB1bnRpbCB0aGUgQ0kgaXMgZ3JlZW4u
DQo+IFlvdSBjYW4gY2hlcnJ5IHBpY2sgdGhhdCBpbnRvIHlvdXIgZGttcyBwYWNrYWdlIGlmIHlv
dSBuZWVkLiBJIHdyb3RlIA0KPiBSZWQgSGF0IGEgcGF0Y2ggYW5kIHNlbnQgaXQsIGJ1dCB0aGVy
ZSdzIGJlZW4gbm8gdXBkYXRlZCBrZXJuZWwgeWV0Lg0KPg0KPiBNb3JlIGdlbmVyYWxseSwgSSdt
IG9uIHRoZSBmZW5jZSBhYm91dCBob3cgbXVjaCBJIGFjdHVhbGx5IHdhbnQgdG8gDQo+IHN1cHBv
cnQgQ2VudE9TIFN0cmVhbS4gQ2VudE9TIG5vbi1TdHJlYW0gaXMgYW5ub3lpbmcsIGJlY2F1c2Ug
aXQncyANCj4gZGV2ZWxvcGVkIGJlaGluZCBjbG9zZWQgZG9vcnMgYW5kIGlzIGV4dHJlbWVseSBz
bG93IHRvIGZpeCB0aGluZ3MsIGJ1dCANCj4gYXQgbGVhc3QgdGhlIGNoYW5nZXMgYXJlIGdyYWR1
YWwgYW5kIGl0J3MgZWFzeSB0byBrZWVwIHVwIHdpdGgsIGJ5IA0KPiB2aXJ0dWUgb2YgcmFyZWx5
IGNoYW5naW5nLiBJbiBjb250cmFzdCwgQ2VudE9TIFN0cmVhbSBpcyBmYXN0IG1vdmluZywgDQo+
IGFuZCBleHRyZW1lbHkgdW5zdGFibGUsIHdpdGggYnVpbGRzIGZyZXF1ZW50bHkgYnJlYWtpbmcu
IFRoaXMgd291bGQgYmUgDQo+IGZpbmUgYW5kIEkgd291bGQgcHJlZmVyIGl0LCBzaW5jZSBpdCBt
ZWFucyB3ZSBjYW4gaW4gdGhlb3J5IGdldCB0aGluZ3MgDQo+IGZpeGVkIHJlYXNvbmFibHkgZmFz
dCwgYnV0IGFjdHVhbGx5LCBTdHJlYW0gaXMgc3RpbGwgZGV2ZWxvcGVkIGJlaGluZCANCj4gY2xv
c2VkIGRvb3JzLCB3aXRoIG5vIHZpc2liaWxpdHkgYWJvdXQgd2hhdCdzIGdvaW5nIG9uLCBubyAN
Cj4gY29tbXVuaWNhdGlvbiBmcm9tIFJIIG9uIHdoZW4gZml4ZXMgYXJlIGNvbWluZyBvdXQsIG5v
IHJlZ3VsYXIgb3IgDQo+IHJlbGlhYmxlIHJlbGVhc2Ugc2NoZWR1bGUsIG5vIHJlbGVhc2VzIGZv
ciBtb250aHMgc29tZXRpbWVzLCBhbmQganVzdCANCj4gYSBidWd6aWxsYSBibGFja2JveCB0aGF0
IGZvcmNlcyBhbGwgcmVwb3J0cyB0byBiZSBwcml2YXRlL3NlY3JldC4gU28sDQo+IHVuc3RhYmxl
K3NlY3JldGl2ZSBkZXZlbG9wbWVudCBtYWtlcyBkZXZlbG9waW5nIGZvciBDZW50T1MgU3RyZWFt
DQo+IG5lYXJseSBhcyBmdW4gYXMgZGV2ZWxvcGluZyBmb3IgbWFjT1MsIHdoaWNoIGlzIHRvIHNh
eSwgbm90IHZlcnkgZnVuLg0KDQpGcm9tIGFuIGFkbWluIGFuZCBkZXZlbG9wZXIgcGVyc3BlY3Rp
dmUgSSBmaW5kIEZlZG9yYSBTZXJ2ZXIgYSByZWFsIGdlbS4gU3BlYWtpbmcgZnJvbSBleHBlcmll
bmNlLCBJIHdvdWxkIG11Y2ggcmF0aGVyIHdvcmsgb24gRmVkb3JhIHRoYW4gQ2VudE9TIG9yIFJl
ZCBIYXQuICBGZWRvcmEgU2VydmVyIGNvbWVzIHdpdGggdGhlIGxhdGVzdCBzdGFibGUgdG9vbHMg
YW5kIGRvZXMgbm90IG5lZWQgdGhpbmdzIGxpa2UgU29mdHdhcmUgQ29sbGVjdGlvbnMgKFNDTCkg
dG8gZ2V0IGEgbW9kZXJuIEFwYWNoZSwgUHl0aG9uIG9yIFBIUC4NCg0KRXZlcnkgeWVhciBvciBz
byBGZWRvcmEgU2VydmVyIG5lZWRzIGEgRE5GIFN5c3RlbSBVcGdyYWRlIChodHRwczovL2RvY3Mu
ZmVkb3JhcHJvamVjdC5vcmcvZW4tVVMvcXVpY2stZG9jcy9kbmYtc3lzdGVtLXVwZ3JhZGUvKSwN
CndoaWNoIGlzIGxpa2UgYSBVYnVudHUgZGlzdC11cGdyYWRlLiBJJ3ZlIG5vdCBoYWQgb25lIGdv
IGJhZCBzaW5jZSBJIHN0YXJ0ZWQgdXNpbmcgaXQgYmFjayBhcm91bmQgRjEyIG9yIEYxNS4NCg0K
SWYgV2lyZWd1YXJkIG5lZWRzIHRvIG1ha2UgYSBSZWQgSGF0LWZhbWlseSByZWNvbW1lbmRhdGlv
biwgSSB0aGluayBpdCB3b3VsZCBiZSB3aXNlIHRvIGNvbnNpZGVyIEZlZG9yYSBTZXJ2ZXIuDQoN
CkplZmYNCg==
