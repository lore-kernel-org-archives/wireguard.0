Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8263DC5475B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Mar 2024 09:24:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e533a489;
	Mon, 11 Mar 2024 09:22:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f17677a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2024 09:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32982CE0ED8;
 Mon, 11 Mar 2024 09:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15C4C433C7;
 Mon, 11 Mar 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710148950;
 bh=5jwRjzBuqHsD6PpmjxxWVJQrTPGroJenGMk4S3Kn5mk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPGYambr5jaJ6Z+mS4Splw3bUn17P/mw45+F/F4IKxxOGqgIy5tsW8sRz6KP1fZrg
 vacdvHj1yvz9RrE1Q79OWQgXSM4pdqnD+1cT/mb/E6f0VuRItRqEw78Rhh/POdTFH3
 mGGeZipdfIemSqwvX67bFvDrrT3tFDgCOp/7i/totLr1hopE1DVNMFNSeHtsXwp1Tj
 z0l7wRA7ksCwKFc7EO9fsSuiDdRPt9hCgTKBvj1nPePVbLi2bXufCLO0p1V+gHcbJb
 VfxAoU2YsFuhUrWGNlNuk02YkfrE/hE+p6ugdar+xaqB48S7QsG2XW5NzAGy+MKYcI
 08YRBY5TWwc0A==
Date: Mon, 11 Mar 2024 09:22:23 +0000
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dsahern@kernel.org,
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v2 2/2] wireguard: Remove generic .ndo_get_stats64
Message-ID: <20240311092223.GG24043@kernel.org>
References: <20240308112746.2290505-1-leitao@debian.org>
 <20240308112746.2290505-2-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308112746.2290505-2-leitao@debian.org>
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

On Fri, Mar 08, 2024 at 03:27:45AM -0800, Breno Leitao wrote:
> Commit 3e2f544dd8a33 ("net: get stats64 if device if driver is
> configured") moved the callback to dev_get_tstats64() to net core, so,
> unless the driver is doing some custom stats collection, it does not
> need to set .ndo_get_stats64.
> 
> Since this driver is now relying in NETDEV_PCPU_STAT_TSTATS, then, it
> doesn't need to set the dev_get_tstats64() generic .ndo_get_stats64
> function pointer.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Simon Horman <horms@kernel.org>

...
