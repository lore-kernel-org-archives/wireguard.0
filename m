Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2C8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:08:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9c84ed07;
	Mon, 21 Mar 2022 19:08:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e37789f3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Mar 2022 19:08:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8E4560ACD;
 Mon, 21 Mar 2022 19:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD61C340F0;
 Mon, 21 Mar 2022 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647889732;
 bh=I2M4YjizpXTdiWneY92Z9cdijcfZVcivnq2uZ24KyhI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s5M57ekAJJ6Oq6F15/Y0+83Lr4ZlkLddf3WbAoCJkZXm3FwY+sBrFJsgo2l6NRqlH
 3ZgYOTfC2EHlKEkw17cVQ7EjokQsATI8DNfYjDo48nEEwK1ET2lHmdL13kkJiDhuHo
 BGM8O00J+sjRswjU6kDFllQiD3Oib4JJu7sU8WPjj9ENO++MmPhJEN+DkbncHXHwaR
 QmdGbZo3a4l4i/OJb/RpEGUQd5iCwBrRhMvChx9MihpDnkFr7DoZV3yLuhWwO7ObtN
 k9Sf3GRqK5Oi6Zq1dLqiDwoKjfiOQU2wzqfRdjDROJT6vpVclx3B6wEy2uJvAyJrHc
 5U9KLy2j0CKlQ==
Date: Mon, 21 Mar 2022 12:08:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: syzbot <syzbot+6f21ac9e27fca7e97623@syzkaller.appspotmail.com>
Cc: Jason@zx2c4.com, davem@davemloft.net, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com,
 wireguard@lists.zx2c4.com
Subject: Re: [syzbot] linux-next test error: WARNING in __napi_schedule
Message-ID: <20220321120849.1c87c4a4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <000000000000110dee05da8de18a@google.com>
References: <000000000000110dee05da8de18a@google.com>
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

On Sat, 19 Mar 2022 01:16:24 -0700 syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    6d72dda014a4 Add linux-next specific files for 20220318
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=124f5589700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5907d82c35688f04
> dashboard link: https://syzkaller.appspot.com/bug?extid=6f21ac9e27fca7e97623
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

#syz fix: net: Revert the softirq will run annotation in ____napi_schedule().
