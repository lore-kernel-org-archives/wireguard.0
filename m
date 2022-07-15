Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jul 2022 07:35:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7466c975;
	Fri, 15 Jul 2022 07:34:22 +0000 (UTC)
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn2155.outbound.protection.outlook.com [40.92.63.155])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 675ac742
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2022 07:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bd+Zn9pmELrU+cViYo3vlXNkG1x1gVCIDWWHPOkEFqbk2ANIbE6qathy2nyviBSkLAP660g78qiJ7v7tUR8npMszywEMPGwDvYbaQMJbjnxwjqyzi5HzVkLqvzJ6wqHcY4A+dJdkVa2NJufE/x0boy1h+lZ8dVLG63BgzZf/VnH3971/BDI2h/9TFAtjbjYyExyyY1R9AvjVPqI+C8CBn/SDJ7N6WrWksPG9rP7pvbg4LKYErAN5XoV9QdomIGiei8INbLTodhNoZYKvZI4dKUIHfcrg3KaAG1qvjFq6b7l4Q6/GA0Y8ybS7V2TxcnzZINiqtjiUg00IXKJSzFSQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uU8apsRV0mka6vUjSn/+utawmomHVHYXdgh9vgGPQwA=;
 b=a8sM5wuqB0WDgriyjic8EqLl+bnzhjzf0VEEQcw002kgHqeq0OaqzhaFzFGvrtXqZbpWRT93ERXkfYHmjiOXVbkMfPWSMGZ9lRMrHplAXwI02Rm9P3JBSj1s+TvPzjGcIIYMpSm4Ads0VunplVfsWTqqCbH1nCqazNdG6zijlYBNO9sbMMj4payu8bdL1XJUksksz4KfzwT7swRqAzWG8A855O0p9BiGOL+31bzzHNijeq15917Idf25zoTKM6aYuKsP1NPpdt06qv7MqcpnE34WXE5gr6t8080ny+rUIPVYDxX76JrhpcnUzxUYEf0ag5QnrCbNXcNtlhtPwrunEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uU8apsRV0mka6vUjSn/+utawmomHVHYXdgh9vgGPQwA=;
 b=IJtZqwAwiEh0NhXszK22YFRcSOyW/1J0ZKsRuGq/K1xauVhKJvAWA6o+BL9Ay89IzfFA+tEnP4F9MtA5d2GiiEdOA8/Zxk61ToyqcG3/EXFrNorU1YgSwHXDGIHzxYUrrOYRNlHHJ1uheCRrmgIFJbHcHlJOhXT8vB36aES/eqDHbMgMtRYKodVyEoalcxsy4HWNlIyAoY5DlpXrVrQDmrFQwS/y6dOyOSJhjm0wI+apyLd1lb5Uw/WZfrq3ZbQoMSaovyHN+hPeGDAzilMqDU9eP1UL/MCrvPvUvbnKXfNO1G6Rr50bRVTOyWqWco5lVdKxGb1cfJybzWbXJJFsKw==
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:69::16) by
 ME3P282MB2178.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a4::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.15; Fri, 15 Jul 2022 07:34:16 +0000
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8]) by SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8%3]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 07:34:16 +0000
From: Shen Red <darkranger_red@hotmail.com>
To: "faustin@fala.red" <faustin@fala.red>
CC: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: =?big5?B?pl7C0DogVXBkYXRlIHdpcmVndWFyZCBpbnN0YWxsYXRpb24gaW5zdHJ1Y3Rpb25z?=
 =?big5?Q?_for_RHEL7/8-Centos8Stream?=
Thread-Topic: Update wireguard installation instructions for
 RHEL7/8-Centos8Stream
