Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6CF1075270
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Mar 2026 17:27:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id db6f4f61;
	Thu, 19 Mar 2026 17:27:27 +0000 (UTC)
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com
 [209.85.161.79])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 52a06e3b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2026 17:27:21 +0000 (UTC)
Received: by mail-oo1-f79.google.com with SMTP id
 006d021491bc7-67c1fd0fc13so6856446eaf.3
 for <wireguard@lists.zx2c4.com>; Thu, 19 Mar 2026 10:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773941240; x=1774546040;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PSG3ejNRrlnw9XOugg9Tq/1P/fmevmevXBXVs3hffk=;
 b=s6I58pYMPdw3VorUUkaPkflDVUSyoWXWrhn0pXIwChcuziVyPp6isPVx+juxhytRGo
 f9H92dJz10hU2xuAay1Q9BV8ekAPHDuCGzWSbgUtj6UpByh1hx0kJqDYgsU/yFb8ZEUO
 KUZCQ3pupZjPTvKE5IwYPKbMbaVAPGJoGmynhLtkDG+n6jYD02RDoM3HkTGKWO8t/Vbr
 DL3NLMNFlN4WTJzgrYL+Mnv7IeoTZ/GFqJ/bn7albSyGylrugedgKx5RRYbDZQpgo82w
 IqTBlKxkaRjVhXJlYnfl2CeYghzj7alclP9+iufumGjzAtFc4frslKrC1gRImdTyTzcN
 0kdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvEgYCcT/MFbccSZ4E/GTnFnkbd+/+AiyJSpEZteZBf3eGXL81J1esaYe7YCz2ai50iPtUGfS4O+E=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yy9sKYE2LbDggQ/28bK2n5bUw8znwqNCS3izII4bSeA+XfSNZW/
 a4MtgXeZvx49X/6wXRKLl1AOwbJ+PnE/HTYqvwngUtXjA04gM1dvHKnDty/ryKC4HcXjlMgnmuT
 qZSsF7CaU8UfbDdrSWU/Jf83yRxHwf6pZFWofi7kQooHFMExsOvYqlOh2aao=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2291:b0:672:7c0d:5607 with SMTP id
 006d021491bc7-67c22ecae21mr230743eaf.26.1773941240062; Thu, 19 Mar 2026
 10:27:20 -0700 (PDT)
Date: Thu, 19 Mar 2026 10:27:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69bc31f8.050a0220.18f14c.0050.GAE@google.com>
Subject: [syzbot] [wireguard?] KCSAN: data-race in
 wg_expired_retransmit_handshake
 / wg_packet_send_queued_handshake_initiation (4)
From: syzbot <syzbot+4ca9a7b9d61b76d0177c@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
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

Hello,

syzbot found the following issue on:

HEAD commit:    5ee8dbf54602 Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123477e6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b32b22d8934c136
dashboard link: https://syzkaller.appspot.com/bug?extid=4ca9a7b9d61b76d0177c
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dacfe44e33b2/disk-5ee8dbf5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/10e825a65a06/vmlinux-5ee8dbf5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b2fe6914587d/bzImage-5ee8dbf5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4ca9a7b9d61b76d0177c@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_expired_retransmit_handshake / wg_packet_send_queued_handshake_initiation

read to 0xffff88810b667808 of 4 bytes by interrupt on cpu 0:
 wg_expired_retransmit_handshake+0x2a/0x160 drivers/net/wireguard/timers.c:46
 call_timer_fn+0x3b/0x2a0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers kernel/time/timer.c:2373 [inline]
 __run_timer_base+0x426/0x620 kernel/time/timer.c:2385
 run_timer_base kernel/time/timer.c:2394 [inline]
 run_timer_softirq+0x31/0x70 kernel/time/timer.c:2404
 handle_softirqs+0xb9/0x2a0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x39/0xc0 kernel/softirq.c:723
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1056
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
 native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
 pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:62
 arch_safe_halt arch/x86/kernel/process.c:766 [inline]
 default_idle+0x9/0x20 arch/x86/kernel/process.c:767
 default_idle_call+0x3b/0x60 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:191 [inline]
 do_idle+0xcd/0x230 kernel/sched/idle.c:332
 cpu_startup_entry+0x24/0x30 kernel/sched/idle.c:430
 rest_init+0xee/0xf0 init/main.c:760
 start_kernel+0x49a/0x4c0 init/main.c:1210
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0xfc/0x100 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x147

write to 0xffff88810b667808 of 4 bytes by interrupt on cpu 1:
 wg_packet_send_queued_handshake_initiation+0x32/0x180 drivers/net/wireguard/send.c:59
 wg_expired_new_handshake+0x26/0x30 drivers/net/wireguard/timers.c:104
 call_timer_fn+0x3b/0x2a0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers kernel/time/timer.c:2373 [inline]
 __run_timer_base+0x426/0x620 kernel/time/timer.c:2385
 run_timer_base kernel/time/timer.c:2394 [inline]
 run_timer_softirq+0x31/0x70 kernel/time/timer.c:2404
 handle_softirqs+0xb9/0x2a0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x39/0xc0 kernel/softirq.c:723
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1056
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
 native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
 pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:62
 arch_safe_halt arch/x86/kernel/process.c:766 [inline]
 default_idle+0x9/0x20 arch/x86/kernel/process.c:767
 default_idle_call+0x3b/0x60 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:191 [inline]
 do_idle+0xcd/0x230 kernel/sched/idle.c:332
 cpu_startup_entry+0x24/0x30 kernel/sched/idle.c:430
 start_secondary+0x95/0xa0 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x147

value changed: 0x00000002 -> 0x00000003

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W           syzkaller #0 PREEMPT(full) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
==================================================================


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
