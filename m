Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE89D10F3D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 02:03:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75492eb4;
	Mon, 18 Nov 2024 01:37:22 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id feed4b67
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2024 12:55:23 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a195122f09so25521375ab.2
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2024 05:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727182522; x=1727787322;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IaV95rr5dy/KVsLIv10Xol1401VIYQE+FUIMdKezUfQ=;
 b=HFLfN33BLik8S66XEppYFxKNf2gWIACE9Gd2+wwPV1ODzM9Qg3GX1QKgrluzvzt0Xh
 dMP1J0cNjXgSni+osAtrAzgtIE0LBVr2ylDUYyCHq1eNXDx7GiCNzeNXeD2LBQuGxAD8
 T148/ndf/+rqWGHOxy9UgGOsa9Y50Q7gV4DILDmqRj/IpNJSuUxynEyNWnQNp70J1jLv
 bMOAgwCQONRVD/0d/3MHwWbH2mBWaU+zGecIkWPzj/f9bWWq+SY10m7SI44FBJqFZysk
 2EZGppYiHzvgjOZB3o+6MiVir4JwpK7KM9XgiIMVaBOZhyGSdThsEbPW1yL0Upf5/7QR
 uHvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzS9aUF/ksviaSqawHW2/BA176JBPHu3JF9Lm4AMBBjDLelobQFJFkeEqErHq9bP9O5h/I4n5GBdA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxj3uN1ToQCi9qPUkNuWdt0ZYJ42fejloDcaQSe/Z0xHF4g+/xp
 DVqGHf/WjjuEh/lLhy6e1CpMBYXsNpwRkoFHXKbHOSlbTK5igqSBbVoKFmPBKwejhMlM5FmRk4g
 V/1VxD6Wl8Gpi1m9UwisR0GIGEUmNOKSvcudEcjj6YMC7Gj7igfuzrn0=
X-Google-Smtp-Source: AGHT+IGq40g22mDZUFKmiOpfVUYhLa9vtDZ2VP6Os/1gCKULwWxLmxccUHWx94qpFOxL4brhVAKl3m2cUsFQ3azOoRa2hqZwC+qB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c2f:b0:3a0:8d60:8ba7 with SMTP id
 e9e14a558f8ab-3a0c8d0eee3mr141058945ab.14.1727182521817; Tue, 24 Sep 2024
 05:55:21 -0700 (PDT)
Date: Tue, 24 Sep 2024 05:55:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66f2b6b9.050a0220.3eed3.002d.GAE@google.com>
Subject: [syzbot] [wireguard?] general protection fault in wg_packet_receive
 (2)
From: syzbot <syzbot+c0f4a2553a2527b3fc1f@syzkaller.appspotmail.com>
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

