Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00503C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Feb 2022 08:32:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 712cc02f;
	Tue, 8 Feb 2022 08:32:22 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f8759a29
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Feb 2022 08:32:21 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 s2-20020a056e021a0200b002b94aede929so10818234ild.12
 for <wireguard@lists.zx2c4.com>; Tue, 08 Feb 2022 00:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Ak7DGjpz8u+yF2tUMgurDsjOzzk2JV1a40V2RS9Gck8=;
 b=fPLz6UybrwNGzAoWKAaodTQaAtRg/w9YZbEzS/7ttTIJInSBNkrS3xdOnZDgiLBsvl
 xXcxSfGNEWOEGVqEC+cVwoyJakEUxg154nQPpsW6+xEMXYk+LSHTopUa3a37zTPNg3+c
 1CnvO+Js/oegHpxmgqYSnSXy+REnhshRWaIfDs3YucDiWoQGAyAbAo3xbc5GKn5y8Kgv
 X1M4yUvVB5lTVKeS8lnbmGHFD3sqVDZrqPuo6YBN8zUUMtZFpOqiS5L8HFHvmU8QeDCy
 5AsHHRn74AefMtfwaVwiDe4ixhHIMz9gBv++d1srz7tHS3gGlB0lgQlPVPGlqKCGCQuD
 17Zw==
X-Gm-Message-State: AOAM531R06U06zRqlOLovWG23qkee5z5KVeJS+S0UF35vwd9hEmIJW0x
 fLT1PWlx4nAcPIfCrKvjknFmHf8FbgBD5JUWcKzcE7mGjNVJ
X-Google-Smtp-Source: ABdhPJy+foHVsEDATvpMe56nchUDiGYkbjVPttKtcXmM5hZNEADLd3cG6tcj3Vkz6WcEeVtjb5ev9mO+QTcW9ge+vdYOTdXIxh1T
MIME-Version: 1.0
X-Received: by 2002:a05:6602:168b:: with SMTP id
 s11mr1598578iow.208.1644309140646; 
 Tue, 08 Feb 2022 00:32:20 -0800 (PST)
Date: Tue, 08 Feb 2022 00:32:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003aafee05d77d8e55@google.com>
Subject: [syzbot] KCSAN: data-race in wg_packet_send_staged_packets /
 wg_packet_send_staged_packets (3)
From: syzbot <syzbot+6ba34f16b98fe40daef1@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, davem@davemloft.net, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
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

HEAD commit:    2ade8eef993c Merge tag 'ata-5.17-rc4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c03872700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1dcc3374da7c1f7c
dashboard link: https://syzkaller.appspot.com/bug?extid=6ba34f16b98fe40daef1
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6ba34f16b98fe40daef1@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_packet_send_staged_packets / wg_packet_send_staged_packets

read to 0xffff888133f5eac8 of 4 bytes by interrupt on cpu 0:
 wg_cpumask_next_online drivers/net/wireguard/queueing.h:129 [inline]
 wg_queue_enqueue_per_device_and_peer drivers/net/wireguard/queueing.h:176 [inline]
 wg_packet_create_data drivers/net/wireguard/send.c:320 [inline]
 wg_packet_send_staged_packets+0x41a/0x800 drivers/net/wireguard/send.c:387
 wg_packet_send_keepalive+0xfc/0x110 drivers/net/wireguard/send.c:239
 wg_expired_send_persistent_keepalive+0x38/0x50 drivers/net/wireguard/timers.c:141
 call_timer_fn+0x2e/0x240 kernel/time/timer.c:1421
 expire_timers+0x116/0x240 kernel/time/timer.c:1466
 __run_timers+0x368/0x410 kernel/time/timer.c:1734
 run_timer_softirq+0x2e/0x60 kernel/time/timer.c:1747
 __do_softirq+0x158/0x2de kernel/softirq.c:558
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0x37/0x70 kernel/softirq.c:649
 sysvec_apic_timer_interrupt+0x8d/0xb0 arch/x86/kernel/apic/apic.c:1097
 asm_sysvec_apic_timer_interrupt+0x12/0x20
 __x64_sys_clock_nanosleep+0x54/0x60 kernel/time/posix-timers.c:1245
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

