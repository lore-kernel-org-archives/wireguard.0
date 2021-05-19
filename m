Return-Path: <SRS0=r1yQ=KO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2CFC43461
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 17:35:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD3B7611BF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 17:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD3B7611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d626d4f;
	Wed, 19 May 2021 17:35:23 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66fd7e85
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 May 2021 17:35:22 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 i13-20020a5e9e0d0000b029042f7925649eso9873427ioq.5
 for <wireguard@lists.zx2c4.com>; Wed, 19 May 2021 10:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=UZHccjix8oNmHRhg4MY5ztlGF7uJvQZGhEY/WEJTmWA=;
 b=R0ZlloaFAwt3oRXNjtRXxhjpnpx8kauRkJwOReU/2HjVSrLj6ARJu/lu1KRKew8DlT
 FwfWpdyoKR2x3AW+zN/6QwSKHA6Xtapa658yFe3hRS6yceuYQ2rMXxtSNNw6yaJWZCR1
 Y+y/zTxdniTc29XRAaeCQXaTfNe88QrKbk5tC311RtcXyNhw5ZPfEYpC7ZRgFLWbZoSL
 Xhxu2qPqYpxmsXmYTTJrGlLgKkZ1KBvn+C00LOPn9+QKyh0iW25PGslZlSk1Akp/qTbL
 IBQgYdJkqPmpREJOKnk84GRXOCS1/HWYLNS/DC/42p2yJIEuJJEphkAx2Y7usGT2DnKb
 WtdA==
X-Gm-Message-State: AOAM532DuUyea6I3qacmYAEwWre6ZaUGZNMBn2/+3Py1itda5a/svTUg
 bG0l+9FcnQ9vz2IO88tT9XDc1x8/wR45PxPl0M5NuDJ3Oqa+
X-Google-Smtp-Source: ABdhPJx8nIme+6MkuMdV8XSTC3jU4BYJoZreomahlwSDgpBYdZiJB6DjldurwWK0/dGzPp+ku2sAA7L0X+o4m/XAC4FtRnQ5BbQt
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c5:: with SMTP id r5mr130961ilq.48.1621445720834; 
 Wed, 19 May 2021 10:35:20 -0700 (PDT)
Date: Wed, 19 May 2021 10:35:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003687bd05c2b2401d@google.com>
Subject: [syzbot] BUG: MAX_LOCKDEP_KEYS too low! (2)
From: syzbot <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com>
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

HEAD commit:    b81ac784 net: cdc_eem: fix URL to CDC EEM 1.0 spec
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=15a257c3d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5b86a12e0d1933b5
dashboard link: https://syzkaller.appspot.com/bug?extid=a70a6358abd2c3f9550f

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com

BUG: MAX_LOCKDEP_KEYS too low!
turning off the locking correctness validator.
CPU: 0 PID: 5917 Comm: syz-executor.4 Not tainted 5.12.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x141/0x1d7 lib/dump_stack.c:120
 register_lock_class.cold+0x14/0x19 kernel/locking/lockdep.c:1281
 __lock_acquire+0x102/0x5230 kernel/locking/lockdep.c:4781
 lock_acquire kernel/locking/lockdep.c:5512 [inline]
 lock_acquire+0x1ab/0x740 kernel/locking/lockdep.c:5477
 flush_workqueue+0x110/0x13e0 kernel/workqueue.c:2786
 drain_workqueue+0x1a5/0x3c0 kernel/workqueue.c:2951
 destroy_workqueue+0x71/0x800 kernel/workqueue.c:4382
 alloc_workqueue+0xc40/0xef0 kernel/workqueue.c:4343
 wg_newlink+0x43d/0x9e0 drivers/net/wireguard/device.c:335
 __rtnl_newlink+0x1062/0x1710 net/core/rtnetlink.c:3452
 rtnl_newlink+0x64/0xa0 net/core/rtnetlink.c:3500
 rtnetlink_rcv_msg+0x44e/0xad0 net/core/rtnetlink.c:5562
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2502
 netlink_unicast_kernel net/netlink/af_netlink.c:1312 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1338
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1927
 sock_sendmsg_nosec net/socket.c:654 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:674
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2350
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2404
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2433
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665d9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb25febe188 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 000000000056c0b0 RCX: 00000000004665d9
RDX: 0000000000000000 RSI: 0000000020000080 RDI: 0000000000000005
RBP: 00000000004bfcb9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000056c0b0
R13: 00007fff30a5021f R14: 00007fb25febe300 R15: 0000000000022000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
