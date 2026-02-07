Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5656FEF06E4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 248dabee;
	Sun, 8 Feb 2026 17:17:20 +0000 (UTC)
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazon11022111.outbound.protection.outlook.com
 [40.107.40.111])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0cbb02e5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Feb 2026 05:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z56UU0IpYwqe/JuwyA95pCHGV1jgFvEjaQARZLF353IBLBYkxJ4C8sPoqwCWjSm63mAjq60Dh0mE+hMXsYoyOSwJDHzBiruHP3paLc+UuRu42ghwQCD1F1ou5/4FqsenE7vnLqCEUtC3rE3tJzo39mH/zpEJ0I3v7C5tvo8ZcdMlb4hyhzd5g4HSmAVNogVFoEQLUjmihT9PXHLBL0lzJMmiNMrffo+Giy+A3gBvyEjvkBnmfLIpCcGm0PsJ5nALCKrblCF/E5Wr97jMCGcwNS4yHxT1RmUNsQEabT+9Z+yRzbIRzqkExwyNeXAT0h1jQyvyhhvOdpj3hcLYtC79kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFDuaF8YL9zM/fMEPqQaM18RhZ8g78PddMMUJG/SXAA=;
 b=TZiAHnLXOQc3NEKdONhoBOUlW+wuIhWgAExS++pqjl15N4r6KlN59Hi/8YO6yo1yR/lsxUMApAtAFiIGhzji9vOX7fxNk/9ClU1ztjQg2WjP04lF9LL4UQoZUwbjA+bv4fTh/ocsuCq7lVP65VL/hYX2nbMHORoP4LlVp1BD/YEnLpusEYRFEPwQKS1YOxcJEgbnRetK4KzOMOuFo3JZsVwYSJxgZ8x6/pvHvzviAK3AD7J67RAs8KXxFk0d4cBY0exLidCcC6G529njFcIeJrz4MTKmtoJvffp8eyfTsS/yyuFyYLkM1oBEOWYzOzMxW1K24pJSfb5NlZxoTUkDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:73::13) by
 ME0P282MB5125.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:239::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.17; Sat, 7 Feb 2026 05:12:42 +0000
Received: from SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7340:fb70:eaa2:ee1f]) by SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7340:fb70:eaa2:ee1f%4]) with mapi id 15.20.9587.013; Sat, 7 Feb 2026
 05:12:41 +0000
