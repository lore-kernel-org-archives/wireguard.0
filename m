Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3BFC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jun 2024 22:51:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 058b0aa3;
	Wed, 12 Jun 2024 22:46:22 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ff80f88
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2024 22:46:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 816FBCE2358;
 Wed, 12 Jun 2024 22:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0D1C3277B;
 Wed, 12 Jun 2024 22:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718232376;
 bh=Btuodt76m2DyYXbGtPV/Vv1FbZvrfNlv6sM+TvESOkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pv5cYMk263zMUbCNp36wRXNXl/tjrUmckYYLHcirlYBNB77YB2467Yd4BgJb+Qb4I
 YqDU+Cm7UNZ7n0MewE6/hilNaJ90Gza1H88RAoEG4A1Y225lvjqc3PekR4aCG22HOa
 eAQV/usrnBVKHJJd9LkQKe85xRAaEOhB13oBSQNKJekbOzbzkrOMmITPPU9uVAHQrK
 HrUG2rhIy4WxyzNQbzTF6NPLZ/gIHpC6rSya37s8bzyXL8h6Xw7WfeWxWP+Bz5oMyj
 5DFBQb/iMdU8+dudcvUFs5V1g2fxaQEsU7q04KgQBDEtVH+9Kij5/LGkrSeYMBe0OP
 HpewrgqVcBCtw==
Date: Wed, 12 Jun 2024 15:46:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org, Neil Brown
 <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo
 <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 linux-nfs@vger.kernel.org, linux-can@vger.kernel.org, Lai Jiangshan
 <jiangshanlai@gmail.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <20240612154615.21206fea@kernel.org>
In-Reply-To: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
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

On Wed, 12 Jun 2024 15:37:55 -0700 Paul E. McKenney wrote:
> So 05/14, 11/14 and 12/14 are OK and can go ahead.  The rest need some
> help.

Thank you for the breakdown!
