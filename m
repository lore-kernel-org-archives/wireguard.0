Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F2AC25B78
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jun 2024 19:56:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa6ef386;
	Tue, 4 Jun 2024 19:56:33 +0000 (UTC)
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com
 [209.85.166.205])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b28d2e07
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Jun 2024 19:56:31 +0000 (UTC)
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-374b033db7dso5964445ab.2
 for <wireguard@lists.zx2c4.com>; Tue, 04 Jun 2024 12:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717530990; x=1718135790;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pIolj0LpEhW/WcCjBKxCJow6wzyZoKm2DMw6PlTaauw=;
 b=fGDso4jqzyRSj7anv8Op78DWBWkSUZ6u73CHvI4OF+X6aj8f4UCS4BeexSW2Hgg+BE
 73b3Ec6dw1lvKxvP85dVPhRGAHBbfMFJ+yYGSKSHsfbGCHcYQ4m9jJesFNqMCo5wwJqJ
 1KCCAC3tRQ5xMAOuSZXyew/KmWb2bA5zD3H39NsAf8ieEcIowBHpSRojJcHe9nxMVn/x
 DPpgdmHR5SnFR7MDYWy7WEpl4zYiPumtChPW46YEsd4te1S96mQKzE2haPEx0ytHxBSt
 RpdhgF0ngr/16oTT/ecefxfQHDPI6zg7YizxyAo4ClzjpqJ4XbndYYKD6Duxb/VFFcFb
 qRHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC03p1lBgTV16o3JDIukNflG/7vmxixiGsZvAljMecj8Iw8gwaP3Opbs2yCu8x0H7zKHiY7dqEcvhlFBxuWIQ90TMf6xy9xPFT
X-Gm-Message-State: AOJu0Yxd/VtKyvLPSa+KFBFN0lsngHr2nxJx/ubtFzgiMowGXv0q9wR0
 CVak+NpcRAk7B3bBHoy6ukQRlkC8Hh1eKz44C/gsRtl2TDPuaatv6jHqx/ugNdBb6vX08D5RC4l
 CKu+R0Jfw/xMmfWQZfQR7hMggHaJb/PW3/LMdzj6Wefu5vPmoYhDpVs8=
X-Google-Smtp-Source: AGHT+IHWFeJxM3i341hjN4LF5TdAFLLfKolxzY9xMIE2j0U52oFs8A2iF/r6yIhVOsQknFpaG5ss6BD50/cbhpMUXhu2H5S+PWlR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe3:b0:36d:b5df:f478 with SMTP id
 e9e14a558f8ab-374b1f6586amr100415ab.4.1717530989806; Tue, 04 Jun 2024
 12:56:29 -0700 (PDT)
Date: Tue, 04 Jun 2024 12:56:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000089d850061a15d886@google.com>
Subject: [syzbot] [wireguard?] WARNING: locking bug in wg_packet_decrypt_worker
From: syzbot <syzbot+9f1d21c20c7306ca9417@syzkaller.appspotmail.com>
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

HEAD commit:    83814698cf48 Merge tag 'powerpc-6.10-2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16746d3a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=733cc7a95171d8e7
dashboard link: https://syzkaller.appspot.com/bug?extid=9f1d21c20c7306ca9417
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-83814698.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7042fdcb685d/vmlinux-83814698.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9f795e13834f/bzImage-83814698.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9f1d21c20c7306ca9417@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 10 at kernel/locking/lockdep.c:232 hlock_class kernel/locking/lockdep.c:232 [inline]
WARNING: CPU: 0 PID: 10 at kernel/locking/lockdep.c:232 hlock_class+0xfa/0x130 kernel/locking/lockdep.c:221
Modules linked in:
CPU: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.10.0-rc1-syzkaller-00304-g83814698cf48 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: wg-crypt-wg0 wg_packet_decrypt_worker
RIP: 0010:hlock_class kernel/locking/lockdep.c:232 [inline]
RIP: 0010:hlock_class+0xfa/0x130 kernel/locking/lockdep.c:221
Code: b6 14 11 38 d0 7c 04 84 d2 75 43 8b 05 b3 39 77 0e 85 c0 75 19 90 48 c7 c6 00 bd 2c 8b 48 c7 c7 a0 b7 2c 8b e8 97 47 e5 ff 90 <0f> 0b 90 90 90 31 c0 eb 9e e8 88 f7 7f 00 e9 1c ff ff ff 48 c7 c7
RSP: 0018:ffffc900003c7a00 EFLAGS: 00010082
RAX: 0000000000000000 RBX: 0000000000000f2b RCX: ffffffff81510229
RDX: ffff888015f38000 RSI: ffffffff81510236 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 000000002d2d2d2d R12: 0000000000000000
R13: 0000000000000000 R14: ffff888015f38b30 R15: 0000000000000f2b
FS:  0000000000000000(0000) GS:ffff88802c000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f743fb94 CR3: 000000005ff86000 CR4: 0000000000350ef0
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
 wg_packet_decrypt_worker+0x2aa/0x530 drivers/net/wireguard/receive.c:499
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
