Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA83C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:45:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 108fd418;
	Thu, 21 Apr 2022 23:50:28 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3291ae2e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Mar 2022 11:57:51 +0000 (UTC)
Received: from kwepemi100018.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KSSjk4mzGzcbPH;
 Tue, 29 Mar 2022 19:57:30 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (7.193.23.3) by
 kwepemi100018.china.huawei.com (7.221.188.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 29 Mar 2022 19:57:47 +0800
Received: from huawei.com (10.175.104.82) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 29 Mar
 2022 19:57:46 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <Jason@zx2c4.com>, <davem@davemloft.net>, <kuba@kernel.org>
CC: <wireguard@lists.zx2c4.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wanghai38@huawei.com>
Subject: [PATCH net] wireguard: socket: fix memory leak in send6()
Date: Tue, 29 Mar 2022 20:15:52 +0800
Message-ID: <20220329121552.661647-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600001.china.huawei.com (7.193.23.3)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:50:26 +0000
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

I got a memory leak report:

unreferenced object 0xffff8881191fc040 (size 232):
  comm "kworker/u17:0", pid 23193, jiffies 4295238848 (age 3464.870s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff814c3ef4>] slab_post_alloc_hook+0x84/0x3b0
    [<ffffffff814c8977>] kmem_cache_alloc_node+0x167/0x340
    [<ffffffff832974fb>] __alloc_skb+0x1db/0x200
    [<ffffffff82612b5d>] wg_socket_send_buffer_to_peer+0x3d/0xc0
    [<ffffffff8260e94a>] wg_packet_send_handshake_initiation+0xfa/0x110
    [<ffffffff8260ec81>] wg_packet_handshake_send_worker+0x21/0x30
    [<ffffffff8119c558>] process_one_work+0x2e8/0x770
    [<ffffffff8119ca2a>] worker_thread+0x4a/0x4b0
    [<ffffffff811a88e0>] kthread+0x120/0x160
    [<ffffffff8100242f>] ret_from_fork+0x1f/0x30

In function wg_socket_send_buffer_as_reply_to_skb() or
wg_socket_send_buffer_to_peer(), the semantics of send6()
is required to free skb. But when CONFIG_IPV6 is disable,
kfree_skb() is missing. This patch adds it to fix this bug.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/net/wireguard/socket.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
index 6f07b949cb81..467eef0e563b 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -160,6 +160,7 @@ static int send6(struct wg_device *wg, struct sk_buff *skb,
 	rcu_read_unlock_bh();
 	return ret;
 #else
+	kfree_skb(skb);
 	return -EAFNOSUPPORT;
 #endif
 }
-- 
2.25.1

