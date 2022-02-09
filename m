Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC9BC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Feb 2022 10:59:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e427b301;
	Wed, 9 Feb 2022 10:59:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id da3d36a2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Feb 2022 10:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgWhcXdGtp1iDel6W+xBX3eIKFjdmDweq/75rdag/0OWNOXaR9jt8Agqk3m4GjqIEGBv3MSfpYe3XH10pW6N9FIg0LPAyDeVVU5SuxamfB0m08G8LqI1kUd9ZSBjmBYZoTFKVL929EVxFHYjgZLOzm6Uw2f7uaCQl5koeYhbTYA76b16WxtsZNlvonjGWyYOPO6VSCwUgtDVONtNhH95YyIvtkGV8WzwAwl5H6WwVxqmLiEDx8bL5AffMrQL0VJcaGsjfDWsqWaSC56nk/bGpvgnHuRoQRguAN1GVxcgEinb32dLu2cr4Tuk9PLKsb31wz6Ts2qJbGjFGEBg6zH+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhy1B8fRk6VAQuBaa9/5mHdpQQhbUNjrrirs8EV7MOM=;
 b=bawsl0G9F0GW2iVpi8aZ6SkdPoWA9dTFrUYDx+kNt8GSDE0T/lCyLXsv46mhzx9nsQCSv9tIEUEDp3eQsIIqNyuWSl62mStfagcVaEzyafUJ6wMIf1Z56yqNtacC3xz2S6eEaR4Tx2Bqe4SFa9F+UfQitsFPTi4kEK1VoA8pyH8btXkJbuxpdvCwWukq2uXVb3DXRy5FhQPH1312Z2kDAUkTPicAemM51+yHmZSa3xCMkU3S6hBnMAJMiBFgs7zzhLa7PXret1Dj9p8aJtB5TeOCPB3zxWG3RiXBL8+oTQj00e0k5msHOkQnHEIxztGLlr9kpZARrAp6/kOc8i8+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jamf.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhy1B8fRk6VAQuBaa9/5mHdpQQhbUNjrrirs8EV7MOM=;
 b=wmuMEz/q7n3sbtKlwivYCfytYI7VEX5HmQjE9OA7x3Fcxpsgyqgyuf+hnrsm1C2ovQZ5KmjVjA3Mysn+5itFOVDKV8xCKFcGFB5BFUV9zfzaph10c3T7Yan99njWFbM7YQ29MEGnGzcyJ3LlqFj6aU9nUP4l0xpkokMwULFiITA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jamf.com;
