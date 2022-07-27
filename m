Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDECAC04A68
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Jul 2022 08:38:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7d353914;
	Wed, 27 Jul 2022 08:38:33 +0000 (UTC)
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01olkn2147.outbound.protection.outlook.com [40.92.62.147])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1ca795ca
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2022 08:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9K1F7puMqz5Ct1pMllsymV9lPH06ZZpRiThGc8OOBz662ci6zOVkWa/1swmi3iIXbcc2f113/YbME8BDHvwhz+ox/xMWjqk0atOOTiFbPC7QLdka1Wf6CtBAlVonDbB8LhOqq6EmS1omxermsnfxIRRAsg0cJHjRHyI3czmyzWuuWKkA2zZYwqIukFL3SjEuYH7rAQr0h1aKeux4KtzJGwi+6Xg33I9mDBLq1SUO/Bnr7aJ+KKE5Q1cibSqU1eVAVoin6RuhB0NP/m0PhO+8JipCXKz9sGZS4dFwsSkcujA7lRdBxloT76NHUIYf+2JNhoavDElqQF50qNPvf3EgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOSVvM/bo7t1whYaMLiATFKuGXnekg1JXtpc3bFtqYQ=;
 b=kO3+/2489Bu7dksmRDJdkXFG4Nw3tJEwBGvKrws5o6e01IU7x7dkE48SZuly0LV849CCmCsMCkaHGlQ9B2xI9F8Hcsbc24dz4Z4Dg2XmH4/6qSXl3g6zL3vwmxbZ/VC9zSxY/cvuz6eYdYPfCf1LJrilriOsCJh4SzTtPjO6jmdDpiS2EujwANRYj1a4UHByhjAGUCsKB0GMPFdGDcUcGso5RBWGV6xFKFvxQgQYi8mYv9yOhaTkebYNu8vn0MakCbsW5QF9x6imVag/m4qIHaEBEPS5KXs1bhyCZOv/SJHyjGxwS0uXov8kJxUXM80d2rk6kVyr2LXxRc92OuHOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOSVvM/bo7t1whYaMLiATFKuGXnekg1JXtpc3bFtqYQ=;
 b=Od51LAGa8nasJ3t5NC+pfCX1oClCmPw8o4+x4bh0lwbUIfPoU78U4HrmIfTmnnwtoqMq+4ePFku66vOhxpjxCH6PNgfdybqdVc2Gwn8wUtH8ULZb/11PxtVFdAADg00Lwo5tXectJTrKy5UcG8faqReJUjt8ZIBX2bzHmvCpgJpxuYCAHr4Y8+aGIn9vG5HiUqHTiFJ0V7sYSwkb15ht4U1fz7CKu6DAUnGHkAqhfoe1npSoc0Ao4CXzQSvJxandfjlHQL5Mqm/FHWRjjvRaZeone/aI1NS+F1BMCybb2uiopip0ZwkJO0QR2AUWqAs2CEoo6qSlO6RUnYqawYTzsg==
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:69::16) by
 ME3P282MB1202.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:8e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Wed, 27 Jul 2022 08:38:27 +0000
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8]) by SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8%3]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 08:38:27 +0000
From: Shen Red <darkranger_red@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [PATCH] compat: don't backport ktime_get_coarse_boottime_ns to
 kernel-4.18.0-394
Thread-Topic: [PATCH] compat: don't backport ktime_get_coarse_boottime_ns to
 kernel-4.18.0-394
