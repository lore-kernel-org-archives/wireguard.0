Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2357FC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Jan 2022 16:09:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 37aece02;
	Tue, 25 Jan 2022 16:09:06 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fbc23452
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jan 2022 08:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyQiMiBZ14y1AmKLmvgNq85efH8/0cJ1CDztFgPwxtBX7WWnsXZ4iCKwpq17xKWLIqfLKLsO1nVgrRRVqI2LBnyOX65bJ3nrg7PK5j373VvV1sfiD4kIWUlbEHoZm6mhWaZOUvtLDapKjsWYHOZ+eKu3DDHFyccWChmM0VS1ZDSQ7DkEeyD4b/KcUKfzq0FmlloHKQORQBnPMzFAFcKLbMO7fzWEPd7nfY6J9oJXRXxAOmlZSLI7RWK0IEucVTtTwr1RlhXT0HeBnY0OluKq7QL+Jm+oBm9I6z75SqM+UZpEZLQXz7Ck8ZL1hH/PeBr2FOVkbFNRTWQ4vhou4iI1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIZmkAoHZDV6Uhtln5cYjraJeUOk8dKNLFUFHdkgH0I=;
 b=gtjnB6bx0w+oR2w3nEvgRf9aRtIXjmIi+sieaAl56zdvsKEktb5ozZYYDimZAwPIGLL1YvLaKvQGL6rqLo1rJarpiC+/FdsIye2cDmgZI8/wv82EYRvK50O0E5mYJ5HLT1mE1U8MZAbnDAGuuHy/GQTRB2dx9v0fLtSztgu/sN8RL/04u1zWfsrTlM1jvSPjAo3v2saMmOLL/5BHvsxWWFX/Pmn+xbdezLxeLCjxNkC1GJeGpw1HaXhHqBn/cM0yuYzSH0V2FjGzF2Oyf8veMpOJ+C5zc4cArah6tiEM29aDyVUlH2xxLV3oRLIaLkwguURVEaiv/F99lIdaxu4PEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jamf.com; dmarc=pass action=none header.from=jamf.com;
 dkim=pass header.d=jamf.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jamf.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIZmkAoHZDV6Uhtln5cYjraJeUOk8dKNLFUFHdkgH0I=;
 b=VQ/RUCccBjf1VxsmPX5+5zlP7tbup377gFfqhb9EkbkD1A5oMDHtFDJj4ijI2g/K///cuB6EnV8BJS5S4JtiJeIk7yADyTu/B09Z0i4tBEanxfuUSKIyi7o4FTuE9IVvtwYH9tzaNdCiBp1mfbLvp1icv9yMXITlzJx8X3fj5v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jamf.com;
