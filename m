Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB3D37E52
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jan 2026 15:41:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b7841f5;
	Wed, 14 Jan 2026 15:41:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d230f4f2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jan 2026 15:41:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB70C43AD9;
 Wed, 14 Jan 2026 15:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD93C4CEF7;
 Wed, 14 Jan 2026 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768405279;
 bh=RQSRiTI5Ss+Tc8KPe8Ge/hfsHFkfRdRKZ4LXmUHadGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FiwNnuf7RCGJjhg58kKfW5zsBcbzbaQisBT7dpxiBPetvQ2HfDTJiDeI6FoU2SJQX
 J3lcqcd0B/XtWGnttdT0+JE8+76rAXwMPBGesA/bGaOwV1QRJCamr8f4zdPjm7Z5ST
 q/Haykvt4UDCAiCpDZd5fcipWHgtETVg7YVOmaTb8vNhtxT4JlXemfgzp/FRobhp8d
 Pgd9hHiscvXr7W2ZHqmJXx/QXOnbEhWqEZc3T8/kruS9s/eHV+qgKmxWac9owjr3a/
 OAwIL/3nSM23c6ipj+7r449GlS39xbu1Wt0rr0oBNet60cwrIknLIfruGhvS/hh3C1
 nMb84SuuyJwPQ==
Date: Wed, 14 Jan 2026 15:41:14 +0000
From: Simon Horman <horms@kernel.org>
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, wangfushuai@baidu.com,
 vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3] wireguard: allowedips: Use kfree_rcu()
 instead of call_rcu()
Message-ID: <aWe5GhgmyDkaBLwS@horms.kernel.org>
References: <20260112130633.25563-1-fushuai.wang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112130633.25563-1-fushuai.wang@linux.dev>
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

On Mon, Jan 12, 2026 at 09:06:33PM +0800, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
> the code and reduce function size.
> 
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>

Thanks,

I believe this address prior review and moreover I agree
with the approach taken here.

Reviewed-by: Simon Horman <horms@kernel.org>

...
