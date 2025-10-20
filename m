Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94970CCD195
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Oct 2025 00:50:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 121cc2e4;
	Mon, 20 Oct 2025 00:50:40 +0000 (UTC)
Received: from server309.appriver.com (server309a.appriver.com [5.152.185.173])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 61d77cc4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Oct 2025 00:50:34 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 10/20/2025 2:49:41 AM
X-Note: SecureTide Build: 10/1/2025 7:25:06 AM UTC (2.52.0.0)
X-Note: Filtered by 10.46.0.101
X-Policy: eagleeyet.net
X-Primary: eagleeyet.net@eagleeyet.net
X-Note-Sender: jaquilina@eagleeyet.net
X-Note-Envelope-Recip: FAILURE,DELAY, <wireguard@lists.zx2c4.com>
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-GBUdb-Analysis: 0, 52.101.70.139, Ugly c=0.142858 p=-0.5 Source Normal
X-Signature-Violations: 0-0-0-9983-c
X-Note-419: 0 ms. Fail:0 Chk:1499 of 1499 total
X-Note: VSCH-CT/SI: 0-1499/SG:1 10/20/2025 2:49:09 AM
X-Note: Spam Tests Failed: 
X-Country-Path: Netherlands (Kingdom of the)->LOCAL
X-Note-Sending-IP: 52.101.70.139
X-Note-Reverse-DNS: europeazon11021139.outbound.protection.outlook.com
X-Note-Return-Path: jaquilina@eagleeyet.net
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G316 G318 G319 G320 G337 G338 G339 G748 G786 G989
 G996 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [52.101.70.139] (HELO
 AS8PR04CU009.outbound.protection.outlook.com)
 by server309.appriver.com (CommuniGate SPEC SMTP 8.0.7)
 with ESMTPS id 64448002 for wireguard@lists.zx2c4.com;
 Mon, 20 Oct 2025 02:49:41 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY8sZGbJAMyWg+6wy531UrPU2gKM29D8SiGRJMmwWt4MNbkYFv/4XqQKhsOucpR7E1qD30xRJAuPtbG67EDmV8Ac4NOClPM6IEsm4qAJiQgiNSx3npLEgwc/P7YaD0ceI+O8P1dJQ18b5x5R23GY0ElzqoDmJGo+8rdaLsonMlVS64v67335AT2KT++K9bc1G547MsS8GtMMEX1TBEY4Rop9STieuE+nnQiYXz1FYqZsjr3e6gT9ZQEAb5FtrcS9C2StGNsbsnGouqYs5T6YS9hO+nGWgf/3iRRBODxa+JBn9iw/Xrd0446Jk/IfucsIsFPcT0ZuJa3gweg0CItcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAj8YweeM7NMXV1LfEbibTsCK8KnUc9/p53uPEGFVrk=;
 b=oZMb7C/8NFcUkt2d2kwvGFahOp5ugDOq97KoiBmw2t9+V3DG7kp++30eY9FVGqRCEqlpLCmxhLmu9kK0p56PpQh6N7TUDv4QX1bP2PoLEqjHscio63YZ7+wQby9LPKpt5M+YDgFgFJ+YC4z3rZzCPP+YrFkcp3GsBh9hRS8REjfwMT2qaURpWOO3jKHKhfmhBa0ew+kkN1ke5Gf2WsdF7xSCmYOvkcKY7V1JWUmW34tRIjgCdkpYA7tyND7/tI9FesC19uWu9b4bSMnvOemGeXFiIPC83SWyX4jwIp2FK3CXksZrtqq5bfTttok8v47z2s5BEsnNjWoTobxhcX7jeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eagleeyet.net; dmarc=pass action=none
 header.from=eagleeyet.net; dkim=pass header.d=eagleeyet.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eagleeyet.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAj8YweeM7NMXV1LfEbibTsCK8KnUc9/p53uPEGFVrk=;
 b=DNGSGka9oz0ua/lwVMNAKtxM87FWjOp4h4wjOPtjCvMc8UWFNQeEerYhQ66NWRyen8CtDd81SKNVHIDwrCtbKhmowIfe9fSNLYnnXfobcB7wNjnMv9NNE/TApCUsFlmtuh/SX/asYMAD4Mp46QrH3dFS21qJKORq4d4u4FOAL/LzyZ1zYg8IlWxjoMTMxeeMuLu+sgqmbd+ceqZDT/nH1QCx3/4vptOkvFVMRC91aVAFoIY8O3ZQYFw/pGT0OsMOyb6QXKOKxSNYOqlwgEIGIuB5yAhafJTRirrUjkIXVBfg23PhMXGa5KargXq2uO7eRbKe5fB42Sl30lRLD3ThqA==
