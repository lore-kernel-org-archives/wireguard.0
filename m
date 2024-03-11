Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56835C54E58
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Mar 2024 09:22:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 016ef60a;
	Mon, 11 Mar 2024 09:22:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a56545aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2024 09:22:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD18B60C37;
 Mon, 11 Mar 2024 09:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007DEC433C7;
 Mon, 11 Mar 2024 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710148927;
 bh=jfyM81qdr/fr+0vUOBaGhfZQoUtRfEy6ZlsHkzSG4Dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfFmCu/m8X2Ov7QlNEH7h1QsK5WSMliR4lIvskJx0ed6YtsDC/H6InjgJZKAUGsYC
 ZjenPVOfJ/ULuGYE/pkI61qG9yB+8B9Pb1IMYyOrR+OCEZKzzALGYo5oS9SCW8Z5Jc
 h9qO1adY9JZNizKkTK5PuWTAw4LP0Nu0JGT6RDl4lBrQwHZRsMrlugDKdp+Z1wgAcu
 qsmAApFtMLvA4a22oXFjzBp/8ZVIVlw7fMcchQrV1ECGOdTRexs/YEMvLDxqJ4i8Wv
 mjKOJXDQtfv/YifzswWIag3lU343wLoidon/pzQzMcPopUdkiCC930fUeKf5sj84at
 TbSVn4taC5+oA==
Date: Mon, 11 Mar 2024 09:22:00 +0000
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dsahern@kernel.org,
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v2 1/2] wireguard: Leverage core stats allocator
Message-ID: <20240311092200.GF24043@kernel.org>
References: <20240308112746.2290505-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308112746.2290505-1-leitao@debian.org>
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

On Fri, Mar 08, 2024 at 03:27:44AM -0800, Breno Leitao wrote:
> With commit 34d21de99cea9 ("net: Move {l,t,d}stats allocation to core and
> convert veth & vrf"), stats allocation could be done on net core
> instead of in this driver.
> 
> With this new approach, the driver doesn't have to bother with error
> handling (allocation failure checking, making sure free happens in the
> right spot, etc). This is core responsibility now.
> 
> Remove the allocation in the wireguard driver and leverage the network
> core allocation instead.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Simon Horman <horms@kernel.org>

...

