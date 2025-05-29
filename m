Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DAAC54FB3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 May 2025 10:22:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ff00cc9;
	Thu, 29 May 2025 10:22:37 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023109.outbound.protection.outlook.com [52.101.72.109])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9c2ddc82
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 May 2025 10:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsEJqj9lfTS7tDFms26E9RGchvTou7ZguKcIoLCidARMx9FVgNsqFM+9+tSIJhUhSdLoMRDd7SJsSEHtqYvDIKkbpTSXg4wa5QGbfOpMfCCXqt2x9ae4vUKMtoMU6RpHEIzD4sCM9OgJsXo2tK/skhJ4nBH+cB+yo7lMyH6BNmZ3j1oTv4s+3C23gxvwrVMLIoIXCZiuS+aog7E1ftrNGDNHALtLQjBUQ8kjoWTHFA2xJp3Om7Xvd5nw4vPfb6sD1c4u8uSxBqpxguwj3m8/Wzf9GdxLydvMBZutDGF25hRGY8YsBiGleVf5CtCfeFv6nPCMxVa8p5Ctgcqhab8R8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFjpAAYwNNhJ2SVwtc87EqykuOAPd/e+xFL3E6rc+8I=;
 b=X43Vj053J+y5kagTP77JSyp+wiBBNVmvGf0CHRMZzTyMu1doxMb7hJE5K648UTYmtgmur4xE6aEBE5XSPd4iwbt7nYSky/BPrUTmL2hS+EKrpD+gJZAbZx+jePhgOYJqi+FnxW3TrFVBPZGk1Ic38c0js2LDQwlPTxNA2HkUtZvgOfyz3C8yJEqS0/+NfFTN2qJKahNFgCuGlX2NV9I9Nppg/PBqmvzzUt4mkT7bX4MeH4XrqpF7ikLOVQbR/WWj0liidBsa8jQCPCTQnse9j/rUyvflyVofYd37i0LiLyyvhGLOgAGsvx8Kiig9fNx0xZDKpGs2A5l0zPeHtYW3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polito.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFjpAAYwNNhJ2SVwtc87EqykuOAPd/e+xFL3E6rc+8I=;
 b=HfRNNtxG+j3sJT1yZS0bhPYheawnnlpXk3SQ4OqfrPqRUZwgI801ZYt/ZsSAmrZQZPFcsawCs+rLsUUeFKWRKHjRABjGv0/BoYjg2GKC0S6p1+yJXZMVCQ8V203uaTg+MQUuWTzIvgBU271ysYs3Z4CxcsRyI8pvZcjkul/DRrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AS4PR05MB9013.eurprd05.prod.outlook.com (2603:10a6:20b:4e5::16)
 by AM8PR05MB7507.eurprd05.prod.outlook.com (2603:10a6:20b:1da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 10:22:33 +0000
Received: from AS4PR05MB9013.eurprd05.prod.outlook.com
 ([fe80::38dd:f975:d9e7:3a60]) by AS4PR05MB9013.eurprd05.prod.outlook.com
 ([fe80::38dd:f975:d9e7:3a60%7]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 10:22:33 +0000
Message-ID: <110667b9-ec00-44d4-a46d-2c5fb1892455@polito.it>
Date: Thu, 29 May 2025 12:22:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Enabling Threaded NAPI by Default
Content-Language: it
From: Mirco Barone <mirco.barone@polito.it>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <PA4PR05MB8995153AC212DDED36166CC48964A@PA4PR05MB8995.eurprd05.prod.outlook.com>
 <CAHmME9pV8inzKksdXFq8C1ey9dLJZBUzNJoCr7PrrqeHqy=e-g@mail.gmail.com>
 <PA4PR05MB8995DDB49A853E42F264B6458967A@PA4PR05MB8995.eurprd05.prod.outlook.com>
In-Reply-To: <PA4PR05MB8995DDB49A853E42F264B6458967A@PA4PR05MB8995.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 250529-0, 29/5/2025), Outbound message
X-Antivirus-Status: Clean
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To AS4PR05MB9013.eurprd05.prod.outlook.com
 (2603:10a6:20b:4e5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR05MB9013:EE_|AM8PR05MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: a35214a5-c416-4167-6a5a-08dd9e9ab9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0hNeWZDUGlWMzJaNnFyeXVwMFZmR0NtUFRPcWR1TVd1eVdRYldwTkEzNitC?=
 =?utf-8?B?QzdvODk3c1huNWVuSGwrckJMRFlyUGlIS2pLaklWUWs2Nm1Sb0ZTemJ6aWdZ?=
 =?utf-8?B?S0JrTk9ldktGMVMxaFNtczV6ZG5YVmRBTitoWEhTSSttRExZeUtid0hjL29K?=
 =?utf-8?B?T2xHOFd1MzNoenlMTEFiYXNjTWFlQzJHcWRINW5QbDFUTkNhMDJGTVBIWC92?=
 =?utf-8?B?R0lkSVJIcDczRi9jTHVkaXJwcFBzc2VzeDdWWUVkNnhpZjR0eWJYdjQrZGha?=
 =?utf-8?B?dUxqSkhiOGNTMlduTVorQlhBeDdkTkRHeDBXOCtYdnFid3k3cEFVMm1RQnQx?=
 =?utf-8?B?bHlGR2RYNWw4OXpIbERKOXVzYWY5UUNCcUFDVGFDOG14REFFWGx0d2JuOXdE?=
 =?utf-8?B?aXpZWWFqemRINldQZ2UwSlZ5aExUNFhVQnpyWnZPbnRCeENzZG50aXppRlJI?=
 =?utf-8?B?WUFoOFVSVnVCMDVYTG5sNnQwbmZZdFhESHhHdmd0elY3VXBaV1NGeFV3cWw0?=
 =?utf-8?B?MWErVDFyMGhQVjRESXhYTFNnSnVWSEowNnM1U3JpejZCSU94ZXlFV2cvNGk1?=
 =?utf-8?B?aEJ3akdTeDNXTjQxU3FNdk10YjJrYml6QmxxMTV4ZkpvdzFacXZMWERSVWov?=
 =?utf-8?B?VVI3TE1tVHZxbExuVmJCS3ZDRXlId1VtVmJVZGtpQ1c2MFBMTVRlUHo3UTJh?=
 =?utf-8?B?c0ZpTzhwcTRVREJNUjBSbk1uTmt5M29BU2svREZxYlBnQitnK3ArRXRXTU5u?=
 =?utf-8?B?U3JYVkZIemh6UzR4YVZQK3A4Sm91QktOSElWdm1sUmNSeDRldmsxeXJwY1lk?=
 =?utf-8?B?WDVBU1JqVm5UV2pYbDM4dU81T3B1TVFQb3llN0VlaWYxbE9zTmZPdGZlOFhv?=
 =?utf-8?B?a3pzbUdSNHNkNlExMWFabTRubm4rQW1XRUdHQVo3ZEVtZnR0bEZpSTd5cCs5?=
 =?utf-8?B?TnhUcEZQNDZ5dDdaU3RqYk5iYUt6ZDRLYXhHZ3AvUDdGN1M5U0duMTdLeEJH?=
 =?utf-8?B?TEljenZ5c2Q0SFhqSU1QWk9pdmJEUElCZ3NaQlVCdGJpYWlHUWtaZG5HWXU0?=
 =?utf-8?B?T1dMWklkT0UyeW9xazVhUXNaRHdMcWFFMEVpbFJpUnJmNEV5cHVOa2k2WnM3?=
 =?utf-8?B?V1o1REV1ZStESnZ4azBqV29ZWTNZWlhOd3RKUWdRcFN5dTVxNlVoNjZRcGx3?=
 =?utf-8?B?cnQzUTQ4OU5pM3lORkcxNXFNT1FnT1lXdFUzbEFIQ2kvSk85SU9kaytZTEVq?=
 =?utf-8?B?Tng1MFhMdVdHVmZFa2FyWVRyNDNuOURKQVZRSFNkWEd3bVIwTEZVQVpvL2U1?=
 =?utf-8?B?RFBsKzBld29zQlRPNlZNRFdnOEFIWTlkaFlLWlc5cjlZRitvRzBvdEJuZ291?=
 =?utf-8?B?Um5Sbzc0YUdYUGlQWGpSTk45MXVQSEpiT0FaOWFTV0tER25XeDBPcE9kQk9k?=
 =?utf-8?B?S2k0cGVQVVNxYUxwYk9wMjB3WTN1TjcwaXNrZ3dMdFQ0N2hEZW9Na0RyeWVD?=
 =?utf-8?B?RStYYk1HVmZCVzNSc1NlbkwrUTNGTVBKVHdGWnYzODBjRG1zVWtWcWQvSDVY?=
 =?utf-8?B?aE1RcW13RXpCbjVwbk9hMzArMTRyaHhCRndGTUVpczR0MjM0cWh5NGlMZ3Nr?=
 =?utf-8?B?bkhCK0FJcUp5djVCTXVSdUh6K1dKdFhxZkJLOFlGS0p5K0NrRXlIeDFsdDVN?=
 =?utf-8?B?MGRaS2xaZ3lPTnUxbDBxbjRoQ0FRRHZhWFRTZDltQ0doNldySndENHZ5VU05?=
 =?utf-8?B?N3oyZmt2U0lJMUNLdHlyVFkyTy9lcmRWbjhIM1VwS2tuTU1KVEhjcisxdk5N?=
 =?utf-8?Q?O8wjvDGcDF95R01j6hOA1228TlZvWIdSU+4oM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR05MB9013.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hadGdkYTZGSWhWWlJEY3Y1cVhEd0w5aTN3Mk16bW9qRWhyZ3FqVzM4ekha?=
 =?utf-8?B?aUcvTHRPR2toNnNOeG9zS0RnZm04U296ZXFYckljYm4xNTNGM2wxV0dpNWla?=
 =?utf-8?B?aElzdUxPSEV1V0NNQ2NBcFBmNm9YNjBuSGpnN2crakpqNmNxV04xK1YxaklG?=
 =?utf-8?B?UEtaTDFwSmc3YTZoNTQxTG1Tek5TUFZjdEVWODN1bVdXamdCMHhnemtUbkZa?=
 =?utf-8?B?V1ZJdHhwaytPakpoOTJ5U080aHN4UVRqNHhpOW1tR3h4dWlSblNBdXFjc2VT?=
 =?utf-8?B?ajNYOUJFQXBSd1NGNUUzVGUzMTVTZy8rSzJDRE5pTUZ5Z2dJZUR2N0k5Z05p?=
 =?utf-8?B?SVpYTDhSMTBCdTNZNERRaVZnaURqT0R4SW42VjV1WnNLdGl3ZDJZOXEvTG5i?=
 =?utf-8?B?aTg4UHFnK2twWlJWenZOaG4raHhMektSc1pVbHh4NUx3Y2VLU2FzYUUySXov?=
 =?utf-8?B?RTZCOXVNSzhOZVRWdm1lOTl5QnlhZmw3MytCVHp1VUE1WVlicFNpbmI5T0xx?=
 =?utf-8?B?OWtiU1M0cnNpUm5JSmZlUVE2a3Z4bEd6Z0NlbWEvQWN2cUh6TU1sdXllNW4x?=
 =?utf-8?B?bHdMVDNLTTBHS1RvOGwwWWE4YytlWGtSZXBDZ1BFWU94ZnlWVEhpRXJDUWNm?=
 =?utf-8?B?aUFpUkRaNHFmdmpuZTRiUFQxM2QrVjdGRkFsb1hGOXhWQTFNbmdmUDJmdytP?=
 =?utf-8?B?YkFnN0FZZVhxb2hIK2FUM3FrcnpTSllnaVBJYjE0eWd5UERIWW1NdFUyVmM5?=
 =?utf-8?B?QVg2MElybEoyS0ZrZlFOazRHdW5WVDFBSytHZEMxK1lpZ2xwODF5bEZoTCty?=
 =?utf-8?B?NDlhT0RQSm9iaG1kaHI2TEpBNk9pdXk2UzRwZis4NTEvQ2tKU0hCRUdPaFVM?=
 =?utf-8?B?SDNUSml6MmFIUE5vQkRHb2dVMGV5eVpreDdYa0ZERUtYR1JaaHBIVVowcHFJ?=
 =?utf-8?B?MnFzVEYrYmgwR04zSHpwRGxFcE5aRHAwOTB1Y3FnOXZKNTF4V2k1K241Ykto?=
 =?utf-8?B?YlBUTmtPSlR5ajEzcFRsOGdSS1BySE1xOWwyTVhZaDBVVk9OazNYZUVDRjU0?=
 =?utf-8?B?TFk5c3lNTThwUGpjQ1JsNVVucjF2bVVPYUxUZEg4NysyRWpVT2RnMGtoYU8y?=
 =?utf-8?B?U3Z1ZkVQL21ocERxb2Jkd0NxV0RzVURBSU9nM2drYTNRZlBYZFBUUmErbGVt?=
 =?utf-8?B?cGRTR3dsMEVrdTB5azFUUUdzQjUrS1hXWnFCR21Rb3BjZDlyWXQvb3NNWk1O?=
 =?utf-8?B?bXY3Ryt1RWpUMnhRWjJCNjQ3RzNmZEExMGRZTkxpK1lLZEY0RmVIcHhEOGtj?=
 =?utf-8?B?MzZFU01ZdXFTWFJUcHlVUnNPWFp2Y0t4V280dHpodmFEZm94Q3BzOFgvbS9H?=
 =?utf-8?B?UUNtMmxQVG5sZEZqYldBZ3lNbGZkdmNnT2lsRlFGR2RwUTZ3b0g5VjQrTWI5?=
 =?utf-8?B?ZHRQVHplS1V2eHd2cDcrd3I4WU1zTGNmallTTkV4cWRwMGUvdnlHS0daampv?=
 =?utf-8?B?RUZ3QVFLUG1zcWdObnl6NVB1QW16bDVPZU9Vc1pwdW5sVkg3b1pDSzdCcTYw?=
 =?utf-8?B?bjY4TkJSZWZ0WmxYRnZxSzQweU0vT1ErSU5oVXgxUFNPVTFaYmZJTkY0bVdz?=
 =?utf-8?B?eWp3YjFvTmNocUswTnBSaHRlNkZSZ3BuRzJPaDZPdGlJTkRhVU9FaHExUjVw?=
 =?utf-8?B?ZlJDd0xqemczclk0cHVaTTFObkdEMUMvY3F1NTlXOHlWQlR3eS9sY2RxUDY4?=
 =?utf-8?B?cjVINVJzZWxPVXcwcUx5UHdjZ0tSN1llb012d1hROUgvN2pVUzhmV0cyUE1m?=
 =?utf-8?B?RFRzYzJ1a3A4WGdMZzRrMExCbHRWNEI1MCtyRUVuSnZnWEppSzIwbUhwS1d6?=
 =?utf-8?B?bFVRdzZzUWpYc3ZLK2dvOEJramJXdjJKSXoyMEpOZ0NvMTVTOElKYnZabTdL?=
 =?utf-8?B?ZXY5R2pzYjEzbk42WXMzVXZsSVRjREROa0ZxMXJSRnZMUXJtMEIwYUE3S3Ny?=
 =?utf-8?B?UU8rSU8wMnVDZEFPd2J1SkpVNk1MM0VUcS9xYXZPM0VmQjBJcFJpRVpvNlFI?=
 =?utf-8?B?VEhiS08vdm1aYzVyU21LQ2E0azZMb2pManpoWUFjcmo5aXY2ZHVYM0RWSEVP?=
 =?utf-8?Q?LJMBeJgkShV3ASCcG90HRFbXR?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: a35214a5-c416-4167-6a5a-08dd9e9ab9ba
X-MS-Exchange-CrossTenant-AuthSource: AS4PR05MB9013.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 10:22:33.6116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1dDpNiwkYAhxWzEj1CVFyCQAqZgwL3jjMu/w0i/soWV/MQsNVoZ4P5UMFdoyvgpYN7wuJp6cWmFVDPxuAIW+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR05MB7507
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

On 5/28/2025 7:26 PM, Mirco Barone wrote:
> This patch enables threaded NAPI by default for WireGuard devices in
> response to low performance behavior that we observed when multiple
> tunnels (and thus multiple wg devices) are deployed on a single host.
> This affects any kind of multi-tunnel deployment, regardless of whether
> the tunnels share the same endpoints or not (i.e., a VPN concentrator
> type of gateway would also be affected).
>
> The problem is caused by the fact that, in case of a traffic surge that
> involves multiple tunnels at the same time, the polling of the NAPI
> instance of all these wg devices tends to converge onto the same core,
> causing underutilization of the CPU and bottlenecking performance.
>
> This happens because NAPI polling is hosted by default in softirq
> context, but the WireGuard driver only raises this softirq after the rx
> peer queue has been drained, which doesn't happen during high traffic.
> In this case, the softirq already active on a core is reused instead of
> raising a new one.
>
> As a result, once two or more tunnel softirqs have been scheduled on
> the same core, they remain pinned there until the surge ends.
>
> In our experiments, this almost always leads to all tunnel NAPIs being
> handled on a single core shortly after a surge begins, limiting
> scalability to less than 3× the performance of a single tunnel, despite
> plenty of unused CPU cores being available.
>
> The proposed mitigation is to enable threaded NAPI for all WireGuard
> devices. This moves the NAPI polling context to a dedicated per-device
> kernel thread, allowing the scheduler to balance the load across all
> available cores.
>
> On our 32-core gateways, enabling threaded NAPI yields a ~4× performance
> improvement with 16 tunnels, increasing throughput from ~13 Gbps to
> ~48 Gbps. Meanwhile, CPU usage on the receiver (which is the bottleneck)
> jumps from 20% to 100%.
>
> We have found no performance regressions in any scenario we tested.
> Single-tunnel throughput remains unchanged.
>
> More details are available in our Netdev paper:
> https://netdevconf.info/0x18/docs/netdev-0x18-paper23-talk-paper.pdf
> ---
>   drivers/net/wireguard/device.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
> index 45e9b908dbfb..bb77f54d7526 100644
> --- a/drivers/net/wireguard/device.c
> +++ b/drivers/net/wireguard/device.c
> @@ -363,6 +363,7 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
>   	ret = wg_ratelimiter_init();
>   	if (ret < 0)
>   		goto err_free_handshake_queue;
> +	dev_set_threaded(dev,true);
>   
>   	ret = register_netdevice(dev);
>   	if (ret < 0)
Signed-off-by: Mirco Barone <mirco.barone@polito.it>
