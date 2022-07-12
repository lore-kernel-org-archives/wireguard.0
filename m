Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC0BC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jul 2022 06:31:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3aa43b77;
	Tue, 12 Jul 2022 06:31:53 +0000 (UTC)
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn2166.outbound.protection.outlook.com [40.92.63.166])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0f4331e4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2022 06:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvP1mnqbO7COIwkjMMhGkgjK0U5wCu4/QE9CCkm7OiNgKdM0fhClUO80EBXzRHJY1o+2olCUoAdRTdugyAsNjHllpeZuaMQQKPATPUm1dFSo7frd0nECZDtUMCHhQCguUHu4/iP/MkQT/9tq6FFP/fQaSNSkD4h0AekPzbov2tgMYyIvB9rQ/ds4gAV6iPXJ7zfE7EQ2cKnyj5yoPxdyu9KbMAguRjJwy/6ycWOL5C+thz0Pqm9vUcUVx8xWqKZO4BtLn5tDHdqNWPSn2OZflqEhL+nm9/hDrU1EohOSBJqTvNRdLIaIJv70TNuPFmEkSG6mADU/fKmt0EItcqEEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpvY7WV/sDQviTTbCn+i2vfAQtdacipGiRxCU0XDTjI=;
 b=YNCGlUkdLR1oTDX8vvPiOjOvmkuuGI6BtWiU21IJnQXgxWb+vgR85xOSvHOcKFqIW1Hs9CEK/a0iYIS0HZ2S0GSZrDFB9v7RZQhwloMXUcbBiRx8XuXzq6Haqr/0HvymrueTEVHcFuqrJmTP2Bx+ISSwvv77T5eRma2YFJ3yeO0tC0S7on1xYa+IKyGF9pKiJEuEvu1hDC1W0AoMvcjpBWQMYsVjBkmvGFESLd1OEAZDGIH2g3VSd+scY0YUgpM/gjQsR4/06ZsbiPQP2bp2P7voB/urYld6Nvrv3UhiIVC0q3cLZ5oTf86jsR+f/uYAGrge6KxzubtPaKEQr6EwIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpvY7WV/sDQviTTbCn+i2vfAQtdacipGiRxCU0XDTjI=;
 b=m55+F93nRaflBRiXVZWrk/Esm0XTmsBdThOAMTDpdahWC+aeNPiupG1deJJews8mBiGtFtsadDUZp92Y1WzuTo8wQ5ZrKKb3N9m2d54h2fGaGvur+pRe8MaVzL46+m78Rz/BhMDUIp1SFqhqmWob4Gm60+h3vbbwkwwZbJ+osd1p9zGyq4xC/Fk0aVWHQJedchjUf3xiHaCZr8quNByBuYfUtqURblqKM+FC+YXYfrr6ir+8XHPyJ7HJmpL8/8K40Nhf06QW6Czu7yp06MY6ydti87yu421w2hL/M8qP4xur6gUL1YeudEpogI8hQ8NL7LJJEbN/YDUSX4QOvirZKA==
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:69::16) by
 MEYP282MB2518.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:11c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.17; Tue, 12 Jul 2022 06:31:47 +0000
Received: from SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8]) by SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c198:d112:9dfd:85c8%3]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 06:31:47 +0000
From: Shen Red <darkranger_red@hotmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Update wireguard installation instructions for
 RHEL7/8-Centos8Stream
Thread-Topic: Update wireguard installation instructions for
 RHEL7/8-Centos8Stream
