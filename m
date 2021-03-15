Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA94C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 19:55:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF32864EF3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 19:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF32864EF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=smartalock.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9583c21;
	Mon, 15 Mar 2021 19:52:47 +0000 (UTC)
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on2081.outbound.protection.outlook.com [40.107.107.81])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c55003c1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 16:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5XZRE/mGwhNol2GIzrxf3xDgx944KIFF4GymQge1g/1LFAHuJmWL2WW7Zc5DFmcF7yhmtmosKVpRkxD83daeniVvi28CmC0BxRz082pvwlVYFmoS5R9CCgdRZiBm445BP07O2rAXpHf2QoB38WO+nMpqQw9rmg4AmWa/ZArdvHIk0oIAFXgNomIi+ZjdaeFrAwL/yuHdHU566tFDmA1N2TPhoh5WDVnRG39CSN4sJWX1ZA4MkuLAprRbzymVn8rpOyOYQZL3GNtqGVC2zigN8myLaNh/+CDiiqSESd5X35OiMuGeoPMug2gYocCuMtoHNaaj8phvbaH1I+U/dWe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T21H3T94YDaVMAm8viK/VJ15jaWVuuAcokJ93GpuYWE=;
 b=En90SLXbL4Cd5COOizxuUJ7mnuvg5SK9hRhU6VqxiqXmXA2ZCtSR3QZEzGEgnOz2j9gvgM4yF21WppkXT/VkgVBuFrChsvyTeJT+zbAp6Dhvk/ngRY5/Rlzhwb+DjO/jmhTjknNZ9wEajfwM8PgwEjB0Jq7Z8LTddFwNiBLCx4bJUQPwaMWs7hIjAknmHk5fh6N+HQLwM/g625jCpqBkh4jPgbw3ZMXftNktGtvZNdkIkQE0h9CCumJxhBp0raqVpWaGH6gZYc+n2VvTuKnFGnu6RKOXhp1W1d7oS7RKDDyKc3BQCAKPUKq/xNCVKdH2q61l7CjqY8F2Q7t8q3B2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartalock.com; dmarc=pass action=none
 header.from=smartalock.com; dkim=pass header.d=smartalock.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getconsole.onmicrosoft.com; s=selector2-getconsole-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T21H3T94YDaVMAm8viK/VJ15jaWVuuAcokJ93GpuYWE=;
 b=lc1NbdSL/8VknrmIghuVJdZFQi3ub8EJ5wLDAc1Vij0NQQSpU0uSP59ExMcpw6wZxgX17mAh5lwXDWab6f0tXa/+Ub/X2JYdarHuppuBP4ZN+LP61gnK+8G8ZhidmtTXb7uiKBYrRO6ApW7bOqZVVgpH6YuI3zdiTEkE5Rfr2K8=
Authentication-Results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=smartalock.com;
Received: from ME3P282MB1748.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a3::15)
 by ME2P282MB0051.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:57::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 16:55:46 +0000
Received: from ME3P282MB1748.AUSP282.PROD.OUTLOOK.COM
 ([fe80::65fd:63f0:68bf:623e]) by ME3P282MB1748.AUSP282.PROD.OUTLOOK.COM
 ([fe80::65fd:63f0:68bf:623e%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 16:55:46 +0000
From: Daniel Hope <daniel.hope@smartalock.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: WireGuard Implementation for LwIP Stack
Message-Id: <7E828597-A5E0-4E54-B2C4-F1E83F25CD71@smartalock.com>
Date: Mon, 15 Mar 2021 16:55:36 +0000
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Originating-IP: [82.70.155.66]
X-ClientProxiedBy: LO4P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::6) To ME3P282MB1748.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a3::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.5.54] (82.70.155.66) by
 LO4P123CA0037.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 16:55:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69bd225-9af0-48a1-8189-08d8e7d32d90