write to 0xffff888133f5eac8 of 4 bytes by interrupt on cpu 1:
 wg_cpumask_next_online drivers/net/wireguard/queueing.h:133 [inline]
 wg_queue_enqueue_per_device_and_peer drivers/net/wireguard/queueing.h:176 [inline]
 wg_packet_create_data drivers/net/wireguard/send.c:320 [inline]
 wg_packet_send_staged_packets+0x455/0x800 drivers/net/wireguard/send.c:387
 wg_packet_send_keepalive+0xfc/0x110 drivers/net/wireguard/send.c:239
 wg_expired_send_persistent_keepalive+0x38/0x50 drivers/net/wireguard/timers.c:141
 call_timer_fn+0x2e/0x240 kernel/time/timer.c:1421
 expire_timers+0x116/0x240 kernel/time/timer.c:1466
 __run_timers+0x368/0x410 kernel/time/timer.c:1734
 run_timer_softirq+0x2e/0x60 kernel/time/timer.c:1747
 __do_softirq+0x158/0x2de kernel/softirq.c:558
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0x37/0x70 kernel/softirq.c:649
 sysvec_apic_timer_interrupt+0x8d/0xb0 arch/x86/kernel/apic/apic.c:1097
 asm_sysvec_apic_timer_interrupt+0x12/0x20
 is_atomic kernel/kcsan/core.c:262 [inline]
 should_watch kernel/kcsan/core.c:275 [inline]
 check_access kernel/kcsan/core.c:741 [inline]
 __tsan_read2+0x13e/0x180 kernel/kcsan/core.c:1012
 tlb_flush_pte_range include/asm-generic/tlb.h:524 [inline]
 zap_pte_range+0x559/0x10e0 mm/memory.c:1366
 zap_pmd_range mm/memory.c:1490 [inline]
 zap_pud_range mm/memory.c:1519 [inline]
 zap_p4d_range mm/memory.c:1540 [inline]
 unmap_page_range+0x2dc/0x3d0 mm/memory.c:1561
 unmap_single_vma+0x157/0x210 mm/memory.c:1606
 unmap_vmas+0xd0/0x180 mm/memory.c:1638
 exit_mmap+0x261/0x4b0 mm/mmap.c:3178
 __mmput+0x27/0x1b0 kernel/fork.c:1114
 mmput+0x3d/0x50 kernel/fork.c:1135
 exit_mm+0xdb/0x170 kernel/exit.c:507
 do_exit+0x569/0x16a0 kernel/exit.c:793
 do_group_exit+0xa5/0x160 kernel/exit.c:935
 get_signal+0x8cf/0x15d0 kernel/signal.c:2862
 arch_do_signal_or_restart+0x8c/0x2e0 arch/x86/kernel/signal.c:868
 handle_signal_work kernel/entry/common.c:148 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:172 [inline]
 exit_to_user_mode_prepare+0x113/0x190 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x20/0x40 kernel/entry/common.c:300
 do_syscall_64+0x50/0xd0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae

value changed: 0x00000001 -> 0x00000000

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 PID: 21549 Comm: syz-executor.4 Not tainted 5.17.0-rc3-syzkaller-00013-g2ade8eef993c-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
==================================================================
sd 0:0:1:0: [sda] tag#3016 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3016 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3016 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3016 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3016 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3023 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3023 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3023 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3023 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3023 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3025 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3025 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3025 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3025 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3025 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3026 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3026 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3026 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3026 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3026 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3027 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3027 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3027 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3027 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3027 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3029 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3029 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3029 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3029 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3029 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3056 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3056 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3056 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3056 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3056 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3057 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3057 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3057 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3057 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3057 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3059 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3059 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3059 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3059 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3059 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3060 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3060 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3060 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3060 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3060 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3061 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3061 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3061 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3061 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3061 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3062 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3062 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3062 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3062 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3062 CDB[20]: ba
sd 0:0:1:0: [sda] tag#3063 FAILED Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK cmd_age=0s
sd 0:0:1:0: [sda] tag#3063 CDB: opcode=0xe5 (vendor)
sd 0:0:1:0: [sda] tag#3063 CDB[00]: e5 f4 32 73 2f 4e 09 6d 26 e2 c7 35 d1 35 12 1c
sd 0:0:1:0: [sda] tag#3063 CDB[10]: 92 1b da 40 b8 58 5b a8 d4 7d 34 f3 90 4c f1 2d
sd 0:0:1:0: [sda] tag#3063 CDB[20]: ba


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
