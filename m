Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C068C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Feb 2022 09:13:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9c7ebe94;
	Tue, 8 Feb 2022 09:13:25 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 81474f8b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Feb 2022 09:13:23 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 r4-20020a6b4404000000b00614d5a865f7so10943288ioa.5
 for <wireguard@lists.zx2c4.com>; Tue, 08 Feb 2022 01:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=d853FYKiMfJBLFjIJPTK0l7nRNte7hxVebJY6lt/Hww=;
 b=i3Pao+PE99smFlSSfBlhpYiqfKnHn0RjqH+hS20LXRJiWBQbnLSWVcd4soUWz43KVW
 +LLDZrM1nykvwZsScqzQR1huKjXgTQBMTyGFL2LvDUOrWmPQFsjP/drXT2ZEuXnHEHON
 T9DNnaOVsgxNihDWjZDE0ZhYnresK7MPcAYWdI86uyiO9HVP+ycbGKMVt96OErUJa8kL
 byiByOhDJlBpBFKtN+VopM1LBNPeeZPV1ZXTCqtC++oqdrtsaSiVQ6PZ9bIKo6sLT0OR
 SsyS/Cym2j7frFdboiKZV9du/sKPb5OFP2+eiaw0Nlg6MiTKsZ65/IJkMu7BLkTiuBr/
 Agyw==
X-Gm-Message-State: AOAM531oyi7MhLBpaCLqRF5OshbvgZmit9xLbIrVNq4nsZ4jIs+Ec7Au
 GyUPnl0QZfe3GKOGRF+w9Ec3ESxL1zYDFBBrk9odaxGPPiJD
X-Google-Smtp-Source: ABdhPJyl5someFze/leMXY+UMeZB6KyqLyKyMR1xHO5v+gqxDic6OW0E2pPO816147akPaw6tPNqw/l+tSUjpJorZcF2e+VR7EY+
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2182:: with SMTP id
 j2mr1752703ila.304.1644311602369; 
 Tue, 08 Feb 2022 01:13:22 -0800 (PST)
Date: Tue, 08 Feb 2022 01:13:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f5988505d77e20e4@google.com>
Subject: [syzbot] KCSAN: data-race in wg_packet_handshake_receive_worker /
 wg_packet_rx_poll (3)
From: syzbot <syzbot+ed414b05fe54c96947f8@syzkaller.appspotmail.com>
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

HEAD commit:    455e73a07f6e Merge tag 'clk-for-linus' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=131009feb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1f9a6122410716
dashboard link: https://syzkaller.appspot.com/bug?extid=ed414b05fe54c96947f8
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ed414b05fe54c96947f8@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in wg_packet_handshake_receive_worker / wg_packet_rx_poll

read to 0xffff88813238a9e0 of 8 bytes by interrupt on cpu 1:
 update_rx_stats drivers/net/wireguard/receive.c:28 [inline]
 wg_packet_consume_data_done drivers/net/wireguard/receive.c:365 [inline]
 wg_packet_rx_poll+0xf6b/0x11f0 drivers/net/wireguard/receive.c:481
 __napi_poll+0x65/0x3f0 net/core/dev.c:6365
 napi_poll net/core/dev.c:6432 [inline]
 net_rx_action+0x29e/0x650 net/core/dev.c:6519
 __do_softirq+0x158/0x2de kernel/softirq.c:558
 do_softirq+0xb1/0xf0 kernel/softirq.c:459
 __local_bh_enable_ip+0x68/0x70 kernel/softirq.c:383
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
 _raw_spin_unlock_bh+0x33/0x40 kernel/locking/spinlock.c:210
 spin_unlock_bh include/linux/spinlock.h:394 [inline]
 ptr_ring_consume_bh include/linux/ptr_ring.h:367 [inline]
 wg_packet_decrypt_worker+0x73c/0x780 drivers/net/wireguard/receive.c:506
 process_one_work+0x3f6/0x960 kernel/workqueue.c:2307
 worker_thread+0x616/0xa70 kernel/workqueue.c:2454
 kthread+0x2c7/0x2e0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

write to 0xffff88813238a9e0 of 8 bytes by task 5035 on cpu 0:
 update_rx_stats drivers/net/wireguard/receive.c:28 [inline]
 wg_receive_handshake_packet drivers/net/wireguard/receive.c:205 [inline]
 wg_packet_handshake_receive_worker+0x54a/0x6e0 drivers/net/wireguard/receive.c:220
 process_one_work+0x3f6/0x960 kernel/workqueue.c:2307
 worker_thread+0x616/0xa70 kernel/workqueue.c:2454
 kthread+0x2c7/0x2e0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

value changed: 0x0000000000000aa8 -> 0x0000000000000ac8

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 PID: 5035 Comm: kworker/0:60 Not tainted 5.16.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: wg-kex-wg2 wg_packet_handshake_receive_worker
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
