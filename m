Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8BDD10F5C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:58:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72661cc0;
	Mon, 18 Nov 2024 01:39:28 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c245eb4a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Nov 2024 23:35:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B8971A42810;
 Fri, 15 Nov 2024 23:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018E7C4CECF;
 Fri, 15 Nov 2024 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731713727;
 bh=+0nSqXJMNPJie6Agi0DCflpUksVQqJLNIcznPm67J68=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SWd4Fyxcy6vkPAs/DoAyKv+eu9nnqiy9VDr1E7w6DAOPjGk3sTNyu3CQVJ1ftQ1Vl
 KQx7V76ZwBrflcMdU07dZ08pvCiVuMniy4GhDYMkJ/3vahjg0pawSvaX+3JhHfGywU
 5B5tE+7wI6tq8XfAriVL28lj/YBhGHcMmGeFVzCIrjSd9YzsgSS8omaH0MLx3DWaMn
 /8V/Hup5AfF5QtyTL3sde4ia3ZIuFa+PC0Cl0GrtcqcB8u0C+PbGN/aNnGXfwN1oRZ
 wKyFrTPI/2pLhWCxOGsAbPXDBSZL+32gxSUIudNzbcxe8lV0SDX6LcluNtG1LiyPmb
 wMVTTXTFPHQrg==
Date: Fri, 15 Nov 2024 15:35:26 -0800
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
Subject: Re: [PATCH net-next v3 4/6] rtnetlink: Decouple net namespaces in
 rtnl_newlink_create()
Message-ID: <20241115153526.3582ebcd@kernel.org>
In-Reply-To: <20241113125715.150201-5-shaw.leon@gmail.com>
References: <20241113125715.150201-1-shaw.leon@gmail.com>
 <20241113125715.150201-5-shaw.leon@gmail.com>
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

On Wed, 13 Nov 2024 20:57:13 +0800 Xiao Liang wrote:
> +/**
> + *	struct rtnl_link_nets - net namespace context of newlink.
> + *
> + *	@src_net: Source netns of rtnetlink socket
> + *	@link_net: Link netns by IFLA_LINK_NETNSID, NULL if not specified.
> + */
> +struct rtnl_link_nets {
> +	struct net *src_net;
> +	struct net *link_net;
> +};

Let's not limit ourselves to passing just netns via this struct.
Let's call it rtnl_newlink_args or params.

The first patch of the series got merged independently so you'll
need to respin.
-- 
pw-bot: cr
