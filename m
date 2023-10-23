Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6332C004C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:37:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad459c48;
	Mon, 23 Oct 2023 14:34:39 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1e5e41b4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2023 14:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9AVQwxIxSYotHD4Rocnl8i7tDLObkuhAA/lI9bOvtGDkvWgSyd99SeykQw0cEJ+9FTt2W6Z91BA9J0BFkVUvODbCiZpM7kFauP3h1sDi7Ri6lvDOty8MNOg4Qu4kEDCLurGoZUR9YBi/i4P7wj1/Tp5GAckVgQpLJjBy5VnxVKC/DxJTDnf7HsfyudH1XQ3gOgL7kWRLcXYqJYeGMJdV01RF5+46iNvrFiA1jVpVsAr9/ycVnH6PKdDSd0ufsX+Jn3JU9kR/jbVfPG3eI0KYureTIk7asl0oQ53KnsqhkdKB79sjI7CgMNmCCIz2PB55k509GNmQJfqc1ihVRQqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj2ZeNPwmuBhpIYO4EWos+53s4pP4SWz0aWf6H3JF54=;
 b=m/e+Pj4oJiSSJqEftaMdFdQacMlFTNmMkbUUnfa3Dh32faTvHwMigmxjzRKqPisGdbd0O0EPHU5qJ2uiggcmrl5YznNHv8AP6RpwnZH2CmGXtHIBwyCqOn/kjqgh/z2F34yaAqsw7Vay2HM/a/88Wz2sm+DY1g4owuddDe9pLB922YcpJvXekNq29xbSnD9kr1pwQAhhLf82+1pxmEdnEZqN6IShY/hfbiyKaIwrd+0mJ+zSl8ClJaYP4nVU72YL0ovtH3gOqcHWXBnZ4r+RFhlgIWcNDKLk//fNWbO5xGcwMtkUEt978URJLI58k93ujqLKnl7eL2CfwGbKUwnKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duckduckgo.com; dmarc=pass action=none
 header.from=duckduckgo.com; dkim=pass header.d=duckduckgo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duckduckgo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj2ZeNPwmuBhpIYO4EWos+53s4pP4SWz0aWf6H3JF54=;
 b=duYAf3XYtgqxwb9sTaszz4VkcZP3eIgWsA4d09ZTxlUTHyWhW232oHHBMYESgGUqLU3UZDgX7wOcCNtbqKjbJzs9JICQnMw7uGa2asZXkw/lA/P6wO18d67NLTRRTyLDew/h7Y9QXnboMk3CsEkrq/zMY0sgSMNCCs7akpBy3/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duckduckgo.com;