Received: from MWHPR0501MB3916.namprd05.prod.outlook.com
 (2603:10b6:301:7b::35) by CH2PR05MB6981.namprd05.prod.outlook.com
 (2603:10b6:610:42::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.2; Wed, 19 Jan
 2022 08:29:13 +0000
Received: from MWHPR0501MB3916.namprd05.prod.outlook.com
 ([fe80::855d:1075:bb02:f8d3]) by MWHPR0501MB3916.namprd05.prod.outlook.com
 ([fe80::855d:1075:bb02:f8d3%4]) with mapi id 15.20.4909.007; Wed, 19 Jan 2022
 08:29:12 +0000
From: Michal Murin <michal.murin@jamf.com>
To: wireguard@lists.zx2c4.com
Cc: Michal Murin <michal.murin@jamf.com>
Subject: [PATCH] Fixed the failing BadConfigExceptionTest unit test
Date: Wed, 19 Jan 2022 09:28:57 +0100
Message-Id: <20220119082857.64215-1-michal.murin@jamf.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To MWHPR0501MB3916.namprd05.prod.outlook.com
 (2603:10b6:301:7b::35)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93213895-cdaa-4f08-5965-08d9db25c557
X-MS-TrafficTypeDiagnostic: CH2PR05MB6981:EE_
X-Microsoft-Antispam-PRVS: <CH2PR05MB698138B99914077CD667E009F4599@CH2PR05MB6981.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcQR9eC3C27flZNH/0QHQY84Tt565qod+b5t6rD8iBj98a2+LZSOZOIyqaGPxmgsucveRSiyTsj5G3YIAqsel3pYAhWBipoqoD32cl9DKP/v4OB1VvennxF654lnT9MechTCoMuSA3tdWwagjB9IAOP5o5pFyEll09rAyNZ4kVBSjCfkh+W3h39A7LoPLC6rPTvZcoJtpyLkdHQGq0dIUojbjIi4Mjyw5KaUq36ryIHPXDiqwCjvNAz88CUPWHKtvsOClI9cMXLSHzZWc7QQG7Lr9oKCPE9Vvc7qT+JVE5JX3aRBp4H7z5SP1Y4ItodSBk6/Q/Qk2VIkpVZREOuaZamNwlQl327WcO5maPCkyBBeprqVnPYeOg0K0Wod2zzkwwLS/ZRQLajXsmWpaljNWKT+hdCV/mI0z5Lgun3F5x806gv4F46f/ZKd7iG90x6JbyzxsYAv/f4lldWMSr0P1R/w33czqgTL72PyxBFbcOAIRZrpWRG2WhMTCHXScKDaLIjN0S7HnriIi5Z7tncVK7sJ5ich+y3kX+Dh2GB39OdG6+Avf3vkNNS2bcGzLV7GxXin7vK7fB/Ps57aLgUqXBb6zGbRXVfch6vn0jGw6FHcKoTszPp6oQeIZiUnLCYV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0501MB3916.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(66476007)(44832011)(66946007)(6916009)(66556008)(4326008)(38100700002)(6506007)(6666004)(6486002)(6512007)(83380400001)(52116002)(55236004)(107886003)(8936002)(508600001)(8676002)(38350700002)(316002)(5660300002)(1076003)(86362001)(36756003)(26005)(186003)(2616005)(19627235002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3/PJH5di3Yhx5R+aSGbqIjiVXnAVsS8OZsKVGyVULsO7Zr1b1qLw9BcCwHmPXZnMUt6ueL02tw7+D9dOLHVDT0zjvSlOWiTuKqaaL8u9IrGP7hxzSkRk8DI/0KTK7wCbNkMRELkGrfzntGiEEkTlUU9U1t8wtra7jE2xpTL1rCZCLce5r7KB3OXR1omY0xpJ5cz7sJ/KWrkoQziH7TN2rDIkbbtL4u3O34uyw6/97xeGZoU5hcgo/q1mlgnylthX2AtVW9DjbW3zCykH+rNf4vRYEWzRDlB9izcjzkYrhehUWfv3FAkiyveO2sNbET7EgKs5E48r7UBjb0CBr42CnDIwsN8+PR8Ov7egQtR5TieCbHAFT3EM4VbNs8LrqEk6wd56fIL0+m9k2U3W/Prfo8Zt2Tv4WoXRd0uOvR1SBKJf3Z8LQ/swJCRmWrmf4Z9h
X-OriginatorOrg: jamf.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93213895-cdaa-4f08-5965-08d9db25c557
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0501MB3916.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:29:12.4494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 10a79a70-90fc-4bd6-ae09-bf4f47a7cbc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9LvofJdRBjd3H9is9sJh3IVF6oViBYdepZ9135yZa3A51PgmLdLoiWPgRVGGD3ypbbKGC7WqvcdTxD+WZFk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR05MB6981
X-Mailman-Approved-At: Tue, 25 Jan 2022 16:09:01 +0000
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

Fixed the test by changing the DNS to a string with an invalid char in the `invalid-value.conf` test configuration file. Also removed the `getParsingClass()` condition from the `parseDnsServers()` method as the condition can be never met - the `InetAddresses.parse(dnsServer)` method always throws the `ParseException` with the `parsingClass` set to `InetAddress.class`.
---
 tunnel/src/main/java/com/wireguard/config/Interface.java | 2 +-
 tunnel/src/test/resources/invalid-value.conf             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tunnel/src/main/java/com/wireguard/config/Interface.java b/tunnel/src/main/java/com/wireguard/config/Interface.java
index 694f313..5bd4da7 100644
--- a/tunnel/src/main/java/com/wireguard/config/Interface.java
+++ b/tunnel/src/main/java/com/wireguard/config/Interface.java
@@ -356,7 +356,7 @@ public final class Interface {
                     try {
                         addDnsServer(InetAddresses.parse(dnsServer));
                     } catch (final ParseException e) {
-                        if (e.getParsingClass() != InetAddress.class || !InetAddresses.isHostname(dnsServer))
+                        if (!InetAddresses.isHostname(dnsServer))
                             throw e;
                         addDnsSearchDomain(dnsServer);
                     }
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

