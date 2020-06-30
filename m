Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6FFC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 00:40:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BCB620786
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 00:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BCB620786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eabb4388;
	Tue, 30 Jun 2020 00:20:38 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64ef0321
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 00:20:36 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id c12so10833600ilf.5
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 17:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=5UrWBVmoV0kWYi8xJ1uBgWYJPb/HpjZvC3ntYfBIxAU=;
 b=LlCD6as3RxhrJYQ76FkytRW0+95MBIPjr744rJLQuQG58vjHDyr6FfnT+ey8u8TPtf
 QCzAu+EuRQ/3d0bTpdsRXRwtZwUnmfpNHD2g9FjVF/+UiPX0LkyBzeCSW5b6pE2w9ki+
 N+thI/Q+wxHjVPbTTv9CZ+YK1Sd5xkVBXoIuahxMOO8lJNWb5uOVTmoKrHACNsQDLGmL
 X93zHtqX2fdEXWnAPHiUEUcLIwAFlBbJ5Ix+a00+qN/NPQ9zheBZgF3x4cid3gK0FU7o
 Ks3RN3kptIGQEtqTOMEs8YWR8z0dbCKrXEsOzt0Vr9VNmt5DcEXjr+5hMDzG6i5WGslA
 GE+g==
X-Gm-Message-State: AOAM532XtMgrgYKsw/7z+KQMEFHG74wGYniTxou8+KQ5yp3ayTvPYm0V
 pvowle8lrPc32d1XuCUpLqG1dOhfDERIoDRt9VjFX6tHkQc/
X-Google-Smtp-Source: ABdhPJwy0gmNL9dXwfjwwXH+OxIpk9277BnY8Xkr0x3lvDbLgnSTAeIpJJbea6uWk2JNS0jLiQPL3OZZDnalABZOYPmBC/vSlJuz
MIME-Version: 1.0
X-Received: by 2002:a02:c903:: with SMTP id t3mr3106487jao.30.1593477618905;
 Mon, 29 Jun 2020 17:40:18 -0700 (PDT)
Date: Mon, 29 Jun 2020 17:40:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006eb8b705a9426b8b@google.com>
Subject: KASAN: use-after-free Read in netdev_name_node_lookup_rcu
From: syzbot <syzbot+a82be85e09cd5df398fe@syzkaller.appspotmail.com>
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

HEAD commit:    1590a2e1 Merge tag 'acpi-5.8-rc3' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1664afad100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf3aec367b9ab569
dashboard link: https://syzkaller.appspot.com/bug?extid=a82be85e09cd5df398fe
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a1bf1d100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1514a06b100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a82be85e09cd5df398fe@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in strnlen+0x64/0x70 lib/string.c:561
Read of size 1 at addr ffff8880933b8c18 by task syz-executor821/6893

CPU: 0 PID: 6893 Comm: syz-executor821 Not tainted 5.8.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x436 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 strnlen+0x64/0x70 lib/string.c:561
 strnlen include/linux/string.h:339 [inline]
 dev_name_hash net/core/dev.c:208 [inline]
 netdev_name_node_lookup_rcu+0x22/0x150 net/core/dev.c:290
 dev_get_by_name_rcu net/core/dev.c:883 [inline]
 dev_get_by_name+0x7b/0x1e0 net/core/dev.c:905
 lookup_interface drivers/net/wireguard/netlink.c:63 [inline]
 wg_get_device_start+0x2e4/0x3f0 drivers/net/wireguard/netlink.c:203
 genl_start+0x342/0x6e0 net/netlink/genetlink.c:556
 __netlink_dump_start+0x585/0x900 net/netlink/af_netlink.c:2343
 genl_family_rcv_msg_dumpit+0x2ac/0x310 net/netlink/genetlink.c:638
 genl_family_rcv_msg net/netlink/genetlink.c:733 [inline]
 genl_rcv_msg+0x797/0x9e0 net/netlink/genetlink.c:753
 netlink_rcv_skb+0x15a/0x430 net/netlink/af_netlink.c:2469
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:764
 netlink_unicast_kernel net/netlink/af_netlink.c:1303 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1329
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1918
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:672
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2352
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2406
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2439
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x445299
Code: Bad RIP value.
RSP: 002b:00007ffd1e794308 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000445299
RDX: 0000000000000000 RSI: 0000000020000200 RDI: 0000000000000003
RBP: 0000000000082a5d R08: 0000000000000000 R09: 00000000004002e0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402430
R13: 00000000004024c0 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 6894:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:494
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0xae/0x550 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1083 [inline]
 netlink_alloc_large_skb net/netlink/af_netlink.c:1175 [inline]
 netlink_sendmsg+0x94f/0xd90 net/netlink/af_netlink.c:1893
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:672
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2352
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2406
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2439
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 6894:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf5/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x103/0x2c0 mm/slab.c:3757
 skb_free_head net/core/skbuff.c:590 [inline]
 skb_release_data+0x6d9/0x910 net/core/skbuff.c:610
 skb_release_all net/core/skbuff.c:664 [inline]
 __kfree_skb net/core/skbuff.c:678 [inline]
 consume_skb net/core/skbuff.c:837 [inline]
 consume_skb+0xc2/0x160 net/core/skbuff.c:831
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x53b/0x7d0 net/netlink/af_netlink.c:1329
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1918
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:672
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2352
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2406
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2439
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff8880933b8c00
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 24 bytes inside of
 512-byte region [ffff8880933b8c00, ffff8880933b8e00)
The buggy address belongs to the page:
page:ffffea00024cee00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002a1da08 ffffea0002763a08 ffff8880aa000a80
raw: 0000000000000000 ffff8880933b8000 0000000100000004 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880933b8b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880933b8b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880933b8c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff8880933b8c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880933b8d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
