Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F288CAC581
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 01:05:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1f9a5be;
	Sat, 6 Sep 2025 00:19:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 49ddb823
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757117980; x=1788653980;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=NwOiNSgej0IOd6UgVQAUn2qFv/1N88JEO7zx9fbzYyw=;
 b=XF3GQqnq8DTKybE9sZGch/c/6NBeiiNndgD86VoPAY3l+XoBo+AbrRtx
 R5j6ivNm8YlJaCe5oDGgfhK65FD+Gmfc75qM0xX3WNq1XWO0iV0ztevK3
 JVu+cnEUTF98SEqSslcYNEm7ett2Dw24rDKRPyW50iPyeit8uyD/Lcvjo
 rTzD3TmcI9bWVZ/vHnhft6n0Sb71ZyR/pL2YxNk4K/mPiphoOppIAm5EY
 Ooqb/Gwz1WHUvCRp5KlRYxd1NdVgULQ0WFNuFv3UM1/m+LVW2pD8wp0iw
 fkJRu7vaDyy8UFDd6Jk2Bic3cczFFSYcpKlwufbpdNb3gwA4eknFH1ev4 w==;
X-CSE-ConnectionGUID: ax1wxtRcTyyrrKuJXjzZag==
X-CSE-MsgGUID: TibecD/dS6KuB6LYKfXOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63112778"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
 d="asc'?scan'208";a="63112778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 17:19:38 -0700