Thread-Index: AQHYlbj87Fa4DZkN1E6Y+0VzcSwVMA==
Date: Tue, 12 Jul 2022 06:31:47 +0000
Message-ID: <SYBP282MB046024065A5CB3522AC577F4F2869@SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3275179f-826c-51cb-7734-efdfb88c5591
x-tmn: [bghqglg4iw2iA9IqqSyA6Rry1TxqVP6U]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ddd15c2-4058-441d-92f9-08da63d0326a
x-ms-traffictypediagnostic: MEYP282MB2518:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGdWHY4LlWmR5cMgGRz1jFyfPAuwTpAGfz3i0G4NoQCBQtfrWWzhMDl1X0NY6RSyTtt48PvVBabdTSxuc5XnCW8OfgHBj58fHi8YWZ3b26saMkcNvBK+lMUY11pBLfJSkrN6KTHKoYhkrqQjanEzzYLRGDNIg2tHEmn+LaAYwHikIsADfm5dQ0Qmxaahw0P9HzJ1PDwEGIohN9Y8B86OFdWTESXHDx6QcRgUD/dbaYgf1/+iexQywAtcKLPnor7aepqk2R6XMWWlb8kEdGDyUkmJBwBOj4rVRd3eITsUd9++lmieGjvsgIwYC6DTezHIAkvrXjRMCFC71i2obVASSvxsR0wnn1fUQQCYShoGjivCTkZ+OGY3BE+2KwV87VMP/bn7pwRHnOaCE2OTfypwVrJJG1XubbDeVHc5l6BDRFRFJEWq82c2A5JjpUYdYqPrX2oQDzMP4iP+4pzZ09rsZ6OjQhSH6gDxxBB0IOHAo/bhyXk4OO1BStBslQKlXOrkDYdOvVNs+Mp7/Zz35inDJDsEejUWIvIA4XBCha6Y3ceI23NPbddONJdi9exPqDuk5BenX+LItQN+1sPmtM6mxQyTCvpWwmGVPECPQ5NO4xamsR9rgthC7WYDGOLFpm+MMd5t+l5wuz096RYJBQdBDIKgZT/fcwT0LeScghXrb26JZEGpPIds3hQbYspip8soL+RCaIxtqalRf5AwDwmiCdEHpbbvW+efC70AUTmnmqg=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?QjY3a0FLM3RQVjBUZXZmZnVhSDVkcG01Wk9yWkYrRm5BTUtCYW9Cb1k3eDh2QkY0?=
 =?big5?B?NFdJUUkycE1kL3pZSm1HVmx3SVYwSlBnaXprbWNVUWNkdnh4eU1VdTcxb1VWdmpL?=
 =?big5?B?WXV3YjVCNmFxbGRZVEJDODZtd2Y3MER6R3AxelVpQ1BWMG5hWUszWUZnVWxOWi93?=
 =?big5?B?bXFLRTZHWUlIbS8rczIyQ1gxcFpLNTJUelNrK0NZOGtRWEV3ZHR1TXR5ZGhMMzRP?=
 =?big5?B?ZVQ1L1psODl5TXJuS3k1elFXMGs2bURDMDhOT3FsU1loRnE3bXQyd2JjcmN2K25a?=
 =?big5?B?ckQxVEJMcTJMWGJCdldmL1ZkVFBrTmt0Mm5zUzJzQzlDVnYyWDhQMGFTR0FRbVlu?=
 =?big5?B?QUI2eWFjZVZLcVVvWlFTVk9JT2xlZTRva21KdTFRQTc0OVFqMi9zT2lvRHVBQkx0?=
 =?big5?B?TDVJUkdDdE0yYmJsVDlZWTh4OXl6Z0FGWVRJeEdPNDBCQnozdGZuWXMyRjVGL2ZM?=
 =?big5?B?azVOWlB2amRvZWYvTzBORUZFYUM0Z0pqdVkzUFZzOExING81TlpaSXJWdW50NEtm?=
 =?big5?B?WFVJcGFrUE42M0dLSW5MejQ3NXczNFZCNGlLK2dwWFdFYkx5bEd6S2pIdy9pTFdm?=
 =?big5?B?djREbkJWWWZNQkM2WWRzRzlrUmI2L0FmZGRZQXgvaktmTlRZWTZSRzNDQm92SDZ0?=
 =?big5?B?UjFpUVNMQkI4dUpleTlvMjZQM1N1L1lXT09IT3VKbnYvWklWM2hvVEhRSUZRMGJD?=
 =?big5?B?MXY5OEtqb252UjQrR3JkQUNud2M0eGVweUF2R3lNZmdBZml0OXRFRTlwMlpKY1Bs?=
 =?big5?B?VzNESmhGbDZsa0FRbUFzemRQSEg0V0tYYmtZZEEzTTFnWkNjeTNWbzVOdERGRUM2?=
 =?big5?B?NW1Gb2NHcDVsN3h0Y3dvRUdrQzRybytLREQ0ckhLUjdnR2lZM20rTWFEeGVhZmw5?=
 =?big5?B?Y09KeXdYdWpvM25qV01wUmZNenYvVjMyMGlscFVIQVFVZnQrbyt5ZXU2TTUzazY0?=
 =?big5?B?YnNxNHVwN1hNSDdnV1V5bXh5aTJqU1IrNjBnRUYvUi9TLzJXU0swUThQb1Q0cWFq?=
 =?big5?B?VzN2Q2ZIVm1PcXhoQ0JvZDFZWVFOc2kxakowSmlpSHZNVFNSdWwzZmdoYUdrWHQ1?=
 =?big5?B?RHE1YitNWFdCL0tZTDJLSWRyMUh4dzVTVENPMS9BSDIvNU56elJyNkxkSE5WdGd2?=
 =?big5?B?V2RsMkdZTjRaZDFLOVpON2srOXVDSHFDQ2g5YVM5RUVIa0Q4Mk1tMWFNL0htQmYr?=
 =?big5?B?NnJMOXkzREpoclduM2lUeFg4L1lPUTVBY3pxRGE1NEZMaldYRGptSmEzelB2Qmpr?=
 =?big5?B?MXlGSjB3TlpBRDVNNHFocDRPdUlrbU9tQk9UQmdYbHcxbUdNeDcvNktWQzlFN3lV?=
 =?big5?B?MGtTWEh3a01ISlJlZFNNOFNNUXBJV0xXdHBmQnpPSHczQkRkT1BHN2YrTDR4dXNG?=
 =?big5?B?VzYzcmhpeHZqVm16cmZJNzVEYjV3RExSZlpKQVF4RGFKQjAvMWZ6dDRKR3ppTVhL?=
 =?big5?B?ZGRkV0l0cm9EZmZDemVjN3BDUDFyQ09RUWtYZllrSW4xK05nL1RYQVY1bXFtRzkr?=
 =?big5?B?TERwQmNsaDhzTTNKeWtMTVZjS2t5ZjIvQ1BzM2tBb0IwVXpabjdXRXVpNG42R1RK?=
 =?big5?B?bm1tdW5md2c2QlJuU3YyRGJpRXZ2QjRyVHo2R01CNjUxeU1IM3VyMGNVeWIwTEp1?=
 =?big5?B?cjdvSVJ3PT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB0460.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddd15c2-4058-441d-92f9-08da63d0326a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 06:31:47.6226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB2518
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

