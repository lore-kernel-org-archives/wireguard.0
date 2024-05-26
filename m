Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B17C25B75
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 May 2024 06:16:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d646490b;
	Sun, 26 May 2024 06:16:25 +0000 (UTC)
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com
 [209.85.166.78])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 291237e7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 May 2024 06:16:23 +0000 (UTC)
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-7e1db7e5386so509734939f.3
 for <wireguard@lists.zx2c4.com>; Sat, 25 May 2024 23:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716704182; x=1717308982;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xqz3OmqrV4/kaQFba8nrxHe8FASlgXMbUyOj/T3OI1w=;
 b=cJ7N2BZ5zuqdE6ildeaqkbZKwXRms9stgcjcfHESBLs3WTWms4lWvXi5JkuqdYea8Y
 CFPb+MPkKGgs37nHySrflWImyKvRWUKiERcZDVKPl6oU2rKcAXsOj4nR5NXM4wGeJj27
 d4o3BNp2zv5tQBJDWgSeC9WXLyHwPn2BgmmQmyMzkzmufRe9I2sHOIiV2NAizbWIzCqr
 LmZICsQTmkzb8MpwDlV0ppfKaJCsxiAkJAnXZZICZ1pVpzKneTU9d6k0IeovqrjvlVTH
 5r5iPjDZI1ie/B1OM+JMOFxMFgf2dGDCS8vnoJKy9sht+QwN5uMIkmEZkXVA8Zb3UT6W
 uibQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmYkmKi/cr0D60CXXt3Tpl3Eq5JI4RSgVwGPggOCQrrMdPamY+gNrn/pJwkqLW9ZQGdaMj4Udb9Q7KhJOKWEPfen6+4szTjl2D
X-Gm-Message-State: AOJu0YwK5Q2Ze/dsXZbVWKZaF0ITuIjq8/PHiUSwHQ7eAPEHLi6HvpyS
 PDAi0KZLOSR/H1y1DzWOkT0/DIKSgsXF06IJ16liKp/pIHIhFTlaTmZM3RCFUZxPBnx00EQJ3Du
 km54Qirh5rdQ2rXSGhJBLwI7B09S483Fbe8nW8x495oLYs79Vrq7QHmo=
X-Google-Smtp-Source: AGHT+IGzJEpq819L+S42AsUcLkVvaFp8ykVfYhW3ECG9bWN2SJW0wkbphk2NfKqWs8CJY3OnKLdoLZx/ujG+eCaGw08+3LvVrPye
MIME-Version: 1.0
X-Received: by 2002:a05:6602:340a:b0:7d6:1df1:bf08 with SMTP id
 ca18e2360f4ac-7e8c6e18876mr36973639f.3.1716704181895; Sat, 25 May 2024
 23:16:21 -0700 (PDT)
Date: Sat, 25 May 2024 23:16:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f2562606195556e5@google.com>
Subject: [syzbot] [wireguard?] WARNING: locking bug in wg_packet_encrypt_worker
From: syzbot <syzbot+f19160c19b77d76b5bc2@syzkaller.appspotmail.com>
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

HEAD commit:    2a8120d7b482 Merge tag 's390-6.10-2' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150fd9cc980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5dd4fde1337a9e18
dashboard link: https://syzkaller.appspot.com/bug?extid=f19160c19b77d76b5bc2
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-2a8120d7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/78c72ae6bdaf/vmlinux-2a8120d7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/99dbb805b738/bzImage-2a8120d7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f19160c19b77d76b5bc2@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 2 PID: 5289 at kernel/locking/lockdep.c:232 hlock_class kernel/locking/lockdep.c:232 [inline]
WARNING: CPU: 2 PID: 5289 at kernel/locking/lockdep.c:232 hlock_class+0xfa/0x130 kernel/locking/lockdep.c:221
Modules linked in:
CPU: 2 PID: 5289 Comm: kworker/2:5 Not tainted 6.9.0-syzkaller-10713-g2a8120d7b482 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: wg-crypt-wg0 wg_packet_encrypt_worker
RIP: 0010:hlock_class kernel/locking/lockdep.c:232 [inline]
RIP: 0010:hlock_class+0xfa/0x130 kernel/locking/lockdep.c:221
Code: b6 14 11 38 d0 7c 04 84 d2 75 43 8b 05 53 0b 77 0e 85 c0 75 19 90 48 c7 c6 00 bb 2c 8b 48 c7 c7 a0 b5 2c 8b e8 f7 40 e5 ff 90 <0f> 0b 90 90 90 31 c0 eb 9e e8 58 f7 7f 00 e9 1c ff ff ff 48 c7 c7
RSP: 0018:ffffc900030c7960 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 00000000000019e3 RCX: ffffffff81510229
RDX: ffff8880203e0000 RSI: ffffffff81510236 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 000000002d2d2d2d R12: 0000000000000000
R13: 0000000000000000 R14: ffff8880203e0b30 R15: 00000000000019e3
FS:  0000000000000000(0000) GS:ffff88802c200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c000873681 CR3: 000000004adc0000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 check_wait_context kernel/locking/lockdep.c:4773 [inline]
 __lock_acquire+0x3f2/0x3b30 kernel/locking/lockdep.c:5087
 lock_acquire kernel/locking/lockdep.c:5754 [inline]
 lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5719
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 ptr_ring_consume_bh include/linux/ptr_ring.h:365 [inline]
 wg_packet_encrypt_worker+0xe4/0xb60 drivers/net/wireguard/send.c:293
 process_one_work+0x958/0x1ad0 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf70 kernel/workqueue.c:3393
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


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
