Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C0C41513
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Jul 2023 16:05:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9b0a057;
	Sun, 23 Jul 2023 16:01:08 +0000 (UTC)
Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4183f6b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jul 2023 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple;
 d=nerdbynature.de; i=@nerdbynature.de; q=dns/txt; s=key1;
 t=1689778933; h=date : from : to : cc : subject : in-reply-to :
 message-id : references : mime-version : content-type : from;
 bh=xIYPqanAqkNAcIDfDD9JYV48Ktk2KbeO1AnpEFpuS/I=;
 b=vcdbASREu5aB4xdwGWi8S7mPC8bFlQ0PgNxR0yfMBzxKb9E1vXhqBeg1cVjgtmQSNpU0t
 fFf5m84sO0Mk+HwCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nerdbynature.de;
 i=@nerdbynature.de; q=dns/txt; s=key0; t=1689778933; h=date : from :
 to : cc : subject : in-reply-to : message-id : references :
 mime-version : content-type : from;
 bh=xIYPqanAqkNAcIDfDD9JYV48Ktk2KbeO1AnpEFpuS/I=;
 b=Tk4ambya8ok6FoEYIxOG23sv3Who4TleXFWWJQ1CHPekpI4zK9a0uZCEcd4gzcRXvcgLM
 IteT/7ZVNrzjptE7BrT/fCv/wdO5pjFwDbD/f+7lWB2+nzq9dVaINbYYgaTo95+txHg3nrJ
 lN5mPSKNVz4b1xfN5NQumzzt+nxzj6DUT8cd08rnqZwvOmqj/vUwOW9Co2tAemOs5MUVUbi
 eUkVFOfaG/Kwz/6xsSUVyp9wlwCvM0SKxOlbXH7GrcqG7lQAl797aOeGLhrUqt/UQdF2R0C
 aGsrK4fSAQCYd+wxmenyRR+HTGvo0X0WmOKDdOmlUWoIzV0o/tQK9COYSHuQ==
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id 3F2345F998;
 Wed, 19 Jul 2023 17:02:13 +0200 (CEST)
Date: Wed, 19 Jul 2023 17:02:13 +0200 (CEST)
From: Christian Kujau <lists@nerdbynature.de>
To: syzbot <syzbot+96eb4e0d727f0ae998a6@syzkaller.appspotmail.com>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 jfs-discussion@lists.sourceforge.net, kuninori.morimoto.gx@renesas.com, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel@vger.kernel.org, povik+lin@cutebit.org, edumazet@google.com, 
 broonie@kernel.org, linux-fsdevel@vger.kernel.org, kuba@kernel.org, 
 pabeni@redhat.com, davem@davemloft.net, wireguard@lists.zx2c4.com, 
 Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: [Jfs-discussion] [syzbot] [wireguard?] [jfs?] KASAN:
 slab-use-after-free Read in wg_noise_keypair_get
In-Reply-To: <97a9c205-2074-07f8-ae9d-9f2b4aebbf9a@oracle.com>
Message-ID: <30f03978-3035-a28e-c097-112036901bcb@nerdbynature.de>
References: <0000000000002bfa570600c477b3@google.com>
 <CAHmME9reBny-ufJp58uOg+KdMptircBRhLFd-N2KwxNUp6myTA@mail.gmail.com>
 <97a9c205-2074-07f8-ae9d-9f2b4aebbf9a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Mailman-Approved-At: Sun, 23 Jul 2023 16:01:07 +0000
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

On Tue, 18 Jul 2023, Dave Kleikamp via Jfs-discussion wrote:
> Maybe not. It could possibly fixed by:
> https://github.com/kleikamp/linux-shaggy/commit/6e2bda2c192d0244b5a78b787ef20aa10cb319b7

Let's try this:

#syz test: https://github.com/kleikamp/linux-shaggy.git 6e2bda2c192d0244b5a78b787ef20aa10cb319b7

-- 
BOFH excuse #371:

Incorrectly configured static routes on the corerouters.