X-MS-TrafficTypeDiagnostic: ME2P282MB0051:
X-Microsoft-Antispam-PRVS: <ME2P282MB00513A68FDF21B43CFCDC3CC916C9@ME2P282MB0051.AUSP282.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKFQ1Nf0MxK23aoEw9s5fKzAHhUk1LIK3s7cO9x0YfvL27DtXlY3wTUUaEYHfHp4+T4cx6d7TJt8I/r4+jJJTUT2/cqD2WRsGPi6/i7LoRBqmbVTDtBgTl9guTrfHuJ+lqalrydwe/+bkgzkjbK5nhNkKiHrGjpEGPmPCuvJBS0Meib8/zI2NL7eDd/5AFKGh1RMfhtbGTnGnK21Qmk4g5rqWcH/K9lASUCioptxqvrP2NcyQ4EfD6/Rd+XSCBPX6/ijomtu1fTaOAHtQl2Trd1XQxzk2eTQdXtsjR8N17sIDUHbWJ2J1rvJs0YXLeXaeOKFNbHPhNlJU8omNtoBz8If5geQO1KYuAyen+F7YFMbnZBiWTtkNa7le7l4We+syBn8E0TyYofEYLZqsBJVZ44E1umBCM58jGhzVHggsmq1HhjXpIXt5dHNHBg0GE8G1gJ7t/pODmdLJee1gQdoI2lE8TseUSL3uRzK0bkKo+hgK0V9kZOwVCml4qYWwHSYao9AqeNWaRu0g7dJIIc6y21CeCrqe9ZdQP6z9eN3ZhOVOGKWb3XRzMxfOFwJGJmqUYY/F0EiLTnp1Fs9TyXi8kLS6UUXZP3jMylKXQNsy+b/BEDRdXMjJTvBtQXOdmJdfoWj3iiIwerhVbAKb7v4+zdK2FZtaJPOnB6XtnrZbMP/LyYxeyf/C07VLX2527yj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ME3P282MB1748.AUSP282.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(376002)(42606007)(366004)(346002)(136003)(396003)(39830400003)(83380400001)(66476007)(66946007)(66556008)(44832011)(33656002)(36756003)(6666004)(5660300002)(52116002)(6486002)(8676002)(2906002)(2616005)(956004)(966005)(26005)(478600001)(16576012)(186003)(6916009)(16526019)(316002)(86362001)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTUrb3BvWktSa3M4T1JVUWFxWTZXYnFZM1dqeUo5R3JjMkZ0OUlsaXY0czR4?=
 =?utf-8?B?QVNIWVVjWml2Tk9Tbk5qZUFMcXQxUnhrblRaQzFTTmd5N2RRZ2FMSXRCNzdT?=
 =?utf-8?B?Z1luMnZweVlZU3Q0WWpLUlk1eVR0Nkt6V0tyb3UxUWVkRm9zU3ZEbGVWNDRL?=
 =?utf-8?B?b3lCQU05UysvYnVtc0VLUW9jTnNjMmNtVThvTmF2WmxTaEZUaksxK3lqWjlW?=
 =?utf-8?B?bldoZmVXRnJBL0Y4bVJDbW1HRzJJV2F4T2d2WDh1ZlB5YkFySVVRWXc4UDFN?=
 =?utf-8?B?T2hCUXlFWkJGb2JzKy9yUGJsSkE1bkZGbGtyb1FhSi9WT3dpVDhWTUhYYjRM?=
 =?utf-8?B?OTdERjRzWjArRDNxQ1FvWDJTKzQrL3pNZjhCUzJUTzVsdjlLRnZjeE9lK3pO?=
 =?utf-8?B?UjZaSHNhZ2pGSm1VV1liYStUQkkzSVY2dHFORHFTQmN2UnZNTnl5NXJZRHNH?=
 =?utf-8?B?VVQ2YmpmR09sRGdqK09sR25CVzBuMEFUdHJpdTF0SFpEOHNYZFU5NUxybHJB?=
 =?utf-8?B?RlZVRDV5SSsyMDZpckRUZHBpVXVrdVFEK0thbkcvT1JGWjVBV0VpSkEwb3hL?=
 =?utf-8?B?NnNmVjJqQjlLYjlvK2xaL25EMWQ1UlZNU3dhajRHNkRkZDBmekRHdklETkVQ?=
 =?utf-8?B?d1p1OTlWK3JUY3doa1h2UUt6NmdzU0VWTFFQeUpKRmRSM0p6Z1Y4ZUcxWEpI?=
 =?utf-8?B?ditNOTJkTFUrVEpkSldBc2NzUktkbUdMUENRYTRZZXp3YmpNa2pmSnJ5M1Iz?=
 =?utf-8?B?SEZ5dEd5bGhPakZmdXRQQmphQnJYdTVGNFBvY2pEb0lqSC8wU3d3UkI5M055?=
 =?utf-8?B?OGZ0Q29rdjdCNnJNQlVEdGl1QXQ3OHZ2QkkydldEQ2czbU1KY3grWGxCR2N1?=
 =?utf-8?B?clI3dkoxbk5iakVUcDVLNm5wempxQ0I3MTRhKytybnhmWmpGanBGbUNkbUkr?=
 =?utf-8?B?U1N3c0ZVQkQ0cHhFdUE5dVdqVjkvalBaL3FjRmp1eVFmRVNDVm9xTGtQWEVS?=
 =?utf-8?B?WEVXMXEwZGdZeDVyTjYwVEhnbG90Yk5hUVo0OERPUUhLZFBtV0JhdnE2UTdZ?=
 =?utf-8?B?anhlbnZpTkZnOEw4aHY3MHBwYXVqSmRTOG83eEhIWEtvUDEwUnlGOFYyZDF0?=
 =?utf-8?B?MWJFYWlTMzIrK3JhbWxlUktrNEZDcDBpaTdsQ0h1c0RMMkEzVmRXcEVkV1I2?=
 =?utf-8?B?dnFyR05heUk2YXdNMU15cUUxQ05CcUJTczFNTklYVkF4UnRWcGlCTmxQeXZL?=
 =?utf-8?B?WFZxR2UvSFB6OEJSMS9XdHdQSDJEODhmcU9WUkV6a3ZKRWJuek1JQnBGNzFF?=
 =?utf-8?B?UDZzNjhhamZ4TGUwSGdrRjB3ak90Qm93Tit2UlNBY0VqUWN3Q3J6dDI5VTZq?=
 =?utf-8?B?L1Vtb0JYamtZQmRud0luNWtCZjU5MDlnU1hjelFVbTg0dmRrMGlkRko5c0Qr?=
 =?utf-8?B?ZDB0Q1lmOGZPL1pJN1FyUXhFRDRCcHdOZy9TeldKcitZQ1NLMEtyZUtacVN4?=
 =?utf-8?B?Vm1qVG1WUEFCV0h1RmhVeFZscnhrOUFLbUw2ZjlXT0xEaTk1UnVsbWJkMWhr?=
 =?utf-8?B?QklDQWR0QzJRM2ZSdFVJekc1QmdvV1VEM2o3bjZYaHFxQjlKTTVZTzRmT2Jz?=
 =?utf-8?B?Z00zanFObjdyVzVNSVBZMTExaDhPaCtYdlBZdEtqMlhxWnRWTTZOb09oamxM?=
 =?utf-8?B?N2g2M1BVUWswcU0vdEYwKzFhR2s0bXNMY2FoNnlRZVdvcnpIOTg3ZDBIMzdx?=
 =?utf-8?Q?mIeSLdLczZ/YkPjmqRnO29xfHpYtWBhOTflUmzo?=
