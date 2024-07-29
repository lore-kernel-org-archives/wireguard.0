Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92376C52D70
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Aug 2024 16:40:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b097ffd1;
	Fri, 2 Aug 2024 16:20:29 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cd5dc14e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jul 2024 15:48:31 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-39ad7e6b4deso51945115ab.2
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jul 2024 08:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722268110; x=1722872910;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jA8+++3yvb+eDXrAD85K2rueOWSInRZ1QvJmqWjrziA=;
 b=cFkiQl9vzBh4zvN2WmfJfL2f60ZRIiL5se19DrDHz7hyzW6jhXHnY61ADKi9vRq0YW
 RTr0l7V/Q8V+D/HBaw2qJjAPgaSZkBJKRK5EEPqKSEj73H6mNck4Q79JXgkNThvwnui9
 3x6WDuUxR30H/pFwUm+vnY2NhYA3eGCR9rKykm4bGMbvptGCIgJR57LOSQxAyPAesKmS
 Xt5mdJyr47lZJnGDckDub9XqR6hdIQrwhCKjF3rnpChcRovao794ymyhasKrOLUGRjNw
 Ga04zUHKNirkZAbQo3SyWj3tI+xtkKPaE5JqfqSYgHZd7wb+ep5+V6WvXHQ0BMUhdV/D
 BWrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUY+bY6ORpJdWAeEqQNXUAlTnmN60rugMI7H1xRqhAx5+uApdvb+BntpGt183pnNTQT7lZyulgrlri65q0zOBcapZBrFD2b/sK
X-Gm-Message-State: AOJu0Yz1+lbl/dJFyii11NVdQ+gXwSWSd9sbqZkG08O4XU/zhFFfNJzI
 HS/Mpldtlxt5odSNi1QHuCSQ1f92+MON75B8is4pyaaOFCKddOhYHC7M9qLzQszZsMlvSjxS3z1
 d7Ee/Yla82seSE+aXr79CHEFvP39gi6IGDSYjohprQZ0B63pWOWxbtZo=
X-Google-Smtp-Source: AGHT+IHSo09wEPx7at03BStfZ2VRmELGpqUvIeiTtyJ7I8yfxlluwu4vCJYFIp1cTivGqT3HGF2d7nhNOr3QXQdZ/XDZ2L3SbkNl
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d15:b0:39a:ea89:22e8 with SMTP id
 e9e14a558f8ab-39aec2d773fmr5162965ab.2.1722268110131; Mon, 29 Jul 2024
 08:48:30 -0700 (PDT)
Date: Mon, 29 Jul 2024 08:48:30 -0700
In-Reply-To: <00000000000061c0a106183499ec@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e9a538061e64cae7@google.com>
Subject: Re: [syzbot] [wireguard?] WARNING in kthread_unpark (2)
From: syzbot <syzbot+943d34fa3cf2191e3068@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, jason@zx2c4.com,
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
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

HEAD commit:    dc1c8034e31b minmax: simplify min()/max()/clamp() implemen..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=100341c9980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2258b49cd9b339fa
dashboard link: https://syzkaller.appspot.com/bug?extid=943d34fa3cf2191e3068
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1022b573980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6699621c3baa/disk-dc1c8034.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/22380dec726f/vmlinux-dc1c8034.xz
kernel image: https://storage.googleapis.com/syzbot-assets/04c3f45e6e2d/bzImage-dc1c8034.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+943d34fa3cf2191e3068@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 53 at kernel/kthread.c:525 __kthread_bind_mask kernel/kthread.c:525 [inline]
WARNING: CPU: 0 PID: 53 at kernel/kthread.c:525 __kthread_bind kernel/kthread.c:538 [inline]
WARNING: CPU: 0 PID: 53 at kernel/kthread.c:525 kthread_unpark+0x16b/0x210 kernel/kthread.c:631
Modules linked in:
CPU: 0 UID: 0 PID: 53 Comm: kworker/u8:3 Not tainted 6.11.0-rc1-syzkaller-00004-gdc1c8034e31b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: netns cleanup_net

RIP: 0010:__kthread_bind_mask kernel/kthread.c:525 [inline]
RIP: 0010:__kthread_bind kernel/kthread.c:538 [inline]
RIP: 0010:kthread_unpark+0x16b/0x210 kernel/kthread.c:631
Code: 00 fc ff df 41 0f b6 04 06 84 c0 0f 85 93 00 00 00 41 80 4d 03 04 4c 89 e7 48 8b 34 24 e8 ad f7 56 0a eb 09 e8 06 a0 33 00 90 <0f> 0b 90 48 89 ef be 08 00 00 00 e8 c5 b5 97 00 f0 80 65 00 fb 4c
RSP: 0018:ffffc90000bd7760 EFLAGS: 00010293

RAX: ffffffff815fe27a RBX: 0000000000000000 RCX: ffff888015f90000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff88801fcd8200 R08: ffffffff815fe207 R09: 1ffffffff269d71e
R10: dffffc0000000000 R11: fffffbfff269d71f R12: 0000000000000001
R13: ffff888029c75a2c R14: 1ffff1100538eb45 R15: ffff888029c75a00
FS:  0000000000000000(0000) GS:ffff8880b9200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc23f437d60 CR3: 000000007e72a000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kthread_stop+0x17a/0x630 kernel/kthread.c:707
 destroy_workqueue+0x136/0xc40 kernel/workqueue.c:5793
 wg_destruct+0x1e2/0x2e0 drivers/net/wireguard/device.c:257
 netdev_run_todo+0xe1a/0x1000 net/core/dev.c:10753
 default_device_exit_batch+0xa14/0xa90 net/core/dev.c:11889
 ops_exit_list net/core/net_namespace.c:178 [inline]
 cleanup_net+0x89d/0xcc0 net/core/net_namespace.c:640
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
