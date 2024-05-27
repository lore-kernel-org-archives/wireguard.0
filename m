Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAAFC25B74
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 May 2024 07:24:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74cf64e9;
	Mon, 27 May 2024 07:24:32 +0000 (UTC)
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com
 [209.85.166.207])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07f97e49
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 May 2024 07:24:31 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3737b3db665so32097365ab.3
 for <wireguard@lists.zx2c4.com>; Mon, 27 May 2024 00:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716794669; x=1717399469;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NWFUzUHCi9dLgq8/JAwYKdKMCUezO6W78gjgnHoq7Sk=;
 b=iGjgderkDNcMBMcArZgvo5FL16cnADnDIAh6jXyf0CH7yQefJwzkEpOS2Tcthyj9V7
 0Ydba1YveFqjtfQxcB52JJx4j+RKFbU7b0n88/l1pq8IpkV0rVtayv0r4cHgTDiLe2Ki
 7gD8GLEwxibkGm2aBLVWHVPS3wgzQMyFn4X+cWS98I/3bnF/Ngrm5SY0CI2/h8zybXif
 C1ti1tw1EpuH1SYjSWoX8geqRtpK2hpWs66vUYNEnFHL6lO577UNzR3mjGjjFGRrdai3
 udMa/6V36OCk4oaQmoYTMG4/YcG3tWIlohRa08y911IK/OyzFExxIW4aFkEzLEfNM0zO
 hIXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnSOZ0jFwXwO02urQF0FdDSs2WNcrF/4hsQTxp8juc+E6gSJLNr1RhARBSjyQlDKK2NeiOZMfoRMuHnilxeDZt4BOIpfTAuq7d
X-Gm-Message-State: AOJu0YyvX4vwjM2t/2s63NyCeOJeG7gvhDQJeDWtTKtTKNEr+PJEu5S+
 4c3GyH7dknVzPO/0VHCC9aIP97LFHyEkBfbmlLPS7U0eE+mzEKDMVpcRDODuRdaiddEb86Gk0+d
 ei2ZqCO7m6v8xKMQxuMK9dnt0uBR2andvb6F6qg5e83BpT2VIA4Iol2k=
X-Google-Smtp-Source: AGHT+IF3zEtmKdKFUFfnTGXoZLon2AJbVRqW1PjJnTKM8yMkzNttssiBdckyMyd7m9o2FVSJ4BgtwCwJDissD+PY9rKN2iEZO1ED
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d8a:b0:374:5b18:28c8 with SMTP id
 e9e14a558f8ab-3745b182b34mr1461115ab.3.1716794669715; Mon, 27 May 2024
 00:24:29 -0700 (PDT)