X-CSE-ConnectionGUID: i6WvKdUVQlSS+OK+ds0R4w==
X-CSE-MsgGUID: 8Z4VPPEWQlq+/GqWEe6Glg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
 d="asc'?scan'208";a="195949390"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 17:19:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 17:19:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 17:19:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 17:19:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2tu1kxm7SqwSCB29i1b0Kfk92mFjApmItQ3WkjJmqhsXVMRjGEvhFN4urdrSrbxieaK2apPHZWko1t0pG3GkH3A5ECBL2ky5KDa5E/SK2TA2mI/greRYXyxB3eNDLTlo/u57Mv+nBNVHD1KMnXjinLvel7bFjePSf61wqlnv2RoqIO2fvMyYh6vJvBSTJpyPyKgYORLm67Np6/ovuLec1QAp3Jl909U7iDK0DLy+/Yvt8WnMF3cXs6cP8K/A6MlVLR4Dany75BJ/Q/5ZIEwKXvbw9XGdCb8WRChalDQsgPKc/jxUo98d99crIT2CjT3lOG0UYJ+xFpHqDFdIJgKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiRov2b72++Q7nfJpV+7NUYhRGSgI7ne1kLl2erKp50=;
 b=JCRzhZ+5jg4+c4y0xp/6PmVDZPT8cwRtsLz04hqteCa71aOKA9Wufw65+BKknmfE5Yw6roAYH9WCrHdb7Mp5Q3iF6+vQvcda4Ef5NDWoZqkVjkYP7q+yXmxBTXKSXOguUlpT63uvKnOtoR3X/nh0Ed6YHGGay4ANYewFX3h/L2ktqyWLKf90sq1Sfiwif0BIChkc29Dc7OrZLmhGMHGx8g0GbOf2WoquWlBWbzgxmqTVkvrrnM5unRdNl4vwdVQMTrTpzEmj85OxBlDFJ/V75XLe7xwhWBaQyW09WWXyNxUof9Bp4YVPAjn4n0aziJP4jEslQAUuEQ1NhenpLa5ZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA1PR11MB6372.namprd11.prod.outlook.com (2603:10b6:208:3ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Sat, 6 Sep
 2025 00:19:35 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9094.018; Sat, 6 Sep 2025
 00:19:35 +0000
Message-ID: <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
Date: Fri, 5 Sep 2025 17:19:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
To: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
CC: Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, <wireguard@lists.zx2c4.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
Autocrypt: addr=jacob.e.keller@intel.com; keydata=
 xjMEaFx9ShYJKwYBBAHaRw8BAQdAE+TQsi9s60VNWijGeBIKU6hsXLwMt/JY9ni1wnsVd7nN
 J0phY29iIEtlbGxlciA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPsKTBBMWCgA7FiEEIEBU
 qdczkFYq7EMeapZdPm8PKOgFAmhcfUoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQapZdPm8PKOiZAAEA4UV0uM2PhFAw+tlK81gP+fgRqBVYlhmMyroXadv0lH4BAIf4jLxI
 UPEL4+zzp4ekaw8IyFz+mRMUBaS2l+cpoBUBzjgEaFx9ShIKKwYBBAGXVQEFAQEHQF386lYe
 MPZBiQHGXwjbBWS5OMBems5rgajcBMKc4W4aAwEIB8J4BBgWCgAgFiEEIEBUqdczkFYq7EMe
 apZdPm8PKOgFAmhcfUoCGwwACgkQapZdPm8PKOjbUQD+MsPBANqBUiNt+7w0dC73R6UcQzbg
 cFx4Yvms6cJjeD4BAKf193xbq7W3T7r9BdfTw6HRFYDiHXgkyoc/2Q4/T+8H
In-Reply-To: <20250904220156.1006541-2-ast@fiberby.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OK0A0TKCfPsEhcgyGmer6gP0"
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA1PR11MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: e359a8ff-9ac9-46af-c59d-08ddecdb0f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEtBTVYyNzY0Z1ByU21ac0JRLyt0Z21PTGxNdm1DcWU1VzlkelBtR0xDck9X?=
 =?utf-8?B?K2NkRnZkNkhvVy9HWVZCZGJWcUJxYS9pTGRUSWFUc1k1dDRNejNrQi9BYWRL?=
 =?utf-8?B?a1Q5OFp4NHp5WlQ2NFEvaUs0M3RmTGtvRyt6SEYwT2Z4ditWK2l3aWJFeFJ0?=
 =?utf-8?B?Z3dWUWFTQWY0SEtHOEhPbEVuNUlwWktGWjZqVEZWMjI0dFdYeHl5amN0YkhS?=
 =?utf-8?B?enRrSEw1YVhGKzlqTlJrTWxZUjJGdmNPZ05USXJlSTUzNktlN3FzWDV4a1dW?=
 =?utf-8?B?Mzd5MWhjN2lJNW56M29zbGxHVzg5ejk4QUtFbkRodFZ3QVFPL0p0bFVEVmxx?=
 =?utf-8?B?eXFlY1c1SHBESGRUZm5jeGV2eXBub1Exc3VSQlZJS1hKODRHbVpEY3RXY25z?=
 =?utf-8?B?VXBYQytOL09ZQXNDY3oxLzQ5ZVdFcThvZzNvenpGVFFFTFFzYWxqeFptdHQx?=
 =?utf-8?B?VWdkYXpqUmd2RFU1WHVHQUlxVlFEcENlUlU2cHg2aHZUWmQwWVoxZXcrVlBt?=
 =?utf-8?B?SHpzb2FCcWNZU2FXQm1EMm9xcnNjUEx6M05ZVDU1djFUMy95ZEJpMzBvbzRX?=
 =?utf-8?B?UXZKbVFtYzRiNG5HbEg5ajNWWjY0L3hnN2IrS293c0w3Y0VmUlBKSDJicEk0?=
 =?utf-8?B?d3NrN2NCQWhGdGI1QXNMV1pLM3k2QnQ3dFNpRFRoaUM2ZlAzb2NYcTJBSkgz?=
 =?utf-8?B?Z1VxRUpWeWhlQ2FqbnFITXdmNEtLVkxaTU4ySlRjcVE4UXY0VEVFQ1BqczVT?=
 =?utf-8?B?c0wwZ3ZiZmNIYlJNNHBzSFlRNWM2S0t6NlRPZFdSdkZWL1FGc0xOWnVaYXBw?=
 =?utf-8?B?elVhZ3hNWHo3bVBtUWNUMEhsMTRqWmJJaXBEVjRtSit3MUx0TTZjRHdGQVRE?=
 =?utf-8?B?RGdpVlpWSjN5d3hXL3hpUi93alcrSzNxTkFxY3FrSjVPUm9OajdnR3Z3M2U3?=
 =?utf-8?B?TjFmWTIrOUpmV3AyUkdXMGVhT2VXaVZ4WmdzN2dMaVZOY0tqRHZnTThGK3hw?=
 =?utf-8?B?MER3cEV5SzIvYkFGZnQrRDRjNnpUV0dlQnNVMlk5UU9nVk5NUUlLeWF3U05I?=
 =?utf-8?B?cVUyam9oajRNNXNrcyszcDJ5Q0VVWVZRVFZkNG40ODFpeGNCV1RFSldaVDU4?=
 =?utf-8?B?RmpOeEh2QXY2cVc4bWl2K2s1VUtCb2ZFYlMzQ1N4dlVsWFhuMUx5T2dvdTNJ?=
 =?utf-8?B?WnFkYTRpVUl4NGhpLzQzTFdYbEVZQitwa2NJTUFLd2JwVWIxWHM1d2cwekR3?=
 =?utf-8?B?NTlTd1hCZmZTbjJFMklvaFJINk5DZUI1bE8renJETGp5bVZQdkpMMXdEWGsv?=
 =?utf-8?B?WFFVZGZBWGo4RXhmSkNvSCtKYTlkb0VUeXJuUFJGRzNjYlVpcDZ4bmtWQ1Fx?=
 =?utf-8?B?SE1kZnR2blp1L081OXk2WWRMbi9QM1V4MlFibllUSEJlMEx6WDhmdmhSU0tX?=
 =?utf-8?B?RldjRHZoSXJQL1M0enhFNndnSVVqWitVUnR0QVJuazVqd0JQR1lqMVduQ09l?=
 =?utf-8?B?cFdFWXFZT29aTmJRUTkvT3VscjB5anVQdkp4UDMyZHJ2RThia0RueGQ4eXdz?=
 =?utf-8?B?dlBjRjVGV3RXK01XbzQwSlZhdklhSUNwUkVDZEc5NjJqMHpJU0NxUW9JSzBT?=
 =?utf-8?B?Q2lTa2grN2tSRjhUdUJDQ3J1STg2bTBDVXZ0QkFBaEpyM1BGN2V3eHAxcXV2?=
 =?utf-8?B?L3d3bFdqR3Q4WWNjMk4xbDBKaVJPNmVtQVBmelhmWTErNVhwMElHRExyakps?=
 =?utf-8?B?Y0lYMHEyY2lRQnozOTdUL0dabFEzOHBKcm5SWWpZM05nWm1Kck9Jem9ETU5C?=
 =?utf-8?B?OUdtMEFrVkVWaVFzejNKVTVjNVIzZmVpYUxodlorbDUvRC8rVUs3WnE2b251?=
 =?utf-8?B?cVBRb0ZXVitpWldML0FxNXlObFpGemNLaE5tSjlNQkUyQzgybnZRTlY4YXZZ?=
 =?utf-8?Q?tZEQ7b5WH2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZoYzQwRGcrbktSY3llN2taMzN6a3R3ckVXcjl4cjFvY21qbTlrV3lMRUNr?=
 =?utf-8?B?bml4bjFrVmV1K1dHVWVRS2VLeDRxZ1UyeHlpNytrWnI2dlpxbkFQYWh4K1U4?=
 =?utf-8?B?MUIzeFc4ZFUwN0p0M1NEZU5tbTU2OG5EWWRpdVFQcG1SUmZYZnhwcVVPcWc0?=
 =?utf-8?B?S1hUT0x6UFVZSCtYcnJYY2szSTYwOHlOajErK0dZamlNck9YMzFwQ0NLNTN4?=
 =?utf-8?B?RlY4ZDI5YUJ5ZnNVVGU0cjdkczlzZ3Jmc0tXUjVVbzd6YkVKK1dTeDNNeTFQ?=
 =?utf-8?B?bFN1d2pnaEtmREdWbnJTQ04vTXRGcE5jNmtjenlQU0piejB4U1Y1TzZ6QTc0?=
 =?utf-8?B?WE0xOFR1NVNQa2kybnJKUWhXTjllZC84Z29Ld1lWVGlpM3FLK3Rjcll3WXc4?=
 =?utf-8?B?MHNVaGp1ZHlNNDZHZlN4SnB5YXM2T2gzdFJMVW81QjVkTk01Qi9sQTJPRTVI?=
 =?utf-8?B?WDg4SWl0eXUwdUxlSWhyeThPeWxDZEUweU4xSWRKZ0VkYnMyLzhGbWxTTHAy?=
 =?utf-8?B?VzNYcmlpWDVOM29DRHBuWkNnUldxMnFPSDlJdU5lM09MYm1xUXYvR1BpZWE4?=
 =?utf-8?B?d0FNdm51NUh3SEc5MDlCYURtaUw1ZlJtSnQxSzgxbW1xL00zbXBFdHJ6c3Zt?=
 =?utf-8?B?amhyeXNHbDMrcjNobjN4S1RJelhxcmVOYnZyWlRmQkRLQyt0Y25BYmY3aldV?=
 =?utf-8?B?NUxsanpMdllvNjFTV2tHYklYbTh2Q0lwc090cEpXTHRhYjN1aStBbk00bWZE?=
 =?utf-8?B?VWkxMFpTdmR6M2kwbUN4dG9icFdZbThVZDlKak9wYTF4Z1ZXeXNqWUg1Uk9G?=
 =?utf-8?B?bkI4Z1Babk5BZzZrN3kwTmZ0NWNGSXI4cWRkRHAzdFdFU0JMemE0RmZMa253?=
 =?utf-8?B?eG9MSTQ0SVFVWklqMCtlSnFuQzczUFhhVjBOVzRaeFUvZ2ljekh5VHNkZzdJ?=
 =?utf-8?B?UFh5bzRZUWV4Y2p3N24xVjk0ZU1oNGM2RmRnaG5VakovamxPTkoyRzgwdzJS?=
 =?utf-8?B?WFFCUDgyWG0rNnBPMTFGeHYzK2l1MnNqYWxndVdhRkdQcTRZcXlpNG82VHB5?=
 =?utf-8?B?TXU3M09abW5sQXFqdG1TRGtiN3l6MndCYVR6RFIySTVhUktBdFFML0tDdGI3?=
 =?utf-8?B?S29OVTMzYjRsbXdUOXByNEM5YVpUQmRJei81R1ZicUJkY1l3UkdSOXZIRWh5?=
 =?utf-8?B?VVZ5NEd3NEluL2UxTTNoZWdoTWs4a2JKUjZrcitwNGFtVTRyU1BmNlg0U2gr?=
 =?utf-8?B?akhIRUw2b21oQWJIQmhKRlJFQzZrNllhSnc5dUV1a21ib3JTOHRxc1lpUnJM?=
 =?utf-8?B?c3grbmtSZ091SEJHYit4MjRicStKMVRiclB6STRwRWE2OVkrbUd6TEJybEti?=
 =?utf-8?B?QzdGOC83THMxRlFSdWtQdUFzNmU4MTlsMlp1Nk1qd0d5SVdHSjM4SlFNSHUv?=
 =?utf-8?B?em5oVWFhMW83WWRtUllLRE1BaGdtUU9Wb0ZrTGlZajZMT1BCUHpXMVpQdUNV?=
 =?utf-8?B?QjRteGp1NWhaaThwbk5yK2NuSTRyYW9OT01tR2NZcklYUlROc0NEb1Jjb0dE?=
 =?utf-8?B?YlBYd2l6STdkVXoxYXY5ZGEvTW5hTllGQkFDYlNVdXJPT0xUZmhmbkRybzV6?=
 =?utf-8?B?Q2dMTmZ0VWlVUUU5TzY4TkxodnRyZEhjbVdRb2dyeEk4WER2ZG5yYnNHZWdj?=
 =?utf-8?B?Q1F4ay9iNWxKbnZ5Z2sxcGZXR0RTMjJRT3BDYlBabE5WbFVONjRDUWx0Rk5O?=
 =?utf-8?B?bnd1YlcrTW9iNlZ4YlozMzBjNW1lZkpaLzZEVFo3ejJzeTNUVHFtZVJBdEFU?=
 =?utf-8?B?M0FWZDZNK2c2ZEZiZDVJN1dRVHN3MmxzREtPbUN1djhlMzByLzl2UHN3MEJH?=
 =?utf-8?B?Nkk0TExSaGNVYVNJclVHcVVOUUQ5Qk1ZNTlRNHdCb251aHZJcTRsb3VWbmpX?=
 =?utf-8?B?YkE1VCtrQmh3N3grdjErTVlOZG4rKzlXZFN0RHNOQkZXSGh5UUd0dWNrb2Rk?=
 =?utf-8?B?SG9ma01LdHF2TnA5L0I1SGtQT0d0M04zdzNEYjZOS0gwQ1dyaFNDRXVVUlUy?=
 =?utf-8?B?OXd5TFVUeTFEcFVqU2lvLy93Tk5KZnduL2Z4aFZFdisvZnIyYjlTMWk2WGdi?=
 =?utf-8?B?eDlCVjBidThNdXREdTltbzZpZGJpWlpPUXNiZGR3TmNFenMvV0g4b1pkY0FF?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e359a8ff-9ac9-46af-c59d-08ddecdb0f02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2025 00:19:35.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEjPH5cZSuJKVy2sMZr3nX4xJ2vKCDXT58e6N5iq/6OwynPOlmpGIoR/rMcGv+gPC/ayP5Y1wuMTov5uruROqQwCS8UYdwzg9ZfFdYttG70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6372
X-OriginatorOrg: intel.com
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

--------------OK0A0TKCfPsEhcgyGmer6gP0
Content-Type: multipart/mixed; boundary="------------13rP0tf1gz076TNjdvkzuDoX";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
In-Reply-To: <20250904220156.1006541-2-ast@fiberby.net>

--------------13rP0tf1gz076TNjdvkzuDoX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 9/4/2025 3:01 PM, Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> This patch adds support for NLA_POLICY_NESTED_ARRAY() policies.
>=20
> Example spec (from future wireguard.yaml):
> -
>   name: wgpeer
>   attributes:
>     -
>       name: allowedips
>       type: indexed-array
>       sub-type: nest
>       nested-attributes: wgallowedip
>=20
> yields NLA_POLICY_NESTED_ARRAY(wireguard_wgallowedip_nl_policy).
>=20
> This doesn't change any currently generated code, as it isn't
> used in any specs currently used for generating code.
>=20
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>
> ---

Is this keyed of off the sub-type? Does you mean that all the existing
uses of 'sub-type: nest' don't generate code today? Or that this
_attr_policy implementation is not called yet?

I checked and we have quite a number of uses:

> $ rg 'sub-type: nest'
> Documentation/netlink/specs/nlctrl.yaml
> 69:        sub-type: nest
> 74:        sub-type: nest
>=20
> Documentation/netlink/specs/tc.yaml
> 2045:        sub-type: nest
> 2065:        sub-type: nest
> 2190:        sub-type: nest
> 2304:        sub-type: nest
> 2494:        sub-type: nest
> 3021:        sub-type: nest
> 3181:        sub-type: nest
> 3567:        sub-type: nest
> 3799:        sub-type: nest
>=20
> Documentation/netlink/specs/rt-link.yaml
> 2203:        sub-type: nest
>=20
> Documentation/netlink/specs/nl80211.yaml
> 610:        sub-type: nest
> 1309:        sub-type: nest
> 1314:        sub-type: nest
> 1337:        sub-type: nest
> 1420:        sub-type: nest
> 1476:        sub-type: nest
> 1615:        sub-type: nest
>=20

--------------13rP0tf1gz076TNjdvkzuDoX--

--------------OK0A0TKCfPsEhcgyGmer6gP0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaLt+FQUDAAAAAAAKCRBqll0+bw8o6Bld
AQDdKDMJeuqdrANp4tIms7Rq7D2fDW3MnplTx7xEwp93ngD6A4JiIHDBvazIvKyYPaDPP+FOBRgS
myi8njPVNrkngQY=
=8lVf
-----END PGP SIGNATURE-----

--------------OK0A0TKCfPsEhcgyGmer6gP0--