X-OriginatorOrg: smartalock.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69bd225-9af0-48a1-8189-08d8e7d32d90
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB1748.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 16:55:46.2133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ce29943b-d032-4b7b-b394-6469e5e11489
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZ33HumA6liV1UdB3adwAyh80tyQXT+REzuZyaFvacOq3rsM46IFBhaWKFP7oTfDfV3JTHsTlInoKH/opfW1+igNQQOhK6IKinCkc6ntbSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2P282MB0051
X-Mailman-Approved-At: Mon, 15 Mar 2021 19:52:45 +0000
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

I have developed a WireGuard implementation for an embedded project we are =
working on that uses LwIP as the IP stack. The implementation has been rele=
ased here: https://github.com/smartalock/wireguard-lwip=20

LwIP is an open source TCP/IP stack that is used mainly in embedded systems=
, often those with very tight memory requirements for code/data size, and n=
ormally not running Linux / BSD or even any operating system at all.

The project contains a pure C, malloc free implementation of the WireGuard =
protocol, some glue in the form of a lwIP netif implementation and some cry=
pto elements that end users will probably want to optimise for their specif=
ic embedded platform. I wish I=E2=80=99d seen the single file crypto.c file=
 that Jason just announced in the FreeBSD code as that would have been usef=
ul=E2=80=A6 although the x25519 probably would still use too much stack for=
 us.

In terms of size we can run a couple of WireGuard peers as well as our main=
 application on an STM32F10x board that has just 64K RAM - the goal here be=
ing secure connectivity rather than raw packet throughput.

I=E2=80=99d welcome any feedback to improve the code!

In terms of other ideas I think this code could be adapted to run as a stat=
ic C library to link against to enable per-application WireGuard support. W=
hilst there are other methods that already exist to do this - e.g. containe=
risation, or via the library here: https://git.zx2c4.com/wireguard-tools/tr=
ee/contrib/embeddable-wg-library/, etc these tend to require either operati=
ng system tunnel/network interface support or Linux in particular.

Daniel=
