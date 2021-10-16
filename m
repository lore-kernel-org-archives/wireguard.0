Return-Path: <SRS0=mIIS=PF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEF1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 00:46:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC8360F8F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 00:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FC8360F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4893b922;
	Sun, 17 Oct 2021 00:46:20 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2041.outbound.protection.outlook.com [40.92.40.41])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6e55979
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Oct 2021 20:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AERb0zo/KQ56zsja1gAP+qEUAYuEMm2kTdBJDTwmNR6JSfk1IFyFDujcRdr2AqadnUCH09p7WwbBHdG6DWTC9r6XixiR5S8utMPzl0smZFabJ9VmSebGxBGjNSmouzRkxBI4Z5921YDn1cnlS3UwaJriSLBIgi2HflZoRX7DTG8ESoBlSzQ5d7dAR+w26kxVAeG8oZQ+14Z5PMyZQACWka0OIeWacBr8ybLGgi9gfWF4vbqLZ1EpgRgOWo/iJWjTKk26vYv8dYTsKGI8S7p2lftqQ1nuvoa6uSJBZ6ObuTGriS2GT1uWfUxu47sPCs8SHOmd6W77Zrob7c3+bADCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flv1gkTS2IhSeJSwtGUid9ZTfzMRNSYwTrQjYTq0y6k=;
 b=UKaG42/6TIv8JPK5LzaVkPaXRjG4O1FP62oAlzL1k15ynYnQdComtiJ06/mHNxuUUOC2StW3fEmQ5cyD2Qi9S09a5/OFQO89580mLNT0wdLkGRk318cLJKRjDfDF6adIUD97E2r/0aCwmivmrxL8BqZxZSLhpkMW4qZ+MDSxXXbWmIguawpIWLC6z9sZKrZe9SEmNl9yaXfj1eXBsSd4H2RFaS2dSJUK9hEN8zPOokOB1hFzwtw+6PrUqC1IHqcDa/i2MA9ibGrKhWRGQNRUQEGqAO5M2/4j+GPacvQaJy2uguENaLWMdYo8wQnpwE1vGvw4UbIk9jRKypFQkbIlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flv1gkTS2IhSeJSwtGUid9ZTfzMRNSYwTrQjYTq0y6k=;
 b=NIshyR0jbjX8dxUg9HoS31z0o9n+vkW3FeOaGehR7wF0OY9kIGAczz5A6XDAhAQ4Ir2xel1l5/r4T7AI+SLqy5/fFKNx/I9sR3HRZU2S0r+k82BObdl4H8cBfe1aoFQFEEv4a9nJrX+GTdmHVwqyOK7ZZ5S7jwjxAXzHrh00eYFPPPicTarNVzou7ahAAAmjHEYqHgHIxtRA7MDdXmuFzBMdYBOHWQk3G1xJjiHh5SI1I5zfJ2goME45JNj6lulD8E41twU1Enryx8zZ1FFfAArrlmwMkhlH1WmtkCd19Ky1spjwKPPfuSIUxEvhP8cXNVabyvmMrHyOH1sGalR2Xw==
Received: from DM6PR01MB4444.prod.exchangelabs.com (2603:10b6:5:78::15) by
 DM6PR01MB4684.prod.exchangelabs.com (2603:10b6:5:67::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Sat, 16 Oct 2021 20:59:41 +0000
Received: from DM6PR01MB4444.prod.exchangelabs.com
 ([fe80::647d:582c:3061:3679]) by DM6PR01MB4444.prod.exchangelabs.com
 ([fe80::647d:582c:3061:3679%3]) with mapi id 15.20.4587.032; Sat, 16 Oct 2021
 20:59:41 +0000
From: Aaron Avery <aavery77@hotmail.com>
To: wireguard@lists.zx2c4.com
Cc: Aaron Avery <aavery77@hotmail.com>
Subject: [PATCH] Fixed null pointer exception when user namespace is empty
Date: Sat, 16 Oct 2021 15:59:30 -0500
Message-ID: <DM6PR01MB4444144DA39B5197C71D9762D7BA9@DM6PR01MB4444.prod.exchangelabs.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Nr3KAO60zz1XliJ5WDGRDd+gsFIQBpNY]
X-ClientProxiedBy: CH2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:610:54::28) To DM6PR01MB4444.prod.exchangelabs.com
 (2603:10b6:5:78::15)
X-Microsoft-Original-Message-ID: <20211016205930.379-1-aavery77@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hmmmbig.localdomain (66.173.7.49) by
 CH2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:610:54::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Sat, 16 Oct 2021 20:59:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 097cf3bf-02ef-4972-f3ba-08d990e7df29
X-MS-Exchange-SLBlob-MailProps: 6H6McBavlAjORyYV4NNX5XSC3u+S4Vxcx3xdIKALqS5S7jE0PIi+0jrmXHRUKtVIgrLC3OY6niaXGKYWHpbSzomjMunTlfprTDzWTyDNkY32O7d5yfuJNFp0JRwWqtwvEveFMCBuD83rSUrejZsD7NnsSyolnrUP46nVTvPgIJ4vWsjgjhvJAJs336oN9JaQOx+GNNFZ/WD9r3iBu8NPZRHRjFAHR3z5lKdWqWTi1tiJypbnTTytNTnxJMPciBQbYkDreY4AIXgQHe2L86Luej0H/BHHhumo4Z3ZtnUdKDbbXS4zPNgm8Xf7Fwcpwrw6umcZTqxXKuRW809wB9E+CyaX3ho9cm3oVr1YzuQNX61mbEeqaRk8BwC1VijZOZq0yXWy0/s7iJ/8fnOel0aB/77+JmVTQkQecvMs8AcSrkEVB+RfZaPvVshMxDq9tuDWrycIv2Y+k9fcAuK27JF4z+EI7xzbwqqNbOsdhkAWh5+YkmhVh0k4gk3MmSlAC8vC8OwO+9NqmnTml71Fuhvb56jqQFnWtYOT9k+nv9DY8gpM0NaIFb7Z3gpUuBVm/oFQ9riQkjuk/e09QqtqC8kJEJX9OKL5Y+z+olkFA95EzSFgIDh18vTxVjeh/VLHwmCVZzquS/9IzI0dLBLI0+qI5KcPl+iwfvalmfWeVzgrXhQb7axRkm8MuunH6N0CC+0O+1Zm2MPsa3qbQNB8YWX+6Kx5XDhCBdnIVCrwHE5n4MJXaU0ji74v2HvKMluxFQ6PcLqQ+FSy0a4=
X-MS-TrafficTypeDiagnostic: DM6PR01MB4684:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXKGhr2usNhJWlF3LGvq0VEgQcfoeNbRBWcHlnk1BOXWEFWUr+ffdVJLc7BWE+uUvXLFgc32z4Nm5fEH7ugg4ftikNO5zQz8I9wcpgcGDoO2xL6NaTnmLGVLi0eSIUiu7H/6JorI3b1LdfrqPWz4BYeuTP6C2gvebPolhyEjBGqiyclqcXVIfZcur9cBuUpAso6lZEA/Rr3Nw9Iq2AAA2qYWMrfZzIkyexuZQ0Iny+uVzwqovcIviB6YWKWQO590CpLzUxOgrg5ct3VqOz4U1EXFW3Xu8pI++YxeMrtfZ0uBXYQlZPyDZRzQUCLm1Ijk3TbwLvyLYfu8UUC40sHcbeVxNOAQAVjBX9aF1kFU+gQ58a0QVjaCylQJ+bVktVzPM5DLvMaAxU+xkjET/zQ9dZG74Nd8+GnnAbJ70hm3Kn5RVT307BlPlbu+2pdcQ5e2GSXMP0JewtpXI1wYBHoO8xlgD2qtzhagQHpQmC7PB/lGnOGLiKZEtjH4mXLvj9BT4pdyUjS6Cg1vLnlYVdpwuAcH6yE+Bvg/JcGlSbkn+qA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Khdp5F1ChcoQGMoK2yq1xtx/Uo+Wjc8qSpPBQR9TA/XqvHqQuW0rF0+fXqYSxLF4tS/JB0yTKrm2AJ7V9kbfsBu5aiHzCALUwiZRhlnbQMgk6gBL/BeNNFKZuMuBb2w+7sR0+M6A7uR0mDBfuxSH2A==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-48c30.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 097cf3bf-02ef-4972-f3ba-08d990e7df29
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4444.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 20:59:41.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4684
X-Mailman-Approved-At: Sun, 17 Oct 2021 00:46:18 +0000
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

---
I compiled the Wireguard kernel module for my QNAP NAS running
version 4.14.24. When creating the network device, it got a null pointer
exception. I figured out that the user namespace is null on this system
and was being passed into ns_capable as-is, crashing the kernel (somewhat).
After applying this change, I finally have Wireguard up and running
after years of wishing I had it available instead of OpenVPN.

I'm not a Linux expert so if there's a better way to handle this
situation (such as checking for root instead of CAP_NET_ADMIN when
user_ns doesn't exist), let me know and I can try it and submit
a different patch.
Otherwise, it seems like this could be applied to both
wireguard-linux-compat and wireguard-linux for maximum system
compatibility going forward.

 src/netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/netlink.c b/src/netlink.c
index ef239ab..688e41f 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -513,7 +513,7 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 		struct net *net;
 		rcu_read_lock();
 		net = rcu_dereference(wg->creating_net);
-		ret = !net || !ns_capable(net->user_ns, CAP_NET_ADMIN) ? -EPERM : 0;
+		ret = !net || (net->user_ns && !ns_capable(net->user_ns, CAP_NET_ADMIN)) ? -EPERM : 0;
 		rcu_read_unlock();
 		if (ret)
 			goto out;
-- 
2.33.0

