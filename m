Return-Path: <SRS0=tBXN=AR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6DFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Jul 2020 06:22:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF8F2075B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Jul 2020 06:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF8F2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3deffd6;
	Mon, 6 Jul 2020 06:01:45 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 901a8b26
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jul 2020 06:01:42 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id a16so23067933iow.9
 for <wireguard@lists.zx2c4.com>; Sun, 05 Jul 2020 23:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=65VFK3CeGOY6XsF4+JQsV3Lwx5hkLbk2n9tjz+Qw9Jo=;
 b=rafWueZzUMyGtwEWE8328ebvf958HJFjHidrMOs86BuUs9IoT/i0fANnWjlmCAUTsj
 oOjxKEoTtJN04vmZB/6wuJ3H1BQJ1VFyDYucH4LIuw34UwE89hUgXdECGgH+C8yxTs6l
 B7PVW7DiDggfCBVJoDEisU12R55xLF7Y9Wr+td6o8ICu1qkPEEkXmXpPI/HXnHZwNlA0
 T46eLVLjVHrZs1MEcmjgeezgdP1upmjPc6pLPNnEI7uJ7JfYyxdLZhgOjoYG3p1F7v68
 fN4n5WEefmS2sGlwPNDpz0F3UEJm7yM/EGfvzboF74/3rBwdEn51T6hmO1oUAus98T02
 3xKw==
X-Gm-Message-State: AOAM532FVfQotq5y3Y+CveKp88Ey8GLSSIeEHo5rCHYlcXCWnJksoTI6
 TxTcnsF22EJTTrYjOp+d+luaint00w1AFpkqoJ8t6Ptx7uuU
X-Google-Smtp-Source: ABdhPJzxJfprkEfzW1CDLFjw0CpuAk9bdct5cThB4k/Pgp3XcKi4EsWkOqKoaALvUQgTFtVbA7bcf/rlB1rqsD1zoXgBN1gbx34K
MIME-Version: 1.0
X-Received: by 2002:a92:b749:: with SMTP id c9mr30062467ilm.289.1594016534226; 
 Sun, 05 Jul 2020 23:22:14 -0700 (PDT)
Date: Sun, 05 Jul 2020 23:22:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000049f07f05a9bfe509@google.com>
Subject: KASAN: use-after-free Read in wg_get_device_start
From: syzbot <syzbot+e869cfbeeae05d706b9c@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, davem@davemloft.net, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hello,

syzbot found the following crash on:

HEAD commit:    7cc2a8ea Merge tag 'block-5.8-2020-07-01' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123532a7100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=183dd243398ba7ec
dashboard link: https://syzkaller.appspot.com/bug?extid=e869cfbeeae05d706b9c
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e869cfbeeae05d706b9c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in nla_get_u32 include/net/netlink.h:1541 [inline]
BUG: KASAN: use-after-free in lookup_interface drivers/net/wireguard/netlink.c:61 [inline]
BUG: KASAN: use-after-free in wg_get_device_start+0x2bc/0x2d0 drivers/net/wireguard/netlink.c:203
Read of size 4 at addr ffff88803b9c3818 by task syz-executor.3/15521

CPU: 1 PID: 15521 Comm: syz-executor.3 Not tainted 5.8.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 print_address_description+0x66/0x5a0 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report+0x132/0x1d0 mm/kasan/report.c:530
 nla_get_u32 include/net/netlink.h:1541 [inline]
 lookup_interface drivers/net/wireguard/netlink.c:61 [inline]
 wg_get_device_start+0x2bc/0x2d0 drivers/net/wireguard/netlink.c:203
 genl_start+0x390/0x570 net/netlink/genetlink.c:556
 __netlink_dump_start+0x3d2/0x700 net/netlink/af_netlink.c:2343
 genl_family_rcv_msg_dumpit net/netlink/genetlink.c:638 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:733 [inline]
 genl_rcv_msg+0xb03/0xe00 net/netlink/genetlink.c:753
 netlink_rcv_skb+0x190/0x3a0 net/netlink/af_netlink.c:2469
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:764
 netlink_unicast_kernel net/netlink/af_netlink.c:1303 [inline]
 netlink_unicast+0x786/0x940 net/netlink/af_netlink.c:1329
 netlink_sendmsg+0xa57/0xd70 net/netlink/af_netlink.c:1918
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x519/0x800 net/socket.c:2352
 ___sys_sendmsg net/socket.c:2406 [inline]
 __sys_sendmsg+0x2b1/0x360 net/socket.c:2439
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007f1bd1266c78 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 0000000000502320 RCX: 000000000045cb29
RDX: 0000000000000000 RSI: 0000000020000200 RDI: 0000000000000003
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000a32 R14: 00000000004cd184 R15: 00007f1bd12676d4

Allocated by task 15525:
 save_stack mm/kasan/common.c:48 [inline]
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc+0x103/0x140 mm/kasan/common.c:494
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0xde/0x4f0 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1083 [inline]
 netlink_alloc_large_skb net/netlink/af_netlink.c:1175 [inline]
 netlink_sendmsg+0x7b2/0xd70 net/netlink/af_netlink.c:1893
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x519/0x800 net/socket.c:2352
 ___sys_sendmsg net/socket.c:2406 [inline]
 __sys_sendmsg+0x2b1/0x360 net/socket.c:2439
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 15525:
 save_stack mm/kasan/common.c:48 [inline]
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0x114/0x170 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10a/0x220 mm/slab.c:3757
 skb_release_all net/core/skbuff.c:664 [inline]
 __kfree_skb+0x56/0x1c0 net/core/skbuff.c:678
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x78e/0x940 net/netlink/af_netlink.c:1329
 netlink_sendmsg+0xa57/0xd70 net/netlink/af_netlink.c:1918
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x519/0x800 net/socket.c:2352
 ___sys_sendmsg net/socket.c:2406 [inline]
 __sys_sendmsg+0x2b1/0x360 net/socket.c:2439
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff88803b9c3800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
 1024-byte region [ffff88803b9c3800, ffff88803b9c3c00)
The buggy address belongs to the page:
page:ffffea0000ee70c0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0001859248 ffffea0000e02ec8 ffff8880aa400c40
raw: 0000000000000000 ffff88803b9c3000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88803b9c3700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88803b9c3780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88803b9c3800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88803b9c3880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803b9c3900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
