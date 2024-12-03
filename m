Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3E2C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 19:35:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a5e2b57;
	Tue, 20 May 2025 19:34:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4fce8303
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2024 09:10:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D524A40F77;
 Tue,  3 Dec 2024 09:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C9DC4CED6;
 Tue,  3 Dec 2024 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733217031;
 bh=t2rIDheqjcBU9D907pHcVZZDQMqpDHx8i/WTx64rQ1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p/S00nTutZFeFDap47LU2wOH4RkX8Rw+FKXBJkY2DC9GFMirmrJkSgs5zUSUQODMm
 uI/Z+0ygF9/uxwmqjBAAU3cMKrF68qBNWeRLuU9+9ZwIfcp+O79rJo0Lnbg2/ITgGB
 i7VyIrCWqluCegLc5eK0j9Y0rJ4BGtRTpNwYl9p8hd4NtloYD8zk67XHgW1NJVrw1O
 PgyWUsZq83zh8BAVG2xiZ1TrZy290zrkSLf55QOrcMn/zBk3bC/zZW1oFQsy5v0aUm
 NDz9DhvX7AwLjt5EuQket3aYIz8n62FSFyaubK41zGO6xFlY2owTqIaYFpx5nDC7Sv
 djbAIoJgXhqXg==
Date: Tue, 3 Dec 2024 09:09:27 +0000
From: Simon Horman <horms@kernel.org>
To: greearb@candelatech.com
Cc: netdev@vger.kernel.org, Jason@zx2c4.com, wireguard@lists.zx2c4.com,
 dsahern@kernel.org
Subject: Re: [PATCH] net: wireguard: Allow binding to specific ifindex
Message-ID: <20241203090927.GA9361@kernel.org>
References: <20241125212111.1533982-1-greearb@candelatech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125212111.1533982-1-greearb@candelatech.com>
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

On Mon, Nov 25, 2024 at 01:21:11PM -0800, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Which allows us to bind to VRF.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
> 
> NOTE:  Modified user-space to utilize this may be found here:
> https://github.com/greearb/wireguard-tools-ct
> Only the 'wg' part has been tested with this new feature as of today.

...

> diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
> index 0414d7a6ce74..a7cb1c7c3112 100644
> --- a/drivers/net/wireguard/socket.c
> +++ b/drivers/net/wireguard/socket.c
> @@ -25,7 +25,8 @@ static int send4(struct wg_device *wg, struct sk_buff *skb,
>  		.daddr = endpoint->addr4.sin_addr.s_addr,
>  		.fl4_dport = endpoint->addr4.sin_port,
>  		.flowi4_mark = wg->fwmark,
> -		.flowi4_proto = IPPROTO_UDP
> +		.flowi4_proto = IPPROTO_UDP,
> +		.flowi4_oif = wg->lowerdev,
>  	};
>  	struct rtable *rt = NULL;
>  	struct sock *sock;
> @@ -111,6 +112,9 @@ static int send6(struct wg_device *wg, struct sk_buff *skb,
>  	struct sock *sock;
>  	int ret = 0;
>  
> +	if (wg->lowerdev)
> +		fl.flowi6_oif = wg->lowerdev,

Hi Ben,

I think that the trailing ',' on the line above should be a ';'.
As written, with a ',', the call to skb_mark_not_on_list() 
below will be included in the conditional block above.
And this doesn't seem to be the intention of the code based on indentation.

Flagged by clang-19 with -Wcomma

> +
>  	skb_mark_not_on_list(skb);
>  	skb->dev = wg->dev;
>  	skb->mark = wg->fwmark;

...
