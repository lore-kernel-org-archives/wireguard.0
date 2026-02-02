Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A8CEF06EA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d0ee2a2;
	Sun, 8 Feb 2026 17:17:19 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16ba73f4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Feb 2026 15:06:41 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-88888c41a13so58295176d6.3
 for <wireguard@lists.zx2c4.com>; Mon, 02 Feb 2026 07:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770044800; cv=none;
 d=google.com; s=arc-20240605;
 b=PBXF+YomAvJx+oRQIJ878i1b/DDY/Fxyt9+RxPcn4SAYB+HYRgfZapvqCLevkklQAq
 7lkfXrVgpcC0W1vgaIvIWfrOwaImzuL1Gq/bmmv/kJtPug0WunfVHkPSY1u+6yaB0Ann
 hi5ZkG9+j4J/tkk/Sug4nTTFzzUCu9MXtgn3dz48j+pZ+yKAVfUWkgINFEWMMqr50+UN
 DCCPqXwZBxX7j0+D+niKpH5Y+a+mViKXTPrmPzXPwwCHMpwD1gw23Xda9wyz/6HqwGtI
 fa993Ck3RN4djyEYf7OBon5SjAnAuZIXEzfClAmcIM2JwCcCcyXiK3A/66wXqx9haAVo
 JCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=w9jeP7bm024Qg0/Bgjvap268vepI5Fu8QRugNXY+EhA=;
 fh=YKtWIOzbdj8fGSf0XCU2BxbpltrKOVclqI4QOvI97GE=;
 b=NHx4X+E7TpHgQPPrTHaa5Zo0msBeodmGeWrvgF3c0sIaawFGLC9BKJKl8DcORtXttf
 daOCVQvTDqrSMhgawOJbT2X5ddCjTymjP0pbeK+l+8H/WgXa+AuQ2342SsqqnNhf1jFj
 FhYAqE29JzcotqRPHPR/BZOOuglM9njYUOGsYP7tP3RydcR0mX6g549REbTykvcuXMOX
 sX79WZnHxLbCBAwg/2x2+zwaNINkbeiXMewRCYyRADuvnimj1fxHW9AnFM0jb0xNdCa9
 IlbsH6cgrH4p82RpJaDXtWeo/l3oOOu6J1LIN0cgmB8RxsGnmz6/c/2jDc6IM+o8gc+U
 9O7Q==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770044800; x=1770649600; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=w9jeP7bm024Qg0/Bgjvap268vepI5Fu8QRugNXY+EhA=;
 b=iJZ658r02fdvZBzYye0T/2jM9Ly3yO6tm1JmUQSSrCKdBrXB4iyWVQVauX7NuOSLWK
 J52wZuexPBpJMTVuVNOSG33/3m759nZ/yCU+QuBl6J3wG6xEONVEeOjIOeLSVoato6Dr
 oGaFkTJ9C24LRSr6fKbWcS9CLIvj2Fe/CkYS6cfvgz1h+gBO+CD7bBp1erdMgmowZ0Ft
 4XYu+QrgUEQgF0TIJfBOCe5SioL/bpjUgK7Rv8mrGmcN1h4UtbmZfRlBw966MNQvZUD9
 EGasz6IjzZ9va9P5hVOG3HKQYmYAfAn0MqUMSNuxOo+54L5fU1hWgL059MS4DHEup/6V
 Ufhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770044800; x=1770649600;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9jeP7bm024Qg0/Bgjvap268vepI5Fu8QRugNXY+EhA=;
 b=nA5BhoxesrboJYY285X7Y7J8NIUa3Q+k/CALeZQdupCYNHn2VT5MEjcrPSxa2HlD5S
 zg0lrYN1iRHlMfF50JiOc2D7WKjcLgfGhwyWMQTWCtMaE7OaAUkLs46+16XarEVFXzIE
 b4sF9gXelK5k938REjnvg7APVicNzFEeysY6vS8dg4c2j3z/F35D2RkYSCfMu862jUDF
 8zvWYN06sNUS9plwmvXNBTDHm1i/qFP+QuS2MvoLTckq8KBbjG3tLkLPSnBcjD/t2Bmw
 uKKnNZOFVFYBWXVfCz4+ojW4QAE2ABY9k8OAnlgV981A5SPZ4aitDBEPl9OZz59UHjwR
 R2/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBcaxBOlG3apzYH2ADv5vWxuUog/OWtv2Ynjv5ODuKUJmsC7ivbO/VGd7eyZEPUarAzESD1bNkXG0=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxqILiA0pfUSf2PtGAPi945QmgSV5N0FyFyCm3v03XGVLLMNzdr
 WZJr5tAzT0yu/UFM8iB11wy4XTqC8z4nmIDRHGS3/UfUskhNCPMmK5YbfNcfDxgZ2WY0Tu24uCb
 ZO/akE4AnRbgmeDOHk983LaFK19wZ8/s=
