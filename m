Return-Path: <SRS0=cn6I=4J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF1DC35643
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Feb 2020 07:23:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B6C20722
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Feb 2020 07:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B6C20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0022a7b6;
	Fri, 21 Feb 2020 07:20:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20b9e24c
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2020 07:20:11 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 659b75f7
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2020 07:20:10 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1C63ACB9E65A576160E;
 Fri, 21 Feb 2020 15:23:02 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 21 Feb 2020
 15:22:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Jason@zx2c4.com>, <shuah@kernel.org>, <davem@davemloft.net>,
 <yuehaibing@huawei.com>
Subject: [PATCH net-next] wireguard: selftests: remove duplicated include
 <sys/types.h>
Date: Fri, 21 Feb 2020 15:22:09 +0800
Message-ID: <20200221072209.10612-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org
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

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 tools/testing/selftests/wireguard/qemu/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
index 90bc981..c969812 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -13,7 +13,6 @@
 #include <fcntl.h>
 #include <sys/wait.h>
 #include <sys/mount.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/io.h>
-- 
2.7.4


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
