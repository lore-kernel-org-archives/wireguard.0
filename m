Return-Path: <SRS0=TH/E=FY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AEBC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 16:54:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5A62343B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 16:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5A62343B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9052c7c;
	Sun, 20 Dec 2020 16:45:19 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 61b1243e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 16:45:17 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id t23so4418382ioh.0
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 08:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=4i7D1Vic0NGgVWV12qBnsGylwzdrUaeZ6Lvdbd3ZN5E=;
 b=Rd2S9N4ijSbDVUuT/gD10JZgf/aklWV1ptbBJg9x9lufxSXEWvYxffjdIIQtblVNWs
 EPBbWB8w9CIB5VpcosmacgJ1fGZFYnPDsdkuW5/iJ72fGXJRcUwmEg/mMfpapzIq9pHg
 eBwHAornOkblaeua++6bnfXEXdha7SHlBAyK/0+T84u7D5knnMqR+0ygp8vugltC+hUT
 zjD7WVqpT4Z/hPG9Zr2uz4vSrP19ONgSuQ6CWQPWzK8mHKpNcVHq80zwlgdj01KGpnAb
 x21k0RV4AWNgDmWKPtTOIhIarcEHR3ZSfSMsyxjfvDdX4meGbpnoSkoHQvjkIokeyCK7
 Hb0Q==
X-Gm-Message-State: AOAM531KiK90f566jnihk6aAbXmLHKSLQyjiVfQWPSLsp7iNhQKuk8aC
 j+CU3zJXT/epaTvWIP9uydgmhpWp6h2tVo/oMbbaZuIya7eh
X-Google-Smtp-Source: ABdhPJygH3tPibPhqTDcxUwciWibFpW9j6ta4+9W/Tw/0iQDmjtRdhSdNdaFpA2ewuddccUk4x2AqG7t/KJwxF4+9E4rgeJAg6Ng
MIME-Version: 1.0
X-Received: by 2002:a05:6602:214b:: with SMTP id
 y11mr11637499ioy.78.1608483252286; 
 Sun, 20 Dec 2020 08:54:12 -0800 (PST)
Date: Sun, 20 Dec 2020 08:54:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e13e2905b6e830bb@google.com>
Subject: UBSAN: object-size-mismatch in wg_xmit
From: syzbot <syzbot+8f90d005ab2d22342b6d@syzkaller.appspotmail.com>
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

HEAD commit:    5e60366d Merge tag 'fallthrough-fixes-clang-5.11-rc1' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12b12c13500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=267a60b188ded8ed
dashboard link: https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f90d005ab2d22342b6d@syzkaller.appspotmail.com

================================================================================
UBSAN: object-size-mismatch in ./include/linux/skbuff.h:2021:28
member access within address 0000000085889cc2 with insufficient space
for an object of type 'struct sk_buff'
CPU: 1 PID: 2998 Comm: kworker/1:2 Not tainted 5.10.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: ipv6_addrconf addrconf_dad_work
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x137/0x1be lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:148 [inline]
 handle_object_size_mismatch lib/ubsan.c:297 [inline]
 ubsan_type_mismatch_common+0x1e2/0x390 lib/ubsan.c:310
 __ubsan_handle_type_mismatch_v1+0x41/0x50 lib/ubsan.c:339
 __skb_queue_before include/linux/skbuff.h:2021 [inline]
 __skb_queue_tail include/linux/skbuff.h:2054 [inline]
 wg_xmit+0x45d/0xdf0 drivers/net/wireguard/device.c:182
 __netdev_start_xmit include/linux/netdevice.h:4775 [inline]
 netdev_start_xmit+0x7b/0x140 include/linux/netdevice.h:4789
 xmit_one net/core/dev.c:3556 [inline]
 dev_hard_start_xmit+0x182/0x2e0 net/core/dev.c:3572
 __dev_queue_xmit+0x1229/0x1e60 net/core/dev.c:4133
 neigh_output include/net/neighbour.h:510 [inline]
 ip6_finish_output2+0xe8d/0x11e0 net/ipv6/ip6_output.c:117
 dst_output include/net/dst.h:441 [inline]
 NF_HOOK include/linux/netfilter.h:301 [inline]
 ndisc_send_skb+0x85b/0xc70 net/ipv6/ndisc.c:508
 addrconf_dad_completed+0x5ef/0x990 net/ipv6/addrconf.c:4192
 addrconf_dad_work+0xb92/0x1480 net/ipv6/addrconf.c:3959
 process_one_work+0x471/0x830 kernel/workqueue.c:2275
 worker_thread+0x757/0xb10 kernel/workqueue.c:2421
 kthread+0x39a/0x3c0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
