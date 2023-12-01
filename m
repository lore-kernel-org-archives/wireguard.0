Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC49C4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Dec 2023 15:31:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80bee4cd;
	Fri, 1 Dec 2023 15:31:28 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 77d00749
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2023 15:31:25 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5c627dd2accso774067a12.0
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2023 07:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701444684; x=1702049484;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0oJz4ABqI6dQYHTyvK+VaenbIcleK/g5CtSQLh80SqY=;
 b=FIwSRvBTx1DSZwXwrLLD4liAVIXNLGYx84GBTaEzClL932BzHUDkLRTY5vyCCxUBnZ
 UfFlrw/ZswqJaLOiAb78rHjYv+vQ6SATBG/hKL2rzhO44nM568osZWIB/92IRbuM8ZF9
 JEa5ZNfh1DLhqJuAz7VLDY082eCrWYYHN/9nKGiml6sdxrFSAlPFyIzufWpSFppkh2OZ
 en/2gZextCVYL1vBuvFtjgA5ct9QiQ81fyUAbBBqrhJZ6d9HQAfRoy1Uyds1lRjat3H+
 8J/iqkziaOewG0aY1Xp+epM5aKXF5LdiRBjgPNlqSZnAjP0fTlBk7OXGrFV26YnMOe2/
 T/rQ==
X-Gm-Message-State: AOJu0YxkW8HQ10i7kFK5m4JDE3iAXCJfBklBclWcUQAq4sMQUUrJ0joK
 2Z7+oty7IEx3d0JK7xx4pLmH2sveeU8xzg0DEXyQpOBwLKFi
X-Google-Smtp-Source: AGHT+IEpfkl2TVrJUq3upLcd96cDovCb5c1uhiWIvTt2OW0A5SrXccNr+K53jgdEjnBTjCOmmHJuSjF/KEqeMS5ZdULuHsQxD8zE
MIME-Version: 1.0
X-Received: by 2002:a17:903:2308:b0:1cc:274d:ba5a with SMTP id
 d8-20020a170903230800b001cc274dba5amr5686495plh.0.1701444684119; Fri, 01 Dec
 2023 07:31:24 -0800 (PST)
Date: Fri, 01 Dec 2023 07:31:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000000843f060b747650@google.com>
Subject: [syzbot] [wireguard?] KCSAN: data-race in
 wg_packet_handshake_receive_worker / wg_packet_rx_poll (6)
From: syzbot <syzbot+57cb9d16a1b17521eb76@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
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

HEAD commit:    d2da77f431ac Merge tag 'parisc-for-6.7-rc3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11294880e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c1151391aefc0c3
dashboard link: https://syzkaller.appspot.com/bug?extid=57cb9d16a1b17521eb76
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0ebc29947781/disk-d2da77f4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a82ec858fbee/vmlinux-d2da77f4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d45f2fa85085/bzImage-d2da77f4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+57cb9d16a1b17521eb76@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_packet_handshake_receive_worker / wg_packet_rx_poll

read-write to 0xffff8881392abfa0 of 8 bytes by interrupt on cpu 1:
 update_rx_stats drivers/net/wireguard/receive.c:23 [inline]
 wg_packet_consume_data_done drivers/net/wireguard/receive.c:358 [inline]
 wg_packet_rx_poll+0xd35/0xf00 drivers/net/wireguard/receive.c:474
 __napi_poll+0x60/0x3b0 net/core/dev.c:6533
 napi_poll net/core/dev.c:6602 [inline]
 net_rx_action+0x32b/0x750 net/core/dev.c:6735
 __do_softirq+0xc4/0x279 kernel/softirq.c:553
 do_softirq+0x5e/0x90 kernel/softirq.c:454
 __local_bh_enable_ip+0x64/0x70 kernel/softirq.c:381
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
 _raw_spin_unlock_bh+0x36/0x40 kernel/locking/spinlock.c:210
 spin_unlock_bh include/linux/spinlock.h:396 [inline]
 ptr_ring_consume_bh include/linux/ptr_ring.h:367 [inline]
 wg_packet_handshake_receive_worker+0x184/0x5e0 drivers/net/wireguard/receive.c:212
 process_one_work kernel/workqueue.c:2630 [inline]
 process_scheduled_works+0x5b8/0xa30 kernel/workqueue.c:2703
 worker_thread+0x525/0x730 kernel/workqueue.c:2784
 kthread+0x1d7/0x210 kernel/kthread.c:388
 ret_from_fork+0x48/0x60 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242

read-write to 0xffff8881392abfa0 of 8 bytes by task 22808 on cpu 0:
 update_rx_stats drivers/net/wireguard/receive.c:23 [inline]
 wg_receive_handshake_packet drivers/net/wireguard/receive.c:198 [inline]
 wg_packet_handshake_receive_worker+0x4b9/0x5e0 drivers/net/wireguard/receive.c:213
 process_one_work kernel/workqueue.c:2630 [inline]
 process_scheduled_works+0x5b8/0xa30 kernel/workqueue.c:2703
 worker_thread+0x525/0x730 kernel/workqueue.c:2784
 kthread+0x1d7/0x210 kernel/kthread.c:388
 ret_from_fork+0x48/0x60 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242

value changed: 0x00000000000070b0 -> 0x00000000000070d0

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 PID: 22808 Comm: kworker/0:4 Not tainted 6.7.0-rc2-syzkaller-00265-gd2da77f431ac #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/10/2023
Workqueue: wg-kex-wg2 wg_packet_handshake_receive_worker
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
