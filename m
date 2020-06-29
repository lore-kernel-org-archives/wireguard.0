Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0EAC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 23:11:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBA220776
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 23:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBA220776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 167d8a91;
	Mon, 29 Jun 2020 22:51:31 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7bc6727
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 22:51:30 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id g17so11959644iob.3
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 16:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=scxQ3olKSlbD2dbdxyeSE7jRyJ9lJyRe3hVz8jvF9ow=;
 b=bsuytfcY8ba2htf4+6MVVDoGQnWg44M+Cxfh9ERVFtNhvKPwXiYxsBxXZc+xgKhEFK
 akyo2K9xCc+vJDkFEX5chfpHsLfbieuhlIqE7h1s0QYqFQDU7WtBoSRV1SRFGFlw/PHO
 fb6vUyi//3mEIUnU2giO/NY/Pl+lB1k98v7VIDFyMuvJzwPY+dMOIDmDBnDmF6uTLwP1
 3GNA7HmgraXh74W1VAtSEc+0xBA3lpnKhTwjamEu98xsyK0djsjv0jmqeLRPPxJZ+A9J
 9km66bzPAI0DIJPUbCh+g28a2BlOa8BUo6PZ1+78NMa62WThDgp4hZwRtLRzJ/ecHOwk
 toYQ==
X-Gm-Message-State: AOAM530axCkwg/YE5zG0uQhntY2hbDhsFOoTacQqT/uIVR4G3Mx5ImlA
 S0JTrNTRhvzEn/3X6eeBaH1SomCUtupH7ncjk6oOcqrVJWPm
X-Google-Smtp-Source: ABdhPJx6hW4JpWu7xneEQCiHNeHEXyoCY16K9PPGVpQTWUp1dg1xDaKn7ah0VhFOgIgt4YT/p0ew9JG20fSp4FFidx1Smbq0Ak8v
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13cd:: with SMTP id
 v13mr9732535ilj.15.1593472272869; 
 Mon, 29 Jun 2020 16:11:12 -0700 (PDT)
Date: Mon, 29 Jun 2020 16:11:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c8af7205a9412c5b@google.com>
Subject: KASAN: use-after-free Read in dev_get_by_name
From: syzbot <syzbot+86e957379663a156cd31@syzkaller.appspotmail.com>
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

HEAD commit:    4e99b321 Merge tag 'nfs-for-5.8-2' of git://git.linux-nfs...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1013cb29100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=20c907630cbdbe5
dashboard link: https://syzkaller.appspot.com/bug?extid=86e957379663a156cd31
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1689e8f5100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144f07bb100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+86e957379663a156cd31@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in strnlen+0x63/0x80 lib/string.c:561
Read of size 1 at addr ffff88809f3e9c18 by task syz-executor276/7264

CPU: 0 PID: 7264 Comm: syz-executor276 Not tainted 5.8.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 print_address_description+0x66/0x5a0 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report+0x132/0x1d0 mm/kasan/report.c:530
 strnlen+0x63/0x80 lib/string.c:561
 dev_name_hash net/core/dev.c:208 [inline]
 netdev_name_node_lookup_rcu net/core/dev.c:290 [inline]
 dev_get_by_name_rcu net/core/dev.c:883 [inline]
 dev_get_by_name+0x9b/0x2a0 net/core/dev.c:905
 lookup_interface drivers/net/wireguard/netlink.c:63 [inline]
 wg_get_device_start+0x1fb/0x2d0 drivers/net/wireguard/netlink.c:203
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
RIP: 0033:0x44a809
Code: Bad RIP value.
RSP: 002b:00007fed6f920da8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00000000006dbc28 RCX: 000000000044a809
RDX: 0000000000000000 RSI: 0000000020000200 RDI: 0000000000000004
RBP: 00000000006dbc20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc2c
R13: 0000000000000000 R14: 0000000000316777 R15: 0000000000000000

Allocated by task 7265:
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

Freed by task 7265:
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

The buggy address belongs to the object at ffff88809f3e9c00
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 24 bytes inside of
 512-byte region [ffff88809f3e9c00, ffff88809f3e9e00)
The buggy address belongs to the page:
page:ffffea00027cfa40 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea000294b388 ffffea00029e4388 ffff8880aa400a80
raw: 0000000000000000 ffff88809f3e9000 0000000100000004 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88809f3e9b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88809f3e9b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88809f3e9c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88809f3e9c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88809f3e9d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
