Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE08CC5321E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 08:47:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83efe25d;
	Mon, 26 Aug 2024 08:38:31 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79764839
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2024 23:06:26 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-39d2dee9722so39593905ab.0
 for <wireguard@lists.zx2c4.com>; Mon, 19 Aug 2024 16:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724108785; x=1724713585;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcqLAn/0WxmaTOn+9QeeAyIEyPR9eYIH/vhup2t6WV4=;
 b=uGiUHKegCJLU96kcRfXc+XeFuj0gZU7F8Jr1S3qi3YQzsK6zUCu/7mprC4uv7nm8+v
 DYInK9OtQOW9ZVERzFVx2wKc8BGAi+FKglP1CJmJtGca8oLataUqHfIr/h+3hWA6Z/N2
 4HJpSuk8yaAnJctz86wMBaL6j88/dTiKUEEUUXeTtQMsIXk1X75VrbaFm6UraOYbG0f9
 4EssmLf0YjRa7O3MzbCPmSUqoqEjpB+JPSOmtfw82i2L2PYHkVyRHFyT5Zu8NSmlVS6T
 GN+f64s9jFlt9KLolrEVLwVUC8ETNU1ExgnhIL31G3s69NqFb47j+hF1tXWB6FYYdPNA
 r5Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyJJQpTWwAmUjowEIiQe3/NOMQ6Y2w+RzrRxe4jQqmHeL4AjjBT6ps7DOcfG0glfJSPy61fEXf4LE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxOGSyO7YYGz3LkJftwNZrEKaQrE3WGpqNGhR8nYVfPjaMI/FTw
 Z2MFpwdO8Gp8r1x9jiZzdhSkX3z8ZxahY84Io2NnBpZ4Fn5i5rtmT/LJovwdxhUt7XkT1nwQlJi
 7yEs9rlhBabXu8SalyBYVX6G/ulxTEGN+cRRWfmvcpxvHVt7tfXeQK50=
X-Google-Smtp-Source: AGHT+IFpdZ7oC/bG0cCQW9emo025+pIVRewECDg57asvxq3GaGoe7xmu6MGqkKYgdt98fl0AkpR9w1JYF9yoBi+ohv/pcIsMqrlA
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3106:b0:39d:300f:e911 with SMTP id
 e9e14a558f8ab-39d300fec7fmr7563125ab.2.1724108784919; Mon, 19 Aug 2024
 16:06:24 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:06:24 -0700
In-Reply-To: <000000000000f6f09e061feefd16@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000adfbb70620115bdc@google.com>
Subject: Re: [syzbot] [btrfs?] general protection fault in __alloc_workqueue
From: syzbot <syzbot+9fd43bb1ae7b5d9240c3@syzkaller.appspotmail.com>
To: clm@fb.com, davem@davemloft.net, dsterba@suse.com, edumazet@google.com, 
 hdanton@sina.com, jason@zx2c4.com, josef@toxicpanda.com, kuba@kernel.org, 
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

HEAD commit:    367b5c3d53e5 Add linux-next specific files for 20240816
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D16ef69f5980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D61ba6f3b22ee546=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9fd43bb1ae7b5d924=
0c3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17582fbb98000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1060bfc5980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0b1b4e3cad3c/disk-=
367b5c3d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5bb090f7813c/vmlinux-=
367b5c3d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6674cb0709b1/bzI=
mage-367b5c3d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/af299b68d869=
/mount_2.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+9fd43bb1ae7b5d9240c3@syzkaller.appspotmail.com

