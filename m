Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA95C5321E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 08:47:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5782753f;
	Mon, 26 Aug 2024 08:38:03 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8021ec3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2024 04:53:04 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-822372161efso381200339f.0
 for <wireguard@lists.zx2c4.com>; Sun, 11 Aug 2024 21:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723438383; x=1724043183;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DCIUv5W1hQZANZ1PEvV4VxKZP1pSyOaOOcCYK3C1sQI=;
 b=vO3HOXdLArhx9C7PYcvr48emp8N4t6wtVw9yHxFw/sD2jRM7qXUTwesUjt34RjmNJs
 tKk1TEPb1enDpJbfVvzsTlsYM0Jk2c++xsNalm9RCR+mMrNwmUsZX4oxOAFrIoYCNDu4
 MR5a0wPg6uyF8mKJ3/iOaf5JqEW8gb8Loa/PN4wRq936nbTvSp0Bl6LC1GoGYN+AUJyk
 LG8mIjQZDBAZn1ApBhB8SsILA4GaFNzxKy/7JyzDpn00clgkseQkS8ksCcKbGE2hpAXd
 8+tBW0KX7R74bDwpNznuhpXk1pTu80VdgBFicDfLERd3rc0uN+WoKHuoytGdPA8nce4h
 0wAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUatgcUFVtzvEf630Kd5LHzxaNK33Z4as3I82wZBWXHpGbygZ7s3ulGSaEbwdPYgWTeCPfu2rRv1gWxqHQOQpk59mwqBbmlr1e
X-Gm-Message-State: AOJu0YyYu/w27nzqngwASjN8dIRqMDe3TXcrvktANIG2qOb9UcHEPqCP
 hKgY/fsLdp4LmLjm98Bk/1lo2S5EhS2EoVo2QWw6O+FWG9TifuJPiwtwiA36WEFwJhCQfS0Rx/J
 huI3LOveCoUes1Iy+U7eVc3iFgs3maN7YZdakdquy8DYR9QW69JCtXW4=
X-Google-Smtp-Source: AGHT+IHYd+OnzWf3WONlYUINKA2XYz4D597wPU1q1yxE0VsRcZoM2LIA3Gz9v5hY/DdXx/pnUZRWQH+QReSO0PWFGZ2UzuXHaJcN
MIME-Version: 1.0
X-Received: by 2002:a05:6602:640d:b0:806:bf73:1167 with SMTP id
 ca18e2360f4ac-8225ee96f73mr27822739f.3.1723438382830; Sun, 11 Aug 2024
 21:53:02 -0700 (PDT)
Date: Sun, 11 Aug 2024 21:53:02 -0700
In-Reply-To: <00000000000061c0a106183499ec@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000099eca4061f754420@google.com>
Subject: Re: [syzbot] [wireguard?] WARNING in kthread_unpark (2)
From: syzbot <syzbot+943d34fa3cf2191e3068@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, 
 gregkh@linuxfoundation.org, hdanton@sina.com, jason@zx2c4.com, 
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 oneukum@suse.com, pabeni@redhat.com, stern@rowland.harvard.edu, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tj@kernel.org, 
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

syzbot has bisected this issue to:

commit b3e40fc85735b787ce65909619fcd173107113c2
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu May 2 11:51:40 2024 +0000

    USB: usb_parse_endpoint: ignore reserved bits

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ca267d980000
start commit:   dc1c8034e31b minmax: simplify min()/max()/clamp() implemen..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ca267d980000
console output: https://syzkaller.appspot.com/x/log.txt?x=15ca267d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2258b49cd9b339fa
dashboard link: https://syzkaller.appspot.com/bug?extid=943d34fa3cf2191e3068
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1022b573980000

Reported-by: syzbot+943d34fa3cf2191e3068@syzkaller.appspotmail.com
Fixes: b3e40fc85735 ("USB: usb_parse_endpoint: ignore reserved bits")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
