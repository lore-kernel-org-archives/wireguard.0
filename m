Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Mar 2022 08:16:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0ecb6662;
	Sat, 19 Mar 2022 08:16:27 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7df87c75
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 08:16:25 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 s14-20020a0566022bce00b00645e9bc9773so6583703iov.20
 for <wireguard@lists.zx2c4.com>; Sat, 19 Mar 2022 01:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=WUWCxbYXpv8z4jcgvVVgbLnra2IcxUsgwjwIFM6opyw=;
 b=xRJpKIMOAg4IVZxOsI6Xz9KjUjE0xjyJrV6zb3Il4ujgwm4PXU5Wtp90fblC1CvyEo
 NrSvSOzzdCwJaJX1PRmBc3/fEP5HMX2zLumHF4mPs4sm7fjROyKR1pSqazRbjyRWBUMa
 L4FoCE7UbnZgpuoXcITjUWdAv6EUlwKOC2JMoht7kfPt9bfjtW/BILVYpMEYSKzA1WR9
 0vDNBjUwpu/6wqJHK57J/0s/4vQ4cvdFl/XMOECoTJ6CTfHPjSAi2Ig2dBstcGZ3JeXo
 /gxtBRS/XGkEevpCUmFtNcq0FZ1h9Ai6qtPr/NzNfctksZYo+S1TWQ2MCv5sLLupVcSd
 isog==
X-Gm-Message-State: AOAM5309A1thPWhlg2CKNWiL77h8Oj9IiR0GtJ/QlhP+IhXmnbfFXW6d
 DpX7F3H9368qIHjmumBPqv4Pxo4DMmqrkSePmt96/YmeYAM0
X-Google-Smtp-Source: ABdhPJyPEwIAqyIUFL+CxixBlWaTZmYK6PeM/UNgXrwWC4dbze6a16I/59eg/9wLMvT9QQR9oi7rektbQwH1FARKkQaauaXpb5uG
MIME-Version: 1.0
X-Received: by 2002:a05:6638:d56:b0:319:f6bb:25e1 with SMTP id
 d22-20020a0566380d5600b00319f6bb25e1mr6281612jak.242.1647677784786; Sat, 19
 Mar 2022 01:16:24 -0700 (PDT)
Date: Sat, 19 Mar 2022 01:16:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000110dee05da8de18a@google.com>
Subject: [syzbot] linux-next test error: WARNING in __napi_schedule
From: syzbot <syzbot+6f21ac9e27fca7e97623@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, davem@davemloft.net, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, sfr@canb.auug.org.au, 
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

HEAD commit:    6d72dda014a4 Add linux-next specific files for 20220318
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=124f5589700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5907d82c35688f04
dashboard link: https://syzkaller.appspot.com/bug?extid=6f21ac9e27fca7e97623
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6f21ac9e27fca7e97623@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 3612 at net/core/dev.c:4268 ____napi_schedule net/core/dev.c:4268 [inline]
WARNING: CPU: 0 PID: 3612 at net/core/dev.c:4268 __napi_schedule+0xe2/0x440 net/core/dev.c:5878
Modules linked in:
CPU: 0 PID: 3612 Comm: kworker/0:5 Not tainted 5.17.0-rc8-next-20220318-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: wg-crypt-wg0 wg_packet_decrypt_worker
RIP: 0010:____napi_schedule net/core/dev.c:4268 [inline]
RIP: 0010:__napi_schedule+0xe2/0x440 net/core/dev.c:5878
Code: 74 4a e8 11 61 3c fa 31 ff 65 44 8b 25 d7 27 c6 78 41 81 e4 00 ff 0f 00 44 89 e6 e8 18 63 3c fa 45 85 e4 75 07 e8 ee 60 3c fa <0f> 0b e8 e7 60 3c fa 65 44 8b 25 f7 31 c6 78 31 ff 44 89 e6 e8 f5
RSP: 0018:ffffc9000408fc78 EFLAGS: 00010093
RAX: 0000000000000000 RBX: ffff88807fa90748 RCX: 0000000000000000
RDX: ffff888019800000 RSI: ffffffff873c4802 RDI: 0000000000000003
RBP: 0000000000000200 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff873c47f8 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8880b9c00000 R14: 000000000003b100 R15: ffff88801cf90ec0
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f998512c300 CR3: 00000000707f2000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 napi_schedule include/linux/netdevice.h:465 [inline]
 wg_queue_enqueue_per_peer_rx drivers/net/wireguard/queueing.h:204 [inline]
 wg_packet_decrypt_worker+0x408/0x5d0 drivers/net/wireguard/receive.c:510
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
