Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C38DCD6E55
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Jun 2026 14:34:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c1e97a53;
	Mon, 1 Jun 2026 14:33:39 +0000 (UTC)
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com
 [209.85.161.80])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c68837b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jun 2026 14:33:33 +0000 (UTC)
Received: by mail-oo1-f80.google.com with SMTP id
 006d021491bc7-69d92a86e3bso10740716eaf.1
 for <wireguard@lists.zx2c4.com>; Mon, 01 Jun 2026 07:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780324412; x=1780929212;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/EPzY9y+i2FcltGH4jmZUHKU6LHLG85QdDxKqek6CXU=;
 b=pQw4MUsT8jNS91MQDvzlG/qX7pKvSwbJ7Ridx9FaFGwIZ6ztRH2oRE0SBQzb6ez8o0
 GDMgnbGh4FuJ9KzlN3ZKmB2BzpkBgXilS2GUyOInHMeYRFqmTE9IGvQPtzW/NY4+beeo
 upjtNNUQX3U4v2Gt450aRP6Hqgzw95E/QuyYWQJhTlwhbZWBqmuZK3+lpsygedY/yuT2
 6njlQMYNrXvY+2SLZNa6AAAlgXuWUWkRlOSEunna1/RpT/nFDp3JGIZa06OND6q/aPPr
 a/mBtTqLVJmZQSYZFOfA9didhoNIhFIHI8inej+R0/CAxJN6tXcqX8MBeT7HTf4dNbWk
 LiRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+J8K+PudwV/GjfLZz4CwlMAdtHcHswRa0LI55Zu3MCSFghLgYbr/ftH5m6gTrg1zHsA08HtstTU2I=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yx7xYDQroFus8SUv2Rg5LMv+xC2Vm2L9Gqn2M/fPNxxDyx9ACTF
 P/ZU36wNTps++4xWcpcKqdh8FaIRAq1Dc0Z5Dj7YjAOloBvzHw/GSHr6rWW4WWSioS6TKa3vmR0
 SKik7yYOvT0pHIyH+JANU8OiRK8/d0MHA4Snhy3yUpOlomqY9J/pH2Yd3rqI=
MIME-Version: 1.0
X-Received: by 2002:a4a:e915:0:b0:685:3561:8926 with SMTP id
 006d021491bc7-69e103afeb8mr5574685eaf.45.1780324411350; Mon, 01 Jun 2026
 07:33:31 -0700 (PDT)
Date: Mon, 01 Jun 2026 07:33:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1d983b.b111c304.35cd64.0028.GAE@google.com>
Subject: [syzbot] [wireguard?] KCSAN: data-race in wg_socket_send_skb_to_peer
 / wg_socket_send_skb_to_peer (9)
From: syzbot <syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
 wireguard@lists.zx2c4.com
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

HEAD commit:    9215e74f228f Merge tag 'block-7.1-20260529' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10465ef2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f571f22917457cd8
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7674fa7521a3f1bc2
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1ddf3069118d/disk-9215e74f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0913e4ffbdb8/vmlinux-9215e74f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3fe3943ae796/bzImage-9215e74f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_socket_send_skb_to_peer / wg_socket_send_skb_to_peer

read-write to 0xffff88811af99028 of 8 bytes by task 310 on cpu 1:
 wg_socket_send_skb_to_peer+0xe8/0x130 drivers/net/wireguard/socket.c:182
 wg_socket_send_buffer_to_peer+0xf1/0x120 drivers/net/wireguard/socket.c:199
 wg_packet_send_handshake_initiation drivers/net/wireguard/send.c:40 [inline]
 wg_packet_handshake_send_worker+0x10d/0x160 drivers/net/wireguard/send.c:51
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0x4f0/0x9c0 kernel/workqueue.c:3397
 worker_thread+0x58a/0x780 kernel/workqueue.c:3478
 kthread+0x22a/0x280 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

read-write to 0xffff88811af99028 of 8 bytes by task 15360 on cpu 0:
 wg_socket_send_skb_to_peer+0xe8/0x130 drivers/net/wireguard/socket.c:182
 wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
 wg_packet_tx_worker+0x12d/0x330 drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0x4f0/0x9c0 kernel/workqueue.c:3397
 worker_thread+0x58a/0x780 kernel/workqueue.c:3478
 kthread+0x22a/0x280 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

value changed: 0x0000000000000a2c -> 0x0000000000000ac0

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 15360 Comm: kworker/0:2 Tainted: G        W           syzkaller #0 PREEMPT(lazy) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Workqueue: wg-crypt-wg2 wg_packet_tx_worker
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