Thread-Index: AQHYoZQoONWfvJID7EmkKSTro1Ev3g==
Date: Wed, 27 Jul 2022 08:38:27 +0000
Message-ID: <SYBP282MB04604E97C0764B3D6FF3D27FF2979@SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 91445e39-7baa-e548-7ece-4f3ea2716915
x-tmn: [LcFsESUz0AKTqmYYo4YK3SlsMjE6vewq]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d5ce8b6-3d69-48b8-5b41-08da6fab6050
x-ms-traffictypediagnostic: ME3P282MB1202:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vva/BQn0QsRhOY6r5DdIYqONdhLfu4Z1ATCdl8qigkHsOm8Ps9GB9uO3yI28Vh/IsCaPRtfkWOoAJ/5MPHAiPaVnS8YEgWj8+A5Qsy/rFoTDSYiJop5JPM/t4iHnPUZQ7mJXl0bWP0D9kMKrgaWu0+3puwPjzdFVpC8kU9peaTo8ToRH5hPaGjDWooCeh1ORMEx9uwaXQ0/3mF2d4eTzChu/7M9g7ABXBtbtq7iOy6MT7DM47BTYU9gNPZwabkpzCdVlRdcbcKkyHHdowQvBeS14m6faRWD3ahG2Fbg7hCkQdCITc9U2fggvUiNvPYdH24fShVFBZjwS5BaZEk3tdQl/KzDBy3j18d5cyEtUTu3jpd8Lz7n9PRB3BUkQD+pfSpbS3bGwt5sHtGAdaPiWu9zcjaegrqM8eeK9iLaeFTpgFyTYtD67J++/LFPBBJKgYcw26sfaTFe6EPiCS1LleGmZfI+L8tyaXK4kHuJrpK4dWGfiwcpyXMsAAP95h9MY9nE32tAqec+TrIL2cLqOTPWkSSQHre39UVeOmRpKVc5GbZL5GvH666UGxUkW7aHIJBE7vL5KQ44aJSxkNjwtZh4wRYgq+Q6DvcbrpdJpdQCZDuchQPmddcsezG59sMem1UCNU5sKFOK6vkxrhfkfw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?TUZ0RDNJbmE1ZFE1bWFqKzYzR1BJcFBuSlhmQk45Y25mb3M4SzlwSGE5c0g2aXpm?=
 =?big5?B?bVVycnptK3ljTUdnbFB0VEI0QVhUMUxSdEJnNmEzQTBaT3VJYnFEMEJKeVFuck5L?=
 =?big5?B?cDdzYVAyY2hoeVpxV2oxL3ZYZEw3ZU9qN0dWZHVTdGUxbktCRStwQ0liNU9WMWw5?=
 =?big5?B?MDQzVHNHSjQ1QXZrVnArQndjd05UcGNOcWZqVC8zNUhCQWxIOERUV2drOVNXRXlD?=
 =?big5?B?Q3VmUXh1Wkcza3dxRDFJczZuZkpuci84REZ4RDFsMVJ6dTQxVnR3WkxaV0ZPSmVZ?=
 =?big5?B?UjFSK3RQNEZwT3k5dVg4Nld5RnhSN1J6dEtqQlcvZFJkNFFpck54akNtNXFKQWMz?=
 =?big5?B?c2hQdjkyL1QwTmYwSmFJUUZONnJkd2RaYzhXZUc2Wkt4amhsRUMyVk8yRjdQVEds?=
 =?big5?B?Q0ZDc3hMN1JzZUFyYm81Wkg2K1o3cGNzSUp2WXB1RzVYUU1zeUNmUkF4WEYva2lo?=
 =?big5?B?bWM5Uno2bGQyWHlJM2ViU2ZteVJHODhEQzlaaHRlVlZoN2NsV2NqK1QxMnlza2lF?=
 =?big5?B?c0N1eXRJS3BpOUVNZ3pyY1M4aE52Vy9tTXpMZHhiampSNDhUQU1rQUNTQjVqcXJH?=
 =?big5?B?a0dlNkQ5b3BVOURFWWV4ODk5dTJDYnRzQWsrT0NJa1hFUGRoeVpPQ2RWSnc2cUN0?=
 =?big5?B?ZjMvY21Hb0JVQzczYzE4SVNTMzI2VVRqVWdDV0wzLzRGamhxOUs3UkZGbzNic0hi?=
 =?big5?B?MDNNTENkRXZWd2V4UmFkUEY5dTU3RmJKbEFUMis5bjRRbDF0enluOWxtbFdNb05n?=
 =?big5?B?cWVleTg0QmU3SkQvMWRWZ01STyt3dXc5K0lOTUF6d2RZbHhDUjFCTEZHQko2Ukl2?=
 =?big5?B?VVRaRktFRXdPRkZWUXl0V2hOdkxCbmxmT0s3ZlZQMFl6aURoYmpUT1A3YWpZVklC?=
 =?big5?B?dFhVN2lDanF4WlkvR0RUSWUxdERvWHRpOGpyczA1N0Z4alJVSThRTWlHZVpFdTBG?=
 =?big5?B?ZkpVZnN5a1FEV0FRL0RRVXNuSzFISDBRRGJkWXh2dm1kbncxbTkycjdtNGFhZHdu?=
 =?big5?B?UjlqdDhWZktwY1BEcE1sYVRvODR0VU83ZG5CaFVNU3ZlZ0FkR0VwSTVFdGZrK242?=
 =?big5?B?S2RWU2JXU1RDd2FEYWE5bFhPZk5jTUd1dS8wT0g3MmI2OXFKNS9TV3p4SHNEV01Q?=
 =?big5?B?TVJ3OWlCK3Vyb0hnSFFBUkZLTGJEZVB1c2FiVmx2ckdVOU45dVBZTEhHdEg2MGRl?=
 =?big5?B?bTVnNWc4ZC9kaVc2QUZGVGpzQUpkNUFvSEMrVWVKK0hjSkdSWmxJMmpRVDhvWnJ2?=
 =?big5?B?bElxZFBvTWM5S0ExcXBBaXFSZW1ndjltSU92YXBJMlMzL3RTVitGS2NRYUN4aDhj?=
 =?big5?B?MC9YTlU2bURWZUZvWkxla0xBTXNzeW1VV3FWNE5tQzVGY0xGZ0hOYy9Ba05XemNF?=
 =?big5?B?VHFFb2NMUlNLSk9zbE1zL3BiNW9kd0Q1cjBBekdwaWo3VGdtKzVRN0EyU0RBcktX?=
 =?big5?B?MW5xZFRBZWlTYnI4Y0VBQTU5cHNoRFAxUkVjak4yNnRibzdWVldnMnVGV2IrYTdP?=
 =?big5?B?TklpRU8zTEl1a1FLdS9YbExQMWFuU1BYN3NCczEvK3dhbGNFQy9haU1ERHZEaDU1?=
 =?big5?B?RDBhUTZYYjhLM2lyTGRuMXFIZ04zOUplc09IZFNjWi9QZXlKb0M2KzdvczV2UTFa?=
 =?big5?B?bmNBdVFBPT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5ce8b6-3d69-48b8-5b41-08da6fab6050
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 08:38:27.2159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB1202
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

