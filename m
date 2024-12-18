Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5B1C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8643638;
	Tue, 20 May 2025 19:36:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6bd5cbff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 23:38:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01A465C59B3;
 Wed, 18 Dec 2024 23:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9872C4CECD;
 Wed, 18 Dec 2024 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734565080;
 bh=TE9MeQggFrUNHk7GnpsPc1qOO621qZHYt6YKXQvYGUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SMB95StF87lMswBTmoy5w+GFfz3iCmebU4gbeFCJK7sk9+I16C9cplpIYLf0W9Qul
 QxmbLpIR7/E6R0kf5eKkyEYZx8mBxxIidhrnHdr7M4IeFwaA3J5y2wWv4oQmfmxORv
 D1j6lmCsAMuKx+jWknHgUh8GEb58788JfHfg1N+UuccR+d6b8ALbB6vzMOTnfrbNpk
 nrbFqHQ3vUtoVAGtl14Lhqr/MD+oEcAwxAPHEo6k2fp/JS6ZLbq87qH4FknN0j6i1c
 yDKA9jZ2UNpUbRlqHX4gnIrK03GFSOZ91dNOO2mqCDLBVJi/w2/4kNnX7grOmVIZvb
 15jS4zu2mRPLw==
Date: Wed, 18 Dec 2024 15:37:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Xiao Liang <shaw.leon@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Donald Hunter <donald.hunter@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, Ido
 Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Jiri Pirko
 <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 11/11] selftests: net: Add test cases for
 link and peer netns
Message-ID: <20241218153759.672b7014@kernel.org>
In-Reply-To: <20241218130909.2173-12-shaw.leon@gmail.com>
References: <20241218130909.2173-1-shaw.leon@gmail.com>
 <20241218130909.2173-12-shaw.leon@gmail.com>
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

On Wed, 18 Dec 2024 21:09:09 +0800 Xiao Liang wrote:
>  - Add test for creating link in another netns when a link of the same
>    name and ifindex exists in current netns.
>  - Add test to verify that link is created in target netns directly -
>    no link new/del events should be generated in link netns or current
>    netns.
>  - Add test cases to verify that link-netns is set as expected for
>    various drivers and combination of namespace-related parameters.

Nice work!

You need to make sure all the drivers the test is using are enabled by
the selftest kernel config: tools/testing/selftests/net/config

This may be helpful:
https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-style#how-to-build
-- 
pw-bot: cr
