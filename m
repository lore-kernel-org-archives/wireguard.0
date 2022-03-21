Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39FDC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:08:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3c113968;
	Mon, 21 Mar 2022 19:08:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b838807e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Mar 2022 19:08:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F6F060AB1;
 Mon, 21 Mar 2022 19:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF8CC340E8;
 Mon, 21 Mar 2022 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647889728;
 bh=FjjsA8zqwAJ+IKcKR86hi1XdFe4x8oPOB7PEGC6DMMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aSM8SQRRdrCU+p808ZfQUx2BZqzYvJOPLCXhy0bPxVdT4wdxu7sFv7NyUGDo0MdAI
 MZIh7KFYpnBV0O7+OGUx9OIb9/9/6EKWM+cyvrGNKSTmmcsvPoJRAweLIVbKarwiA8
 wpHS9ev5I2p2mC4pbMBHOs++vV+D4B12+JHnxhWWCWLv1BQxnBTlIWdyhr8+1fhpd3
 ChIfWmjBznWlrpPlteuv+4Wmng7TE2w8xHgvFkwqBZDmnEIqTbrCsG5Zoq4VNcS1N4
 dXu0HY5dx8rGpOXlAzXRD1nx0NscP/DhUQHNZVatpYoZPRIOLXJZ8IBe/ks+XreOLb
 KG9vDFuO5zZ5Q==
Date: Mon, 21 Mar 2022 12:08:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: syzbot <syzbot+fb57d2a7c4678481a495@syzkaller.appspotmail.com>
Cc: Jason@zx2c4.com, davem@davemloft.net, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com,
 wireguard@lists.zx2c4.com
Subject: Re: [syzbot] net-next test error: WARNING in __napi_schedule
Message-ID: <20220321120846.4441e49a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <0000000000000eaff805da869d5b@google.com>
References: <0000000000000eaff805da869d5b@google.com>
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

On Fri, 18 Mar 2022 16:36:19 -0700 syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e89600ebeeb1 af_vsock: SOCK_SEQPACKET broken buffer test
> git tree:       net-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=134d43d5700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ef691629edb94d6a
> dashboard link: https://syzkaller.appspot.com/bug?extid=fb57d2a7c4678481a495
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

#syz fix: net: Revert the softirq will run annotation in ____napi_schedule().