X-Gm-Gg: AZuq6aJN8540VtCeAai0blcCZflVsDNJNYDIGNQXjOauQ4Y9c6ePJi8eRZVA6omMTl2
 MTY6Nyy/w1qvQTkeuRJ1pPyzGR+9wuceAc28tcC2xVp+I72Nq24G4UY6Nk8YrQglNJJPq9fkytY
 6ysSQW3L/7/dJLHa59jJrNe2YRyn1X6DshYQ1TGyKn4J+n19ITg8nZOVvAYC5gR5HlopBV4at27
 n+GPisJzKF3wdR7y3QPMEnGXWW0XBeAIgF1ji28vaznP0m2bOeRM2QMMA+eIsGScalAwDfX
X-Received: by 2002:ad4:5f4a:0:b0:894:835d:b112 with SMTP id
 6a1803df08f44-894ea021d37mr174389836d6.40.1770044799594; Mon, 02 Feb 2026
 07:06:39 -0800 (PST)
MIME-Version: 1.0
From: Sam Sun <samsun1006219@gmail.com>
Date: Mon, 2 Feb 2026 23:06:28 +0800
X-Gm-Features: AZwV_QijWGswhsnlUNOl98VZFGdjf-cZHkRE_JI1VByzESDNxU_o63zDFEHKqI8
Message-ID: <CAEkJfYP+dGtJZAatpFi9XgNJ5pKWDv6hOPUtyz14_6NbxTWT+g@mail.gmail.com>
Subject: [Linux kernel bug] general protection fault in
 wg_packet_send_queued_handshake_initiation
To: Jason@zx2c4.com, davem@davemloft.net, Eric Dumazet <edumazet@google.com>, 
 kuba@kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: syzkaller@googlegroups.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:17:13 +0000
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

Dear developers and maintainers,

We have encountered a kernel crash in __queue_work occurring within
the wg_packet_handshake_send_worker context. The call trace indicates
the crash happens when wg_expired_send_persistent_keepalive (timer
callback) attempts to queue a specific work item while the interface
is being destroyed. The original crash log is listed below.

