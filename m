Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569EFC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8a10715;
	Tue, 20 May 2025 19:43:44 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b72d651c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Mar 2025 23:20:05 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85dd46b20bfso258666039f.2
 for <wireguard@lists.zx2c4.com>; Fri, 28 Mar 2025 16:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743204004; x=1743808804;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yCVG857K8spOJ4YsQYg/bfS5ks2fAnUWHrw003r3ztI=;
 b=dkjKCUq9Rn+tOBfvwYGHr2GQIPo5IwshIRsugbJ02jLGGqnAz80WGEPtvGLvoFLKFb
 76QZUtiQotg7oZeSAoUO5+xgwR3vlfq8oQ7dQNKrwX8X1eKB7Ld42dwu4p3vK/IxeQD7
 wBCcoK5rPGs+NvSGkGN/eBhyyIeh34JxzIQpTva7Pux+3GOohUzyL3baLmpVbXlt5U1J
 xpkTfqzl5mPegXW3wUUH4uZEQ8djojLqDf8t7SOo3a4V1AWzZWfeFPar9IaN3nTXwpZh
 EntETYf8aoFXDfqm4ix16DEi1lW2iRe+NujCbTTzO45ZGVl7evxHcnHlMOfXIQ6PizPV
 r4KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXl8gCdTF9tr4LZHY11RaGNSG5903aFBNrLZwy+FCbOi4yW706fjA/CHk0jm/PrWKmHHv5WG9Trkk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YysKWx9q/uoa9LO+dly4XSJxZMDyUY2hPSZFYIPCjwnhXD8u+mO
 SBeu2Cy2WZ3c+e/tui32Lh4zuHrw1YYLlwDuGaJz7Oe2RB5s8RFulwtX8886kwbMVvhVI5fOK7l
 xNvzt4CDX8M7chimskMtWb8l66N4UwTEi5i25nIk3iQgSSv8zp77Pp6o=
X-Google-Smtp-Source: AGHT+IGBjmKtWhEv7cg6OyvtdjVUV7yXiaEddspakjNLmB55uy4vp7Q5fbPmsWneys0zmDsOBerGwJgwNvWr52PoFKTGX4KCoLBw
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2144:b0:3d4:6ff4:260a with SMTP id
 e9e14a558f8ab-3d5e08e9ecdmr15302375ab.2.1743204003938; Fri, 28 Mar 2025
 16:20:03 -0700 (PDT)
Date: Fri, 28 Mar 2025 16:20:03 -0700
In-Reply-To: <66fa2708.050a0220.aab67.0025.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e72ea3.050a0220.1547ec.0000.GAE@google.com>
Subject: Re: [syzbot] [wireguard?] INFO: task hung in wg_destruct (2)
From: syzbot <syzbot+7da6c19dc528c2ebc612@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, bsegall@google.com, davem@davemloft.net, 
 dietmar.eggemann@arm.com, dsahern@kernel.org, edumazet@google.com, 
 jason@zx2c4.com, juri.lelli@redhat.com, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
 netdev@vger.kernel.org, pabeni@redhat.com, peterz@infradead.org, 
 rostedt@goodmis.org, syzkaller-bugs@googlegroups.com, 
 vincent.guittot@linaro.org, vschneid@redhat.com, wireguard@lists.zx2c4.com
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

syzbot suspects this issue was fixed by commit:

commit 66951e4860d3c688bfa550ea4a19635b57e00eca
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Jan 13 12:50:11 2025 +0000

    sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16f07804580000
start commit:   e32cde8d2bd7 Merge tag 'sched_ext-for-6.12-rc1-fixes-1' of..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=286b31f2cf1c36b5
dashboard link: https://syzkaller.appspot.com/bug?extid=7da6c19dc528c2ebc612
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146ae580580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
