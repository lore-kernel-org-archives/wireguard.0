Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF985CCD195
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Oct 2025 01:52:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b7f9935;
	Mon, 20 Oct 2025 01:52:30 +0000 (UTC)
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com
 [209.85.166.79])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb44cd72
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Oct 2025 01:52:26 +0000 (UTC)
Received: by mail-io1-f79.google.com with SMTP id
 ca18e2360f4ac-940d88b8c15so47531439f.2
 for <wireguard@lists.zx2c4.com>; Sun, 19 Oct 2025 18:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760925145; x=1761529945;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rFUqgO/1X4tGf013zyFKn87MJvA/QpMdKd1TaPnKCjc=;
 b=CgMwNFa9OzgaEyp3o3M1ElgIP67xqmp3qXlmUjjijRSPH5UBdTA5Q2mEn2Yut1eMNV
 5mIfqF+q/OIlAWynLtzLJmqgsd+xt/94oCqlD3uspBGXyWYbc3Ju8xZx4+7Cl464bXn/
 wZpbSg84OslwYJIGVRj6dvzbdWcK672RS1+WR/FMFurSga3sy4fQ44gaUxSBaud0cYLN
 B0cGOHS7WNOKO6mRAEFGdlG95dJNQA0RYhLhdiZhsuWqrrCo6W2XflM9bsCH7ea3UEWQ
 SOv9cWHwwZcFz+lgelW788C7LUJCcmPVbPcTdwcLeW6oOX8d88Oqxx3Yst6xzdM3gfGW
 Gqdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXYLn/LClaAK6bVoxhEwkQddFdKB46YxIDB9tjEMztiY+yChCvWjnZUma2RBNgKpKxKAiGozcTtEY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwmAsWvQIxJtqfHnL+Zokh7jrnvbBhxfEgBYFCxcc+eXHytq0nr
 TFinPnS2/QrGVqYw9WwGkdLR4sEQgyONeufbARkEqxaaswL9c6AGjyK9x50wtsIwT/nKAoLgrjI
 V1g2YKMYbFjhdWtOCfw3kaTkbqJz8fJvzlU+AW382VIuhhjI7eDjrLj5PhTc=
X-Google-Smtp-Source: AGHT+IGEOGgAhJ/VqxDKE9fKEFF/jaq3tSnh+we7qLzZ2LAHPDAXshaEsuvm4ccKBJLGxkBNcROv4yDvfOrJP5YcURXXt2nQ2uHU
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6409:b0:901:3363:e663 with SMTP id
 ca18e2360f4ac-93e76451522mr1784937939f.13.1760925145012; Sun, 19 Oct 2025
 18:52:25 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:52:25 -0700
In-Reply-To: <66f49736.050a0220.211276.0036.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f595d8.050a0220.91a22.043c.GAE@google.com>
Subject: Re: [syzbot] [wireguard?] INFO: task hung in wg_netns_pre_exit (5)
From: syzbot <syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, jason@zx2c4.com, kuba@kernel.org, 
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    88224095b4e5 Merge branch 'net-dsa-lantiq_gswip-clean-up-a..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17b28de2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=913caf94397d1b8d
dashboard link: https://syzkaller.appspot.com/bug?extid=f2fbf7478a35a94c8b7c
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10796b04580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f3cb46a2b9fc/disk-88224095.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0d43ffbc738d/vmlinux-88224095.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9817e4fdd10a/bzImage-88224095.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com

INFO: task kworker/u8:8:6081 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:8    state:D stack:23424 pid:6081  tgid:6081  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: netns cleanup_net
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7083
 __mutex_lock_common kernel/locking/mutex.c:676 [inline]
 __mutex_lock+0x7e6/0x1350 kernel/locking/mutex.c:760
 wg_netns_pre_exit+0x1c/0x1d0 drivers/net/wireguard/device.c:419
 ops_pre_exit_list net/core/net_namespace.c:161 [inline]
 ops_undo_list+0x187/0x990 net/core/net_namespace.c:234
 cleanup_net+0x4d8/0x820 net/core/net_namespace.c:696
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz-executor:6161 blocked for more than 147 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:25608 pid:6161  tgid:6161  ppid:1      task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x1798/0x4cc0 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