Date: Mon, 27 May 2024 00:24:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000070dbbd06196a68ea@google.com>
Subject: [syzbot] [wireguard?] general protection fault in wg_packet_receive
From: syzbot <syzbot+470d70be7e9ee9f22a01@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=10263a34980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5dd4fde1337a9e18
dashboard link: https://syzkaller.appspot.com/bug?extid=470d70be7e9ee9f22a01
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-2a8120d7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/78c72ae6bdaf/vmlinux-2a8120d7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/99dbb805b738/bzImage-2a8120d7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+470d70be7e9ee9f22a01@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc001ffff113: 0000 [#1] PREEMPT SMP KASAN NOPTI
KASAN: probably user-memory-access in range [0x00000000ffff8898-0x00000000ffff889f]
CPU: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.9.0-syzkaller-10713-g2a8120d7b482 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: wg-kex-wg1 wg_packet_handshake_receive_worker
RIP: 0010:__lock_acquire+0xe3e/0x3b30 kernel/locking/lockdep.c:5005
Code: 11 00 00 39 05 b3 cf 1f 12 0f 82 be 05 00 00 ba 01 00 00 00 e9 e4 00 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 82 1f 00 00 49 81 3c 24 a0 3d e3 92 0f 84 98 f2
RSP: 0018:ffffc90000007500 EFLAGS: 00010002

RAX: dffffc0000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 000000001ffff113 RSI: ffff888015f20000 RDI: 00000000ffff8898
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8fe29817 R11: 0000000000000004 R12: 00000000ffff8898
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff88802c000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c0016a3000 CR3: 000000005dcac000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 lock_acquire kernel/locking/lockdep.c:5754 [inline]
 lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5719
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
 __queue_work+0x39e/0x1020 kernel/workqueue.c:2319
 queue_work_on+0x11a/0x140 kernel/workqueue.c:2410
 wg_packet_receive+0x13ea/0x2350 drivers/net/wireguard/receive.c:570
 wg_receive+0x74/0xc0 drivers/net/wireguard/socket.c:326
 udp_queue_rcv_one_skb+0xad1/0x18b0 net/ipv4/udp.c:2131
 udp_queue_rcv_skb+0x198/0xd10 net/ipv4/udp.c:2209
 udp_unicast_rcv_skb+0x165/0x3b0 net/ipv4/udp.c:2369
 __udp4_lib_rcv+0x2636/0x3550 net/ipv4/udp.c:2445
 ip_protocol_deliver_rcu+0x30c/0x4e0 net/ipv4/ip_input.c:205
 ip_local_deliver_finish+0x316/0x570 net/ipv4/ip_input.c:233
 NF_HOOK include/linux/netfilter.h:314 [inline]
 NF_HOOK include/linux/netfilter.h:308 [inline]
 ip_local_deliver+0x18e/0x1f0 net/ipv4/ip_input.c:254
 dst_input include/net/dst.h:460 [inline]
 ip_rcv_finish net/ipv4/ip_input.c:449 [inline]
 NF_HOOK include/linux/netfilter.h:314 [inline]
 NF_HOOK include/linux/netfilter.h:308 [inline]
 ip_rcv+0x2c5/0x5d0 net/ipv4/ip_input.c:569
 __netif_receive_skb_one_core+0x199/0x1e0 net/core/dev.c:5624
 __netif_receive_skb+0x1d/0x160 net/core/dev.c:5738
 process_backlog+0x133/0x760 net/core/dev.c:6067
 __napi_poll.constprop.0+0xb7/0x550 net/core/dev.c:6721
 napi_poll net/core/dev.c:6790 [inline]
 net_rx_action+0x9b6/0xf10 net/core/dev.c:6906
 handle_softirqs+0x216/0x8f0 kernel/softirq.c:554
 do_softirq kernel/softirq.c:455 [inline]
 do_softirq+0xb2/0xf0 kernel/softirq.c:442
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x120 kernel/softirq.c:382
 wg_socket_send_skb_to_peer+0x14c/0x220 drivers/net/wireguard/socket.c:184
 wg_socket_send_buffer_to_peer+0x12b/0x190 drivers/net/wireguard/socket.c:200
 wg_packet_send_handshake_response+0x297/0x310 drivers/net/wireguard/send.c:103
 wg_receive_handshake_packet+0x248/0xbf0 drivers/net/wireguard/receive.c:154
 wg_packet_handshake_receive_worker+0x17f/0x3a0 drivers/net/wireguard/receive.c:213
 process_one_work+0x958/0x1ad0 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf70 kernel/workqueue.c:3393
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0xe3e/0x3b30 kernel/locking/lockdep.c:5005
Code: 11 00 00 39 05 b3 cf 1f 12 0f 82 be 05 00 00 ba 01 00 00 00 e9 e4 00 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 82 1f 00 00 49 81 3c 24 a0 3d e3 92 0f 84 98 f2
RSP: 0018:ffffc90000007500 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 000000001ffff113 RSI: ffff888015f20000 RDI: 00000000ffff8898
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8fe29817 R11: 0000000000000004 R12: 00000000ffff8898
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff88802c000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c0016a3000 CR3: 000000005dcac000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	11 00                	adc    %eax,(%rax)
   2:	00 39                	add    %bh,(%rcx)
   4:	05 b3 cf 1f 12       	add    $0x121fcfb3,%eax
   9:	0f 82 be 05 00 00    	jb     0x5cd
   f:	ba 01 00 00 00       	mov    $0x1,%edx
  14:	e9 e4 00 00 00       	jmp    0xfd
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	4c 89 e2             	mov    %r12,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 82 1f 00 00    	jne    0x1fb6
  34:	49 81 3c 24 a0 3d e3 	cmpq   $0xffffffff92e33da0,(%r12)
  3b:	92
  3c:	0f                   	.byte 0xf
  3d:	84                   	.byte 0x84
  3e:	98                   	cwtl
  3f:	f2                   	repnz


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
