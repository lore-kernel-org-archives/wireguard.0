Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD4C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Nov 2022 18:36:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddf68b48;
	Tue, 8 Nov 2022 18:36:48 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f8a0988c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2022 18:36:45 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id n186so16435271oih.7
 for <wireguard@lists.zx2c4.com>; Tue, 08 Nov 2022 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fMwy9JhsDtkEfYvoCi3Vv2kM/bZCakgL7LGXwDgD7c8=;
 b=gC9LNMAegiA4Jf0erWP42jTuM1gr5OF16nO8+Kis6MUUI3a3J59FC4kuaia5eevrgj
 5aMVrqdIr/VhdXsHBYlgkE2YWODgLOSohoPdyXxWnnigY0GwYPq01R7lgEPfo1L3CieJ
 v8nJpmLBF4vXNoNYbyki/vLUaSn0NlGpXhsDLWLWFU/ufFqtV3t7x6Knf0P365b542wn
 RG32NUv2pbv9X/LomjvJxNdrc2B7pNKfeQ4wicXG/KhxmPEPVmVwwJuRma2czE6rsdeO
 /vIoM4WGwW22+EDbW2Qpy+KWMRaUgIYHYxrfBYOFMGM6h40v7tLDZks1FJ13APmZMkY8
 JSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMwy9JhsDtkEfYvoCi3Vv2kM/bZCakgL7LGXwDgD7c8=;
 b=ojbW+00MrBkjRhtoE5KBzdJwprQDcLq0oCWd24/AMkJo11a3csSCOnNVPOZws+CtHo
 0fEDGePwwuNs9wRcBSMxWpX7/hgk3G6T/UI6Jb4FjUO8Gb1njCmVDcHZTLX9l9Yw+VrS
 9E86tHZMbU2UwonUC6sSVOSAKm0wHUxuxU+UEJGeZUkkE8P1VtrzLZGv6ROXEu4Pmyo9
 CCWhzSR6FMZsQRSwBwiSTrTkjmP/C1NDRJgbtp9dV50C2qDi9MmxsTUwIabVE83BQtJQ
 UJze2ZNXTwUT1W1qu5c/h8b5JrZhu7im6NGSDHQiDdOFZsiNVtB9tkFj6kO5z/vbu9XQ
 abQA==
X-Gm-Message-State: ACrzQf2Yfhz76D5U+si8MW58LwbKPvY4JiOVsAqpKZsTBUPJVHDuNQpf
 rre98enrp3jaLMLtaCV0GA+24xNJZbwZgBYXY5K8hA==
X-Google-Smtp-Source: AMsMyM4aUyvVSKVG8vFRQUL68ZcsPvXRkDj4mEBD4c2JVjw+KaualiLVr75Z9yDAkuqcho9YbEni5ZrTQTr1F5mKbYk=
X-Received: by 2002:a05:6808:1184:b0:350:f681:8c9a with SMTP id
 j4-20020a056808118400b00350f6818c9amr30966555oil.282.1667932603686; Tue, 08
 Nov 2022 10:36:43 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003687bd05c2b2401d@google.com>
 <000000000000b4dae405ecf5af7f@google.com>
In-Reply-To: <000000000000b4dae405ecf5af7f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 8 Nov 2022 10:36:32 -0800
Message-ID: <CACT4Y+ZYNqGwKJ8+do08hf0XrqBh0CAWrHxaBGp2tE=KHi=WDA@mail.gmail.com>
Subject: Re: [syzbot] BUG: MAX_LOCKDEP_KEYS too low! (2)
To: syzbot <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com>
Cc: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, 
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, penguin-kernel@i-love.sakura.ne.jp, 
 peterz@infradead.org, rdunlap@infradead.org, syzkaller-bugs@googlegroups.com, 
 tonymarislogistics@yandex.com, wireguard@lists.zx2c4.com
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

