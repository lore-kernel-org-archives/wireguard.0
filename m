Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B52DC27C43
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 May 2024 01:04:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1acffa47;
	Wed, 29 May 2024 01:04:27 +0000 (UTC)
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com
 [209.85.166.77])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4884d6a4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 May 2024 01:04:26 +0000 (UTC)
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-7eacdc3fb57so141284639f.3
 for <wireguard@lists.zx2c4.com>; Tue, 28 May 2024 18:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716944665; x=1717549465;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WZXGbhTFhiJOStQUUF1Ob48iI23dJ6bKL3UoFrOl37s=;
 b=L3Dj7F0weZTaBTaSao4JWACxTa921TA3c9LudNvJlrabQQXUuNcFWRzvv4ADiyYtnE
 5r3l4zCh4SFPTyH4cXC5JUyhCK+N4UCrUtvtBlSM4wld13ZwTa+G9GxJLDRdXMjlQtss
 jrogGWdcoEAl3Q1IzNf79XE0fg/KoQN2VN6CFQbGe9sV0xSO/D6tsR/QFy5QWLhm/3Ah
 FIzlsVRNNPlEgaIyK0S9g9ILXr036QF2eqfnXaZs7SKJNvxCf4TCACK/95IjOCEWKw6d
 gvdVH59ADid6F0+jR679W5mRm86Mp30LDsR9Q62k/DOburMjLcKROtd3fTs9X58s2fJY
 MqKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9HgmxyjX/Ngd5mhAAizxFRx7wAx1JdIcsz1UPedbp6JdB6aZS5OrkQwPzAtDTYnABbS45NkndSWhqJJ/MaMQUGnUoBwh2TNQp
X-Gm-Message-State: AOJu0Yx5VAe1UwSdZVVkV+sP3maUTbZ3QDyYhSiQZvTn0sUgTZJ94NEW
 a/y1FldMHxeZWWydG5u3YvUpi17ZAE1DD6w3JrJSdru5JfkOOf3NOcbupnKGGQaiCgYjUsrOFeE
 Bg4ZBzYLVtz9mtuvUd68c0qQn2Exv4Nb6q5i6a1eA0CcLM7WjAuFcT+U=
X-Google-Smtp-Source: AGHT+IHNdzOfvn06/H/KYXpYdvV38vQwvCrsuvwsSbEuj9AkmWaZ18IZe1lNAsEqSgFY81XZw/GpnHqE52339NWkU475qX/ZTWGS
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d18:b0:36c:4c5b:ce1 with SMTP id
 e9e14a558f8ab-3737b41cca1mr8697405ab.5.1716944664871; Tue, 28 May 2024
 18:04:24 -0700 (PDT)
Date: Tue, 28 May 2024 18:04:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d9551e06198d54b4@google.com>
Subject: [syzbot] [wireguard?] INFO: task hung in wg_destruct
From: syzbot <syzbot+a6bdd2d02402f18fdd5e@syzkaller.appspotmail.com>
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

HEAD commit:    e0cce98fe279 Merge tag 'tpmdd-next-6.10-rc2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1040c63a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=47d282ddffae809f
dashboard link: https://syzkaller.appspot.com/bug?extid=a6bdd2d02402f18fdd5e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2739658d66f3/disk-e0cce98f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad17bcdfd78d/vmlinux-e0cce98f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/31990c7700ed/bzImage-e0cce98f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a6bdd2d02402f18fdd5e@syzkaller.appspotmail.com

INFO: task kworker/u8:2:35 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc1-syzkaller-00021-ge0cce98fe279 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:2    state:D stack:14456 pid:35    tgid:35    ppid:2      flags:0x00004000
Workqueue: netns cleanup_net
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x1796/0x49d0 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a4/0xd70 kernel/locking/mutex.c:752
 wg_destruct+0x25/0x2e0 drivers/net/wireguard/device.c:246
 netdev_run_todo+0xe1a/0x1000 net/core/dev.c:10692
 default_device_exit_batch+0xa14/0xa90 net/core/dev.c:11760
 ops_exit_list net/core/net_namespace.c:178 [inline]
 cleanup_net+0x89d/0xcc0 net/core/net_namespace.c:640
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
INFO: task kworker/u8:12:8583 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc1-syzkaller-00021-ge0cce98fe279 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:12   state:D stack:21976 pid:8583  tgid:8583  ppid:2      flags:0x00004000
Workqueue: ipv6_addrconf addrconf_verify_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x1796/0x49d0 kernel/sched/core.c:6745


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
