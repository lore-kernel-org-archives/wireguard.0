Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB3C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jul 2022 19:45:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 22b0bb46;
	Tue, 5 Jul 2022 19:45:44 +0000 (UTC)
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn2145.outbound.protection.outlook.com [40.92.63.145])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b22ea2d8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2022 08:58:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frKAHEJyw3NEf4j1cECT1SlFzaY9u/mfNhVhWOU2KCCnk18vhD8ay+scKlneJ0wlYE4vYCJCtGkxvHWfKuWhGl9f4HyRA3wd5oR7uw8DkczPlaXJF4HBHIh5wrw/G8XfJr0ZmYBfHHKJp7Dn5iXVUzPLbpEeRfXcqfdlgJSUWi4yy6sWMl7PVA8e/2MTzcTX5o1NrtRhelim8y9DuZ7v4kXXT5aYhjZjFfdRx4IXBnlPQL0lNW/jxnA4Y/o26h2VNkodQ3yJSC21rZmEJbHoWC+QVZGhN7noTSbkDfOCDn2hTM0Irc3laV7yzcCZen0XvwnoweuzTOHYTkk8hwXNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfBRYP2zZPxxNNDzRAPmtPiS7Q+YR/9rHK8ixh31hg8=;
 b=ERbS+6JJbhhMWu2TDqINe+0PoAgy1OCzJNoAgbhh7R2XZzgcWKbaQ3o8BBB91CWQn54hicrgHNBRGkFGzZYzR3fBochBAwoW1QFLen3nq43eiXdo0nWYy9Dp7FUR5UKi/ZQc6Grq4qXddoRYKhYvENGOMRrh/0fdQQlmg2Kg/Vo30Tgbiyz0BrGUYiyLcZeU8QKSwY0v3hViGr0vn6nN3YGsvlXzdtbny69rkmHkAywZ9dqP7Ns45SKELElilYz+KeqAMfqo/dHFkm3RnN/Ib3uONthkjk3Iqbvlpvqo7oRXA4RbZGZw0W9vSKwxfwaxWnm4vfYQFN7ohbduOKAwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfBRYP2zZPxxNNDzRAPmtPiS7Q+YR/9rHK8ixh31hg8=;
 b=RKuDWgWVH0TTLkucAXbZ/E8i5BnxrNiKfJVkUqlAxt6pSeCRJMgtbtPyODv9BsDKDmcXa4WCmOhJEwFZXgWf0Vi2ERJK3XDinhetgSSqs1eeXX7yE8ZyGoy/B2NQKcHOFlWS3Nf/wjy7/XfybEW3mSvgx73el5aRd+m+TBPtxXclc7Tz6c9yBzvU4Il4RQ8xks+eXJO8noKXtFajJCR09wjkvdYmb9mWLEeFWLCc8XBA78X9vbMXpdEaDdLUorPH5RAsJ9ig3r58VpjScpjTkLSV2eSQ61j2IScMaIge/FS4Ib7eLws+wMNr1NRLSq1VP7l9LFmHx3d0rSYH32Jf9w==
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:69::16) by
 ME2P282MB0660.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:5a::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.17; Tue, 5 Jul 2022 08:58:46 +0000
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8]) by SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 08:58:46 +0000
From: Shen Red <darkranger_red@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: package from fedorainfracloud for centOS 8 does not build
Thread-Topic: package from fedorainfracloud for centOS 8 does not build
Thread-Index: AQHYkE1sUO+5Q+/OQ0m11Sj9l7+JWg==
Date: Tue, 5 Jul 2022 08:58:46 +0000
Message-ID: <SYBP282MB04601262532DDD031AD31F24F2819@SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f7de123a-4cfa-7030-5f5d-1e7e6ec93228
x-tmn: [C+GcoYu7mNqyR8bqRlpLBaMpHOTktCv9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4985fc41-169a-4ec4-7a80-08da5e6491bf
x-ms-traffictypediagnostic: ME2P282MB0660:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UfyoiQwobzY5yx4rInvWQIWeaegh4tTQPapkJfIxDrQXXlQTx7DnwYwJDjYPSpB74j7kF6WrajDiLKPfZYXcWZ63+Yjb5Gw4Bl8VzNTchI+oQqFhR3l9tdf6Me09A2G4TVfchlSDiZUsNjIobUhLkrJ0U1PLoLNRpZbduD0sdXkv8yABTj2cr8uiS8GQ1Q6WM9RWZe7siXViPYJmbuX0KQeuCZ+zdg8GqX9Gepfs+1L3LSuaQ2MkWCXE5eT17zRYeBvL1gI26TJUa7Z8u1QEJJDMiuJXj7NkZK9bIDY5Gx/UiXTUHEznq6eZhVVthIpqPaGhssROvtaM0buiF0DTp1vZaTCSeGY29Qt2zdS/AvM07bTMrIbMx6yo5sYj1S43TbKDa+mjpTitrctupCfHTj3DVqdh/eikwlkTF2+Py4kKjQS0jUehrumIjHlYnz+Q94ZwFjY3u9Km9EoKev87365k15/+ey4kbIFN44vznGM5Vvp/y2KTdQB5TNMUNI/vmI7kt0ynVqK8Zzk4qbkljXdozyejk5+8woIKfb/Z3BdJWkBe3pXArcLLeCVvq1kHLKiDCtHHPUhqvD7+tWAlLRNfxu7DTkrEebjyw9CHhj5bHHSsCxtzH96XmPv73C8rUM/T4wzIpglTeJtts2CS7g==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?dFFkdnpOSEdHa2x3TmRmbUJwZjRsbW40M0RxK0VYSWZmTWROczBNelNGSlBqYk1C?=
 =?big5?B?alQweURNcU1iTDJ3SW1remdacGJIVkE2bkNYMHRCY2ZHaW51YTRzdXBSeDBFeElG?=
 =?big5?B?OUMvMU0zNDZKdlFVa2ZQT3M4NHhVN1Yvd2h3Q2IzcHVGWGNvM2gwRlNPbVVaUnd0?=
 =?big5?B?VlpTWm50Ky9GbnRsYkVPOXZQd3Z5QTZscWljWEJ6Z0V2eTRHQWVNQnlVdmdmdllo?=
 =?big5?B?YkhNNFpQWlQzOFRuRGdaMFlibjZnTmhXL1Fqc3Q0TG9MV1F1TTl4YXlTZkd0TzFO?=
 =?big5?B?ekMvQm9JaE1mNkpkaG1NVENPSWwzSEQ3TGY1NVQrVExld1FyWHU2Zy8rK1p0NTZK?=
 =?big5?B?Nkp4SzRZcC90enZ6bEcrRXBWamtKTXdhOTVpWElsKzFSNWVnTDRZdVBDTGc3MUVK?=
 =?big5?B?blRNcnBDSnl3UStsZWRJcVZleFJFT05RRFJST3B3RWRFZGJramNYdDVYQXFtTG1O?=
 =?big5?B?a1pVSERtNDhrVm5Ucm1aSzZXTUV2NmFDdExhU0dKRWxSanVzWVVtdnhzKzFJUEhE?=
 =?big5?B?TFduU29icVZKdUMxU25vcXVGTTZHY09ldzVjR0pNR0JTZllSMktPWnZrT1dlZVRS?=
 =?big5?B?ZGFtUnl4MUZmVmxOVUhxeWIwbHlBWnhkMnJXSTlNWW95Q1Jnb0w5MUtuK01hblAv?=
 =?big5?B?eVR0aFVERVJhOHpGMnBMbnBQbFNxeUlUdVM2ODFXbnd5TWRLcGo2Rmo4bDd2OXph?=
 =?big5?B?WGt5aFVDV3VNc043Sis1UTVibzM4Y3VXZGozTXJGVkpSa25rY1hSM2hNRzVvWGRs?=
 =?big5?B?dHRKOHdzYUdwL2pJdVM3QVBQQVNlb3lJbzMwUWtXWi9OS1QzL3E4SzBzS3lYMDFQ?=
 =?big5?B?Rm50d2hSR3hzZEpObmNieXk2VVZxbXFWL3BFbTRpZ3dKQlhidkFPYTdPMEtsb2J1?=
 =?big5?B?amJETUZNNlpUclNMYk1hd2JCWndzY3Z4WG9qdWQvU0JvYkVsdktid0w0SE9wU0tk?=
 =?big5?B?dW9LV2FtVlV4NHFjNnhFcHRxeTRVaGFmeVlJZ2ZwRkUzRzhBVVVlWU5pblFWVVkz?=
 =?big5?B?WVFwVER4dTdNemRnZFNlc2FsWStZdlFvVmwreHExbE5PS2hMUjJnTUh6SG5aTUNE?=
 =?big5?B?ZEw5QnErcDk0VHZ5SU10Z21WUUR3aVlLcHZqa3pkL2s4MGg0anJhQy9xVTFkQjd0?=
 =?big5?B?VHNPQkFxcFhMUGxIUk9BaW04MWw1bFBEUmZadUtIQWhJZ0FrTjdNT0ZuNWRiUmFF?=
 =?big5?B?WDdBa09iU2Jyb09lRnJnQTYyZm00Q2huT1hrNzFscFNLQ20rc25MMnlERkxqU1Vn?=
 =?big5?B?cFpPZTNEWTFrcFNUS1VsYTJIQ0FoTkFESDVXM2V6cnorTG8va3RkcGlwZDJsb2o1?=
 =?big5?B?YWF3cGphUklTNHNobWJDOTBUL0N4ZWF1S1hWSVN3b2ZqYkswd280ZEVHbnZLWjk5?=
 =?big5?B?NjBNVzZGbDFZOUx4cFNQRnFZNzZoRlBhK3Npa3VvelNTaDVsNmNKR1d0RURqd1NC?=
 =?big5?B?V1h5NHcxSVBnZ3FMR2JuWHpwZXEwMlVkSjdwNm1PMU1pWmVOYTNTcU1nUGF6YU5L?=
 =?big5?B?Skc0cldKVXgzOTJWYTl3RzlybGJLcUVHTENPMUdxclZUU1h3c1VtOVBERGtjRDR0?=
 =?big5?B?c2U3T3pKcVJiQlpvY0JCZy9vRUNCQ2k1VUdnTGZBTnAwSlhGSGtjNFpZUEoycG45?=
 =?big5?B?d0RJQ2NBPT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4985fc41-169a-4ec4-7a80-08da5e6491bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 08:58:46.0707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2P282MB0660
X-Mailman-Approved-At: Tue, 05 Jul 2022 19:45:42 +0000
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

Tm8sIHByb3ZpZGluZyBtdWx0aXBsZSB2ZXJzaW9ucyBpcyBub3QgaGVscGluZy4gQmVjYXVzZSB0
aGUgYnJlYWthZ2UgaXMgY2F1c2VkIGJ5IGtlcm5lbC00LjE4LjAtMzk0LmVsOC54ODZfNjQsIG5v
dCB3aXJlZ3VhcmQtZGttcy0xLjAuMjAyMjA2MjctMS4gSWYgeW91IGRvIGhhdmUgdGhlIG9sZGVy
IGtlcm5lbC00LjE4LjAtMzgzLmVsOC54ODZfNjQgaW5zdGFsbGVkLCB5b3UgY2FuIHJ1biB0aGUg
Zm9sbG93aW5nIGNvbW1hbmQgdG8gcmVidWlsZCB0aGUgd2lyZWd1YXJkIG1vZHVsZSBzdWNjZXNz
ZnVsbHk6CnN1ZG8gZGttcyBpbnN0YWxsIHdpcmVndWFyZC8xLjAuMjAyMjA2MjcgLWsgNC4xOC4w
LTM4My5lbDgueDg2XzY0CgpUaGUgd2lyZWd1YXJkIG1vZHVsZSBidWlsdCBmb3IgNC4xOC4wLTM4
My5lbDgueDg2XzY0IGNhbiBiZSB1c2VkIG9uIDQuMTguMC0zOTQuZWw4Lng4Nl82NC4=
