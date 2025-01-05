Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2547EC54ECC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cc50687;
	Tue, 20 May 2025 19:37:49 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 59397c0f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2025 15:45:03 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3a9d303a5ccso277198365ab.3
 for <wireguard@lists.zx2c4.com>; Sun, 05 Jan 2025 07:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736091902; x=1736696702;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aYO2mT0l8UdFQloxr21510y8jZ+d6H783XFANJKB5e4=;
 b=m1ClDcBdbi7JpEsISBp9GTOssJce8OI/LJSILYmKE5cziVIsg+FFdAxp7FTZJ9yzeU
 D0YhKH8hHIFJD1YBF6XOSYbjDZ4B0jSm7ELCB/KOocb2hSobp3uhdA3tgQrDExFBPDiv
 u5+qhmjxUGdv4QGHAmg4YxyZrcRiIq2jUyIMl3E28BIKA4X1asEIi9Q9MnTylbyGO6Tl
 U2nvfurA8ATrZshIgtsV4OwQ2Omh1RrlzjZHBvBE8onwQFdvYBD1sgBkzCDNJquWdU0/
 J3OwFxipkcRhT5OwCSmGSDADwoWpQrPozRoslNUsCG6Aj2JwY2bJAit0nGJzbyA7WIUq
 63kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW977kGp0xbY7au4FXZnq3jh5m/MwdCZ4knppa55rRzfM2NdaNGbyQ7Zim4BWyGm8xDdtjPEk1jncI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwwVX2vJdPFaAW9oOyXWvz/eDR9t2c1MWb7Q+Zhwc659xBjpW8a
 HjN5UKbtYKFgIjT2YBzVZNdOAfYV0IgATfVmz0y/WTVn+zaSNqEGRu2rVZA2J1IqdU3mRtvaFtK
 B715WQSuRrcD4YaqCZ8W1yAYjRtfsLHsaXrPAmRenyppzEllnzJFEgEc=
X-Google-Smtp-Source: AGHT+IFwCap45szDJbgHItMrNynRyqPDv0rMUC6X/I/GFjB+cEFn4XLaNGO4GeV3q5BlT/r5RZH/dBDV6dduH0YJsOYQBW0UD/dB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d94:b0:3a7:e047:733f with SMTP id
 e9e14a558f8ab-3c2d1e7f8f0mr533683665ab.1.1736091901794; Sun, 05 Jan 2025
 07:45:01 -0800 (PST)
Date: Sun, 05 Jan 2025 07:45:01 -0800
In-Reply-To: <000000000000bd671b06222de427@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677aa8fd.050a0220.380ff0.0019.GAE@google.com>
Subject: Re: [syzbot] [net] INFO: task hung in tun_chr_close (5)
From: syzbot <syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, andrew@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, jason@zx2c4.com, jasowang@redhat.com, jhs@mojatatu.com, 
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 mail@country-targeted-traffic.com, netdev@vger.kernel.org, pabeni@redhat.com, 
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

syzbot has bisected this issue to:

commit 5a781ccbd19e4664babcbe4b4ead7aa2b9283d22
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date:   Sat Sep 29 00:59:43 2018 +0000

    tc: Add support for configuring the taprio scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11535418580000
start commit:   7ed2d9158877 qed: fix possible uninit pointer read in qed_..
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13535418580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15535418580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fee25f93665c89ac
dashboard link: https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112374f8580000

Reported-by: syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com
Fixes: 5a781ccbd19e ("tc: Add support for configuring the taprio scheduler")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
