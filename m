Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E12D58CBF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 22:41:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e10d60e3;
	Mon, 23 Mar 2026 22:41:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021102.outbound.protection.outlook.com
 [52.101.65.102])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9e5c335e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 22:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN8YXacsV56BKJA/LRHeiVBKSg9WrNmkGZi8CTfcKFRX/O0N7RuemQPI2oq34eOIu1ohJqeAyHaYpndLWc5FdClw84dImsKdBWPdQ9/numtJD5dJV6Y+2Jc50EYuuDRWhC3CFFI+1/EfeS31EhH25DvGX0PgLs8agqhlDAQBQ/ZQ3OpM/cjDOFmKB32DDAmhldMWecv5yEJOaO4+qxTP3phXtyzoVxvxdU7vRLsUjjSIFb7E1/ptLu7mnnORrmGzId2kAsaSCZr441BM6rfvQWnraUUqc6sohw0xQxwd+/nZGhZU1Z9xWZ/VK9kD5lA8HoAivJDh2UB4cqM/7WDusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMRfATIkI8kCwWi4spvE0L4lc5Y9oXY7kHzU8yCymko=;
 b=XSzc/3cAyW4AnHu681y2IhxqPnFuYnKNCP8oJvT0VLq8pVJmHRzbPESIdBE/qofGrEx154ezfR4wHXUGW+WOCbM5N+7DHX7HpPCCzptb5FE01pUrlJhusFxmgMeNVo+6jYYIHIQfbWa8tDA/MCm4puvXhcO5oDPYk67VMgEJcSHTUDsEWKx2dl9bQZ4GVt+moQeS09Wz5SKGNMJ0o239CSGalSFPjpJthmwDREEygrZqP1d8bYaqOKeAqLoo6iJWE6Q5yO6k56twIYBtosYNxCxIuxxm9rly7F0N4BBR8PEwxq8lPr86RgIQA6ecNggayGQZQ1VGFmO0Jn357sds0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwl.dev; dmarc=pass action=none header.from=iwl.dev; dkim=pass
 header.d=iwl.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iwl.dev; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMRfATIkI8kCwWi4spvE0L4lc5Y9oXY7kHzU8yCymko=;
 b=PIVhQyOZnFF85Up0+X8Rrx0duf7pqrES9xcoHfTEKwpVlVAmoxHKNakfzPdKm2dBJD8yJbzcl5Oq5T2sKuq7Xp6xqYLHqYwQzgxBmmsaBDQsgSoSWdwST1sYRIaKn8SN33Bb4kPyavnwUGscvuKtLE4meQUEhz3Cee8iGYLOi2fy7m2nBoTTogikO3bnEFF+sQz2+3XpLjSFRNytg7yEU/Wi7u5r9N+/G/P2WcklSpbY/gRZgxKyl0eY8y+Pkz2ZFz4M52q+30eWVccmboRRAQfnvfWd8CG60uaaaqHtWwkQ7aKOitkpv/tvN/kvPIHXXBMD8I1fjumtBkLhQe4ZRA==
Received: from AS4P251MB0681.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bd::6)
 by PAXP251MB0129.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:41:07 +0000
