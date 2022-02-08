Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5F0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Feb 2022 08:37:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 319c75fe;
	Tue, 8 Feb 2022 08:33:32 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ca07f71b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Feb 2022 08:33:30 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 n13-20020a056602340d00b006361f2312deso10896374ioz.9
 for <wireguard@lists.zx2c4.com>; Tue, 08 Feb 2022 00:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Zu1f5wks8CG9qf+bEyfbwDDqbLe9bidYWfVJmudyP5c=;
 b=XOnLLlLKn6A3/XdUVDOZ6hhMBs+QLA2lxOB0Wcpmq46tjZ8gKhYim1LHc6n5JFJbW5
 nVDZhthe+zu6k9DzGqHCFsMvCYN4zA67qVYDYi7LV69/lqpmvvC6/6yDfcX44lvhNUbt
 Qwq6tAgLwwaj/U0FdBpcyA+tx0fEBZDSXzTYXgon3rpQtYKS7O09MQtV+fpU+o0LjcwM
 Bw+SdynLK/pt4FiXaYHrhZZT+QiNeMH/ejyQjOLhBdPBHdUm8yGi4Lq4Wk0n+krsR1On
 7IVNs/djqkfs34tPdafVyabt7nha+XwFwQz+/gcjQzhbPIX9S3NCH88s/f5CFWqq0OVy
 3dZg==
X-Gm-Message-State: AOAM531Qv+o1q2zBSF6ocajxQ1UANSeRQdU5zBS5fBTK6nBKykKgkHiE
 YmlPdE0paplXXM9Rv1obeCrlxuQTdo63fkUzRcIkafrPDlel
X-Google-Smtp-Source: ABdhPJz2gSdVhCHqfIAKJccadNo+Pwyc0aWv5nW4Iwpv1ik7Vv8sD+fb4hjvadw87gBxqOfFORmeIByV5Ol5nUDZY0Wah4vaPz+t
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dd4:: with SMTP id
 l20mr1577514iow.115.1644309209624; 
 Tue, 08 Feb 2022 00:33:29 -0800 (PST)
Date: Tue, 08 Feb 2022 00:33:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005733c005d77d9215@google.com>
Subject: [syzbot] KCSAN: data-race in wg_packet_decrypt_worker /
 wg_packet_rx_poll (2)
From: syzbot <syzbot+d1de830e4ecdaac83d89@syzkaller.appspotmail.com>
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

HEAD commit:    2ade8eef993c Merge tag 'ata-5.17-rc4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112ef758700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1dcc3374da7c1f7c
dashboard link: https://syzkaller.appspot.com/bug?extid=d1de830e4ecdaac83d89
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d1de830e4ecdaac83d89@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_packet_decrypt_worker / wg_packet_rx_poll

write to 0xffff888127d03888 of 8 bytes by interrupt on cpu 1:
 counter_validate drivers/net/wireguard/receive.c:328 [inline]
 wg_packet_rx_poll+0x436/0x11f0 drivers/net/wireguard/receive.c:468
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
 kthread+0x1bf/0x1e0 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30

read to 0xffff888127d03888 of 8 bytes by task 1912 on cpu 0:
 decrypt_packet drivers/net/wireguard/receive.c:259 [inline]
 wg_packet_decrypt_worker+0x23a/0x780 drivers/net/wireguard/receive.c:508
 process_one_work+0x3f6/0x960 kernel/workqueue.c:2307
 worker_thread+0x616/0xa70 kernel/workqueue.c:2454
 kthread+0x1bf/0x1e0 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30

value changed: 0x0000000000000bb9 -> 0x0000000000000bba

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 PID: 1912 Comm: kworker/0:3 Not tainted 5.17.0-rc3-syzkaller-00013-g2ade8eef993c-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: wg-crypt-wg1 wg_packet_decrypt_worker
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