Received: from CH0PR16MB4548.namprd16.prod.outlook.com (2603:10b6:610:f0::17)
 by LV3PR16MB6335.namprd16.prod.outlook.com (2603:10b6:408:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 14:34:32 +0000
Received: from CH0PR16MB4548.namprd16.prod.outlook.com
 ([fe80::3603:bccb:f99:5461]) by CH0PR16MB4548.namprd16.prod.outlook.com
 ([fe80::3603:bccb:f99:5461%3]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 14:34:31 +0000
From: Nick Goossens <ngoossens@duckduckgo.com>
To: wireguard@lists.zx2c4.com
Cc: Nick Goossens <ngoossens@duckduckgo.com>
Subject: [PATCH] tun/netstack: close stack on netTun close
Date: Mon, 23 Oct 2023 16:33:47 +0200
Message-ID: <20231023143356.6889-1-ngoossens@duckduckgo.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::22)
 To CH0PR16MB4548.namprd16.prod.outlook.com
 (2603:10b6:610:f0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR16MB4548:EE_|LV3PR16MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: a771f03d-ab36-4f41-510e-08dbd3d52b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ARJ4D7xYIsCZx+XxU+BjL+zCHYtn0tdsc7itdilp1SOAZkSdvGRP5nZASpAtvr0VO4+ByaUON61BfOHQbt9EnBjZyTp1fqk0VPR0hO7emZFmj09brpguM3C47mT/3benWX3FjRbsg82vmFsg3bpL1tKL4uBc29FDiI9sZnEaPEj3dmozirn03fro88YSnZ0fMmsQ25Ujtk47oMM4eQJ8rr9VpbxMbRbz7N3B1dViaSovLjHhqZswP9xUGYwXsG/JwkpbjLOFa8fWH67I82h1cmowaqzbM6R21FAGSrr9kz8nOf5nH+nsBUhyTIZJtLDReJZ9LQQpnVsHh43ghmCIgPuSePBkPbAVqigok8nAFMJX7ob0mGmbKt3Ed6O0L1UT0Tzx708p5oUCxdcOB1a+2BJXjaLi2BcTkUOD5EaGtGfppp9GuMdfTTz2McPbnVKpvgvtjV2ylqK2L3TikZEb4GimH83/HcnJ1XPUs0HmcIkm9Yd0xblpz4PNIaCl8pT1PU+btO1Alf5bu3SlW/s1aOp20BL5/XTfrhQGq6G9/q6erE5Wu2di6gyq9CWgPt9/JfJMdPgeJxjnaVoGSLEFE2Zm50ah+W/q5RjYvrEKXdQxctyyWNuJOCOR9SDVhsxE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR16MB4548.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39840400004)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6506007)(38350700005)(4326008)(2906002)(4744005)(5660300002)(36756003)(6512007)(8676002)(8936002)(38100700002)(316002)(41300700001)(66476007)(66556008)(478600001)(6486002)(6916009)(86362001)(6666004)(52116002)(107886003)(66946007)(1076003)(2616005)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjELX6qlqCzTVFFG2bRGJaHWCU0U9X0uiF66yX0JpKOrTbsWE8kMSp9f+QNZ?=
 =?us-ascii?Q?wue67136z6BvpUYTXYd2mlm66k1Eetn2UCSb1Iirx//g8U6x7CN3ObryBT4d?=
 =?us-ascii?Q?qGNuJDapnzAwmn8nFSuVpJp22KUuDLzykYsV+xhhKCt2o8nv+WQGrqS7VLR+?=
 =?us-ascii?Q?twc+OFAKYCUdpwFQ4sMFLEZattiLbe/+CML6Q/BUfwGhkV1/bzFOOc21ooeC?=
 =?us-ascii?Q?apGV1JqId8EN7KgVunqECfyTKSvPMZIeFoU39cFp0n+k/gCPt6fyv4/31GIe?=
 =?us-ascii?Q?EVq1sY2SYuL8YRbIP1EhLxEXuZ8BpJW3WGrigK4YV7aWd6c7t9dryIopF88T?=
 =?us-ascii?Q?aOqpr8LPRWXmUR/mCPq8UBjDJgFFRq8Q4mzAfx5mgf2IiISCkBxezef+bih7?=
 =?us-ascii?Q?GrKOlyBFKYA9W6T00ATtHD68ExYYx8826t61X7xC+rXlKX4sqcdHQkTmwTIw?=
 =?us-ascii?Q?uwqcE4EpGrTk80uP0gbikCcQDr6906tanFLM3KR7cRTBlHwb1VLR2blOBQ1V?=
 =?us-ascii?Q?fbys4hHVjEe9x2H+PGvvavjj5xihhkTq4/LF+6yTKBM5Y5F3VhA6aLTtGHnq?=
 =?us-ascii?Q?hgBs1zwplDALM637WBEKyejUI45jC96B8o3d4AKEjnU71q5h7cP95B1zABqa?=
 =?us-ascii?Q?gmouP7aZ+zSY4nC5whvq829UeSwq30xfxOMqhdtGCH8+6mMZEqm9F38DTVwH?=
 =?us-ascii?Q?eLPLF6hmKovqTHGocRfoTirtYBG7/ivYrD14CTXc7a0pPqNAAwuFnas5+3hl?=
 =?us-ascii?Q?iP0yTXXK2tFZE87zIdCXb67d8mBc/AnSVFNXTIo8jyLg2fsd3juBovFISTOL?=
 =?us-ascii?Q?6J73grFvFNMZVN2dyvTa/f/1TY6OeETXp0laOY9c6fWeOFzfudDWjVJNEDFI?=
 =?us-ascii?Q?XOLZiiszsOozpRECRNXApFlT18ciL6dI3YtYEB8Xfxz3mMxxYSidlOm/Y2Na?=
 =?us-ascii?Q?/usFMJoSi2MVj5TF+KZZgAfvbr+MW7JUBhE/vKbPx2q3ubwKA67AxPipgGKx?=
 =?us-ascii?Q?jKzLJGJyKkIBoNHk1K94sFny0aVlMJil8r1YgerWIOYfDrYPW5iZN8Xsn3t1?=
 =?us-ascii?Q?tdtg//LiG/PrZfN7LSR4LnqKQfhyYvjq/B3naKgDA0Edosq2ZyBcHFdDtfQ/?=
 =?us-ascii?Q?/+ErDBQ/Qr3YrCyjpxmY2kbFeM6yL26+tZd9CKcxchkNyWPT9sxTt5E6qO6w?=
 =?us-ascii?Q?6p+OBGurP+dJdyD2gfsfPIfxbaVyBcFDrCoSUkqFgphDEOiR0WlZG8bXFMP8?=
 =?us-ascii?Q?Wz3aWjIirX3kDC0qoKLBbUqfeGDgd1R9XyUF6zwo5jsuk83RtqKiV7MZGFr5?=
 =?us-ascii?Q?hA/fS+pg0SAf8DtJ90u1o26IVGAH67jx14Qc2iIkmjQKtL7+xz6jfxiK+G++?=
 =?us-ascii?Q?xbdSovgY0Wa1op5yFEzKCvHD9NuTxluz3xQ7liMhkXEF2hdjpdd0wzyfsieo?=
 =?us-ascii?Q?spIvLqr4vEJetDno/Nlnr1DVo5p/Z3ClLpfEXXQgmxAWKUCI50GfXDpx/o6h?=
 =?us-ascii?Q?ZjoiDH0DJnpLSF4spnHVCGIDFOUa66k77A+h6LnrZ9NyAPgGcRax2rQNJVV6?=
 =?us-ascii?Q?BSfj1C2jeX9vWoJASL7Ni8QGCZF/CIR99XpPGJNpL21EpzLVbVkbpAhhr9zp?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: duckduckgo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a771f03d-ab36-4f41-510e-08dbd3d52b86
X-MS-Exchange-CrossTenant-AuthSource: CH0PR16MB4548.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:34:31.8843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 728892a0-4da9-4114-b511-52f75ee3bc3d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7PHYRkegKAuVP3Zyl460zDUhNtzZy9Z/GpqpIcICuOxPElntiRehbLrozUWDiGGEFERi6ha1bIkp+0W6jMTXQS93dzJYtlzce8tUYYmPZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6335
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

If the stack is not closed when closing netTun then goroutines
will be leaked because the the transport protocols remain open.
This adds the needed close call.

Signed-off-by: Nick Goossens <ngoossens@duckduckgo.com>
---
 tun/netstack/tun.go | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tun/netstack/tun.go b/tun/netstack/tun.go
index 2b73054..a06bc21 100644
--- a/tun/netstack/tun.go
+++ b/tun/netstack/tun.go
@@ -167,6 +167,7 @@ func (tun *netTun) WriteNotify() {
 
 func (tun *netTun) Close() error {
 	tun.stack.RemoveNIC(1)
+	tun.stack.Close()
 
 	if tun.events != nil {
 		close(tun.events)
-- 
2.42.0

