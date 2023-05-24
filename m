Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1B1C7EE33
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 May 2023 15:33:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6015797;
	Wed, 24 May 2023 15:33:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86418104
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2023 15:33:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C174263385;
 Wed, 24 May 2023 15:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7922C4339C;
 Wed, 24 May 2023 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684942423;
 bh=88v5bOvUrHpnigzjD7xR3ehZTKQzCviyqHGY6Krfgxk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nZ0/YZCGN+y4Pnj8RFVrtv/aa7OoIMusnYX2i0bHSk0upcrNedee0iJe+T7ZA+UMc
 VKXxpJt/8x+rpyZqd4SdrXnxWeBIZfkNHcAbEZXHIh6zgOnAuAg4fdqMP5Oz1by3lp
 8lHeciDHiVh1V6exuh2DDo/VWDhgqT7EjlVeXzNqsrDqbjah/6gOp1uX9QP5QJx4C5
 Mo6ZNRL5VvsS/BlsYqZJe8dhZYj2eOgU6xXy3SyhTQknJRBDJiV9l6xVyh53/77YpJ
 pU8u/t9DATb3dXTxPTT4TBvi4R8GdYgLb4Zmr/+13FLPWdLXALLpQXnCa4COmk39u/
 psDsfH8PfTAIw==
Date: Wed, 24 May 2023 08:33:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Eric Dumazet <edumazet@google.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, syzbot
 <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 wireguard@lists.zx2c4.com, jann@thejh.net
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
Message-ID: <20230524083341.0cd435f7@kernel.org>
In-Reply-To: <CACT4Y+YcNt8rvJRK+XhCZa1Ocw9epHg1oSGc28mntjY3HWZp1g@mail.gmail.com>
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <CANn89iLVSiO1o1C-P30_3i19Ci8W1jQk9mr-_OMsQ4tS8Nq2dg@mail.gmail.com>
 <20230523094108.0c624d47@kernel.org>
 <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
 <20230523094736.3a9f6f8c@kernel.org> <ZGzxa18w-v8Dsy5D@zx2c4.com>
 <CANn89iLrP7-NbE1yU_okruVKqbuUc3gxPABq4-vQ4SKrUhEdtA@mail.gmail.com>
 <CANn89iKEjb-g1ed2M+VS5avSs=M0gNgH9QWXtOQRM_uDTMCwPw@mail.gmail.com>
 <CACT4Y+YcNt8rvJRK+XhCZa1Ocw9epHg1oSGc28mntjY3HWZp1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 24 May 2023 10:24:31 +0200 Dmitry Vyukov wrote:
> FWIW There are more report examples on the dashboard.
> There are some that don't mention wireguard nor usbnet, e.g.:
> https://syzkaller.appspot.com/text?tag=CrashReport&x=17dd2446280000
> So that's probably red herring. But they all seem to mention alloc_netdev_mqs.

While we have you, let me ask about the possibility of having vmcore
access - I think it'd be very useful to solve this mystery. 
With a bit of luck the timer still has the function set.