On Tue, 8 Nov 2022 at 05:40, syzbot
<syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    3577a7611842 Merge branches 'for-next/acpi', 'for-next/kbu..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=15ea3e61880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=606e57fd25c5c6cc
> dashboard link: https://syzkaller.appspot.com/bug?extid=a70a6358abd2c3f9550f
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168c4c99880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145d6376880000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/054b1f56af52/disk-3577a761.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/c616835b2a22/vmlinux-3577a761.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9825c28b2090/Image-3577a761.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com


I see team device code uses lockdep_register_key()/lockdep_set_class()
in some interesting ways:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/tree/drivers/net/team/team.c?id=3577a76118426e4409ecf4f75520925eff67d42c#n1657
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/tree/drivers/net/team/team.c?id=3577a76118426e4409ecf4f75520925eff67d42c#n2008

I guess that's what causes lockdep capacity exhaustion. Does team use
it incorrectly?


> netlink: 4 bytes leftover after parsing attributes in process `syz-executor357'.
> device team6635 entered promiscuous mode
> 8021q: adding VLAN 0 to HW filter on device team6635
> BUG: MAX_LOCKDEP_KEYS too low!
> turning off the locking correctness validator.
> CPU: 0 PID: 9692 Comm: syz-executor357 Not tainted 6.1.0-rc4-syzkaller-31844-g3577a7611842 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
> Call trace:
>  dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
>  show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
>  dump_stack+0x1c/0x58 lib/dump_stack.c:113
>  register_lock_class+0x2e4/0x2f8 kernel/locking/lockdep.c:1326
>  __lock_acquire+0xa8/0x3084 kernel/locking/lockdep.c:4934
>  lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
>  __mutex_lock_common+0xd4/0xca8 kernel/locking/mutex.c:603
>  __mutex_lock kernel/locking/mutex.c:747 [inline]
>  mutex_lock_nested+0x38/0x44 kernel/locking/mutex.c:799
>  team_vlan_rx_add_vid+0x38/0xd8 drivers/net/team/team.c:1904
>  vlan_add_rx_filter_info net/8021q/vlan_core.c:211 [inline]
>  __vlan_vid_add net/8021q/vlan_core.c:306 [inline]
>  vlan_vid_add+0x328/0x38c net/8021q/vlan_core.c:336
>  vlan_device_event+0x200/0xc4c net/8021q/vlan.c:385
>  notifier_call_chain kernel/notifier.c:87 [inline]
>  raw_notifier_call_chain+0x7c/0x108 kernel/notifier.c:455
>  __dev_notify_flags+0x170/0x2e8
>  rtnl_newlink_create+0x460/0x6bc net/core/rtnetlink.c:3372
>  __rtnl_newlink net/core/rtnetlink.c:3581 [inline]
>  rtnl_newlink+0x728/0xa04 net/core/rtnetlink.c:3594
>  rtnetlink_rcv_msg+0x484/0x82c net/core/rtnetlink.c:6091
>  netlink_rcv_skb+0xe8/0x1d4 net/netlink/af_netlink.c:2540
>  rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:6109
>  netlink_unicast_kernel+0xfc/0x1dc net/netlink/af_netlink.c:1319
>  netlink_unicast+0x164/0x248 net/netlink/af_netlink.c:1345
>  netlink_sendmsg+0x484/0x584 net/netlink/af_netlink.c:1921
>  sock_sendmsg_nosec net/socket.c:714 [inline]
>  sock_sendmsg net/socket.c:734 [inline]
>  ____sys_sendmsg+0x2f8/0x440 net/socket.c:2482
>  ___sys_sendmsg net/socket.c:2536 [inline]
>  __sys_sendmsg+0x1ac/0x228 net/socket.c:2565
>  __do_sys_sendmsg net/socket.c:2574 [inline]
>  __se_sys_sendmsg net/socket.c:2572 [inline]
>  __arm64_sys_sendmsg+0x2c/0x3c net/socket.c:2572
>  __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
>  invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
>  el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
>  do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
>  el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
>  el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
>  el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
>
