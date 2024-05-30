Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC367C25B74
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 May 2024 10:55:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a0721fe;
	Thu, 30 May 2024 10:55:25 +0000 (UTC)
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com
 [209.85.166.205])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3a61c4be
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 May 2024 10:55:24 +0000 (UTC)
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3744edd84b1so7829015ab.0
 for <wireguard@lists.zx2c4.com>; Thu, 30 May 2024 03:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717066523; x=1717671323;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iunsuq9ABCO5JX4UJQ3Bv8b2PefbRZOzD4N7eg1UFRw=;
 b=J4oGLLU7cIzTCK8jK0po7bu532Kuhmq3UX74RDEZgiQqpH9p4D7SWlaQ62dZ42X5Eb
 ByJgOef+Xpy5AX3+ozitMxSl1z8n/I5M8T7nXCDH2kQ5cHaUXMAyw+2tQZ+dm6m2mgCq
 GD7RgawR2M2I9wCHFW8oHdGf0gMw3t2WUaA1mQXapGFgmQkamvJr9qxv3sM8Ara5fH5N
 HwxzqYRTs+/DdQyTsX751kexySWnm6w4xGejOM6k8kangjPSJOYfFcg24iM1pkfuhjzx
 4sC8aYRIknBZ4+rjOEe+azIm+BLhyJKD4hmehbxlN6WA1vR8KXurlcjrTMZZNGkp83kb
 bFVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ1BRP2yoeQPtNgrCVxHk4IRAEE5DaN4tkn+ijyBffmvqxFVMU3y0OE0HlEuhCsqxFAbh63cLVwZ25a6tSiwdJgVTKWEwObgBc
X-Gm-Message-State: AOJu0YyHk5ZspEroTiKeURLI4OTmozb24+0wgYZw4s3xCr9e+CYjs4mZ
 j6MhUNeGP3WgxQSXiI1SC4IIBB67agG0OvV3l1+BPQfNXME/XxZYIaZEKUPboZddsR0qaJxiP+N
 FYVzxB4U4fQ2oxwCGzh1tm55OIbVF+ixjKgIjLYDMSkVRVZocGiqmlDw=
X-Google-Smtp-Source: AGHT+IHwn3DG8TI8c+pSOPW4SZeSIleHDtVE5X9V0Ei+ExCzUmYDOAvvnb/L1RAsPyFb/xq0pJY0a1XnF/gw4Y85v/G98R5Y99qq
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1caf:b0:374:64df:681c with SMTP id
 e9e14a558f8ab-3747dfc26cdmr938955ab.4.1717066523122; Thu, 30 May 2024
 03:55:23 -0700 (PDT)
Date: Thu, 30 May 2024 03:55:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002aadc50619a9b4d5@google.com>
Subject: [syzbot] [wireguard?] INFO: task hung in wg_netns_pre_exit (4)
From: syzbot <syzbot+1d5c9cd5bcdce13e618e@syzkaller.appspotmail.com>
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

HEAD commit:    4a4be1ad3a6e Revert "vfs: Delete the associated dentry whe..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14003162980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9016f104992d69c
dashboard link: https://syzkaller.appspot.com/bug?extid=1d5c9cd5bcdce13e618e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd3b4fa0291b/disk-4a4be1ad.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d58e4ceaeff3/vmlinux-4a4be1ad.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4df89f1b7d3b/bzImage-4a4be1ad.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1d5c9cd5bcdce13e618e@syzkaller.appspotmail.com

INFO: task kworker/u8:0:11 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc1-syzkaller-00027-g4a4be1ad3a6e #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:0    state:D stack:20632 pid:11    tgid:11    ppid:2      flags:0x00004000
Workqueue: netns cleanup_net
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x17e8/0x4a20 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a4/0xd70 kernel/locking/mutex.c:752
 wg_netns_pre_exit+0x1f/0x1e0 drivers/net/wireguard/device.c:414
 ops_pre_exit_list net/core/net_namespace.c:163 [inline]
 cleanup_net+0x617/0xcc0 net/core/net_namespace.c:620
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2e/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f2/0x390 kernel/kthread.c:389
 ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
INFO: task kworker/1:1:45 blocked for more than 144 seconds.
      Not tainted 6.10.0-rc1-syzkaller-00027-g4a4be1ad3a6e #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:22064 pid:45    tgid:45    ppid:2      flags:0x00004000
Workqueue: events linkwatch_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x17e8/0x4a20 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a4/0xd70 kernel/locking/mutex.c:752


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