HEAD commit:    de5cb0dcb74c Merge branch 'address-masking'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=167ce19f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=74ffdb3b3fad1a43
dashboard link: https://syzkaller.appspot.com/bug?extid=c0f4a2553a2527b3fc1f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6dde53474dba/disk-de5cb0dc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6a60a36c2a3b/vmlinux-de5cb0dc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f3f799d774bf/bzImage-de5cb0dc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c0f4a2553a2527b3fc1f@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xedfd63131ffff113: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: maybe wild-memory-access in range [0x6feb3898ffff8898-0x6feb3898ffff889f]
CPU: 1 UID: 0 PID: 6046 Comm: kworker/1:8 Not tainted 6.11.0-syzkaller-08833-gde5cb0dcb74c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Workqueue: wg-kex-wg0 wg_packet_handshake_receive_worker
RIP: 0010:__lock_acquire+0x69/0x2050 kernel/locking/lockdep.c:5062
Code: b6 04 30 84 c0 0f 85 9b 16 00 00 45 31 f6 83 3d 88 66 ab 0e 00 0f 84 b6 13 00 00 89 54 24 54 89 5c 24 68 4c 89 f8 48 c1 e8 03 <80> 3c 30 00 74 12 4c 89 ff e8 f9 27 8b 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc90000a17fd0 EFLAGS: 00010002
RAX: 0dfd67131ffff113 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 6feb3898ffff8898
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: dffffc0000000000 R11: fffffbfff2036ac6 R12: ffff88801e783c00
R13: 0000000000000001 R14: 0000000000000000 R15: 6feb3898ffff8898
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd8f5bfa440 CR3: 0000000029774000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5822
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
 __queue_work+0x759/0xf50
 queue_work_on+0x1c2/0x380 kernel/workqueue.c:2390
 wg_packet_receive+0x133a/0x2570 drivers/net/wireguard/receive.c:570
 wg_receive+0x75/0xa0 drivers/net/wireguard/socket.c:326
 udpv6_queue_rcv_one_skb+0x1695/0x18a0 net/ipv6/udp.c:726
 udp6_unicast_rcv_skb+0x230/0x370 net/ipv6/udp.c:928
 ip6_protocol_deliver_rcu+0xccf/0x1580 net/ipv6/ip6_input.c:436
 ip6_input_finish+0x187/0x2d0 net/ipv6/ip6_input.c:481
 NF_HOOK+0x3a4/0x450 include/linux/netfilter.h:314
 NF_HOOK+0x3a4/0x450 include/linux/netfilter.h:314
 __netif_receive_skb_one_core net/core/dev.c:5662 [inline]
 __netif_receive_skb+0x1ea/0x650 net/core/dev.c:5775
 process_backlog+0x662/0x15b0 net/core/dev.c:6107
 __napi_poll+0xcb/0x490 net/core/dev.c:6771
 napi_poll net/core/dev.c:6840 [inline]
 net_rx_action+0x89b/0x1240 net/core/dev.c:6962
 handle_softirqs+0x2c5/0x980 kernel/softirq.c:554
 do_softirq+0x11b/0x1e0 kernel/softirq.c:455
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x1bb/0x200 kernel/softirq.c:382
 wg_socket_send_skb_to_peer+0x176/0x1d0 drivers/net/wireguard/socket.c:184
 wg_packet_send_handshake_response+0x198/0x2e0 drivers/net/wireguard/send.c:103
 wg_receive_handshake_packet drivers/net/wireguard/receive.c:154 [inline]
 wg_packet_handshake_receive_worker+0x5e6/0xf50 drivers/net/wireguard/receive.c:213
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0x69/0x2050 kernel/locking/lockdep.c:5062
Code: b6 04 30 84 c0 0f 85 9b 16 00 00 45 31 f6 83 3d 88 66 ab 0e 00 0f 84 b6 13 00 00 89 54 24 54 89 5c 24 68 4c 89 f8 48 c1 e8 03 <80> 3c 30 00 74 12 4c 89 ff e8 f9 27 8b 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc90000a17fd0 EFLAGS: 00010002
RAX: 0dfd67131ffff113 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 6feb3898ffff8898
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: dffffc0000000000 R11: fffffbfff2036ac6 R12: ffff88801e783c00
R13: 0000000000000001 R14: 0000000000000000 R15: 6feb3898ffff8898
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd8f5bfa440 CR3: 0000000029774000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	b6 04                	mov    $0x4,%dh
   2:	30 84 c0 0f 85 9b 16 	xor    %al,0x169b850f(%rax,%rax,8)
   9:	00 00                	add    %al,(%rax)
   b:	45 31 f6             	xor    %r14d,%r14d
   e:	83 3d 88 66 ab 0e 00 	cmpl   $0x0,0xeab6688(%rip)        # 0xeab669d
  15:	0f 84 b6 13 00 00    	je     0x13d1
  1b:	89 54 24 54          	mov    %edx,0x54(%rsp)
  1f:	89 5c 24 68          	mov    %ebx,0x68(%rsp)
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1) <-- trapping instruction
  2e:	74 12                	je     0x42
  30:	4c 89 ff             	mov    %r15,%rdi
  33:	e8 f9 27 8b 00       	call   0x8b2831
  38:	48                   	rex.W
  39:	be 00 00 00 00       	mov    $0x0,%esi
  3e:	00 fc                	add    %bh,%ah


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
