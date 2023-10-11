Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0CEC25B44
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6f20501;
	Mon, 23 Oct 2023 14:07:40 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5cf2aa21
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2023 11:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxmXXYK95RJ0KCpyP77MzzTg9eQHAJnp9dUg3ZghGzeqKErJZAMdnlxqUvvxBt466gv9GxjjV1naCNAqFASy0z/4432irwYXuRdwJYB+UtacTIj/ALKRdHC2I67ca18+NeoDos0tt+i5v5QuP7L8hGD38bWBHpnd/ClGu63v6+1gniSTkFRtQWJru24qNX+7N9MOATZ9/1NsP/wXrsJyR+zz+spP9F4/2u8tsg4ZdQ6x/r/m51G8qGstnIkBGKUwnzLaDO5vpqvnOtCJTCvXPINgXC2sCPd3hzGYGjhMD7gOJoi+deF1PBasxxq2nFW9i44badVhUkwkGBq0KuqOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7B/hKLC+TgjX+ChOiL2CkxBgFfN81zWFBKnMT9Kq4g=;
 b=IO38blZ/rvsjKbVIuRnS2PGuyWTBXarwnc4MVYymBNlpv7WL2DIxj0tKl8/2JRqMFzzTXy5wM0Hv6ofBfUBYFmputZswUnOLIsnkGpsPyBDlAjOyNJtBc+aIuAS6KcTNuBKXrDND5a51vjiI2G2CSs858OcAQm7maDhicSER+rHmKWzA6/Z8t1//PEd5pxhYD+AuVyoHgQeuynMvKHbXonhTY/KiSVywBDI1JV65yaEZKXvk8oabUANnRX/0Q1FRHfjqtnNBg7mnboPZJT0sTRGCRmFEQkUMOE/6GdxbpuJBXI9HbHrpgs2wCSIBCEqgLtIp40IguIIUJyUruP8tVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duckduckgo.com; dmarc=pass action=none
 header.from=duckduckgo.com; dkim=pass header.d=duckduckgo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duckduckgo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7B/hKLC+TgjX+ChOiL2CkxBgFfN81zWFBKnMT9Kq4g=;
 b=b2tN4gfMu0fBWcsQIF2L5EatW5VBq8gOrsWxdFmyFHTi+twmRjwc/HGPdi1ExjvBxGwORRicg+JoY9p8KJYiIfTJEV9R4VSHOhFj3TW07C8BuHghq/oX/rEgmNOdLh4WQfQ8rEIdDaXa4G7HylAoOevR2FxhCmJ0xxrzeHTT/g8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duckduckgo.com;
