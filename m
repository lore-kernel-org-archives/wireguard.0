Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC040C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Feb 2022 09:13:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9662f8ec;
	Tue, 8 Feb 2022 09:13:27 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d6cc5729
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Feb 2022 09:13:23 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 o8-20020a056e0214c800b002bc2f9cffffso10888074ilk.8
 for <wireguard@lists.zx2c4.com>; Tue, 08 Feb 2022 01:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=fmKzwHE9y2F6412F2hvJKw1swsIkm5oQWcI9LLxHYNM=;
 b=XzWUX3fRRWo/6OSXkYZGh/5qbvkT+Hv12g71teBDzwJwE6vP2Tkeeu3Y8iiziogZS+
 mZ6zpfZv52lsNx/7AjSLYdkcdEeCE1OUiPigYAU9zL/tiCJnq/4NO1lZzR638EMbSAHD
 ms4xsYyeu6O/Q7Zfw5n9B7D0pmslK9eQyEpdKBoz0i0PXGv5kV9+HAHDdPF5fRgb6EfW
 uysbyDLSoYJ6sz7oXojujUhYd/5qHJ7M8oFQfi9x1GhNOX2yixLXB0F5ysBQYIojFp1B
 iveU88swWiMudgS9PO9XF6+WAys3Gm+8CsmZBmXps9702Wb02/4eDJZSW163ODHflFCE
 HO3g==
X-Gm-Message-State: AOAM531Dq5p31U6hUac0ctpn1tYY2pFhnZX/Gq1lOaDC03QhqjJ8g4p8
 xvj61E9ae4LiLrhmsLWUMKu1ZzHfSR9x0iqmpD6a4696nFYh
X-Google-Smtp-Source: ABdhPJwJFN2ywyl3Ztm6XamwcrU4BWSBBwyGIGQ0RFICRB4abjdE45+rX21ZCaG4FTlpyAbnRjEg2ygdzgf8G3U9mETEPNi4BdlB
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1347:: with SMTP id
 i7mr1627681iov.141.1644311602582; 
 Tue, 08 Feb 2022 01:13:22 -0800 (PST)
Date: Tue, 08 Feb 2022 01:13:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f8dc8805d77e202f@google.com>
Subject: [syzbot] KCSAN: data-race in dev_get_tstats64 / wg_packet_rx_poll (3)
From: syzbot <syzbot+5d8276c437d9827c1fbf@syzkaller.appspotmail.com>
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

syzbot found the following issue on:

HEAD commit:    79e06c4c4950 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1642e837b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d443ab22c440893a
dashboard link: https://syzkaller.appspot.com/bug?extid=5d8276c437d9827c1fbf
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5d8276c437d9827c1fbf@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in dev_get_tstats64 / wg_packet_rx_poll

write to 0xffffe8ffffc39fe0 of 8 bytes by interrupt on cpu 0:
 update_rx_stats drivers/net/wireguard/receive.c:26 [inline]
 wg_packet_consume_data_done drivers/net/wireguard/receive.c:365 [inline]
 wg_packet_rx_poll+0xf37/0x11f0 drivers/net/wireguard/receive.c:481
 __napi_poll+0x65/0x3f0 net/core/dev.c:6365
 napi_poll net/core/dev.c:6432 [inline]
 net_rx_action+0x29e/0x650 net/core/dev.c:6519
 __do_softirq+0x158/0x2de kernel/softirq.c:558
 do_softirq+0xb1/0xf0 kernel/softirq.c:459
 __local_bh_enable_ip+0x68/0x70 kernel/softirq.c:383
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
 _raw_spin_unlock_bh+0x33/0x40 kernel/locking/spinlock.c:210
 spin_unlock_bh include/linux/spinlock.h:394 [inline]
 ptr_ring_consume_bh include/linux/ptr_ring.h:367 [inline]
 wg_packet_decrypt_worker+0x73c/0x780 drivers/net/wireguard/receive.c:506
 process_one_work+0x3f6/0x960 kernel/workqueue.c:2307
 worker_thread+0x616/0xa70 kernel/workqueue.c:2454
 kthread+0x2c7/0x2e0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

read to 0xffffe8ffffc39fe0 of 8 bytes by task 7601 on cpu 1:
 dev_fetch_sw_netstats net/core/dev.c:10050 [inline]
 dev_get_tstats64+0x117/0x1e0 net/core/dev.c:10075
 dev_get_stats+0x65/0x180 net/core/dev.c:10017
 rtnl_fill_stats+0x45/0x320 net/core/rtnetlink.c:1203
 rtnl_fill_ifinfo+0xf16/0x25b0 net/core/rtnetlink.c:1776
 rtmsg_ifinfo_build_skb+0xa8/0x130 net/core/rtnetlink.c:3833
 rtmsg_ifinfo_event net/core/rtnetlink.c:3865 [inline]
 rtmsg_ifinfo+0x58/0xc0 net/core/rtnetlink.c:3874
 __dev_notify_flags+0x63/0x3b0 net/core/dev.c:8173
 dev_change_flags+0xa2/0xc0 net/core/dev.c:8215
 do_setlink+0x820/0x2500 net/core/rtnetlink.c:2729
 __rtnl_newlink net/core/rtnetlink.c:3412 [inline]
 rtnl_newlink+0xfad/0x13b0 net/core/rtnetlink.c:3527
 rtnetlink_rcv_msg+0x745/0x7e0 net/core/rtnetlink.c:5592
 netlink_rcv_skb+0x14e/0x250 net/netlink/af_netlink.c:2494
 rtnetlink_rcv+0x18/0x20 net/core/rtnetlink.c:5610
 netlink_unicast_kernel net/netlink/af_netlink.c:1317 [inline]
 netlink_unicast+0x602/0x6d0 net/netlink/af_netlink.c:1343
 netlink_sendmsg+0x728/0x850 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:705 [inline]
 sock_sendmsg net/socket.c:725 [inline]
 __sys_sendto+0x21e/0x2c0 net/socket.c:2040
 __do_sys_sendto net/socket.c:2052 [inline]
 __se_sys_sendto net/socket.c:2048 [inline]
 __x64_sys_sendto+0x74/0x90 net/socket.c:2048
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

value changed: 0x0000000000000001 -> 0x0000000000000002

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 PID: 7601 Comm: syz-executor.0 Not tainted 5.16.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