Date: Sat, 7 Feb 2026 05:12:27 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: wireguard@lists.zx2c4.com
Cc: rudi@heitbaum.com
Subject: [PATCH] wireguard-tools: retain const qualifier from pointer
Message-ID: <aYbJJ86gqdWvmD-j@c9fca329e4d7>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEVPR01CA0018.ausprd01.prod.outlook.com
 (2603:10c6:220:205::13) To SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:73::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYYP282MB0960:EE_|ME0P282MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: b829c9d7-9bc1-4544-9441-08de660784c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oijPUf7wlQNUv4ju0sMbZVVPz+a4sshDGdp6QoMa41TPOvh//n2cT+GkZtaq?=
 =?us-ascii?Q?5ArVHa/rslSAHaea0CRk6bg9VECZ684e+zEF0q4L3yuftDY3Z0lh+nIhFzQz?=
 =?us-ascii?Q?QjqV4mLebHCgwabVu4fjh9485cFqDn3rTRJGqy26C9GtKovHNxlRmg99yE7H?=
 =?us-ascii?Q?xS5kh+dJgsz1F8Dbae3GSaJH+WwVN38B+bngMknxqM8SSFy2PTmtOSETuOAy?=
 =?us-ascii?Q?5Ng3brcQgmKo6iKtJ5jJP2L06GlIKvuEUB5109nps/hhJwGqy6Sfv5X0rU1v?=
 =?us-ascii?Q?BN7jTmxaGRflRzTfRr4+grOsJrGq08bVBqB35Bh3WmdeL5oiw0E3R9gJ3CFT?=
 =?us-ascii?Q?lRXTfNrU9E1Sy2FxonsyWxpo7Psv5djD2p1b3wsQZzjur0YTJXsGof1Oga1g?=
 =?us-ascii?Q?vH4UwAAdXGH80zDzZTfTPfASkAl/PcrUBoXzGEAc23ViGcyJEXaKJ1c3HMFk?=
 =?us-ascii?Q?gCiZTE0XHQL9zXWZTegYt4cE04/yiFUOTp/jDJjZpRAY+G/oTe6fE8o9T3aS?=
 =?us-ascii?Q?5NSMvxrDm8nWzKpERmdfb+i/Er8aE5buv/XQ4CTPk7KVIqV0+JfoKgE+yZfp?=
 =?us-ascii?Q?c408AvHjGUPS3f82viT+8akCXt9TELFqPw5AAurOCPENbR826UBbQ/sxjNPk?=
 =?us-ascii?Q?JISf2MnjtcEGEkawus9eGaFRE2aNkYJKsvXayMl7flpGWkLEOv4t4vYZyI6j?=
 =?us-ascii?Q?+SZI1G9jRyD+s6bRU/s7143u7wonGpDvoVk+jnXWpihImcjVJev0J2RXsbHw?=
 =?us-ascii?Q?dYSUH4C/aa79YaXW6i6m/0nZgOOkM3xFMwa7Piz488aFhojmBvEqVkd8gxAp?=
 =?us-ascii?Q?GIH6YmOdWdiu9DVLJ7uWPuuv8hnPaOQIpy16nDVTCDp2oc9UpeM8sHzZgLT4?=
 =?us-ascii?Q?kDUvXRPLAKr3Wsmc3IG38LLrddELUEOOdssiUrjqzkZ5OkEJxP4XKwLG5VSp?=
 =?us-ascii?Q?g0ZMMMGIVLUKTp2Fzf2HnxN7omxFQ4wFlodGh7zuxf2hdXtnhDCH2O6S+gzX?=
 =?us-ascii?Q?N3rBqdK5G8mNMl75v7qQzINeNDY/Lu6DA6lx6le1c+RXVNXdib86rHVlvE1Z?=
 =?us-ascii?Q?BWaIJYlp7Z05Y6XojB5EXr82ebHoGX1Gar0Ik2Di0ieGJCZvzocjRLyo2Rh9?=
 =?us-ascii?Q?oUO3fKD4EYL6ZuMH14W5si+o4B0+3sZYUS3smUqfB0NtkgecwG4kWWo3hpP2?=
 =?us-ascii?Q?2LvJVkBYbsBWZpXlsY/WjNa0ebRly++FDcnKmXOERY+94TmQsDEg2Nlg5oAH?=
 =?us-ascii?Q?utuAmaMMgCAWrnOSjJK0E4o2qj2BMWBTaFU0Yu1RkVwSLqHhTXOOyF0m2Os6?=
 =?us-ascii?Q?9Uy8wrMhXwmL94556VImk/eBWL4zhK6Gzvw9kcTAiq7Dk52aquryVePa3zIi?=
 =?us-ascii?Q?2FlJ0mYsC+gekIpMsjGRGhCMOYml8MBOHAnRG4/YgxpnHz1rgMeIlVNFBCGv?=
 =?us-ascii?Q?zead3/Jy1FHex6FoCblx0DO2Sz5S3i7tt3H3imnTLNUfvUtDVFDy6ruuyOot?=
 =?us-ascii?Q?NIzhu+tsPPX0+Z0h1vajw7MCQCNft9QzrwpqM8oxPY5oTErDTmTUuEnOuZqq?=
 =?us-ascii?Q?xUpQ6wpn+V9UVPu0y1o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UomiKIl9qInDfpy+7YM8T4/oUv/En4kdkjiYfk0q3ztJpInnyTlh8iGvEOKR?=
 =?us-ascii?Q?aVWR4rvnWS+HaPFZAihQ++XRdKZ4e5tBExbwIVuTP+BFLVyeAZ3Ac9aFR7QG?=
 =?us-ascii?Q?g+n3FZ5Q2tNpUN+bhWc6iYY7bMeo20XctOU3vDFwJByA01v22VAZDC7l+leC?=
 =?us-ascii?Q?dllgkRxAsEccym9Rr5HAxIs23s4DSjvEZdDhDam73aaDdTQKeXID2E1+WTyu?=
 =?us-ascii?Q?lrM/wvUnAV59v2AmXxfno1eKtyRlAm0Dyzlv7cnVUmPH1VLTKgpInCI9D0N2?=
 =?us-ascii?Q?yGLvZWGDT8+VjFovB4QEguPzocX/j4jOnub1XkXbQLkPgILqgyv7QqSYgHO8?=
 =?us-ascii?Q?IdOAsQhFLsBAg9HC/jWOLeE4BCEtaHmbeAnuo0dll/I4FHNAtHPG2OInY8un?=
 =?us-ascii?Q?MjjrLzVooBRVnx/sEb5EEMgLO1NpjdIsjBxULgaLFkiT5vr8oQRFBs2ItkJX?=
 =?us-ascii?Q?V1K5G2MDeM187axNfNIDnbZdFaLbUOL1Ja6n/LW5gE8vyYesHc34MDcOV4LQ?=
 =?us-ascii?Q?11SWRIFDTUcBGxfa8i27y3dPVdgZT/8zIV0KeOsujerUbgywLob8OYSJj1wG?=
 =?us-ascii?Q?qJnyGZOzWDHWJE8mAo+wq6f8weJfMulvCSIcEOJynwzKKWn8LYE9Wj6uIPp5?=
 =?us-ascii?Q?T8hg0N1bCab0dHRJBM1R+DqKi4ta2MR7m4ALQ7GhvdQlG8+wrZwqjvSzceP2?=
 =?us-ascii?Q?6Bpd67ytL/5xkbJz/mEGJMwqFdIV9+hBVe1ZmMl3WIdkQqlsEjiyPR4We6Zv?=
 =?us-ascii?Q?klaXm2zkoKBlGH6Ptj+RB9fs+Fe8DU3easKtxvqk1vFsRb/sZO1KHssk712B?=
 =?us-ascii?Q?bDutDNBI9hZr6VjWWO8enYIBPcCqU0GVkVkwAwgChYNIqlORr6wiwfS2M2Gu?=
 =?us-ascii?Q?MdM+bKugPUiS5knTIJjdsm0HGqqNxdCAYYbFcahp849isjflk1fExATC/N9M?=
 =?us-ascii?Q?lcVu65hw/P4EagOJUdBwn/NoAqYoIlnoILwacikCdx/6AAlpCUxmOO4pUgrt?=
 =?us-ascii?Q?9KnZOS2n3PkIf94mBcY/fccvOAD9x+UO7L2D1tUPFZFLMoHT8cD31C5o5xFE?=
 =?us-ascii?Q?NTdIsG0CVDEp8lo3QWwLdZJXVjWxAGEbHsp1yWb5CM74nnAd0VOCXheWXS0Q?=
 =?us-ascii?Q?JAk3cQ2PoqPXUnAGKWMNdXEQe4LSqgbxXNXqOOoeUHBzryGdVIPnCIXBLv0Q?=
 =?us-ascii?Q?B2AXMqCNnkpCi3GJXmFNqAo+QU2MZHTaZLLA5H90A4YMObXzZct2Br+v4Apm?=
 =?us-ascii?Q?CqdRQMOL/CRS7RuI2Y8Zg8pLs1n5qTBDJbprVj6oeIpyKf4GyTCqLQYNKhJH?=
 =?us-ascii?Q?gJbcyvs7rAZSgyGkzeKhb34XyZ1+RZuMFCh+M4Ye01chcHd/mFrVuV/2rh0r?=
 =?us-ascii?Q?+k9oDm0LG60keGzUTdIZhVq3CLGu9VGsmnOQaYKzSF0joeYb5WrBI84JP2Zk?=
 =?us-ascii?Q?VIaqg9FoQpNR+GRFI5Zbd1Uw1AeE1BcpgcXQZ5C8JmRPcwHdMLbl46a49i7s?=
 =?us-ascii?Q?/TD/K51bcT+G0hCy2SNY1wHig5e08sP/ug0SltjBVhotViJVeibq+x3sWFn4?=
 =?us-ascii?Q?o1GZWsQ8aSCVg6cRmz9vEjZRBSZoG+OAODIKS4nHbLXAApakvSCjPQE1CdWY?=
 =?us-ascii?Q?IHAz33wA72G/RIppMMt8oEJEhaR6HwWGbkxw53UPcc/oOIje/zADeV9vHkh7?=
 =?us-ascii?Q?i+SSZjmeA3h5izbKhcspHulHvKhiIGyqCZ5jjCzZwSVlCW50?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b829c9d7-9bc1-4544-9441-08de660784c6
X-MS-Exchange-CrossTenant-AuthSource: SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 05:12:41.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFZv1tMwqkgd4IuOzEMYghSaSyHa7q+4QtkR6Ja8FEiUEQyJaMAiMOkh7sFhOsk6SOFHxEg90myASWtw321mhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P282MB5125
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:17:13 +0000
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

Since glibc-2.43:

For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr,
strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return pointers
into their input arrays now have definitions as macros that return a
pointer to a const-qualified type when the in put argument is a pointer
to a const-qualified type.

https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00005.html

Resolves the following warning:
    config.c: In function 'config_read_line':
    config.c:513:17: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      513 |         comment = strchr(input, COMMENT_CHAR);
          |                 ^

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 src/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/config.c b/src/config.c
index 6b8aa58..cd65d7e 100644
--- a/src/config.c
+++ b/src/config.c
@@ -506,7 +506,8 @@ error:
 bool config_read_line(struct config_ctx *ctx, const char *input)
 {
 	size_t len, cleaned_len = 0;
-	char *line, *comment;
+	const char *comment;
+	char *line;
 	bool ret = true;
 
 	/* This is what strchrnul is for, but that isn't portable. */
-- 
2.51.0