workqueue: Failed to create a rescuer kthread for wq "btrfs-=18": -EINTR
Oops: general protection fault, probably for non-canonical address 0xdffffc=
0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 8040 Comm: syz-executor149 Not tainted 6.11.0-rc3-next-2=
0240816-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 08/06/2024
RIP: 0010:__lock_acquire+0x69/0x2040 kernel/locking/lockdep.c:5010
Code: b6 04 30 84 c0 0f 85 87 16 00 00 45 31 f6 83 3d b8 08 a9 0e 00 0f 84 =
ac 13 00 00 89 54 24 54 89 5c 24 68 4c 89 f8 48 c1 e8 03 <80> 3c 30 00 74 1=
2 4c 89 ff e8 49 5c 8c 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc9000e68f030 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff20318b6 R12: ffff88802b298000
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fbb7be9e6c0(0000) GS:ffff8880b9000000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055df1c2ef668 CR3: 000000002e318000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5762
 touch_wq_lockdep_map kernel/workqueue.c:3876 [inline]
 __flush_workqueue+0x1e3/0x1770 kernel/workqueue.c:3918
 drain_workqueue+0xc9/0x3a0 kernel/workqueue.c:4082
 destroy_workqueue+0xba/0xc40 kernel/workqueue.c:5830
 __alloc_workqueue+0x1c30/0x1fb0 kernel/workqueue.c:5745
 alloc_workqueue+0xd6/0x210 kernel/workqueue.c:5758
 btrfs_alloc_workqueue+0x1c8/0x2a0 fs/btrfs/async-thread.c:112
 btrfs_init_workqueues+0x3af/0x740 fs/btrfs/disk-io.c:2004
 open_ctree+0x122c/0x2a10 fs/btrfs/disk-io.c:3364
 btrfs_fill_super fs/btrfs/super.c:965 [inline]
 btrfs_get_tree_super fs/btrfs/super.c:1888 [inline]
 btrfs_get_tree+0xe7a/0x1920 fs/btrfs/super.c:2114
 vfs_get_tree+0x90/0x2a0 fs/super.c:1800
 fc_mount+0x1b/0xb0 fs/namespace.c:1231
 btrfs_get_tree_subvol fs/btrfs/super.c:2077 [inline]
 btrfs_get_tree+0x652/0x1920 fs/btrfs/super.c:2115
 vfs_get_tree+0x90/0x2a0 fs/super.c:1800
 do_new_mount+0x2be/0xb40 fs/namespace.c:3507
 do_mount fs/namespace.c:3847 [inline]
 __do_sys_mount fs/namespace.c:4055 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4032
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbb7bf1346a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 1e 09 00 00 66 2e 0f 1f 84 =
00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbb7be9e088 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fbb7be9e0a0 RCX: 00007fbb7bf1346a
RDX: 0000000020005100 RSI: 0000000020005140 RDI: 00007fbb7be9e0a0
RBP: 0000000000000004 R08: 00007fbb7be9e0e0 R09: 0000000000005106
R10: 0000000000000012 R11: 0000000000000282 R12: 00007fbb7be9e0e0
R13: 0000000000000012 R14: 0000000000000003 R15: 0000000001000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0x69/0x2040 kernel/locking/lockdep.c:5010
Code: b6 04 30 84 c0 0f 85 87 16 00 00 45 31 f6 83 3d b8 08 a9 0e 00 0f 84 =
ac 13 00 00 89 54 24 54 89 5c 24 68 4c 89 f8 48 c1 e8 03 <80> 3c 30 00 74 1=
2 4c 89 ff e8 49 5c 8c 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc9000e68f030 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff20318b6 R12: ffff88802b298000
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fbb7be9e6c0(0000) GS:ffff8880b9000000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055df1c2ef668 CR3: 000000002e318000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	b6 04                	mov    $0x4,%dh
   2:	30 84 c0 0f 85 87 16 	xor    %al,0x1687850f(%rax,%rax,8)
   9:	00 00                	add    %al,(%rax)
   b:	45 31 f6             	xor    %r14d,%r14d
   e:	83 3d b8 08 a9 0e 00 	cmpl   $0x0,0xea908b8(%rip)        # 0xea908cd
  15:	0f 84 ac 13 00 00    	je     0x13c7
  1b:	89 54 24 54          	mov    %edx,0x54(%rsp)
  1f:	89 5c 24 68          	mov    %ebx,0x68(%rsp)
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1) <-- trapping instruct=
ion
  2e:	74 12                	je     0x42
  30:	4c 89 ff             	mov    %r15,%rdi
  33:	e8 49 5c 8c 00       	call   0x8c5c81
  38:	48                   	rex.W
  39:	be 00 00 00 00       	mov    $0x0,%esi
  3e:	00 fc                	add    %bh,%ah


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
