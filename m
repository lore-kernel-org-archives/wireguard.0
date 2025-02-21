Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6031C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42cfe49f;
	Tue, 20 May 2025 19:42:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 76e1d5b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2025 23:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B63B268364;
 Fri, 21 Feb 2025 23:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D170C4CEE8;
 Fri, 21 Feb 2025 23:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740181802;
 bh=CTqJ/KmzI6Gqn0P8GISxBeKnxm42pSWuEHz+MsnFwsw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BDu9ISbENe4QBTzFvL3z1yzMFvK03RKEkTbSwfBUkHNtTUh87YeINV9ofzYEHWC3S
 jZzNU5gsxWbwLeHefuhEiZ9tiDlx3f/7HNbz6+540xOxAjI7PR0td6mH30Y3+TKUgF
 LvyTFKZzhdtpcsU6ypDidAaK+ncYlAPPafKV4INeuNv7tC9FhmAMN0Vo6m1FyHhHaY
 CchC7RgW86hAUItr0fS49w52qJFaotrHr/KW9nOdhhDez05BFc79K9glnKMMjqoXTE
 2B5QJHf8bMDZ6dD1+XamNosy4PieEtpvxtm9eOjBTRJHtAiLr3CyiD+AQA01DPTnNn
 +FzWQRl5jE+uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710DC380CEEC; Fri, 21 Feb 2025 23:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v10 00/13] net: Improve netns handling in
 rtnetlink
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174018183327.2240430.4249639047640655494.git-patchwork-notify@kernel.org>
Date: Fri, 21 Feb 2025 23:50:33 +0000
References: <20250219125039.18024-1-shaw.leon@gmail.com>
In-Reply-To: <20250219125039.18024-1-shaw.leon@gmail.com>
To: Xiao Liang <shaw.leon@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuniyu@amazon.com, kuba@kernel.org, davem@davemloft.net, dsahern@kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, shuah@kernel.org, donald.hunter@gmail.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Feb 2025 20:50:26 +0800 you wrote:
> This patch series includes some netns-related improvements and fixes for
> rtnetlink, to make link creation more intuitive:
> 
>  1) Creating link in another net namespace doesn't conflict with link
>     names in current one.
>  2) Refector rtnetlink link creation. Create link in target namespace
>     directly.
> 
> [...]

Here is the summary with links:
  - [net-next,v10,01/13] rtnetlink: Lookup device in target netns when creating link
    https://git.kernel.org/netdev/net-next/c/ec061546c6cf
  - [net-next,v10,02/13] rtnetlink: Pack newlink() params into struct
    https://git.kernel.org/netdev/net-next/c/69c7be1b903f
  - [net-next,v10,03/13] net: Use link/peer netns in newlink() of rtnl_link_ops
    https://git.kernel.org/netdev/net-next/c/cf517ac16ad9
  - [net-next,v10,04/13] ieee802154: 6lowpan: Validate link netns in newlink() of rtnl_link_ops
    https://git.kernel.org/netdev/net-next/c/3533717581dd
  - [net-next,v10,05/13] net: ip_tunnel: Don't set tunnel->net in ip_tunnel_init()
    https://git.kernel.org/netdev/net-next/c/9e17b2a1a097
  - [net-next,v10,06/13] net: ip_tunnel: Use link netns in newlink() of rtnl_link_ops
    https://git.kernel.org/netdev/net-next/c/eacb1160536e
  - [net-next,v10,07/13] net: ipv6: Init tunnel link-netns before registering dev
    https://git.kernel.org/netdev/net-next/c/db014522f356
  - [net-next,v10,08/13] net: ipv6: Use link netns in newlink() of rtnl_link_ops
    https://git.kernel.org/netdev/net-next/c/5e72ce3e3980
  - [net-next,v10,09/13] net: xfrm: Use link netns in newlink() of rtnl_link_ops
    https://git.kernel.org/netdev/net-next/c/5314e3d68455
  - [net-next,v10,10/13] rtnetlink: Remove "net" from newlink params
    https://git.kernel.org/netdev/net-next/c/9c0fc091dc01
  - [net-next,v10,11/13] rtnetlink: Create link directly in target net namespace
    https://git.kernel.org/netdev/net-next/c/7ca486d08a30
  - [net-next,v10,12/13] selftests: net: Add python context manager for netns entering
    https://git.kernel.org/netdev/net-next/c/030329416232
  - [net-next,v10,13/13] selftests: net: Add test cases for link and peer netns
    https://git.kernel.org/netdev/net-next/c/85cb3711acb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


