Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F6C71148
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Jun 2025 16:49:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 493b67de;
	Fri, 13 Jun 2025 16:49:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 98300e50
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jun 2025 16:49:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DE80A45236;
 Fri, 13 Jun 2025 16:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17550C4CEE3;
 Fri, 13 Jun 2025 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749833339;
 bh=9qE4Kk3orcnozxb2Pvy7xMPE0E6IASPUn9yb17+Z9nE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lQHeqPmL2hTxWlqwT4eWnqQcuKXz+AR0+zVBfe8DXk8c00+4jSSVjQzIIwS9kjYlI
 JKraQuA7ftKBR5I+YmToYLO01DxFv9JZmns7SX/5HRebOkuJfvltKaeuV3Dj6x3ukp
 y1cGjPpeBO9OtzOqcZkMuZhlmrRDcRvQN18Vtj3CtR0TAKiD1O9fsqX6ri0i6fzasW
 JZ+y7u0H3lT+O7t5LnZlyeJheC6nfLnLn9Zra7SCmFNe5KQwayaDiNh0vMdDmbfdKe
 4JwVkE23AGm+toTtjamskt9qZbWsqjwwwUdExchuinb8olFWy1A6cIwBpkBgMM1W/6
 2kDPMbRGrVPwg==
Date: Fri, 13 Jun 2025 09:48:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Petr Machata <petrm@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@gmail.com>, <netdev@vger.kernel.org>, Simon Horman
 <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel
 <idosch@nvidia.com>, <mlxsw@nvidia.com>, Antonio Quartulli
 <antonio@openvpn.net>, Pablo Neira Ayuso <pablo@netfilter.org>,
 <osmocom-net-gprs@lists.osmocom.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Taehee Yoo <ap420073@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 <wireguard@lists.zx2c4.com>, Marcelo Ricardo Leitner
 <marcelo.leitner@gmail.com>, <linux-sctp@vger.kernel.org>, Jon Maloy
 <jmaloy@redhat.com>, <tipc-discussion@lists.sourceforge.net>
Subject: Re: [PATCH net-next v2 01/14] net: ipv4: Add a flags argument to
 iptunnel_xmit(), udp_tunnel_xmit_skb()
Message-ID: <20250613094858.5dfa435e@kernel.org>
In-Reply-To: <93258d0156bab6c2d8c7c6e1a43d23e13e9830ec.1749757582.git.petrm@nvidia.com>
References: <cover.1749757582.git.petrm@nvidia.com>
 <93258d0156bab6c2d8c7c6e1a43d23e13e9830ec.1749757582.git.petrm@nvidia.com>
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

On Thu, 12 Jun 2025 22:10:35 +0200 Petr Machata wrote:
>  void udp_tunnel_xmit_skb(struct rtable *rt, struct sock *sk, struct sk_buff *skb,
>  			 __be32 src, __be32 dst, __u8 tos, __u8 ttl,
>  			 __be16 df, __be16 src_port, __be16 dst_port,
> -			 bool xnet, bool nocheck)
> +			 bool xnet, bool nocheck, u16 ipcb_flags)

This is a lot of arguments for a function.
I don't have a great suggestion off the top of my head, but maybe
think more about it?