VGhpcyBwYXRjaCBhaW1zIHRvIGRlYWwgd2l0aCB0aGUgcmVjZW50IGNvbXBpbGF0aW9uIGJyZWFr
YWdlIGluIENlbnRPUyA4ClN0cmVhbSwgYW5kIHRoZSBmdXR1cmUgUkhFTCA4LjcgcmVsZWFzZS4g
RHVlIHRvIGEgY2hhbmdlIGluIHRoZQprZXJuZWwtNC4xOC4wLTM5NCwgd2hpY2ggaGFzIGltcGxl
bWVudGVkIGt0aW1lX2dldF9jb2Fyc2VfYm9vdHRpbWVfbnMoKQphbmQgY2F1c2VkIGEgcmVkZWZp
bml0aW9uIGVycm9yLiBBY2NvcmRpbmcgdG8gdGhlIHJlc3BvbnNlIGZyb20gUmVkIEhhdApCdWd6
aWxsYSAjMjEwMzg2NS4gSXQgZG9lc24ndCBzZWVtIHRoYXQgY2hhbmdlIHdpbGwgYmUgcmV2ZXJ0
ZWQuIFNvIHdlIGhhdmUgCnRvIGRlYWwgd2l0aCBpdCBpbiBXaXJlR3VhcmQuCgpJbiB0aGlzIHBh
dGNoLCB0aGUgYWRkaXRpb24gaW4gY29tcGF0LmggaXMgYWN0dWFsbHkgdmVyeSBzaW1pbGFyIHRv
IHRoZQpwcmV2aW91cyBhYmFuZG9uZWQgY29tbWl0IDk5OTM1YjAuIEJ1dCB0aGUgY29uZGl0aW9u
IGlzIGEgbGl0dGxlIG1vcmUKcHJlY2lzZS4gVGhlcmUgaXMgYSBuZXcgZGVmaW5pdGlvbiBuYW1l
ZCBSSEVMX0tFUk5FTF9SRUxFQVNFIHJlcHJlc2VudHMKUkhFTC1zcGVjaWZpYyBrZXJuZWwgdmVy
c2lvbmluZy4gRS5nLiwgMzcyIGZyb20gNC4xOC4wLTM3Mi4xNi4xLiBUaGUKUkhFTF9LRVJORUxf
UkVMRUFTRSBkZWZpbml0aW9uIGlzIGdlbmVyYXRlZCBieSB0aGUgc2hlbGwgY29tbWFuZCBpbiB0
aGUKbW9kaWZpZWQgS2J1aWxkLmluY2x1ZGUuIEl0IHdpbGwgcmV0dXJuIDAgaWYgdGhlcmUgaXMg
bm8gUkhFTCBrZXJuZWwKdmVyc2lvbiBmb3VuZC4KClNpZ25lZC1vZmYtYnk6IFJlZCBTaGVuIDxk
YXJrcmFuZ2VyX3JlZEBob3RtYWlsLmNvbT4KLS0tCiBzcmMvY29tcGF0L0tidWlsZC5pbmNsdWRl
IHwgMiArKwogc3JjL2NvbXBhdC9jb21wYXQuaCAgICAgICB8IDUgKysrKy0KIDIgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2Nv
bXBhdC9LYnVpbGQuaW5jbHVkZSBiL3NyYy9jb21wYXQvS2J1aWxkLmluY2x1ZGUKaW5kZXggMDE5
MmVjZC4uZjE3MGE0MiAxMDA2NDQKLS0tIGEvc3JjL2NvbXBhdC9LYnVpbGQuaW5jbHVkZQorKysg
Yi9zcmMvY29tcGF0L0tidWlsZC5pbmNsdWRlCkBAIC0xMDksMyArMTA5LDUgQEAgZW5kaWYKIGlm
bmVxICgkKHNoZWxsIGdyZXAgLXMgLUYgIlwjZGVmaW5lIExJTlVYX1BBQ0tBR0VfSUQgXCIgRGVi
aWFuICIgIiQoQ1VSRElSKS9pbmNsdWRlL2dlbmVyYXRlZC9wYWNrYWdlLmgiKSwpCiBjY2ZsYWdz
LXkgKz0gLURJU0RFQklBTgogZW5kaWYKKworY2NmbGFncy15ICs9IC1EUkhFTF9LRVJORUxfUkVM
RUFTRT0kKHNoZWxsIGdyZXAgLXMgLUUgJ15cI2RlZmluZSBSSEVMX1JFTEVBU0VbWzpzcGFjZTpd
XSsiW1s6ZGlnaXQ6XV0rJyAiJChDVVJESVIpL2luY2x1ZGUvZ2VuZXJhdGVkL3VhcGkvbGludXgv
dmVyc2lvbi5oInwgc2VkICdzL1wuLyAvZyd8IHNlZCAncy8iLyAvZycgfCBhd2sgJ3twcmludCAk
JDN9IEVORCB7aWYgKCFOUikgcHJpbnQgIjAifScpCmRpZmYgLS1naXQgYS9zcmMvY29tcGF0L2Nv
bXBhdC5oIGIvc3JjL2NvbXBhdC9jb21wYXQuaAppbmRleCA2OWRhZGE4Li40ZjhlZTY5IDEwMDY0
NAotLS0gYS9zcmMvY29tcGF0L2NvbXBhdC5oCisrKyBiL3NyYy9jb21wYXQvY29tcGF0LmgKQEAg
LTE2LDYgKzE2LDkgQEAKICNkZWZpbmUgSVNSSEVMNwogI2VsaWYgUkhFTF9NQUpPUiA9PSA4CiAj
ZGVmaW5lIElTUkhFTDgKKyNpZiBSSEVMX01JTk9SID49IDcgJiYgUkhFTF9LRVJORUxfUkVMRUFT
RSA+PSAzOTQKKyNkZWZpbmUgSVNfTkVXRVJfUkhFTDgKKyNlbmRpZgogI2VuZGlmCiAjZW5kaWYK
ICNpZmRlZiBVVFNfVUJVTlRVX1JFTEVBU0VfQUJJCkBAIC0zODcsNyArMzkwLDcgQEAgc3RhdGlj
IGlubGluZSBpbnQgZ2V0X3JhbmRvbV9ieXRlc193YWl0KHZvaWQgKmJ1ZiwgaW50IG5ieXRlcykK
ICNkZWZpbmUgc3lzdGVtX3Bvd2VyX2VmZmljaWVudF93cSBzeXN0ZW1fdW5ib3VuZF93cQogI2Vu
ZGlmCgotI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDUsIDMsIDApCisj
aWYgTElOVVhfVkVSU0lPTl9DT0RFIDwgS0VSTkVMX1ZFUlNJT04oNSwgMywgMCkgJiYgIWRlZmlu
ZWQoSVNfTkVXRVJfUkhFTDgpCiAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4KICNpZiBMSU5VWF9W
RVJTSU9OX0NPREUgPCBLRVJORUxfVkVSU0lPTigzLCAxNywgMCkKICNpbmNsdWRlIDxsaW51eC9o
cnRpbWVyLmg+Ci0tCjEuOC4zLjE=