Received: from DU5PR08MB10852.eurprd08.prod.outlook.com (2603:10a6:10:522::19)
 by AM9PR08MB5940.eurprd08.prod.outlook.com (2603:10a6:20b:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 00:50:30 +0000
Received: from DU5PR08MB10852.eurprd08.prod.outlook.com
 ([fe80::2f21:97d1:cb2b:8acd]) by DU5PR08MB10852.eurprd08.prod.outlook.com
 ([fe80::2f21:97d1:cb2b:8acd%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 00:50:30 +0000
From: Jonathan Aquilina <jaquilina@eagleeyet.net>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Laptop using tunnel on iPhone through hotspot 
Thread-Topic: Laptop using tunnel on iPhone through hotspot 
Thread-Index: AdxBW4cje6pyiQGEQWWDByYLJNhfQA==
Date: Mon, 20 Oct 2025 00:50:30 +0000
Message-ID: <DU5PR08MB10852082E6694229E649E4F83A0F5A@DU5PR08MB10852.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_ActionId=0b898bbe-4838-4194-90b6-aa4d130828c0;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_ContentBits=0;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_Enabled=true;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_Method=Standard;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_SetDate=2025-10-20T00:47:41Z;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_SiteId=689fcbc3-edb4-45aa-9f50-cf9ecb3e505a;
 MSIP_Label_bbf21c0f-3c0e-4c64-8ba1-4f3572a20c42_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eagleeyet.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR08MB10852:EE_|AM9PR08MB5940:EE_
x-ms-office365-filtering-correlation-id: aadb06f8-aac8-443a-c69c-08de0f72aae5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TTlRdDkxc2FDZ1dpVS90OGttcE1tVUFTMnZSSmk5T2krcGxKbTh0bmh2TFdp?=
 =?utf-8?B?K0VsZ3BoN0JwbXpzUjdiN0oxREEyQWFaVm9tQlJpVndxdyt5cFFDOUwxVkZH?=
 =?utf-8?B?TkhYK1FaTDZYV0ExanBqYTU5elA5bzJtZGdjU1pMdHovMzVSaXJ6TmZuTmpk?=
 =?utf-8?B?TG84ekdKeWR5V2Z5T3psRnJycHVpajBOaGZBRW5EbWtORHpuZWU2YlFMNlA2?=
 =?utf-8?B?Q203NnN1K3RLU1QyaTR0RU1aVXBvOFJFVTJ5L01FZmtUcGg0aWRMNWdQblY1?=
 =?utf-8?B?R0krMVNpTkFDSlRlcVlZSGRzaGg2d2RTOUswVElSbEpFTXlhVE94eUdETVU2?=
 =?utf-8?B?dW9nTVdVV0d6VFJjajRjM0tMZTFTLy9qM25waWpJN0dob1cvaXVIU29WdVBO?=
 =?utf-8?B?cWhnNk1CQWxQZTE2dWUxV2R0b1ZTNW9rTjZPOGJ4dzRXV2hyVWhySDc5MzdU?=
 =?utf-8?B?R3BYcUtmMkNOOHVIMDVyRzc1b3Nhb3JyWHhIQ0xBSVVDRDBjNFc5cm9hQitY?=
 =?utf-8?B?c3RnVGVVNHZoZ2pOZlRTeUNZY1kvTFBTKy8zS2V6N3hPeHB2a1MvVDQ1VFVo?=
 =?utf-8?B?MWZHUTlndkd4RDRPdFlUZDBkYk5VcVJxZVdJaVB4ZkNtdnkybHYxYjFGRFZD?=
 =?utf-8?B?bHZ4bzNqTHBPMWJYK2Q3T0FEcFBGb2F3clpPOTkrOTUyN0RZaENRRVQ0SWFu?=
 =?utf-8?B?ZjBoSytpeXhGcU1wM3pSUFExL01zbUpQTjA0dWtza1RLeVNWeTlEUXFsYkcw?=
 =?utf-8?B?UlBFY3RJS0tFL3MrRVZ3cVd5L2g5UjNldEZkK1VGZDEreUdsM2drSXVkKzEz?=
 =?utf-8?B?QVFUY2xmV25RclNGM0xyNkV3d2xkOHBGa0pqaEE2NGNhSVZHSWQwYU5WRk5J?=
 =?utf-8?B?djV3cG9ibVA4VlFSVmJBU2VBWkVTdTJVWGZXZkdHaDVBaEJqWkRnYVNUOGJr?=
 =?utf-8?B?TjdhN2VKcnZIZ0R6R3NJMlZGdFpYbHdRUjBzZVZoenM5MHhUNjBCUVE0OTVZ?=
 =?utf-8?B?bE9XeVV5bEg0TGtSUkxYdmJaN0xhSlRqbFJoOXF2TDR3NHVqdGhRQWI0d3RU?=
 =?utf-8?B?eUFFT2dOcVkyaksrTE8vcitYanUweTBTeVF4aXFlQ285dTBCMm5UR3lyVTIw?=
 =?utf-8?B?N21wWS9vSWdrRVVrRldEMFU3ak5jeGw2WVMyYkloOTJIZGFRTTY2ZDd1MG1s?=
 =?utf-8?B?a0owSFhEaEV2RmVjeXdsSUxtSm43Uit4ZThST1FBMGVJVzhFUlpvcDYxQkM5?=
 =?utf-8?B?dGxHZjJsR0RGRWZBU0YxRG1CZ3Bvbko1MTloTXFTTHpKQkxPVWZXQmJrRnZC?=
 =?utf-8?B?Zm5DQXl4UlY1K08vdTJ5ekFnd0NvVUZXT2RBbUl0cGtYTCtzcjVUeTNycmRi?=
 =?utf-8?B?RnJCVHR0TXdDSVc0dFhINUJ1alRZNWp3RmdYZXN4ZUNHaDJxcVR3c0NEZUNR?=
 =?utf-8?B?cUM0WlhqOHhrRVVXOVhjc280bENkTk5RVVUvbWxtUmlwaVA0VTUyRlNQZFVP?=
 =?utf-8?B?Wld2NVpTZm1iY3ZGamQvK25kbmF6bEFxbGZCVnY5a2dqSTNUZjhuUEZwVFF1?=
 =?utf-8?B?cDd0RW51TjZDdVJLejdTdGxPKzJYYWplN000cms2ZVlJdWdidzhrRk0yRS84?=
 =?utf-8?B?akI2UVRROUhVUGlDYUF1NW9jYmE0MXFBbEtKWlRtamg1MGtBbzZ5RkNRY1Zt?=
 =?utf-8?B?Y1RrcUdUL3B5M3VRbzZSMVhiMnEycG1VQ2hHTit3NStRTnI5cnhEb2JvRFVn?=
 =?utf-8?B?VHVnbTQwN3ZRMlJpSGtNVEExeE9taGttQ2xrWkpHUXpldDE5bTd1dzd3dXFh?=
 =?utf-8?B?aTRseXdmdWxYRVlldFFQREdGRFcxTE1OK3VDcnhxMmk4NWZ2MFJqTmxOTThl?=
 =?utf-8?B?dzZDNHF0WS8vVUdnZWZoSk56d1laN0QveUpwckFpWlVFeXczaHZGZFRWNjdG?=
 =?utf-8?B?UXJrSGZDS04xOVZSZFJUQi9uVFQ2Nk12ZlRtWlBxRVRSOFFoYVFlUEpab04y?=
 =?utf-8?B?UVVrMVNOMnd6Y29SZmNNMk9xV2hHaXY3L0xURDJMRklNMm9VNFBjeVZsVnVS?=
 =?utf-8?Q?B7ilpC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU5PR08MB10852.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3E3MUZsb2h1bGUvSFgrNjBuenlpeHpQYm41amNMTTlZVy9PamE0eWVUaVVG?=
 =?utf-8?B?TVIzNmQxYU4vd1p5cjI3QXNHMFUxRlgwSUlONXBmbkN6WnJyVTk0YXA5OGpX?=
 =?utf-8?B?NDl4UUZiNnlqLzVnd29OanJhdjN4cFc3YW9leGV0ZkJLT0lwZHE4UnRmMU5K?=
 =?utf-8?B?V1RoeWtrbVhCUmdNNkcvbklQUEdZUGFwY05iSERPZzZybWJTL0Z0TU9GVUFt?=
 =?utf-8?B?SDRjbCtXRnRlSWtjVlRYVi94M3ZtYXJVRWJZZGVrUUIxMVRUU3ljazdNbEV6?=
 =?utf-8?B?T0d2RVlhbTFkK0p4VGs1Z2RwaS8vOFpsR21KRWMyanFaZUVPS282QzREQlVJ?=
 =?utf-8?B?R0RuWjhURUo2M0pOYlZYa1Nia3pLc05hRmZkK3VDL0QySzI0cVUxa3lURmMw?=
 =?utf-8?B?a2h3WUQ0bGFaa0ZJNE4rTnlXQ1hCeDVXeG5EcU94ZFg5L1J0RmR1Z3lVayta?=
 =?utf-8?B?UDB0UkVxRllNMDVQdW5ZZVV1bEttUlJld2Z6S3lWb0RKeWZnb0pCOTZhblJD?=
 =?utf-8?B?RG9OeXlwVms2YiszYzJMTlo3S2RqQlNVa1MvQS9BK2VGeHFXaDVmUVZCajN0?=
 =?utf-8?B?a0hIb0VFTG9Ld2ZRUWtmR0xyN3p0UFA3d2FySGxmWFRRbWxHS0l4R0gyYm1l?=
 =?utf-8?B?V1Jvclgwci9nR3pXQXBBVTFEWFBWdHZ4UzRjUThleVJ1YlkrdUVQcWgwVmxS?=
 =?utf-8?B?bmhSbnJhc0gyaGtteEZncUFjRU9vc2wyMFVZdXRudUpZMTlZMW41elNROWxO?=
 =?utf-8?B?UmpmbUpWKzBweFpkTEloOS9EQXBlSFpZQmxGMHJiQ2xHTzkyTUVhTHAyeDBz?=
 =?utf-8?B?b08wbTRFSHloZGlKRXRadS9LME42WHNDUlowVmEvcC8xSGVQWUhjMCtSOFVT?=
 =?utf-8?B?WWlzaU51N2xqUHd2dldlT2Uwb3BrSTVzVTVvRkVIYUczSmRsdEx2dm9CUlRM?=
 =?utf-8?B?Y0ZkRFJFMEtkQWdIYTQ1ZzdDb29rUW85elBsRGNjUUt0M3B4YnhIZU5KODVt?=
 =?utf-8?B?SVhBZkJjVlgzYWJvdXhYMVRsMHFmOTY3aWlBek0vRUkyTTAwNEFyMFE5VE1i?=
 =?utf-8?B?L3I3Q1ZHQ1QxYnJJb203dGRTbVRGSUdrR29zWFJ1eG5ZY2xTUEcveTN5NFUr?=
 =?utf-8?B?VzNCTlJWRzF0OW9yMjk4MllHMmZWRUhWWTBGai9BV21ZUkR3eFc3YmVPN0hY?=
 =?utf-8?B?NlNsNDBoVW10UTVlNkdrUitiV1J2SFRYN3FtV1FZRW50R2xPTFcvTW80Zklo?=
 =?utf-8?B?c25SaWFGYVRwZXduSkVKYzZNbGRvaTNGc2JBNmxkelZhUi80NG5PYW0xUG9U?=
 =?utf-8?B?ZzBtcDcvbjVUdWlSUWxieEcxbVBNT09pOHFRQ3R5ZlgrenNmQUM3bGN5ak1C?=
 =?utf-8?B?NUthS0NZb0VMOXh0blZIYWpuY3BQTFk0cWoyYkhxZlNtaTIrc1NsNzE5bGR3?=
 =?utf-8?B?Y0NBczUyRFVzakpZUjVXOFZlYTYrcVBpb3JQcW96dC9PR2tCWm0rcVVGdG0r?=
 =?utf-8?B?RWRGTFNkYTJPQS9xUFV4YWZRelR2WXNaRUhEVGErKzFUczhvSkY1a0MzeHdk?=
 =?utf-8?B?Z0NvMVVXNXQxaEdWbVY1b1RyVnZHc3lreE9HcERDQ0ppdmEyMTVxUXEyOGVw?=
 =?utf-8?B?MksrNW4wUm55akE5YjJDWldNTXhyb3NvOEIxNC94ZG12Y09jSUdhYnhUZUlT?=
 =?utf-8?B?SFhDR0NuTlJNSnN4TDdxQlRiQlk3OFM5WXFjbDM3RmdOZnRxMGt0Z1JNZ29w?=
 =?utf-8?B?TWY1Ri9OMnNJMWZPUVpOR0pyaVNrOWw3NGIzNkFFOWRRTHlpeVdzMkJnY1pv?=
 =?utf-8?B?dmpPRVY5bjgzQXNPWTZFa2dlaXBVem5BMXJHTE5ocVY0ay9ySjJobmF2MFdi?=
 =?utf-8?B?UTNnWnZMM3ZBVG9GVnlUNlRDMi95R0VieE04d1FmWUhjNVI4V0MvUTNSM09B?=
 =?utf-8?B?RElKL2FId1NUejFVdGwrZ0lOZ1pOK09YQzU5NUhta3J3OHc0bkVKbURhemRK?=
 =?utf-8?B?U2w2dzVyZG5rV1c2bmhQUkN1dDltTFVvMGxzRlFPb2c1RFV6Qzh3L3BXK2FG?=
 =?utf-8?B?Z0RsaTJDWGs1NHJIUTFER0Zua2xIYUYxeWtueTRpclIyNjg0UUNRNTlld2Nz?=
 =?utf-8?Q?WZ/vjLTQkf+81BZpHIV6vLlX3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: m4iZJtUPkqlGVDlT0ChZcAvIbqhMUExymbSRV3Cp1S+/m8ezmdNWfGexC7NxYK+rOpJ4h17NprdMJ1hb3pnQkyJItLlD/ZdRPCOT2rSuHyD033ZDQPUsZrJgBpnJ8zWihQtkCwJvjWZkw0i6vLf3dibLPOq2rt0Hn4JoKgc6V1Ohhi/4+Ky4kRy7HfTwPw3s7lvrg2tj+1BmS02ZUTAB5T2QjrqyWTLkMk6IJXGhYsreXLf8+GVLaIuAa/Gz+p4m6LEJK4OHRc35FM7jwz6fiQmVRH5srKPjWqeFdldY6JsYvuKyaHfCqQFcOv5tlANzbCFwRyYT1Rm/0j9ySN6Y9ud4nEQCEadF5946dIhrzA7pSQDjxoMb8BuvEzJuhwB9fdlK4bEm1G99lqnuwtWKaPntrTKkPJwbQp/sC7G6pG4SzKoyfvn/jIIrj1ernIpoVQxC05HzdR7D0kuEQiL1wrR5xhvOOhvqM/bpP9yCHJuDRJ3kAvgtE9YKlmv3WF3D076rIH0AdnfCDPvJigFJCm5xJc2bUxQXqGA+WZGXf1Fx7mGKPWDFov2fZqj3wDojxHk+Fz85p6/vpFo+GZ5DAl/OBg0fYEaH3cNNAMi5T20TcaldHbZakGG7hdi8cuBDd8vjCVfgl3MvhVtUWCLTz4uu2rPIUahxSxzAtIhNwgweJcx5KEYYqVDiGoT2QLc3
X-OriginatorOrg: eagleeyet.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR08MB10852.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aadb06f8-aac8-443a-c69c-08de0f72aae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 00:50:30.0797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 689fcbc3-edb4-45aa-9f50-cf9ecb3e505a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B900V+skBFZLXjRGAj0XzvYo9b5ctmhVaXj8sK+mvz71ifWtWzuDjErL2efVfxEGODYTuZj3cx9YjOOZA1aLwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5940
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

R29vZCBldmVuaW5nLA0KDQpJIGhhdmUgYSB2ZXJ5IGludGVyZXN0aW5nIHVzZSBjYXNlIHRoYXQg
SSB3b3VsZCBsaWtlIHRvIHJ1biBieSB0aGUgbGlzdC4gDQoNCk15IGlQaG9uZSBpcyBwZWVyZWQg
d2l0aCBteSBvcG5zZW5zZSByb3V0ZXIgd2hpY2ggaGFzIFdpcmVHdWFyZC4gDQoNCklzIGl0IHBv
c3NpYmxlIGlmIEkgaGF2ZSBhIGxhcHRvcCBjb25uZWN0ZWQgdG8gbXkgcGhvbmUncyBob3RzcG90
IHRvIGhhdmUgYWxsIG5ldHdvcmsgdHJhZmZpYyBnbyBvdmVyIHRoZSBXaXJlR3VhcmQgdHVubmVs
IHRoYXQgbXkgcGhvbmUgaXMgY29ubmVjdGVkIHRvPw0KDQpSZWdhcmRzLA0KSm9uYXRoYW4NCg==