Received: from CH0PR16MB4548.namprd16.prod.outlook.com (2603:10b6:610:f0::17)
 by PH0PR16MB4884.namprd16.prod.outlook.com (2603:10b6:510:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 11:15:14 +0000
Received: from CH0PR16MB4548.namprd16.prod.outlook.com
 ([fe80::3603:bccb:f99:5461]) by CH0PR16MB4548.namprd16.prod.outlook.com
 ([fe80::3603:bccb:f99:5461%3]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 11:15:14 +0000
From: Nick Goossens <ngoossens@duckduckgo.com>
To: wireguard@lists.zx2c4.com
Cc: Nick Goossens <ngoossens@duckduckgo.com>
Subject: [PATCH] tun/netstack: close stack on netTun close
Date: Wed, 11 Oct 2023 13:14:13 +0200
Message-ID: <20231011111425.3329-1-ngoossens@duckduckgo.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CT2P275CA0084.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:27::22) To CH0PR16MB4548.namprd16.prod.outlook.com
 (2603:10b6:610:f0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR16MB4548:EE_|PH0PR16MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: a55b3766-71f3-42d5-857e-08dbca4b571e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SvOiQvWGJ1UUEOw7YH+zueiz0DAs8FbrNOKx/ADgYqkZ1iIvWb/o9IRlMgSiesbD6BxElnfx8HLwfQ5eJPyeWiLeOAbTrZhQqhhjVSIb1fLMpSaHJTPS1dyDpNdq0Xbg5hByyM7HTKmnlNW4ZihYKYfpnmr8O6FGo9NFqKkcNsZo4U8ywZTqaD+efzTuUJytB4zoMjjZtCXCI5Rbui3kRKRevSClui749+CTarXTHCTmZyyALpDPopf3wp7nx6BLvHUSzTXFT36OKaBmkloXQXBYKza+e3QXrEqSe37oKJ5Ewje5UVW8Wi7+grLPx90SJwFzWhg3xaeevs4nUmD3OLHwlWB3c3Ztb1tS8TaGkldOMnsrBvLrWiiBiRPgpmrqrOuQdE3+0X+FfsRZrzeTd+1O+Iu4VCJrsmXIhffjvU90QhvAPqR2wjYNxUCinQrkiRfkemZxhqUUJuKkAklNjTdL9VGuql5kEitkKZJ2O+9G/IeRJgh/2prFbeduFgT6up/DVZrjTowBtw9oke2Frpy0FEuymefZYkVcGB5zrittkmzDCpPXF5hPQborWW7hjlQL9uEBbucRS3eibzKkrsYjOeZCqhkxhA4VkyFefBV8UW39sgiy1UpZwuFQfiT8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR16MB4548.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(366004)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(316002)(6916009)(66556008)(66946007)(66476007)(6486002)(38100700002)(38350700002)(41300700001)(5660300002)(8936002)(4326008)(8676002)(4744005)(107886003)(1076003)(2616005)(86362001)(6506007)(83380400001)(2906002)(6512007)(52116002)(36756003)(26005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cm7oZDPIVoMipbSOlRCGZoHJ4uF1zNGc5vLQyKDsg2szNMsd+BJIyPzyDE2+?=
 =?us-ascii?Q?zvzs07gsGOaZgDIImHVyEb716fuiSpKIm3mnqE0U7N/QitFwWHhikNeIYHT2?=
 =?us-ascii?Q?U8dJ9yWzuh7kKBklHpcniZSVJosjC5XPUh4CQ7HMK6zctYaFZyq/wHk4Oe/W?=
 =?us-ascii?Q?mz+hdnSNyHk1pZKkZ07Yo3bXoGnD/L5myHiaCl/5F12+/Lj1M0rq+i2QSwpp?=
 =?us-ascii?Q?2G7rHdlh31yB44d9OR9DogW+z5u8uuS/BOcGfb2jHeKyAPnOExLgzSz63rcL?=
 =?us-ascii?Q?1YYzCH3kJpccM53Fk6yKNAVMD25s39OUTgEckjDmZmngGi4AFHfMzXj93vz6?=
 =?us-ascii?Q?45GlvpgFZxHAM/B7ZBzU4mo/rEyAWISd6yrAscmPRr3qL1Rh/OH9MMbBz0XZ?=
 =?us-ascii?Q?KpAiuJwBfcvRe1osD0fel7seQ4LqGOR8yZ2XeDxtKWl1+KAS9g6YGxZvZnOC?=
 =?us-ascii?Q?AIu4GBBorOYGqi6WgqdoKjMU2M2q5XLgZ2j53o3gJZHtvmLew2VkGMNaWXKm?=
 =?us-ascii?Q?ZZ8Swp2BeJbsFrT5jqeb+/U/klNYoIas8ln7KPtzejsNx67akeLXQ/hrxgdz?=
 =?us-ascii?Q?tUQqDf0BVXbX8JajVOo2FHxAjiwAbkPM2y/++N7tvw0iJzih7brMhziQVF26?=
 =?us-ascii?Q?H+o/YalZXWYjqiMDOSy9o4b/LHJZbTRH3wGtBIg0xcApiR2S71l3cNCgqVOD?=
 =?us-ascii?Q?2PBD5V3Ze+sYU8yMtI489hfDhM5OBm7KgI9iWy90qpHSY6WLx1Q72IGxXB7w?=
 =?us-ascii?Q?FPJ/LLa+kGZ1C08LSIwmHqL95J/6Xug6JGj9GHCVyu0Q3x83DAE+jmQF4FeU?=
 =?us-ascii?Q?NSRtr5988yqHF7RNGwn5vbAaUz7pILYkMA1LKnVbGC6btHpAZdqVE5tDo8/q?=
 =?us-ascii?Q?XJ0pVGJqgE4TNL9fIAo4Csp0BxrGV8p9orND/OHg8qLKrH7TQjaLRItfFJW1?=
 =?us-ascii?Q?Q/OYDiHbRPZWzO3T40RMP02bFxbOLapLaTqvew50rqA3u52ZxgK8e5GPk7+q?=
 =?us-ascii?Q?PVb566/hMoF9dFjyhUzWSsLUiQlpoFj6F7t2FsJtWQKs9zl5JUe9dGxOQfas?=
 =?us-ascii?Q?ZmPifU2FbuWq3/oYtO4OzPFlvfkgN1x6qfZoz2C89XYkzvf/ObWCP4LEwKc3?=
 =?us-ascii?Q?bpYw5W6k5SXsOYG9O6Tiv6qSdhW+D9JOqSr7MLd7feOi0VGccrWnSJiwqT84?=
 =?us-ascii?Q?ol098ehli4/StAsM9jydn5X0nuzuQW5FRitqgMxg356SjeX7SNIng0OLxu87?=
 =?us-ascii?Q?p0yu4oh7tPDvzFvdC86HUOc6ueGkUlr5l890Y+dJToQq41GSMManUx+Rcqml?=
 =?us-ascii?Q?RSIbctX+0yC01BmFLdjqzdvOs031I38FUzB6ybSedBjAeAtrQO/igoxGu5Jf?=
 =?us-ascii?Q?OJ8LjCCq+GZfQI8rRM3q1pmEwVNebBx8yT2H6rY4dEtidVSly1AQjeq8j7W3?=
 =?us-ascii?Q?FUxzaGuAknzgFiiGgH9cZ3OyquFOD9DvuXKaMq4Rt+eQRZBCsXN1MTpA70VU?=
 =?us-ascii?Q?dYQgAHrf6qOxHuN+6eqJqU5DWNIZREfHoLs0RgLP6kquXhjxl4/KUV1Vz+jM?=
 =?us-ascii?Q?Yvacc5mk6VA6Iz0HKIODYWyjOS7GLYV7YuZM8wunSsH0uHffUccW8Sl0pIic?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: duckduckgo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55b3766-71f3-42d5-857e-08dbca4b571e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR16MB4548.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:15:13.9865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 728892a0-4da9-4114-b511-52f75ee3bc3d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWD2gx5oOHFwXhMVMuXFD1+CGpf2Xup2CYmnXGQ9qg6375PG57k834evWKepsRQOK0t5N2BQyHEkFKQDNJQX7/BQ6lTHLp/41PKfGwOVwQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4884
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

