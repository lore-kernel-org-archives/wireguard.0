Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC85C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jan 2022 21:10:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ea10c850;
	Sun, 16 Jan 2022 21:10:51 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b5bb4872
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jan 2022 07:42:48 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id h14so27409019ybe.12
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jan 2022 23:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Wk/qGtz26hTAu2Z0ry2fUvvnKiyHU/sS4gV9WX8tBw4=;
 b=jI39erstFBgNIGGl+tQmwBiWrUIc9bgBj2bYOdDXTCO9Pd8IbRWtD9TS2r5MHOCHG+
 bPQlZGT7uj2aIkyb6hA3i11qstvrr0xHAd+mOW0cY6G9+T/e3OHnqOnGnS4ZKsqH7DPJ
 ofxAqXjCIf/xFi8OzWqkvjrvZASqHZSCrfRB8yQPQ7WPFCgdN1jNIKWyM1dC9AM9bXE4
 iiL5R0dwuy7J1t4mzrqIkGQZyqBiTURI07s+gq5Q74CgbzHSNcJPVqFHnPg1g1wULvN+
 1mb+7A8KVG/MiNByEUVrtLRl1jYB+Pdc+hp+0K4ZSuaspxApTgzOAwTppyf1/UFT22CX
 H18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Wk/qGtz26hTAu2Z0ry2fUvvnKiyHU/sS4gV9WX8tBw4=;
 b=2bmD+oxYL9WO+aAlO5wivxmRP6RsLwaEOOZZLeNNWooZvYNWS/a+ZDedxuxydZkjPR
 x6ZVkuaygs+ZXXiLj+++mNaeSgedayaF0RvGByVtLSU5F2y9nhhCbs4VdtPpuCM/YNDn
 lNnhozAYaCzI17wSf5ykvSteWyVNtzRvyDHUgstfJJS53A9/9zbNS0T5jJ7XUYknhh+/
 XgylepOfe/AZ+eEbC4mV9gvhzFlzvFuGcKBF2IJhW2B5XH9kon6x2LRKRDgQ/xp2nUrK
 saTgU3qjFNF+n6EBczQkByu8qNPzLOhg424IUKS0z+jNxYZ6aj+4t1hRp8KRnrJNY/DW
 YWdQ==
X-Gm-Message-State: AOAM530MrQT0vG+2nezVc1j/ZDMXMgww/Wk78sFkYMuOqBprIbSQ6GVj
 MPi4F8LN9PPJ93dHwycI6mJX1r2o+mDgM3+2JoU=
X-Google-Smtp-Source: ABdhPJyMRjDffGb4p4uOnDBwu0Qf279Fkk2F9HdUxM/rBqwFZ2JxNZsc3ES+DqcDwIb3BowdrEqXErSucCWsR0TnKvQ=
X-Received: by 2002:a25:4aca:: with SMTP id x193mr4438918yba.149.1641886967694; 
 Mon, 10 Jan 2022 23:42:47 -0800 (PST)
MIME-Version: 1.0
From: cruise k <cruise4k@gmail.com>
Date: Tue, 11 Jan 2022 15:42:37 +0800
Message-ID: <CAKcFiNC1w87Of0ukV3oPHiAkKeVT7bbTqG3p1LgoUs0bGXk9CQ@mail.gmail.com>
Subject: INFO: task hung in wg_noise_handshake_consume_initiation
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 16 Jan 2022 21:10:46 +0000
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

Hi,

Syzkaller found the following issue:

HEAD commit: 75acfdb Linux 5.16-rc8
git tree: upstream
console output: https://pastebin.com/raw/E1a5ZGSt
kernel config: https://pastebin.com/raw/XsnKfdRt

And hope the report log can help you.

INFO: task kworker/6:1:78 blocked for more than 143 seconds.
      Not tainted 5.16.0-rc8+ #10
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/6:1     state:D stack:26416 pid:   78 ppid:     2 flags:0x00004000
Workqueue: wg-kex-wg1 wg_packet_handshake_receive_worker
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:4972 [inline]
 __schedule+0xcd9/0x2550 kernel/sched/core.c:6253
 schedule+0xd2/0x260 kernel/sched/core.c:6326
 rwsem_down_read_slowpath+0x59c/0xa90 kernel/locking/rwsem.c:1041
 __down_read_common kernel/locking/rwsem.c:1223 [inline]
 __down_read kernel/locking/rwsem.c:1232 [inline]
 down_read+0xe2/0x440 kernel/locking/rwsem.c:1472
 wg_noise_handshake_consume_initiation+0x271/0x5f0
drivers/net/wireguard/noise.c:599
 wg_receive_handshake_packet+0x589/0x9d0 drivers/net/wireguard/receive.c:151
 wg_packet_handshake_receive_worker+0x18e/0x3d0
drivers/net/wireguard/receive.c:220
 process_one_work+0x9df/0x16a0 kernel/workqueue.c:2298
 worker_thread+0x90/0xe20 kernel/workqueue.c:2445
 kthread+0x405/0x4f0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>
