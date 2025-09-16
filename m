Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA971CAC598
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 15:40:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24fd69f6;
	Tue, 16 Sep 2025 15:38:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b1cd6377
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 15:38:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D89AD6020A;
 Tue, 16 Sep 2025 15:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CA4C4CEEB;
 Tue, 16 Sep 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758037082;
 bh=ZV1/ZgIDRprs7axQ6TQnrVXYxz9AalJXylNl+cUmS9E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SpC8htl2dZYhzkI/LEZ9wRT+2WVngbKP3PssF0IAMmyghFhx9H8g0pdZmDUynt+TM
 ssj1ZhMEZ4/OPVihcn/OfncjMrhdvNusZIolYVN6cWJnWrtQF/bsCPmUcW9cQUm69M
 y5PeuCk7TtJUlF+12ay53vpt5u1UaTMrGf4peN4ALNp1QrY9Thmh3q8KZyx68Batv2
 aNSiiOKIORqw9hhSiqcVg3w/ckL0X3MwoOTdawXNTH1fOFUG72QYOLBIkbdWBdNpj1
 vU7syqgU/jOWfczM37Cn1BKRkI1K5ha8saIQ2hofPsAzjHf23P6z4RuUx2Kqo1dzXR
 JVW7phFNgr34A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF7F39D0C1A; Tue, 16 Sep 2025 15:38:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 00/11] tools: ynl: prepare for wireguard
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175803708374.1166060.16728108514341236086.git-patchwork-notify@kernel.org>
Date: Tue, 16 Sep 2025 15:38:03 +0000
References: <20250915144301.725949-1-ast@fiberby.net>
In-Reply-To: <20250915144301.725949-1-ast@fiberby.net>
To: =?utf-8?b?QXNiasO4cm4gU2xvdGggVMO4bm5lc2VuIDxhc3RAZmliZXJieS5uZXQ+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 horms@kernel.org, jacob.e.keller@intel.com, sd@queasysnail.net,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
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

On Mon, 15 Sep 2025 14:42:45 +0000 you wrote:
> This series contains the last batch of YNL changes to support
> the wireguard YNL conversion.
> 
> The wireguard changes, to be applied on top of this series,
> has been posted as an RFC series here:
>   https://lore.kernel.org/netdev/20250904-wg-ynl-rfc@fiberby.net/
> 
> [...]

Here is the summary with links:
  - [net-next,v5,01/11] tools: ynl-gen: allow overriding name-prefix for constants
    https://git.kernel.org/netdev/net-next/c/3ff5258b9781
  - [net-next,v5,02/11] tools: ynl-gen: generate nested array policies
    https://git.kernel.org/netdev/net-next/c/d0bdfe36d777
  - [net-next,v5,03/11] tools: ynl-gen: add sub-type check
    https://git.kernel.org/netdev/net-next/c/8df78d97e498
  - [net-next,v5,04/11] tools: ynl-gen: refactor local vars for .attr_put() callers
    https://git.kernel.org/netdev/net-next/c/db4ea3baa484
  - [net-next,v5,05/11] tools: ynl-gen: avoid repetitive variables definitions
    https://git.kernel.org/netdev/net-next/c/099902fc66f8
  - [net-next,v5,06/11] tools: ynl-gen: validate nested arrays
    https://git.kernel.org/netdev/net-next/c/1d99aa4ed707
  - [net-next,v5,07/11] tools: ynl-gen: rename TypeArrayNest to TypeIndexedArray
    https://git.kernel.org/netdev/net-next/c/a44a93ea6f06
  - [net-next,v5,08/11] tools: ynl: move nest packing to a helper function
    https://git.kernel.org/netdev/net-next/c/328c13426240
  - [net-next,v5,09/11] tools: ynl: encode indexed-arrays
    https://git.kernel.org/netdev/net-next/c/5c51ae2446c2
  - [net-next,v5,10/11] tools: ynl: decode hex input
    https://git.kernel.org/netdev/net-next/c/52550d518d24
  - [net-next,v5,11/11] tools: ynl: add ipv4-or-v6 display hint
    https://git.kernel.org/netdev/net-next/c/1b255e1beabf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


