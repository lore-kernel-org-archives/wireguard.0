Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC20C2D0C8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:54:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F142173E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F142173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aa0b87a;
	Thu, 12 Dec 2019 09:54:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e45c8c33
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 09:18:17 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e37428a
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 09:18:16 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3EADA54B19AC2CC7B697;
 Thu, 12 Dec 2019 17:18:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Dec 2019 17:18:07 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, "David S . Miller"
 <davem@davemloft.net>
Subject: [PATCH net-next] net: Remove unused including <linux/version.h>
Date: Thu, 12 Dec 2019 09:15:27 +0000
Message-ID: <20191212091527.35293-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:54:08 +0100
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireguard/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/main.c b/drivers/net/wireguard/main.c
index 10c0a40f6a9e..7a7d5f1a80fc 100644
--- a/drivers/net/wireguard/main.c
+++ b/drivers/net/wireguard/main.c
@@ -12,7 +12,6 @@
 
 #include <uapi/linux/wireguard.h>
 
-#include <linux/version.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/genetlink.h>



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
