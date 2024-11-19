Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1C4D60D0A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2024 01:38:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fe649af;
	Tue, 19 Nov 2024 01:38:31 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ba486ca7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2024 01:38:28 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b154948b29so568079285a.0
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 17:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731980307; x=1732585107;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M6EjDLjjtQ68xGBuwGRxdUrqM8C5RZmamt1lDWE5w9g=;
 b=isEj41tZAIULSoeB6bLLReJ6sVaJVGkZiWaBEnjFb2Obtmqs6nvkqFli0tUySNIUA8
 WPcnmxeNx15Lz42g6Suo6RrUmj6lT4wIxOFSmMF3GB2OtVue5HTc9TxJoXxwTDl0kHc6
 pLBGGsWI3c0AW0Ew54AezJKy2seBUHPxSfaQSg6QuQ9IOfsulaU60KRqzYDcAEOlgaBX
 AXAs7lbV7Z92TNbLvHGzuiJ/iDgnD/6y5VrclGQrnKSg/p14W01rCx5jTdHYPSap/36l
 mRnoyc4bnk3cSgq8xVXoey3bgxZOK0E0qRdfk7S+MM+UfLgte0mnN0wrnUeENEmdpSEA
 FNBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU90mb3NPre2ppaShtOXFcTMx+x9p/nEKenFVn0D3T+XbwmV6L8dKxXkV4wYtsdFm15z/1X539kQeU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxePCFAN99d+Ig0StU5sTxTQmIpcG/O+/cnO6xU1zwl5wdJX62+
 TcYgAkffNShV5Ntt0OJuAh+VecAIsonL9LK2+qQDQ/3RiXVNheWbSmdHKwUC+Y/qs8IsATnFRdF
 S/zJv7HR8xCekBKDhOBbuTefl9fXd2mhCZL/SFsTaGZP+BcHHGuj1rZ4=
X-Google-Smtp-Source: AGHT+IHOoxjL4Xq4d3UyvEdls8RH9GHMu6BOLYRDy5KOxpfuN4r1O0xA6FL8YQvee5NfcCtpcDu/9lWwkFmYbVyixVRDt0H0OSff
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a02:b0:3a3:b3f4:af42 with SMTP id
 e9e14a558f8ab-3a74800eedamr139156545ab.7.1731979881303; Mon, 18 Nov 2024
 17:31:21 -0800 (PST)
Date: Mon, 18 Nov 2024 17:31:21 -0800
In-Reply-To: <000000000000bd671b06222de427@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673bea69.050a0220.87769.0061.GAE@google.com>
Subject: Re: [syzbot] [net] INFO: task hung in tun_chr_close (5)
From: syzbot <syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
 jason@zx2c4.com, jasowang@redhat.com, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
 syzkaller-bugs@googlegroups.com, willemdebruijn.kernel@gmail.com, 
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    9fb2cfa4635a Merge tag 'pull-ufs' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a57378580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e31661728c1a4027
dashboard link: https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1026f2e8580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-9fb2cfa4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e676eb2a9e5f/vmlinux-9fb2cfa4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/abff576e0e8f/bzImage-9fb2cfa4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com

INFO: task syz-executor:5443 blocked for more than 143 seconds.
      Not tainted 6.12.0-syzkaller-00233-g9fb2cfa4635a #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:20280 pid:5443  tgid:5443  ppid:1      flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x184f/0x4c30 kernel/sched/core.c:6693
 __schedule_loop kernel/sched/core.c:6770 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6785
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6842
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a7/0xd70 kernel/locking/mutex.c:752
 tun_detach drivers/net/tun.c:698 [inline]
 tun_chr_close+0x3b/0x1b0 drivers/net/tun.c:3517
 __fput+0x23c/0xa50 fs/file_table.c:450
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 exit_task_work include/linux/task_work.h:43 [inline]
 do_exit+0xa2f/0x28e0 kernel/exit.c:938
 do_group_exit+0x207/0x2c0 kernel/exit.c:1087
 get_signal+0x16a3/0x1740 kernel/signal.c:2918
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f250b78049a
RSP: 002b:00007ffd42ecadc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000037
RAX: 0000000000000000 RBX: 00007ffd42ecadf0 RCX: 00007f250b78049a
RDX: 0000000000000040 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000003 R08: 00007ffd42ecadec R09: 00007ffd42ecb207
R10: 00007ffd42ecadf0 R11: 0000000000000246 R12: 00007f250b90a500
R13: 00007ffd42ecadec R14: 0000000000000000 R15: 00007f250b90c000
 </TASK>
INFO: task syz-executor:5449 blocked for more than 148 seconds.
      Not tainted 6.12.0-syzkaller-00233-g9fb2cfa4635a #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:20752 pid:5449  tgid:5449  ppid:1      flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x184f/0x4c30 kernel/sched/core.c:6693
 __schedule_loop kernel/sched/core.c:6770 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6785
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6842
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a7/0xd70 kernel/locking/mutex.c:752
 tun_detach drivers/net/tun.c:698 [inline]
 tun_chr_close+0x3b/0x1b0 drivers/net/tun.c:3517
 __fput+0x23c/0xa50 fs/file_table.c:450
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 exit_task_work include/linux/task_work.h:43 [inline]
 do_exit+0xa2f/0x28e0 kernel/exit.c:938
 do_group_exit+0x207/0x2c0 kernel/exit.c:1087
 get_signal+0x16a3/0x1740 kernel/signal.c:2918
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f853b18049a
RSP: 002b:00007fff077d36d8 EFLAGS: 00000202 ORIG_RAX: 0000000000000037
RAX: 0000000000000000 RBX: 00007fff077d3760 RCX: 00007f853b18049a
RDX: 0000000000000041 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000003 R08: 00007fff077d36fc R09: 00007fff077d3b17
R10: 00007fff077d3760 R11: 0000000000000202 R12: 00007f853b30b280
R13: 00007fff077d36fc R14: 0000000000000000 R15: 00007f853b30c000
 </TASK>
INFO: task kworker/0:8:5617 blocked for more than 152 seconds.
      Not tainted 6.12.0-syzkaller-00233-g9fb2cfa4635a #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:8     state:D stack:25104 pid:5617  tgid:5617  ppid:2      flags:0x00004000
Workqueue: events switchdev_deferred_process_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x184f/0x4c30 kernel/sched/core.c:6693


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
