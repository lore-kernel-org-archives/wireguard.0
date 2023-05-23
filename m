Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF3C7EE2D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 16:54:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1db64f5c;
	Tue, 23 May 2023 16:47:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8247898
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 16:47:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3102F61D9A;
 Tue, 23 May 2023 16:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF54C433D2;
 Tue, 23 May 2023 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684860457;
 bh=P+E5V4yXEwV4VUqoxxCmc9HAaXwmyldyY2acq1W/+PM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pbzoM1Hpl+yazUyCg6hK7RyG+Nl1KNz1thduWK5rlj/DAXNyM17RKgH4rKMzVZx/s
 I0Jb30N2z0k9k/hjBcRsOsxlOBtCUEIudPnzyh7WJtYqsvTgYlYfc/tzPuZRdNtuMF
 KuN5MNfvCZogp998Gl4N3DDslwHfASZ+K5w+EJhfXg6gUlspMAm8G0LOxC8yMx9Pb1
 kDAGJMryjHftqKwWMBMs/LOG0xQoFxFl0Fey0YB46baTfD44zoCNDzTTtOw+iA26yG
 MbZcICZd47I7v/SK1pGP4TIlYyJ/8wcShC3A+hKGqqNQlgDw+jYNwNOJo0ydFwGkX8
 28ou9u5iKY3qA==
Date: Tue, 23 May 2023 09:47:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eric Dumazet <edumazet@google.com>, syzbot
 <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 wireguard@lists.zx2c4.com, jann@thejh.net
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
Message-ID: <20230523094736.3a9f6f8c@kernel.org>
In-Reply-To: <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <CANn89iLVSiO1o1C-P30_3i19Ci8W1jQk9mr-_OMsQ4tS8Nq2dg@mail.gmail.com>
 <20230523094108.0c624d47@kernel.org>
 <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
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

On Tue, 23 May 2023 18:42:53 +0200 Jason A. Donenfeld wrote:
> > It should, no idea why it isn't. Looking thru the code now I don't see
> > any obvious gaps where timer object is on a list but not active :S
> > There's no way to get a vmcore from syzbot, right? :)
> >
> > Also I thought the shutdown leads to a warning when someone tries to
> > schedule the dead timer but in fact add_timer() just exits cleanly.
> > So the shutdown won't help us find the culprit :(  
> 
> Worth noting that it could also be caused by adding to a dead timer
> anywhere in priv_data of another netdev, not just the sole timer_list
> in net_device.

Oh, I thought you zero'ed in on the watchdog based on offsets.
Still, object debug should track all timers in the slab and complain
on the free path.