Thread-Index: AQHYmBz8XEJgrOUsy0mEJ7nkuGmS6g==
Date: Fri, 15 Jul 2022 07:34:16 +0000
Message-ID: <SYBP282MB04602F7E8D72EAA794403414F28B9@SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 355126d6-2c5c-ac68-619a-d149d2c86a89
x-tmn: [pWehyx54lYIqQMDIG3qloNtPplg4/0DW]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e26eb380-f610-45ff-dde2-08da66346c06
x-ms-traffictypediagnostic: ME3P282MB2178:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /WTB8h7R2YwIp0tENf+B9BQVavxboGl/MwqQBsM/e16frlNdgHnYkoc1YSm6VvB9pyfQaiZ5Xu35D560EnMs6Yz75d/wrv3BI8cU+Vk4sJY2+KBooaFd/o49xWYVzw6P46JcbyRBcXpTOoTg6R27T+lLyqLiWK/dSsqrtUyE6zFcRMq2Gs4ed1L2D86mSwvGfG8F+gkUKvWLnOr5Y9pwPmpx58gJInH7ielvsec6BNmUguHPOuHs9sfauVUXTrd71p9sAWJHRuhg0m9EbtuPi/dHBTtvVkhpn+oZSo1OutnnqLEuGFUQHBVcODr6lAMTL7r9LXViK1u0BOXbV/KPbNsbQvmXEBdKczC9zldBBDioqsXzI+6MxhTJgoqE/BanODZrlhNZPhDuzkkK32PJiJQGLuUtA/K7hPFYPj7/PEfKZCotneWiCcOrLU+f9ia91JuOPDh+pDTfv6q5Y2yJeQ2N7AnZ+LlgOa8sZzIpRPbSGUwqFst175d/K3gQ7hX3bdY/BkMbM/al8kA/uRfKO7nd6lfF21W7nzBkl/5rMfy/lQdP/F3SgfqUwrTfUPyj//pnns5dvjRP/nNdZT8xnVkzLdfS9JJ1svt+HZz44yU6K8n5Qja0DfIvHt/UXZy4OPgMUNAqQNKq3XotYZVMS6tLr6g020oFiQ3Lf0U/9FAY8uUwdHm8h4U+v+9Ny3LIWAAKZscfASzzqDV+cLTgAw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?cEFVcXNCVzVrV3pXWGVIRzFCT1M2ck5Odnp4TFJYNHFDcTdicVVmNTlBRzc5eGk1?=
 =?big5?B?cUFqUk9vVUc4dHU3VFQ3b2hISFQzNy80UHdMSS9TcGZSMTd2Skk0VTk3NVpQRkpy?=
 =?big5?B?dUt1RG4xYVh0MDFjSTczYUc5Y0JiSlh6MWcybjBDMVIvUHZ2bUhSQmwwM0t4WTA1?=
 =?big5?B?czI4dTZ4bjRpZjNiODdja3BvTjZnSityS0xwSHBLNHpRNG10QjRaZVMxYWo4aW4v?=
 =?big5?B?Q1FreDQ2U1Y1cnFNWStwOWx2NkxhSjlhUzFwL0VIUzUySDZNakFRSTA1Vkp2TGli?=
 =?big5?B?ZHpBbHJrUzJwdnluTGJFc3E2eEZNU1ozTU9JN2VFWHBhSFFQMTdnbzJhU2dJOEdR?=
 =?big5?B?ZHlIdytwZnRqY0M4c3pKTGJYeUcxZ0xXQlhnNDNFbzNPT0xPMHI5c1R2aE9RZHFU?=
 =?big5?B?cXRoMFB2UzZpR0hZeDFjOXFGbFhxSWFkMkcyakhSVmFROTBZRGZpNXJlYlIzemdt?=
 =?big5?B?YVg2NVVjYzhzdzBGSm92bWs0QTl1MXJzd2hyYlk2Y3pzV25KczU5MTJ2ckF3NU02?=
 =?big5?B?N0taZkxHNEpFall1YU8rYm4zbm1pMEt4VnZrM1B3dG95aFNvY3FWSDNSRGRsNlcv?=
 =?big5?B?MG1WTHZBcGw0Wm9PME9YUGV6Mmt3YWVVaHZ1ZGZBdVo2RVNYb3RqSVAvQ0ZFS2Z4?=
 =?big5?B?SzdkNGFhRkVrNUtOTjZvYWJpelVZdGtLMktuSlNRcVNSdVNKYjVzanYyelhxbkpG?=
 =?big5?B?RlA5OXVVa1BQTldNU05LR0E0SEZFVW9NcTduazlScHJ6aEl0bXI5NWo3b0NCRi9z?=
 =?big5?B?dTFGcFM3NmVqMXIxRy9jSHozdHc2cHVFZ3gxWm1HZVp6ODdZb1BGUXYyMXhWa0lo?=
 =?big5?B?UUo1Q2JobldtUW9pZ3BIWmg1UmUyVHVDQ0tSaWR3aktCU05INjlXK01VZ3o5T2ti?=
 =?big5?B?aXhIZlMwM3FmQjZmVG1TOUNOc3VSb0VmUXZZT0d4OVNLR0s3OWZoM0lEbmNvZVlp?=
 =?big5?B?K2FYaXNXNEUrUVVuWUtkYVpDZE9kdnBkdFoxUW1CZExXZzZ5VXZ4YlhlOGhrNDlz?=
 =?big5?B?N0dFenhMK0JFWWxEQmFiU1UxQkdERE90RHBHN2lSQlNBbFVnc3FRSDJlNm9ZTWdQ?=
 =?big5?B?WnduVWdHQ3NBL3BxdFUxVEtrZGZZcFdmblRpVURTdkIyaXg1U1hXL091WGRSUWR3?=
 =?big5?B?QUtBLzFIeWFOU21KU2JCR2JFb0cvTWFic2tmRy9Ta1hqNXpWRmJ0U291UEptM3ZP?=
 =?big5?B?c1c2RE5IVE1yUnEvanZtem1zUjBLZW92VkUzNlNrQ1dkUDdkRFQzeUZIR2duYjVU?=
 =?big5?B?Z0RJL0pqVklIL2YyRDIzVXdLNk1ZWTNaZjNNaTNBaXJ0N3QzQmllSTZWbm1tMkZF?=
 =?big5?B?YmdJeWhCZStxRDNpOXhja2Jvd0hac1c1eWh5eFhhZUFTbTdNYzZtc1YyMDdoZ21n?=
 =?big5?B?bUxOY3UrSGZSMkJlbkc3dzMvditzdUFsMTE1OTQ4cFNUTmxCTVpXWWVPblFPaGZp?=
 =?big5?B?ZnNPcElVd1NUQ0hicTNqTlNVd0NDb0JFaG5qTzQ0YVNnUFBaMG41UW5Ia0FBU2Q2?=
 =?big5?B?SVZ0N3A2bkZubzR4T3VTZGhpdHVzVXRuZ0JvNVB3eFgzQUFVWldLbHR6eFQ1OEoy?=
 =?big5?B?aGlPWUNPUTgxRXl0K2tFVlloN0JhWGJuUEZCN0VNU3QybWdkTWl6WHJDNi9lcXRT?=
 =?big5?B?K2l3Ynp3PT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e26eb380-f610-45ff-dde2-08da66346c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 07:34:16.2443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB2178
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