Oops: general protection fault, probably for non-canonical address
0xe1d2d8131fe22003: 0000 [#1] SMP KASAN NOPTI
KASAN: maybe wild-memory-access in range [0x0e96e098ff110018-0x0e96e098ff11001f]
CPU: 1 UID: 0 PID: 7634 Comm: kworker/u10:17 Tainted: G             L
    6.19.0-rc6-00003-g13bede03f3b8-dirty #18 PREEMPT(full)
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
Workqueue: wg-kex-wg0 wg_packet_handshake_send_worker
RIP: 0010:kasan_byte_accessible+0x15/0x30 mm/kasan/generic.c:210
Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
0f 1f 40 d6 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6
07 3c 07 0f 96 c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffa00000001d89c0 EFLAGS: 00010086
RAX: dffffc0000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b56293e RDI: e1d2d8131fe22003
RBP: 0e96e098ff110018 R08: 0000000000000001 R09: 0000000000000000
R10: ff11000100070003 R11: 0000000000000007 R12: 0000000000000000
R13: ffffffff8b56293e R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ff110001a1773000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd5733fc158 CR3: 000000000df84000 CR4: 0000000000753ef0
PKRU: 55555554
Call Trace:
 <IRQ>
 __kasan_check_byte+0x14/0x50 mm/kasan/common.c:573
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire kernel/locking/lockdep.c:5842 [inline]
 lock_acquire+0xfd/0x330 kernel/locking/lockdep.c:5825
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
 __queue_work+0xac2/0x12b0 kernel/workqueue.c:2315
 queue_work_on+0x11c/0x140 kernel/workqueue.c:2418
 queue_work include/linux/workqueue.h:765 [inline]
 wg_packet_send_queued_handshake_initiation+0x220/0x410
drivers/net/wireguard/send.c:75
 wg_packet_send_staged_packets+0x10f0/0x1890 drivers/net/wireguard/send.c:413
 wg_packet_send_keepalive+0x4b/0x2f0 drivers/net/wireguard/send.c:239
 wg_expired_send_persistent_keepalive+0x5e/0x70
drivers/net/wireguard/timers.c:144
 call_timer_fn+0x19f/0x570 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers+0x6d2/0xac0 kernel/time/timer.c:2373
 __run_timer_base kernel/time/timer.c:2385 [inline]
 __run_timer_base kernel/time/timer.c:2377 [inline]
 run_timer_base+0xc5/0x120 kernel/time/timer.c:2394
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2404
 handle_softirqs+0x1d4/0x8e0 kernel/softirq.c:622
 do_softirq kernel/softirq.c:523 [inline]
 do_softirq+0xac/0xe0 kernel/softirq.c:510
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x120 kernel/softirq.c:450
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 fpregs_unlock arch/x86/include/asm/fpu/api.h:77 [inline]
 kernel_fpu_end arch/x86/kernel/fpu/core.c:506 [inline]
 kernel_fpu_end+0x5e/0x70 arch/x86/kernel/fpu/core.c:499
 blake2s_compress+0x77/0xe0 lib/crypto/x86/blake2s.h:42
 blake2s_update+0xb6/0x1f0 lib/crypto/blake2s.c:119
 mix_hash+0xf1/0x140 drivers/net/wireguard/noise.c:438
 message_encrypt drivers/net/wireguard/noise.c:470 [inline]
 wg_noise_handshake_create_initiation+0x363/0x5c0
drivers/net/wireguard/noise.c:555
 wg_packet_send_handshake_initiation+0x182/0x340 drivers/net/wireguard/send.c:34
 wg_packet_handshake_send_worker+0x1c/0x30 drivers/net/wireguard/send.c:51
 process_one_work+0x9cd/0x1ba0 kernel/workqueue.c:3304
 process_scheduled_works kernel/workqueue.c:3401 [inline]
 worker_thread+0x67e/0xe90 kernel/workqueue.c:3482
 kthread+0x3d0/0x780 kernel/kthread.c:463
 ret_from_fork+0x966/0xaf0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:kasan_byte_accessible+0x15/0x30 mm/kasan/generic.c:210
Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
0f 1f 40 d6 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6
07 3c 07 0f 96 c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffa00000001d89c0 EFLAGS: 00010086
RAX: dffffc0000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b56293e RDI: e1d2d8131fe22003
RBP: 0e96e098ff110018 R08: 0000000000000001 R09: 0000000000000000
R10: ff11000100070003 R11: 0000000000000007 R12: 0000000000000000
R13: ffffffff8b56293e R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ff110001a1773000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd5733fc158 CR3: 000000000df84000 CR4: 0000000000753ef0
PKRU: 55555554
----------------
Code disassembly (best guess):
   0: 00 00                 add    %al,(%rax)
   2: 0f 1f 00             nopl   (%rax)
   5: 90                   nop
   6: 90                   nop
   7: 90                   nop
   8: 90                   nop
   9: 90                   nop
   a: 90                   nop
   b: 90                   nop
   c: 90                   nop
   d: 90                   nop
   e: 90                   nop
   f: 90                   nop
  10: 90                   nop
  11: 90                   nop
  12: 90                   nop
  13: 90                   nop
  14: 90                   nop
  15: 0f 1f 40 d6           nopl   -0x2a(%rax)
  19: 48 b8 00 00 00 00 00 movabs $0xdffffc0000000000,%rax
  20: fc ff df
  23: 48 c1 ef 03           shr    $0x3,%rdi
  27: 48 01 c7             add    %rax,%rdi
* 2a: 0f b6 07             movzbl (%rdi),%eax <-- trapping instruction
  2d: 3c 07                 cmp    $0x7,%al
  2f: 0f 96 c0             setbe  %al
  32: c3                   ret
  33: cc                   int3
  34: cc                   int3
  35: cc                   int3
  36: cc                   int3
  37: 66                   data16
  38: 66                   data16
  39: 2e                   cs
  3a: 0f                   .byte 0xf
  3b: 1f                   (bad)
  3c: 84 00                 test   %al,(%rax)

<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>

Analysis:
The crash happens at raw_spin_lock(&pool->lock) inside __queue_work.
The faulting address (0xe1d2d8...) suggests that the code is accessing
a garbage pointer, characteristic of a Use-After-Free error.

Suspected Root Cause:
The issue could be resulted by race condition between another thread
invoking destroy_workqueue and the current thread. Unfortunately, we
don't have any reproducible PoC yet.

Best Regards,
Yue