Received: from MWHPR0501MB3916.namprd05.prod.outlook.com
 (2603:10b6:301:7b::35) by CY4PR0501MB3889.namprd05.prod.outlook.com
 (2603:10b6:910:90::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Wed, 9 Feb
 2022 10:59:01 +0000
Received: from MWHPR0501MB3916.namprd05.prod.outlook.com
 ([fe80::8cf3:4e9e:bab:2eb4]) by MWHPR0501MB3916.namprd05.prod.outlook.com
 ([fe80::8cf3:4e9e:bab:2eb4%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 10:59:01 +0000
From: Michal Murin <michal.murin@jamf.com>
To: wireguard@lists.zx2c4.com
Cc: Michal Murin <michal.murin@jamf.com>
Subject: [PATCH] tunnel: fixed BadConfigExceptionTest
Date: Wed,  9 Feb 2022 11:57:58 +0100
Message-Id: <20220209105758.22038-1-michal.murin@jamf.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To MWHPR0501MB3916.namprd05.prod.outlook.com
 (2603:10b6:301:7b::35)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3eaa442-ce85-4d3e-7a0a-08d9ebbb2db7
X-MS-TrafficTypeDiagnostic: CY4PR0501MB3889:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: <CY4PR0501MB3889D0F88D8121458670A641F42E9@CY4PR0501MB3889.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jsbiqq532JNASeDJUtULSi2znwoPypuxHCRX2f1p8zI9UrdH/jRctrcbqNxYUOySHTKjPIFe2snA7fJAL/ohMOHzUywsU/F88ifo0JSdChUUUB699xpNDu8IUSXjQ1WjDkL3ckD+R8oBQuFYGLtr5dbSlFGHJWa8/VLZgIgY6l8o035w4LnSDeKDwOhsAoAvPxu9UgJb9YHjsClM3eRC4A158zaDv1rXaFF6kKoyA0hTctl0SyprjROMAHs+PYMUxQ5yZAF2URtjH/VgPQ9vqZ6Mp/jWAM45LV7Jm0GhAa59Hcc9FeYk+X4xsCBMQJL4RATC+NLivnRej/ivmuKoYDqchXBJXZLkBUHiXk6wjFVIiHRSg7q3/bp7rWZ4OfdO7cNq7k9QTq9UFbximKbB5bgKd8JZH5yecBGb4IhO/iLbi4/z6mGBN3DunvzpFYQ+VWyoWYAX3OX4/sgeKaoV5iSu0MaaiYneZbTUZRNOcRSxeCt7x6qVhb6WGHSl4G0Vs7YAtiTIRM1d0pSdzQXWblgPPs0FNooY94Rov/6sIwfuZU4CjcwKSSNYNcnFX4DQxNFrsibeCT3t/XPx0aa71571o7Rs/tIXkBO6yUPJgw/xVMzzZk6exKhE9q81pSCuWkUvQFkDmXiWucmrIQNBk2AW/yft9ZKtJU+ywJPPloJNTmz6tMgi4mpH9FXPNa+6lN+OwZLXT17F7tP3FAmXah5Qk820nqKr6zebqktU0IWrUNBn6TNYvQvYM1Oxh/2i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0501MB3916.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(83380400001)(66556008)(186003)(4326008)(4744005)(38350700002)(5660300002)(2616005)(8936002)(107886003)(66476007)(36756003)(26005)(44832011)(1076003)(8676002)(6486002)(6666004)(38100700002)(6916009)(52116002)(316002)(508600001)(55236004)(86362001)(6512007)(2906002)(6506007)(19627235002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?trU83yeGGf1NWMMFMPuOXIZKS1jBqS64uwfZ/gOd31yvwLdr1BgSeP1DQn80?=
 =?us-ascii?Q?1XUHf2NStnA0nDOKU4csxotT0LtnCM5fDEyCLvgQLOjg8nXkn9A6GLZnVrrA?=
 =?us-ascii?Q?RsME5qleCUEWph9HXksvzWAL72JIBPcap6kRib1kiSqe9oSDg1UmgSkHPJty?=
 =?us-ascii?Q?SCIWDFelVBj2tRIP1ObJoUXuQYx5sWBXvN3HyNC2F2HsmdRCtTTJJSnEh6LP?=
 =?us-ascii?Q?RRWCTAYYCdwt0OtbBkYF7YCi1JSf15rzLOyPge0KUFXI/E1xTpLwQ/qTGcf2?=
 =?us-ascii?Q?T8TVUKlVVXfie3DY4XPocxPj7UUnymfSeONYHEChRGsYbCaKajqb58MjBFs4?=
 =?us-ascii?Q?dgSBSCy7U56us0OA0vX80+vQYCEd37tRGWrD94pnRYtOVen2W8/KJW6BE1Lo?=
 =?us-ascii?Q?rN0bs6WRzYdCxmvjaEcuLECRW9w6Al8iXsfTcQyHpwdm8yzybVdvEK67rjtx?=
 =?us-ascii?Q?z7a9i56QV778zu331xE/O5S6vBL7F/Echk7PhYErb7YVty2me3s1I86nvDc0?=
 =?us-ascii?Q?32MQX2CfbBq4u2S/On2ntIqnYNp4eoLtEeE+0/8S7gS3aC7Q4UqWYZfRTKV0?=
 =?us-ascii?Q?yW4vik/1Ht6FmQAMcTU0XVweJju8tCfSXlgQ7uq/5HuNGJYgnHdqhhRPdeSP?=
 =?us-ascii?Q?2t/TcVw7994xbqceMqdsoPfFU9aZOPR+nluzRp1bZzV3Mxzxme1pudz7XTNW?=
 =?us-ascii?Q?J8INvo9XHbsdObiWvhRRRXUap7SchNW8PxLylrWj0mBMixrMq6iHp+s4oVev?=
 =?us-ascii?Q?csxoh9jt39d7ILg8yt0KAUuuWNz108u3OJe4NKx3SDnrIvS1oA8+RZN/nAKa?=
 =?us-ascii?Q?pFmP7G4TvrgiUlIcXYL8edBxMGC7S4H939KXAZdqZJLgALoiYLcBRpd96CRJ?=
 =?us-ascii?Q?VdKJC/YKHHkyLqsor/l49VKySsxo95r9edaK7okUICynsmrQJTilyKpM8JvS?=
 =?us-ascii?Q?2Uj6a/Fot9FMkeYqRyR6CRn5nLVht528MLt5it35QLsYcjr7Ks38G3MDbJl7?=
 =?us-ascii?Q?+QAV3x0oNA0jA6Z6x2l6bmG8mq3rjLKGM195+UCOi3dpDZWilKkySf2QE6q7?=
 =?us-ascii?Q?rGb1IRaGmAImj84wVw8OXjQzPQX0tUeHsmyr4TXjL2ydVUQ92tBNGFSCP+82?=
 =?us-ascii?Q?1qlrex0qNGdWpckYZHhtt5KwciV+epofB3mJush2Gu4qIZOL3NryE1zFwPVj?=
 =?us-ascii?Q?uX1+RXii7Jp5TIxAfAIZk3DXnbbxZApZRmOZ/IGL3FuVI+VufRVbS0XWiczY?=
 =?us-ascii?Q?Vt9u9M1jSxajPw3MVKFGYo+eXP3DDTa74FbqVA40bGqaeE+yJO4NXdDDHOrQ?=
 =?us-ascii?Q?AwOhWeFS/JzJNT5p+IKO4fEDqEMNRBCaj9dWLWRwS9ZWZOQ5A+BE27f7gV1M?=
 =?us-ascii?Q?m289TsLBzaE9RiN97QB8ztlcRZhv4AiudoH1QhvZEIZWZ1q77pWBHq74y1f5?=
 =?us-ascii?Q?LBgIlgBGgfd6dtWaxBDeL+mnbk0RhE/0xeXlwqMc+7xSFzA/dvQ3wbs+jqbQ?=
 =?us-ascii?Q?IQL8VEIgw/9YJ48nt1SdKEeqImhkAdfDY6Cp5M5WLHiXeeTBBZ+1hzrFg7rx?=
 =?us-ascii?Q?S4peMM/AfcBLRT7Rwx+mhaRsoIPpIHoZCfdg3RA8L9wQpZtQlmDXlQ8lFUf+?=
 =?us-ascii?Q?SJdM+I9jaJA/9GE2gWaORh4=3D?=
X-OriginatorOrg: jamf.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3eaa442-ce85-4d3e-7a0a-08d9ebbb2db7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0501MB3916.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 10:59:01.1640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 10a79a70-90fc-4bd6-ae09-bf4f47a7cbc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCFDfaB0rOScV+FAsFzc+bTE+UMZCmzC2TyZQt7ReEgNn4KITFaC0VZWMzxm5XORdLDus5LTldwKmNTVf124dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0501MB3889
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

Fixed the test by changing the DNS to a string with an invalid char in the `invalid-value.conf` test configuration file.

Signed-off-by: Michal Murin <michal.murin@jamf.com>
---
 tunnel/src/test/resources/invalid-value.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tunnel/src/test/resources/invalid-value.conf b/tunnel/src/test/resources/invalid-value.conf
index 2889111..6a1e3b6 100644
--- a/tunnel/src/test/resources/invalid-value.conf
+++ b/tunnel/src/test/resources/invalid-value.conf
@@ -1,6 +1,6 @@
 [Interface]
 Address = 192.0.2.2/32,2001:db8:ffff:ffff:ffff:ffff:ffff:ffff/128
-DNS = 192.0.2.0,yes
+DNS = 192.0.2.0,invalid_value
 PrivateKey = TFlmmEUC7V7VtiDYLKsbP5rySTKLIZq1yn8lMqK83wo=
 [Peer]
 AllowedIPs = 0.0.0.0/0, ::0/0
-- 
2.30.1 (Apple Git-130)

