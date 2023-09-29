Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB70EE728DE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Sep 2023 19:45:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a110fe49;
	Fri, 29 Sep 2023 19:45:22 +0000 (UTC)
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ef65ee0b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2023 19:45:21 +0000 (UTC)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1d66b019a27so30652946fac.0
 for <wireguard@lists.zx2c4.com>; Fri, 29 Sep 2023 12:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696016719; x=1696621519;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uOUbdmuYhfXA8PXd4YARC5tF6kjo7P/y7HVDRuq7ymQ=;
 b=hV1AcxSTMUoUY7uyhswSYA3HZJzThOsdrib3akjwXA9uUxfTt7PtRGXqypHrMzgltY
 7ubfbA6KIpqL4YEYpHAnNOTu4lwv2s/I3jfyzQ+R4e0/oWhfwGdTYjXIn9MmT9YxGlAT
 m2VASNhenWLxE5BniHsC3rkOk6/vG24fi8zQGIzH51jNOo/E+d1SllKnfHx3iZqwVMIZ
 env13nwKqvvh58UxQCbhIgPnmDhFdq9nCrOEZH+AUblZbUHSwlIY0ILIQtmw9zrcUJaB
 5L6VpaGdcTTtxarW6gGrSbcY/4uqCPp5ToIdnQi7Xw7agJelwzB4rHSMOhR9nkMI365q
 mXCg==
X-Gm-Message-State: AOJu0YzjY95/Kt1nK+GIPQNcr1kNsbrs6wMkexgkR19T/eCz0rOJWc8C
 sLqvAGx66b+jX9mXdMTl7EJtqEtbSvHN5yvw8c++EcGF3Pzq
X-Google-Smtp-Source: AGHT+IFYMqItjJEVGHOIHmUPeuMNaMxy8KqwKD+rwjOwwTOlXsRSXiwCv6oua1+5pQPktR4BQVSd+yRH6/cIOImXUzqYibBfr/5x
MIME-Version: 1.0
X-Received: by 2002:a05:6870:98ae:b0:1b0:9643:6f69 with SMTP id
 eg46-20020a05687098ae00b001b096436f69mr1969651oab.4.1696016719665; Fri, 29
 Sep 2023 12:45:19 -0700 (PDT)
Date: Fri, 29 Sep 2023 12:45:19 -0700
In-Reply-To: <00000000000021dc2806031ad901@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001be691060684aa2c@google.com>
Subject: Re: [syzbot] [wireguard?] INFO: rcu detected stall in
 wg_ratelimiter_gc_entries (2)
From: syzbot <syzbot+c1cc0083f159b67cb192@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, daniel.wippermann@resol.de, davem@davemloft.net, 
 edumazet@google.com, hdanton@sina.com, jason@zx2c4.com, jhs@mojatatu.com, 
 jiri@nvidia.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, pctammela@mojatatu.com, 
 syzkaller-bugs@googlegroups.com, victor@mojatatu.com, vladimir.oltean@nxp.com, 
 wireguard@lists.zx2c4.com
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

commit da71714e359b64bd7aab3bd56ec53f307f058133
Author: Jamal Hadi Salim <jhs@mojatatu.com>
Date:   Tue Aug 22 10:12:31 2023 +0000

    net/sched: fix a qdisc modification with ambiguous command request

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=129c464e680000
start commit:   8a519a572598 net: veth: Page pool creation error handling ..
git tree:       net
kernel config:  https://syzkaller.appspot.com/x/.config?x=3e670757e16affb
dashboard link: https://syzkaller.appspot.com/bug?extid=c1cc0083f159b67cb192
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=129f8553a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1205baada80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: net/sched: fix a qdisc modification with ambiguous command request

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
