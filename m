Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5014FC7EE23
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 16:54:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f0ea471;
	Tue, 23 May 2023 16:46:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dd0495c2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 16:46:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FC24633C6;
 Tue, 23 May 2023 16:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420CDC433D2;
 Tue, 23 May 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684860367;
 bh=frZYjDQKin2OHTgUDD9pxdXKaV6vGksRhCcsFtba5x4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H8SfP/1BV7zbPUtsX6lI0G0fNnb1MZitP4ubj+awDqBrFHMpMSz2TribsuvaMA3hM
 e/iuchNE906qqEzi12NJg2q2qNsjX/b9oB/CzvhmuFkTCMhoV/sY4zhTmq1tr866b9
 k/fRX88Huy3s20ikowigjysvgkzvtCyBUi6DVA+MjfdLnVM9nr1te2U5gk0fHRIDZH
 wOJS9i41FMYjizitrnHb1MsvjWX+53PagC6EKTJlVtfMyQe4w/0r6IuGwDiqGwsZPS
 fGI9khOKXUd6zxx1577oULe81ZEcIqCCM2kwErfPln4q+CbyTNrcZfEYy5reMNg69S
 8riVqD/CwqA0g==
Date: Tue, 23 May 2023 09:46:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: edumazet@google.com, syzbot
 <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 wireguard@lists.zx2c4.com, jann@thejh.net
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
Message-ID: <20230523094606.6f4f8f4f@kernel.org>
In-Reply-To: <ZGzmWtd7itw6oFsI@zx2c4.com>
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <ZGzmWtd7itw6oFsI@zx2c4.com>
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

On Tue, 23 May 2023 18:14:18 +0200 Jason A. Donenfeld wrote:
> So, IOW, not a wireguard bug, right?

What's slightly concerning is that there aren't any other timers
leading to

  KASAN: slab-use-after-free Write in enqueue_timer

:( If WG was just an innocent bystander there should be, right?