Received: from AS4P251MB0681.EURP251.PROD.OUTLOOK.COM
 ([fe80::4352:ee0a:8c9d:1299]) by AS4P251MB0681.EURP251.PROD.OUTLOOK.COM
 ([fe80::4352:ee0a:8c9d:1299%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:41:07 +0000
From: sh0rch <sh0rch@iwl.dev>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, sh0rch <sh0rch@iwl.dev>
CC: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: =?utf-8?B?UkU6IGd1dGQg4oCUIFdpcmVHdWFyZCB0cmFmZmljIG9iZnVzY2F0b3Igdmlh?=
 =?utf-8?Q?_TC/XDP_eBPF_(no_kernel_patches)?=
Thread-Topic: =?utf-8?B?Z3V0ZCDigJQgV2lyZUd1YXJkIHRyYWZmaWMgb2JmdXNjYXRvciB2aWEgVEMv?=
 =?utf-8?Q?XDP_eBPF_(no_kernel_patches)?=
Thread-Index: AQHcpoiVDgzClq56akuts+ijuNN0O7W8jBSAgABRMXA=
Date: Mon, 23 Mar 2026 22:41:07 +0000
Message-ID: <AS4P251MB0681A77E973F350C2310F3D98B4BA@AS4P251MB0681.EURP251.PROD.OUTLOOK.COM>
References: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
 <CAHmME9q6vwkXp0Hzsp7ZoLN6QxNr_Lsqu12OWjOi1shhV-seyQ@mail.gmail.com>
In-Reply-To: <CAHmME9q6vwkXp0Hzsp7ZoLN6QxNr_Lsqu12OWjOi1shhV-seyQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iwl.dev;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0681:EE_|PAXP251MB0129:EE_
x-ms-office365-filtering-correlation-id: ab7d1dd5-3e29-44c9-2a33-08de892d462e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: EOZsPW3cNfcwEo383DLZHHLuM3I6pmQtlCLBK0ScikU2kcIwKJKmc3+OTaw8pv2n2gNVk1po/V83v+mQ/ZyWme1I6zKamCbKK9jiuG7Pg46ZjLs8xWuMg3T2BWk/uh8WJfslmoHibH1JM28tu6bf1dqAST7W7WD9kHZrIeQs9md3/Gvu8noGV3SVCrS2r4wH7PPVv0pyodeoK7GTRXjGFTl3rUO+2eBYGiR5gRwRQ/V9umZR/fcsXtU8P/pKQIJ/yEscklkiXmX7g4dKyxlD1qLh0XQpLfZnZeVD2iwiEPRrdF/STmerVWiKgLzkanw5EfmMz9NosKYP8fC5eIso8PzrU2pcr0dfSpvDqpl2NilGwK3y/+s1J5L6hpA3A4eMH9+uGW4caOoWBhtYKdmBdHV2cszqQUmSINrD7OU7p4OeBKH+JU4N7ZDePPfSvYEmTS1OxxasYdU6TLheSoSzMWbbmNDmIZG7biQHMq/R7ySvEP98AqdKyxZtOG/oWteOsjA6XAKR23frDhZc88Syg5fGlE/I4XJYjXR/0MduVxISqdMutSKZMe/lTKRCxiCPh0Otsp/jQa2UVGqUazSMvUM0ozqQZXjDMxp6kYdM34WgLL4+jFcq345BviYR856iWS0BoM62CgTbH/VqcMqnVY5M+FUR3SubUVrTV8yBMPrqVrQxXdcRNaZB1P71ULVAAUHTEcocSlHh+LZoJjBlDKmgl4Uke8DCIDkmuzs9hnCEbOnrf9PO7E7zCCFMs353YIgjegKvZ5WNrZDAoysZH1/o1iKasdwQmm8oet4HBkg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0681.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3c0REVBWllBTXNWZjlmWmFOaTFySE1ZNzBYdjd0TlpQL0NzQ3dRWTJ2UU5k?=
 =?utf-8?B?OEFnb0hKRDIrd3dJb1dmR0U1dnhGWjNCWXVtTytuMlJPV0FZd1VJZHo0cTlk?=
 =?utf-8?B?a2dQWElONnZ1YitqNVJjMENhRFg0Skw4SGh5ZkVoUzBpU2diT1J5cnp6ZGpO?=
 =?utf-8?B?TDVGNnlSbDA3MzlIWHpJYndZd3pSVHRPVlJIV0FJdFZOclNoaUlxTUVrNGMz?=
 =?utf-8?B?a1I2cno5aTFycE0zVnVTZWxCd3I3Rzc1TVB0bkNROWoxMXhPU1pUeDJzdkNN?=
 =?utf-8?B?bVZUS3ZJSHh2SnB2UlNCZzM3STVkM0IrSlRGOGtwQkR5MHhHWHk4d0pSejho?=
 =?utf-8?B?cG9BV0Y4WU1iNmVINDlZQ2J2UEpScEYzaUJyRDZKZ1B6Q24yWVJVeTlneGJp?=
 =?utf-8?B?THRpbnQ0U2hsZWNZUS9vNmoza2JRN0t3bERmaTFtOGhDZ0syOCtmY2tCV0Z6?=
 =?utf-8?B?TkxnWTVkc3g5UEtQaXpiczFRU1RQU3B3bjBnSmR5MFpuUmdWcHpaQ3pZSU5o?=
 =?utf-8?B?K3dFVWlFVHFXM3FBY3Q5VFVsbFRJZFcrRWszY2FGSmQvUG9zMUc0Y3JUcFRw?=
 =?utf-8?B?WTY5N1FKNXhBTGZUQ1pjQlhDV0pMMGhkU04xSEVhbG02aUlTek9oV1pEdGR4?=
 =?utf-8?B?dHUwdkIxL1dXR0huNk5QQTd3NzZPWXEyVEhTQnI2OEdsWWxlWU9TUTR1NlhZ?=
 =?utf-8?B?NDRMbVVhcGd2eEdOcGJhUEg0VXdwMjFCV2haWmU4Y1FCS2VRMmxNcU50L2xs?=
 =?utf-8?B?T2U5QXRYT0FNNFBDVkhLV2ZtbXZGYXU1ZUU5ZUg3eDB2VGhuUHRNTyt4ejVG?=
 =?utf-8?B?SVUya0ZJbUFNYmV5bWwzZVJXbzdJSVVFUUp6QWZseVRZc2wrakUxVG5MUk40?=
 =?utf-8?B?UFN1NmZIL2RHdzQzbGdLSkt2TVA0Z0tIM3Nnd1hnUXJQUEdTeEdiNlUwckhB?=
 =?utf-8?B?Zms3L0Q3b01NSFV1bUcyUjFoTVFPRWp4ZXlLZXdTNldHTDhhNjNXdjhrbU13?=
 =?utf-8?B?Ry9EN2lDU3ltd29YeWR6ZWRvQzJJb3ludktnN1Z6c3huMFE3WHpCTm9LVnZH?=
 =?utf-8?B?dU4zUmt5YWttMGhCZEJtR3IrR1ZJZzhKRDM2TUZUTDh2UnltZTcwVERSZFJL?=
 =?utf-8?B?WGFrS0hKZSsxUmE0d2NRZFFKaDNYdEMwVGVlVStyWGorcnJQc08veGFCNzgx?=
 =?utf-8?B?UWN6MlVuelI5VHpWV0tUd0JzN3dWRDV4NGlVOURaeVRWQ1ViZ0NKT1YwSjhu?=
 =?utf-8?B?ODRUMENHSmhhb1VtS1Z4Vk9wRjkzYWtaSXhmR1kyTmI3cHBuZithRVFLYnF3?=
 =?utf-8?B?VUVtdm0wLzVYMk91SDlJYjA2aWdhNlE5QkV3SnkrZW84SkFyUytqRm1SaUht?=
 =?utf-8?B?NnhpMXduNitkQ2VtRVFjcThiOVdXU2hUeitxdWR0ZGkyTW90RUFrTDJOaVZx?=
 =?utf-8?B?OXI3eFRjcTFSTDB2VTd3a1hRWjBXaWtxV3JaMUJQcnJKZXVON3dVckNwMkpm?=
 =?utf-8?B?dG1JNFJsOVVUcDkvMk8wdjlpM05HRUMvVnhIdVkvWFNXTXRlRXpReGxRakNt?=
 =?utf-8?B?bmlLQVdzSEdkNTdLSU04K2JpWlRGSW0rL0F6K1NCaGorTW5vZ2JqQzhpRUcv?=
 =?utf-8?B?TnhZYUZYbHNoQStsQWVTNFkwWlh1bFhmTGNPdk43OThYcE4vU1hVSUZ5aG1Y?=
 =?utf-8?B?aFJ1RDQxY25rMkYycDdPUit0QVdMVFNINWRYeTR5WTlyMGdUSTl3dllqRjhE?=
 =?utf-8?B?ZklIakdxL2NQY1I1dHh3cG1GK1lYL0FBSCtuVXp1YmVTek94cVgvWlVNZWFh?=
 =?utf-8?B?NlpKTFNXd2dIa0Fzb1lpTU1DZmFuT09oR1hZMmJaMklwU3FKVG5CZ2tKb1gx?=
 =?utf-8?B?bGY5MWNaOWNSMVRUWkl3eENsYTc2V1RMaUpJSEw3aEE5elcxRThkSU1oRXY1?=
 =?utf-8?B?SHd2T0hYSFNLeXg2eWE4TGlZSFNrdy94YlNiVm1SZUJXL2Q2TW1QaVRjOFZq?=
 =?utf-8?B?aWtJSVZodVU0Um9FbHhjWmJuTlp4Q3NrVWhrV0JVckdrRmZ0ZS9FSDFFc3VQ?=
 =?utf-8?B?RmU5NitJQmxaY0RqRnUzb1RYTS9JUUNWdlhEZXpYTGVUeGNFd2k4RGh1eVhG?=
 =?utf-8?B?SUw3ZWI0WlVQUmRvL2FMcjcvZWsrRHg5ZDJ6aUJtWkZUQXpzcXhRSjBpcVN5?=
 =?utf-8?B?K0owVU9NVkF6S3A5eDFFTWVDSTdnMm5QTTllSTM2Ky9xNmd6UzBDVDFVVVQw?=
 =?utf-8?B?SnpJS0Yydzh1YlBYUGlyUnI2UVhJbWx3bWRkWjJUZWI5NGhBbENWRWFJUzJB?=
 =?utf-8?B?ZmM5blhQMnFueTV4SmkrQUt2ajc2QTNubzl1YTZLdDRiTGFVTk5VQmYyWFJo?=
 =?utf-8?Q?3U3MoUGojB+1YXYI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iwl.dev
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0681.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7d1dd5-3e29-44c9-2a33-08de892d462e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:41:07.6737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1bc387f5-9185-4d74-bbf3-9f70e48b60b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IoBJYeWW9O1QCx/0nTyOXXQjHK+QTUlNCxU8PkVZ1Y0971BBx5Oevo+bLxTJB8KkL9G9HBYwfG1z/smtnKXfXA0rHEuCEQOXCaiwwIpdru8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0129
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

SGkgSmFzb24sDQoNClRoYW5rcyBhIGxvdCBmb3IgdGhlIGtpbmQgd29yZHMsIHJlYWxseSBtZWFu
cyBhIGxvdC4NCg0KSeKAmW0gdmVyeSBoYXBweSB0aGUgYXBwcm9hY2ggbWFrZXMgc2Vuc2UgZnJv
bSB5b3VyIHBlcnNwZWN0aXZlLiBUaGUgd2hvbGUgaWRlYSB3YXMgdG8ga2VlcCBpdCBzaW1wbGUg
dG8gZGVwbG95IG9uIHRvcCBvZiBleGlzdGluZyBXaXJlR3VhcmQgc2V0dXBzLCB3aXRob3V0IHRv
dWNoaW5nIHRoZSBrZXJuZWwsIHdoaWxlIHN0aWxsIGdldHRpbmcgdGhlIGJlbmVmaXRzIG9mIGVC
UEYuDQoNCkFuZCBhbHNvIGh1Z2UgdGhhbmtzIHRvIHlvdSBmb3IgV2lyZUd1YXJkIGl0c2VsZi4g
SXTigJlzIGhvbmVzdGx5IGFuIGFtYXppbmcgcHJvdG9jb2w6IHNpbXBsZSwgc2VjdXJlLCBmYXN0
LCBhbmQgc28gY2xlYW5seSBkZXNpZ25lZCB0aGF0IHNvbWV0aW1lcyBpdCBmZWVscyBsaWtlIGV2
ZW4gdGhlIHdob2xlIHdvcmxkIGlzbuKAmXQgZW5vdWdoIGZvciBpdCA6KQ0KDQpJZiB5b3UgZG8g
ZmluZCB0aW1lIHRvIGludmVzdGlnYXRlIHRoZSBpbnRlcm5hbHMsIEnigJlkIHJlYWxseSBhcHBy
ZWNpYXRlIGFueSB0aG91Z2h0cyBvciBmZWVkYmFjayB5b3UgbWlnaHQgaGF2ZS4NCg0KVGhhbmtz
IGFnYWluIQ0KDQpXaXRoIGJlc3Qgd2lzaGVzLA0KRGFuaWxhIE1ha2Vldg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5j
b20+IA0KU2VudDogMjMgTWFyY2ggMjAyNiAyMDo0NA0KVG86IHNoMHJjaCA8c2gwcmNoQGl3bC5k
ZXY+DQpDYzogd2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbQ0KU3ViamVjdDogUmU6IGd1dGQg4oCU
IFdpcmVHdWFyZCB0cmFmZmljIG9iZnVzY2F0b3IgdmlhIFRDL1hEUCBlQlBGIChubyBrZXJuZWwg
cGF0Y2hlcykNCg0KSGkgc2gwcmNoLA0KDQpUaGlzIGlzIGFuIGF3ZXNvbWUgcHJvamVjdCEgSXQg
c2VlbXMgbGlrZSBkb2luZyB0aGlzIHdpdGggZUJQRiBhbmQgVEMvWERQIGlzIGV4YWN0bHkgdGhl
IHJpZ2h0IHdheSB0byBkbyB0aGlzLCBhbmQgbGV0cyB5b3UganVzdCBkcm9wIGl0IGluIG9uIHRv
cCBvZiBhbiBleGlzdGluZyBjb25maWd1cmF0aW9uLiBJIHJlYWxseSBsaWtlIHRoaXMgYXJjaGl0
ZWN0dXJlLg0KDQpJJ2xsIHRyeSB0byBmaW5kIHNvbWUgdGltZSB0byBsb29rIGF0IHRoZSBpbnRl
cm5hbHMgaW4gcHJvcGVyIGRldGFpbC4NCkJ1dCBJIHRoaW5rIHRoaXMgaXMgYmFzaWNhbGx5IHRo
ZSByaWdodCBkaXJlY3Rpb24uIFRoYW5rIHlvdSBmb3IgaW1wbGVtZW50aW5nIGl0IQ0KDQpKYXNv
bg0K
