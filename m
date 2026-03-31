Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4734C10F92E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2026 17:17:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3d05d021;
	Tue, 31 Mar 2026 17:17:32 +0000 (UTC)
Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com
 [209.85.161.77])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 95491e5a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2026 17:17:29 +0000 (UTC)
Received: by mail-oo1-f77.google.com with SMTP id
 006d021491bc7-67e42861891so2700909eaf.3
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2026 10:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774977448; x=1775582248;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hteMWmC5zuwxY1wca9+Xqy4IWjKYX39OfCnF/7yj5mU=;
 b=X6FoafY4D+PLQDAI5nvRSGzu/VMVRYrXnLxX29Vf1Vb8sdgbuHEhEb0MPwQ8kFIJ3H
 2DMuIE2snZwjq9Fo4CXtBGc0veB+M+WnKkuDcvVwG2eQuk1mCdGVonCDiGpnJ3hwxUhX
 EKK/1L3B2gVMNBDLIVlDk6Uw3cXXNL9/6Ojh8LNqAuM1GT9zQ6P1+eAlRGj5G4zW2wu8
 Aj8yDdh83tyyGjqeZ/HwrunEtdFx0W9fJppLONK/uyMNhBQjV+tVfaEyyb77TMj9sDsM
 Eg5u3z2hgyM7Nyz1tqmrQGlbA597mlWwZZtiAXOHVHnlGzmiXOnZNdAQIGn5REJZqpKo
 BYZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxw1kLMzGeNNCezvWBzvBw2YcLwr4T+xU7ocy/Amm4Y5ohQIledYsXxGe0u8LBMahMcbEApKyObmw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwjGj04WiuFq2DHwTWeVW5R9NOAxTnfi7n75Up9JkhEChmcjxAC
 +yVOSTceXBnLEZjtOIQYNJJ+Fpeql5FJeY5wCVOsU7i+Va0duBcPBZriV/km9HIQocSKY29MfsX
 O6mfxPBafXgHlsK2EPINezrPVEQ1agP1TKYx9Kpu0ZUxhHoFD9iSCAJcqOrU=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d03:b0:67b:c122:d2c8 with SMTP id
 006d021491bc7-67fabc982c6mr14767eaf.39.1774977447940; Tue, 31 Mar 2026
 10:17:27 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:17:27 -0700
In-Reply-To: <000000000000bd671b06222de427@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69cc01a7.050a0220.183828.002d.GAE@google.com>
Subject: Re: [syzbot] [net] INFO: task hung in tun_chr_close (5)
From: syzbot <syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, andrew@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, jason@zx2c4.com, jasowang@redhat.com, jhs@mojatatu.com, 
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 mail@country-targeted-traffic.com, netdev@vger.kernel.org, 
 newsletter@monkeydigitaldeals.com, pabeni@redhat.com, 
 syzkaller-bugs@googlegroups.com, vinicius.gomes@intel.com, 
 willemdebruijn.kernel@gmail.com, wireguard@lists.zx2c4.com, 
 xiyou.wangcong@gmail.com
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    47ab2c12c87a Merge branch 'correct-bd-length-masks-and-bql..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=153aed02580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91
dashboard link: https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1286e8d2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106df5da580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/289234295ce6/disk-47ab2c12.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b3f30eb7dc01/vmlinux-47ab2c12.xz
kernel image: https://storage.googleapis.com/syzbot-assets/62a0f5642c08/bzImage-47ab2c12.xz

The issue was bisected to:

commit 5a781ccbd19e4664babcbe4b4ead7aa2b9283d22
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date:   Sat Sep 29 00:59:43 2018 +0000

    tc: Add support for configuring the taprio scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11535418580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13535418580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15535418580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com
Fixes: 5a781ccbd19e ("tc: Add support for configuring the taprio scheduler")

INFO: task syz-executor:5978 blocked for more than 143 seconds.
      Not tainted syzkaller #0
      Blocked by coredump.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22400 pid:5978  tgid:5978  ppid:1      task_flags:0x40054c flags:0x00080003
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0x15dd/0x52d0 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7008
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7065
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0x7fe/0x1300 kernel/locking/mutex.c:776
 tun_detach drivers/net/tun.c:634 [inline]
 tun_chr_close+0x3e/0x1c0 drivers/net/tun.c:3436


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
