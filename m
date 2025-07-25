Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9F6C87FCA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jul 2025 23:25:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e43e941;
	Fri, 25 Jul 2025 23:25:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13543541
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jul 2025 23:25:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 379F65C6BDA;
 Fri, 25 Jul 2025 23:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E6C4CEE7;
 Fri, 25 Jul 2025 23:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753485950;
 bh=k+gS4GQuoGUziec6fqwcYVbZRGH00+uvJgsa8lL3+8w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=vCT6Nob53ktddXRTiLA22iurf8QTUFtVDRLwYuc6tyc4ZtFba8TWPyirgGONVqnEn
 qWJs3HcdFvOyjhO2y5ekUJEwu6HZlHQQuJteftEtJ+XLMUjEhc1rfJERKUN8FLq3Lj
 Qq18dCgTiE56LRrsa8OgZi3oHsggkp/cnyl8DXKmc9zHr13JqY5QQyL0Te3vDOZGfn
 3I8DA1ebMR8M/dQZ3eC+j7iWq7o8NvRjA+U8C9uFOGW1TJZJlm4aftY1NEOuQGnQkG
 6lQBcLmz5hr1Lt8HNHOl1/tgJa5ddBRhFhOgkptX909zq/16Vn4H71Fol+pvAOchvB
 Q6oWs7LNvJw1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD3F383BF4E; Fri, 25 Jul 2025 23:26:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: Add sockaddr_inet unified address
 structure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175348596749.3366157.11889906791238903563.git-patchwork-notify@kernel.org>
Date: Fri, 25 Jul 2025 23:26:07 +0000
References: <20250722171528.work.209-kees@kernel.org>
In-Reply-To: <20250722171528.work.209-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: marcelo.leitner@gmail.com, kuba@kernel.org, Jason@zx2c4.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, lucien.xin@gmail.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Tue, 22 Jul 2025 10:18:30 -0700 you wrote:
> Hi!
> 
> Repeating patch 1, as it has the rationale:
> 
>     There are cases in networking (e.g. wireguard, sctp) where a union is
>     used to provide coverage for either IPv4 or IPv6 network addresses,
>     and they include an embedded "struct sockaddr" as well (for "sa_family"
>     and raw "sa_data" access). The current struct sockaddr contains a
>     flexible array, which means these unions should not be further embedded
>     in other structs because they do not technically have a fixed size (and
>     are generating warnings for the coming -Wflexible-array-not-at-end flag
>     addition). But the future changes to make struct sockaddr a fixed size
>     (i.e. with a 14 byte sa_data member) make the "sa_data" uses with an IPv6
>     address a potential place for the compiler to get upset about object size
>     mismatches. Therefore, we need a sockaddr that cleanly provides both an
>     sa_family member and an appropriately fixed-sized sa_data member that does
>     not bloat member usage via the potential alternative of sockaddr_storage
>     to cover both IPv4 and IPv6, to avoid unseemly churn in the affected code
>     bases.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] ipv6: Add sockaddr_inet unified address structure
    https://git.kernel.org/netdev/net-next/c/463deed51796
  - [net-next,2/3] wireguard: peer: Replace sockaddr with sockaddr_inet
    https://git.kernel.org/netdev/net-next/c/9203e0a82c0b
  - [net-next,3/3] sctp: Replace sockaddr with sockaddr_inet in sctp_addr union
    https://git.kernel.org/netdev/net-next/c/511d10b4c2f9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


