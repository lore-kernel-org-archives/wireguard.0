Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082D6C35247
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:20:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688872080D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="v6IKuwBb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 688872080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a606c1c7;
	Mon, 3 Feb 2020 17:19:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55eb9e46
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 17:19:13 +0000 (UTC)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9824b25a
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 17:19:13 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id e62so9722440pfh.14
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 09:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=jnL0ScITd8eCMfVda0jLyLM51O2oGM7qNgtPIiFYLaw=;
 b=v6IKuwBbOjYPc/cR3DFvGtZoUWG7D8hWuv8iXebhKJBHqrdO9oEtD5OzTUE/i+KauP
 E04O+8eDhQBdeGEHlWTAq6ABmMqZ3fMurSYER4ZGfHGieG2xxTYFNH8YWoxgqMulFX/O
 CRLFq33yy18wVdukjeQhmk3TwNW45uxWXnEQrfvZ3eRZKyWrxKF9w4kbNyZ/Mx+WTMNM
 DIF9emEx+Eecwcz+WrFL7IG6PjTFib4u+Toip/MohqdHLHQTAt/Ana6PRT8IHSfL+yOV
 e4h301ieYa4Kh8gpQoGZC747UZAdxkyEtBQCijwVETuBA9YjVrXMdg0G5BehBZ6gUTQ8
 Ok+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=jnL0ScITd8eCMfVda0jLyLM51O2oGM7qNgtPIiFYLaw=;
 b=S8HonVyifeTN7o1dF2bTDlk+EVccpOoKP8mxWfZWCtkptUbDWaf9+YRwwhUd2uLTIh
 jLB1XfPVtr2PgCifbHuQKyT5q/8lTtcH2X2xhLLwK23qf73p6ti7/re+mLSIOahco3jG
 DTxxXXVqxJG5Myo7DuLPBL51UD1DbSut/AnDocU9WHaARbB5un/QnZMtu2xsMbaErHZx
 BGeChcrVCEC+A1szb0YCBYfWr7b8NCbVV66cptmt4acaDk8zFUzwXt04VlnwByP9Nc0v
 ssog3klZi3uhnvnVABXQyU0w1954JFro+Mtm2bA4rQkfsoRsWupGpWkaE7qzJSiAoGZu
 05WA==
X-Gm-Message-State: APjAAAVzweZlYhGldXDVG1TJ7lzdsVXFyCWpmWzjQw5zeO120DDOKmhs
 i3DbzYHbdm9Nqlve+UxcPxnm3rbD52mx2A==
X-Google-Smtp-Source: APXvYqztnap0MvD/Nu3UzT2FGx102H0njN+adPqY7rxP5rvw8nfZ1BSOFCfkn2TwL0KnULoO2pEk/Bqvxy+Usg==
X-Received: by 2002:a63:220b:: with SMTP id i11mr25720816pgi.50.1580750394752; 
 Mon, 03 Feb 2020 09:19:54 -0800 (PST)
Date: Mon,  3 Feb 2020 09:19:51 -0800
Message-Id: <20200203171951.222257-1-edumazet@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH net] wireguard: fix use-after-free in root_remove_peer_lists
From: Eric Dumazet <edumazet@google.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, syzbot <syzkaller@googlegroups.com>,
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

In the unlikely case a new node could not be allocated,
we need to remove @newnode from @peer->allowedips_list
before freeing it.

syzbot reported :

BUG: KASAN: use-after-free in __list_del_entry_valid+0xdc/0xf5 lib/list_debug.c:54
Read of size 8 at addr ffff88809881a538 by task syz-executor.4/30133

CPU: 0 PID: 30133 Comm: syz-executor.4 Not tainted 5.5.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
 __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:639
 __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
 __list_del_entry_valid+0xdc/0xf5 lib/list_debug.c:54
 __list_del_entry include/linux/list.h:132 [inline]
 list_del include/linux/list.h:146 [inline]
 root_remove_peer_lists+0x24f/0x4b0 drivers/net/wireguard/allowedips.c:65
 wg_allowedips_free+0x232/0x390 drivers/net/wireguard/allowedips.c:300
 wg_peer_remove_all+0xd5/0x620 drivers/net/wireguard/peer.c:187
 wg_set_device+0xd01/0x1350 drivers/net/wireguard/netlink.c:542
 genl_family_rcv_msg_doit net/netlink/genetlink.c:672 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:717 [inline]
 genl_rcv_msg+0x67d/0xea0 net/netlink/genetlink.c:734
 netlink_rcv_skb+0x177/0x450 net/netlink/af_netlink.c:2477
 genl_rcv+0x29/0x40 net/netlink/genetlink.c:745
 netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
 netlink_unicast+0x59e/0x7e0 net/netlink/af_netlink.c:1328
 netlink_sendmsg+0x91c/0xea0 net/netlink/af_netlink.c:1917
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xd7/0x130 net/socket.c:672
 ____sys_sendmsg+0x753/0x880 net/socket.c:2343
 ___sys_sendmsg+0x100/0x170 net/socket.c:2397
 __sys_sendmsg+0x105/0x1d0 net/socket.c:2430
 __do_sys_sendmsg net/socket.c:2439 [inline]
 __se_sys_sendmsg net/socket.c:2437 [inline]
 __x64_sys_sendmsg+0x78/0xb0 net/socket.c:2437
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45b399
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f99a9bcdc78 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007f99a9bce6d4 RCX: 000000000045b399
RDX: 0000000000000000 RSI: 0000000020001340 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 00000000000009ba R14: 00000000004cb2b8 R15: 0000000000000009

