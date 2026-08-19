Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D27C5DF6D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Aug 2026 12:07:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 00698411;
	Wed, 19 Aug 2026 12:07:43 +0000 (UTC)
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com
 [209.85.161.78])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eabdeda9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Aug 2026 12:07:38 +0000 (UTC)
Received: by mail-oo1-f78.google.com with SMTP id
 006d021491bc7-6a0f261aeb6so1266651eaf.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Aug 2026 05:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787141257; x=1787746057;
 h=content-type:to:from:subject:message-id:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FBqP4hzWqlcD5XduxSoz3ubi2vBU150XG1dXZ14qzas=;
 b=KRSSAr++PaPh5YzWa0eFdOQz2v1dSbDnvBcXC8XHnc43gHxhtQZfJkrLrNTZMcVRyY
 YQ2X08Rf3yRo9AJKO9DYkup1v3jJDQmT0v3DJmg36vQxaMigr+tbCjqKS/43YA+11XUH
 HODP7y66/buvlK3+MMG6MMIfD1rSxltZdPuCOQ5nXScX12kaY5HsRKr+77ubAdXkSXpf
 /xdtA1bHxT7n5+PUVpDEtNlfZYMua77Yf16QI+4bYYYjVL5Cc2K42SYbYWaC3vkZSxXF
 AUQrC/QKwdKBkKuIAzmL6Sg0McWNvWJwzlZpAhrDJjHocJcfvWcQvwe5k6IRDjSoShQA
 D/OA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrI1oYny96+DDYjfwYivMh/0AIVyZ9ucmH1dldZ8jYbDRmErmgmCvewEdRr8/iFy62/gEx9bM7orug=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxguFwl4V7CxbSaHd68VWBPgXD6oIm8cudHle/9q5sD5cWu4LH/
 9on4vossrOf90Okx+aYVNn/Q1+vlDudjpgg+tDOWXfeYPKeBo7jNfeKpIUoLOKqfk6f8tQu1Fv9
 yttYBDvcng9KBp5Yhqrsea5PlaF8SekCQfBouXWPIqHGi2wY7yglycIqgC0I=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c91:b0:6aa:e854:d05d with SMTP id
 006d021491bc7-6b13c2d60ebmr2645032eaf.3.1787141257279; Wed, 19 Aug 2026
 05:07:37 -0700 (PDT)
Date: Wed, 19 Aug 2026 05:07:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a859c89.f7a79266.2f965f.003e.GAE@google.com>
Subject: [syzbot] [wireguard?] KCSAN: data-race in wg_packet_encrypt_worker /
 wg_packet_encrypt_worker
From: syzbot <syzbot+75273239c9ffd7dc304f@syzkaller.appspotmail.com>
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

HEAD commit:    0f23d56f17fd Merge tag 'linux_kselftest-next-7.3-rc1' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11c9b679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e688dbf432017c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=75273239c9ffd7dc304f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a243b05cdc37/disk-0f23d56f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3af864b2bf56/vmlinux-0f23d56f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8c3f9cd19ac5/bzImage-0f23d56f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+75273239c9ffd7dc304f@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_packet_encrypt_worker / wg_packet_encrypt_worker

read to 0xffff88811ac90080 of 4 bytes by task 3410 on cpu 0:
 wg_cpumask_choose_online drivers/net/wireguard/queueing.h:107 [inline]
 wg_queue_enqueue_per_peer_tx drivers/net/wireguard/queueing.h:183 [inline]
 wg_packet_encrypt_worker+0x9f5/0xe90 drivers/net/wireguard/send.c:305
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0x4d4/0x9a0 kernel/workqueue.c:3405
 worker_thread+0x569/0x750 kernel/workqueue.c:3486
 kthread+0x221/0x270 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

write to 0xffff88811ac90080 of 4 bytes by task 15243 on cpu 1:
 wg_cpumask_choose_online drivers/net/wireguard/queueing.h:110 [inline]
 wg_queue_enqueue_per_peer_tx drivers/net/wireguard/queueing.h:183 [inline]
 wg_packet_encrypt_worker+0xcca/0xe90 drivers/net/wireguard/send.c:305
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0x4d4/0x9a0 kernel/workqueue.c:3405
 worker_thread+0x569/0x750 kernel/workqueue.c:3486
 kthread+0x221/0x270 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

value changed: 0x00000002 -> 0x00000000

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 15243 Comm: kworker/1:19 Tainted: G        W           syzkaller #0 PREEMPT(lazy) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: wg-crypt-wg0 wg_packet_encrypt_worker
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