SSB0aGluayB0aGF0IHRoZSB3aXJlZ3VhcmQtbGludXgtY29tcGF0IHByb2plY3QgZG9lc24ndCBv
ZmZpY2lhbGx5IGRyb3AgQ2VudE9TIDggU3RyZWFtIHN1cHBvcnQuIFRoZSByZWNlbnQgY29tbWl0
IG1lc3NhZ2UganVzdCBpbmRpY2F0ZXMgdGhhdCBpcyBubyBsb25nZXIgZ3VhcmFudGVlZCB0byB3
b3JrLCBhbmQgaXQgZG9lc24ndCBpbnRyb2R1Y2UgYW55IGNvZGUgY2hhbmdlcyB0aGF0IGFjdHVh
bGx5IGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5LiBUaGUgcmVjZW50IGJyZWFrYWdlIGlzIGNhdXNl
ZCBieSBhIGNvZGUgY2hhbmdlIGluIGtlcm5lbCA0LjE4LjAtMzk0IGluc3RlYWQuIEFuZCB0aGF0
IGNoYW5nZSBjb3VsZCBhbHNvIGJlIGNvbW1pdHRlZCB0byBSSEVMOCBldmVudHVhbGx5LgoKVGhl
cmUgaXMgbm8gcHJvcGVyIGluc3RydWN0aW9uIGZvciBDOFMgZm9yIG5vdy4gVGhlIGN1cnJlbnQg
d29ya2Fyb3VuZCBpcyBkbyBub3QgdXBkYXRlIHRoZSBrZXJuZWwgdG8gNC4xOC4wLTM5NC4gT3Is
IGlmIHRoZSBrZXJuZWwgaGFzIGJlZW4gdXBkYXRlZCwgdHJ5IHRvIGJ1aWxkIHRoZSB3aXJlZ3Vh
cmQgbW9kdWxlIGV4cGxpY2l0bHkgZm9yIHRoZSBvbGRlciBrZXJuZWwu
