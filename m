Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121CAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Feb 2022 09:24:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4c74dfe3;
	Tue, 8 Feb 2022 09:23:10 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c0898543
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Feb 2022 09:23:08 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id p5so47919348ybd.13
 for <wireguard@lists.zx2c4.com>; Tue, 08 Feb 2022 01:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v76WYw+Y0qvP4uX30X1KgyYe/e2hfdHgurh6EKNW+q8=;
 b=n1nAaz8mpAHyjSZbhJO8QIbsIa5zxJfvygj1pQr2QNjKJTccmyrcbRbzPDkMAKs5ts
 DJ87Gl3nQ4o6p1LkBwQmsl2gOa0Z+zt7j/lDCunDTBVsG16tbwuBLsHvQ2C0uIRpgOQA
 WYxkyc+QaeiMs25HR9WMBholE65iyKKgdQkEaenWyoXhTQn/KVfgNajmSMdPzCChmIwR
 ciN14kdB1jJNt9G5Nn92zW+ZWRtc/X9vD7+Ujddwmk1bo+ITNcHy7NVkCrDk8prn/sMW
 FjF5Onpw+OSdNTVDCKJ7xujLHo2FogRS/e5D9a1MfNzQF10J/zUGlMLJPlrDjkEttoVs
 FNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v76WYw+Y0qvP4uX30X1KgyYe/e2hfdHgurh6EKNW+q8=;
 b=bUR/1j18GenMywi14Mnt24WfEbtlziBY2N8ztt0LlmQ0QgGn2GUoAgPRIWrv46a95P
 v9T2I19p8zWOipmLbzIwdSrWNcDhHlY+1gFTJKeObXoaWgM5nleI13525k/luBTmCzbP
 Cl+BmuYrLaNyISCGfmfJCRXq04AV6I14SWvhq0TLQC5WQT1mxZPHiOlHGpzlrG7CTMqY
 l9MEpbU0NwiwfrcQeHzNWeMEoX34auAd4LpHqOtRVd4vDyYt3h80zK9jTza2/jyQUOpY
 u5//jhJnnhiwP8GkhUtm7o40DMX1SWuumHWV6nzt3tYr5ybkTUmQluCZ2/SG9iKgKObg
 MKlQ==
X-Gm-Message-State: AOAM530hb0BhCbbMGBblsw0tfBdZL4Ndg9xZjU7QBttQEQMjbVOA1rHG
 sYeujk2imAWLDK2IU3zfsMO2lcsOPx8nKSqMUqTrQQ==
X-Google-Smtp-Source: ABdhPJzLRXokh9NY389zkuq7SRqJcDaCXcyuFgSKt6O1g6TLHOTBGT49eRBXwG18qgajp+IKjQlAfWJwMSjXV8jlX64=
X-Received: by 2002:a25:148b:: with SMTP id 133mr3797329ybu.270.1644312186679; 
 Tue, 08 Feb 2022 01:23:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000f5988505d77e20e4@google.com>
In-Reply-To: <000000000000f5988505d77e20e4@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 8 Feb 2022 10:22:55 +0100
Message-ID: <CANpmjNPW7Y9oHkdvfYjgEo0OCbtN1Ymf1mXE1CHFBj2oryfJ=g@mail.gmail.com>
Subject: Re: [syzbot] KCSAN: data-race in wg_packet_handshake_receive_worker /
 wg_packet_rx_poll (3)
To: syzbot <syzbot+ed414b05fe54c96947f8@syzkaller.appspotmail.com>
Cc: Jason@zx2c4.com, davem@davemloft.net, kuba@kernel.org, 
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

On Tue, 8 Feb 2022 at 10:13, syzbot
<syzbot+ed414b05fe54c96947f8@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    455e73a07f6e Merge tag 'clk-for-linus' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=131009feb00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e1f9a6122410716
> dashboard link: https://syzkaller.appspot.com/bug?extid=ed414b05fe54c96947f8
> compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ed414b05fe54c96947f8@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in wg_packet_handshake_receive_worker / wg_packet_rx_poll
>
> read to 0xffff88813238a9e0 of 8 bytes by interrupt on cpu 1:
>  update_rx_stats drivers/net/wireguard/receive.c:28 [inline]
>  wg_packet_consume_data_done drivers/net/wireguard/receive.c:365 [inline]
>  wg_packet_rx_poll+0xf6b/0x11f0 drivers/net/wireguard/receive.c:481
>  __napi_poll+0x65/0x3f0 net/core/dev.c:6365
>  napi_poll net/core/dev.c:6432 [inline]
>  net_rx_action+0x29e/0x650 net/core/dev.c:6519
>  __do_softirq+0x158/0x2de kernel/softirq.c:558
>  do_softirq+0xb1/0xf0 kernel/softirq.c:459
>  __local_bh_enable_ip+0x68/0x70 kernel/softirq.c:383
>  __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
>  _raw_spin_unlock_bh+0x33/0x40 kernel/locking/spinlock.c:210
>  spin_unlock_bh include/linux/spinlock.h:394 [inline]
>  ptr_ring_consume_bh include/linux/ptr_ring.h:367 [inline]
>  wg_packet_decrypt_worker+0x73c/0x780 drivers/net/wireguard/receive.c:506
>  process_one_work+0x3f6/0x960 kernel/workqueue.c:2307
>  worker_thread+0x616/0xa70 kernel/workqueue.c:2454
>  kthread+0x2c7/0x2e0 kernel/kthread.c:327
>  ret_from_fork+0x1f/0x30
>
> write to 0xffff88813238a9e0 of 8 bytes by task 5035 on cpu 0:
>  update_rx_stats drivers/net/wireguard/receive.c:28 [inline]
>  wg_receive_handshake_packet drivers/net/wireguard/receive.c:205 [inline]
>  wg_packet_handshake_receive_worker+0x54a/0x6e0 drivers/net/wireguard/receive.c:220
>  process_one_work+0x3f6/0x960 kernel/workqueue.c:2307
>  worker_thread+0x616/0xa70 kernel/workqueue.c:2454
>  kthread+0x2c7/0x2e0 kernel/kthread.c:327
>  ret_from_fork+0x1f/0x30
>
> value changed: 0x0000000000000aa8 -> 0x0000000000000ac8

Hi Jason,

For stats data races, in the majority of cases if the semantics is
"approximate" no harm is done, so the usual resolution is to mark them
intentionally racy with data_race() [1].

I've released these for completeness, but I can also skip them in
future. However, marking them appropriately helps because when all
intentionally racy accesses are marked, only "bad races" will be left,
and we can do less pre-moderation.

Thanks,
-- Marco

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/access-marking.txt
