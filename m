Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF19DD60D15
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2024 03:09:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa564865;
	Tue, 19 Nov 2024 03:07:06 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a4d0374
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2024 03:07:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 95061A42574;
 Tue, 19 Nov 2024 03:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD48C4CECF;
 Tue, 19 Nov 2024 03:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731985622;
 bh=PGoG8fEB7llM322/jpcOwn3LGAi0gafsk5SM9vL39KQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oGWzVf9fm47IURqF82sBjxlSLSQaSxQvnftln+sAaadyrOaTpKmG1QB1++Q+XtGq2
 iqnrNBO0CyTqqEwlU/q+011kC2hwIrbq/6K0SGXImw3qfRg1+XKGoOsssJ5vIMkYcz
 Z6YQRFxP4izqrZoqEbsdoy+taGRJqRWgfpsrekJKESn6nbT7e6NOHGhh6GN5IbeTmn
 lzthFeg7CnYNFnEs0XFbrLEZd2ql/Jl9IGwusT5cDv1Qr6Psf8Q5n6XqbkH/peqmPn
 uwk0TjN/tbOC/IkQ2CmF/L5xISUzVUBpQQlxdujGCk9lYUVk7IvT7QmP1ZZAPQtMkX
 AVNlOOjcQBmSw==
Date: Mon, 18 Nov 2024 19:07:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Xiao Liang <shaw.leon@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Ido
 Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Jiri Pirko
 <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/5] net: Improve netns handling in RTNL and
 ip_tunnel
Message-ID: <20241118190700.4c1b8156@kernel.org>
In-Reply-To: <20241118143244.1773-1-shaw.leon@gmail.com>
References: <20241118143244.1773-1-shaw.leon@gmail.com>
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

On Mon, 18 Nov 2024 22:32:39 +0800 Xiao Liang wrote:
> This patch series includes some netns-related improvements and fixes for
> RTNL and ip_tunnel, to make link creation more intuitive:
> 
>  - Creating link in another net namespace doesn't conflict with link names
>    in current one.
>  - Refector rtnetlink link creation. Create link in target namespace
>    directly. Pass both source and link netns to drivers via newlink()
>    callback.
> 
> So that
> 
>   # ip link add netns ns1 link-netns ns2 tun0 type gre ...
> 
> will create tun0 in ns1, rather than create it in ns2 and move to ns1.
> And don't conflict with another interface named "tun0" in current netns.

## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new drivers,
features, code refactoring and optimizations. We are currently accepting
bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer

