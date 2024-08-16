Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DCBC5472E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 08:47:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3c41789;
	Mon, 26 Aug 2024 08:38:14 +0000 (UTC)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc50e286
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Aug 2024 18:24:39 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2d3baf38457so2231739a91.0
 for <wireguard@lists.zx2c4.com>; Fri, 16 Aug 2024 11:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723832677; x=1724437477; darn=lists.zx2c4.com;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4RwvB+WPYoDnWK8A0tq8EiazLJfKL2CtNS7fQiVukC0=;
 b=bOEs/6nyPp2rgrCkw/phN0vqRag+gbpfnZIdzFKR5Q75pJL+XcyAqy5qYZavZrE4g1
 aKUw9Bxp0tZ6jOLh3InLftHUe8M+Uf6vTPPS4eCRBKPDVU4Po7KG7dnhZraXhA6j0stj
 BuOe+LwL44QP9yavLa00nB7yWxeN0B0wmbNCVrG2GcaAK20dAC5WpDEZoc+1T7xXWlVK
 6fbXTCOqIRwPU4uyj10g6wraQ6bTUbKGYmU2D4sXZfeX8r9gKvqfCgpb0jG1GrTA7TH0
 edFQvK1SvK8sApd7V25ftc40pI2tstrkmL19mkNbvogRnvLStsg4aLMTCQW649LJhMEK
 Jp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723832677; x=1724437477;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4RwvB+WPYoDnWK8A0tq8EiazLJfKL2CtNS7fQiVukC0=;
 b=tKsHTItSnPoILmHxC9OM9cZSoShNLh1WgW13R0BVIDHTfCYTjl52wi/YmCFsx7ze7w
 rWcDVo1SO/eOythLTFQta4e0OOlxRfVjzwLaWurWRKCyt7lwBuHRwiAHaqebwfzCs9MF
 3Vqi7NXu7lCoYBrwMWyhnPj1x8OHZ7/6HWXSI+q6A3008Zj0RuJ8+0yQzcH4ScAVw7km
 G2lJtXYNR6w55fC6LbYDxj3nJ2t509SrQNqu1QYpfNyQNPrVwwS9mFf/2zSOkii5YZna
 +U6sYWpp5Uqhp2izHOMnbf+jZ5LFgyPMH73YVOetHZ57QdFPQsT1LQp+ssFq2VKMDZoY
 H94Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVozn6W4b18VWazFvmWUyv6UWFy9TFOCoVk3eNB3+XGuwKF7A1S4jb0sr5t1g+OpWzVE56mOrqRTUx+yALhjT/JMenGZ2Bw62hT
X-Gm-Message-State: AOJu0YwOxdxTZfAueo30hU/UfaWrUWHh9lXQ1SMfwd8SoCZTgTcfhiW2
 34lCAtk79G8AfOinE0mPkTTPFiANeCyEWU2Rdqkkj8D6Fh6IjYG/bB65JNCahFCi+xpjFkprUqO
 Kpw==
X-Google-Smtp-Source: AGHT+IFTs6mafYXYQyMdbVzMHx30DteW5lbCrThkaAk8B3G1fl2Zt7Rvnd8UnKlKrq/X37xDttudYA8SWrg=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1906:b0:2c9:5ca5:4d20 with SMTP id
 98e67ed59e1d1-2d3c3723c6amr46011a91.0.1723832677231; Fri, 16 Aug 2024
 11:24:37 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:24:35 -0700
In-Reply-To: <0000000000006eb03a061b20c079@google.com>
Mime-Version: 1.0
References: <0000000000006eb03a061b20c079@google.com>
Message-ID: <Zr-ZY8HSGfVuoQpl@google.com>
Subject: Re: [syzbot] [kvm?] general protection fault in get_work_pool (2)
From: Sean Christopherson <seanjc@google.com>
To: syzbot <syzbot+0dc211bc2adb944e1fd6@syzkaller.appspotmail.com>
Cc: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="us-ascii"
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

On Mon, Jun 17, 2024, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2ccbdf43d5e7 Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16f23146980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=81c0d76ceef02b39
> dashboard link: https://syzkaller.appspot.com/bug?extid=0dc211bc2adb944e1fd6
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-2ccbdf43.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/13cdb5bfbafa/vmlinux-2ccbdf43.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/7a14f5d07f81/bzImage-2ccbdf43.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0dc211bc2adb944e1fd6@syzkaller.appspotmail.com

See https://lore.kernel.org/all/Zr-Ydj8FBpiqmY_c@google.com for an explanation.

#syz invalid