SSB1bmRlcnN0YW5kIHlvdXIgc3VnZ2VzdGlvbi4gQWx0aG91Z2ggSSBhbSBub3QgdGhlIGFkbWlu
aXN0cmF0b3Igb2YgdGhlIFdpcmVHdWFyZCB3ZWJzaXRlLiBCdXQgcGVyc29uYWxseSBJIGRvbid0
IGV2ZW4gc3VyZSBob3cgdG8gdXBkYXRlIHRoZSBpbnN0cnVjdGlvbiBwcm9wZXJseSBmb3IgdGhl
IGN1cnJlbnQgY2lyY3Vtc3RhbmNlcy4gQXMgbXkgdW5kZXJzdGFuZGluZywgdGhlIGluc3RydWN0
aW9ucyBmcm9tIHRoZSBXaXJlR3VhcmQgd2Vic2l0ZSBhaW1zIHRvIHByb3ZpZGUgdGhlIGJlc3Qg
cHJhY3RpY2VzIHRvIGluc3RhbGwgV2lyZUd1YXJkLiBCdXQgdW5mb3J0dW5hdGVseSB0aGVyZSBp
cyBubyBiZXN0IHByYWN0aWNlIGF2YWlsYWJsZSBmb3IgQzhTIGZvciBub3csIGVhY2ggbWV0aG9k
L3dvcmthcm91bmQgc2VlbXMgcXVpdGUgdWdseSB0byBtZS4KCk9yIHNob3VsZCB3ZSBqdXN0IHdy
aXRlIGRvd24gbGVuZ3RoeSB0ZXh0cyBvbiB0aGUgcGFnZSB0byBkZXNjcmliZSB0aGUgc2l0dWF0
aW9uPyBJIHRoaW5rIGl0IHdpbGwgYnJlYWsgdGhlIHNpbXBsaWNpdHkuIFNpbmNlIHRoZSBTdHJl
YW0gaXMgdGhlIGJldGEvZXhwZXJpbWVudGFsIGJ1aWxkIG9mIFJIRUwuIFRoZSB1c2VyIGJhc2Ug
aXMgbG93IGFuZCB0aGUgZGVtYW5kIG9mIHRoZSBpbnN0cnVjdGlvbiB1cGRhdGluZyBmb3IgdGhh
dCB1c2VyIGJhc2UgaXMgYWxzbyBsb3cuIENvbnNpZGVyIHRoYXQgdGhlIENlbnRPUyBTdHJlYW0g
OCBkb2VzIG5vdCBhY3R1YWxseSBtZW50aW9uIGluIHRoZSBpbnN0cnVjdGlvbiwgb25seSBDZW50
T1MgOC4gSSB0aGluayB3ZSBtYXkgbGVhdmUgdGhlIGluc3RydWN0aW9uIGluIHRoZSBjdXJyZW50
IHNoYXBlIHVudGlsIHdlIGdvdCBzb21lIGRlY2lzaXZlIHNvbHV0aW9uIHRvIHByb3ZpZGUuCgpU
aGVyZSBpcyBhIGJ1ZyAjMjEwMzg2NSBhYm91dCB0aGUgcmVjZW50IFdpcmVHdWFyZCBicmVha2Fn
ZSB3aGljaCBJIHN1Ym1pdHRlZCB0byBSZWQgSGF0IEJ1Z3ppbGxhLCBhbmQgSSBkb24ndCBzZWUg
YW55IHJlc3BvbnNlIHlldC4=
