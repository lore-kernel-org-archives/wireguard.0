Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3525D10F58
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:01:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab5efe70;
	Mon, 18 Nov 2024 01:38:12 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 10792feb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Oct 2024 07:44:05 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a342e872a7so68304515ab.3
 for <wireguard@lists.zx2c4.com>; Wed, 09 Oct 2024 00:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728459843; x=1729064643;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/cIM4FzGaC91vtdSI5kp+oxCUFiOwgoAfMBzSugYPic=;
 b=e6npuzrTFRtbERzV44IlXQ9aaYLAtzuAgDs9rBObMfpJ3OClq/Vpo4O3IEOYJomuvV
 MfGfrI25evWorV+/44AccQ979bvlprMcgTT8vhgG78IAmItMzghfIJ1Y8kJu49fL26Rf
 h2WOvGd1RtV6PfigZtfrwLcd4VDmZOxz1c5/d95tSQjnaiXIcvK5/sKeyzdY1RyfNW8W
 Nb/4XzrvsMMwhcDZSRhPDUsVmqelkOSih+/LLUCSfTDLlso/GO3XKUy6kjyRB3STMb1v
 aNHAsIfE3b7WRdFBvujeXEc/B+QMTMbc9ZT0B3geRdOQi4aXUlg2o2TLT0jY30q1gLZA
 MQUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWcja/qgNrA2o48zX3gOlfcxNco6yBxJ4bA+zW+iQ+JurrxBFa8Nb46JJmq/bhxt0fCXnHOfp55Iw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz+669vGR/gZ3npoBmd0J64VPxr6041Y3BP/QRfe34duM/rOvR3
 BOQwNP1onU1bSpTN/JDXZE/4MBG7vy0akOaCjjJF/BAKVtcuu0/rSTs39Jl7kw3Vp/WhRNfPGIR
 9wGuSHxmRrzR2vAls/naKG1/1Bqu174oICiLrQF0q5dWQtC0HLLVBZGI=
X-Google-Smtp-Source: AGHT+IGQUQlE1emHK5BMoVHftqjMHMKZ9WzpGESuX/WJupIlx748u5PWWxzaIpPs7tVEVvN3RxleI5Ir+epplxZsh4OdZn5wVcaV
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152b:b0:3a2:463f:fd9e with SMTP id
 e9e14a558f8ab-3a397ce4910mr11518575ab.6.1728459843585; Wed, 09 Oct 2024
 00:44:03 -0700 (PDT)
Date: Wed, 09 Oct 2024 00:44:03 -0700
In-Reply-To: <66fa2708.050a0220.aab67.0025.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67063443.050a0220.22840d.000f.GAE@google.com>
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

syzbot has bisected this issue to:

commit dfa0a574cbc47bfd5f8985f74c8ea003a37fa078
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Wed Jun 5 10:09:11 2024 +0000

    sched/uclamg: Handle delayed dequeue

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13c2d7d0580000
start commit:   e32cde8d2bd7 Merge tag 'sched_ext-for-6.12-rc1-fixes-1' of..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1022d7d0580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17c2d7d0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=286b31f2cf1c36b5
dashboard link: https://syzkaller.appspot.com/bug?extid=7da6c19dc528c2ebc612
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146ae580580000

Reported-by: syzbot+7da6c19dc528c2ebc612@syzkaller.appspotmail.com
Fixes: dfa0a574cbc4 ("sched/uclamg: Handle delayed dequeue")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