Allocated by task 30103:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:513 [inline]
 __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
 kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
 kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:670 [inline]
 add+0x70a/0x1970 drivers/net/wireguard/allowedips.c:236
 wg_allowedips_insert_v4+0xf6/0x160 drivers/net/wireguard/allowedips.c:320
 set_allowedip drivers/net/wireguard/netlink.c:343 [inline]
 set_peer+0xfb9/0x1150 drivers/net/wireguard/netlink.c:468
 wg_set_device+0xbd4/0x1350 drivers/net/wireguard/netlink.c:591
 genl_family_rcv_msg_doit net/netlink/genetlink.c:672 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:717 [inline]
 genl_rcv_msg+0x67d/0xea0 net/netlink/genetlink.c:734
 netlink_rcv_skb+0x177/0x450 net/netlink/af_netlink.c:2477
 genl_rcv+0x29/0x40 net/netlink/genetlink.c:745
 netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
 netlink_unicast+0x59e/0x7e0 net/netlink/af_netlink.c:1328
 netlink_sendmsg+0x91c/0xea0 net/netlink/af_netlink.c:1917
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xd7/0x130 net/socket.c:672
 ____sys_sendmsg+0x753/0x880 net/socket.c:2343
 ___sys_sendmsg+0x100/0x170 net/socket.c:2397
 __sys_sendmsg+0x105/0x1d0 net/socket.c:2430
 __do_sys_sendmsg net/socket.c:2439 [inline]
 __se_sys_sendmsg net/socket.c:2437 [inline]
 __x64_sys_sendmsg+0x78/0xb0 net/socket.c:2437
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 30103:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:335 [inline]
 __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10a/0x2c0 mm/slab.c:3757
 add+0x12d2/0x1970 drivers/net/wireguard/allowedips.c:266
 wg_allowedips_insert_v4+0xf6/0x160 drivers/net/wireguard/allowedips.c:320
 set_allowedip drivers/net/wireguard/netlink.c:343 [inline]
 set_peer+0xfb9/0x1150 drivers/net/wireguard/netlink.c:468
 wg_set_device+0xbd4/0x1350 drivers/net/wireguard/netlink.c:591
 genl_family_rcv_msg_doit net/netlink/genetlink.c:672 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:717 [inline]
 genl_rcv_msg+0x67d/0xea0 net/netlink/genetlink.c:734
 netlink_rcv_skb+0x177/0x450 net/netlink/af_netlink.c:2477
 genl_rcv+0x29/0x40 net/netlink/genetlink.c:745
 netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
 netlink_unicast+0x59e/0x7e0 net/netlink/af_netlink.c:1328
 netlink_sendmsg+0x91c/0xea0 net/netlink/af_netlink.c:1917
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xd7/0x130 net/socket.c:672
 ____sys_sendmsg+0x753/0x880 net/socket.c:2343
 ___sys_sendmsg+0x100/0x170 net/socket.c:2397
 __sys_sendmsg+0x105/0x1d0 net/socket.c:2430
 __do_sys_sendmsg net/socket.c:2439 [inline]
 __se_sys_sendmsg net/socket.c:2437 [inline]
 __x64_sys_sendmsg+0x78/0xb0 net/socket.c:2437
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff88809881a500
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 56 bytes inside of
 64-byte region [ffff88809881a500, ffff88809881a540)
The buggy address belongs to the page:
page:ffffea0002620680 refcount:1 mapcount:0 mapping:ffff8880aa400380 index:0x0
raw: 00fffe0000000200 ffffea000250b748 ffffea000254bac8 ffff8880aa400380
raw: 0000000000000000 ffff88809881a000 0000000100000020 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88809881a400: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88809881a480: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
>ffff88809881a500: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                        ^
 ffff88809881a580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88809881a600: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Reported-by: syzbot <syzkaller@googlegroups.com>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
---
 drivers/net/wireguard/allowedips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 121d9ea0f13584f801ab895753e936c0a12f0028..3725e9cd85f4f2797afd59f42af454acc107aa9a 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -263,6 +263,7 @@ static int add(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
 	} else {
 		node = kzalloc(sizeof(*node), GFP_KERNEL);
 		if (unlikely(!node)) {
+			list_del(&newnode->peer_list);
 			kfree(newnode);
 			return -ENOMEM;
 		}
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
