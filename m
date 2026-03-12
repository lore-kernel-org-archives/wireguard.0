Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B811067020
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2026 13:49:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bf0824e3;
	Thu, 12 Mar 2026 13:49:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9a32128a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2026 13:49:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF00160141;
 Thu, 12 Mar 2026 13:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1211C4CEF7;
 Thu, 12 Mar 2026 13:48:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Vbza1ZoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1773323333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cGQoGI0iD9IPU4MUwC9OugDLG8y8kJybLkuwslOCZHA=;
 b=Vbza1ZoZ3MQ4b2ykXY2DyqS4C6Ur7UHx9qiWIc/vFh778HfoElPE2RxbHwwtYDWBWz5kTd
 GgqrRtZHwWKcuZxBSTueiwWRWvj2d75BQlYdE8HJs5S7vd9FutLk/Ei4er761vtUbva2iY
 m5uliyiKx+1wocBBtZVjNBVv6c6GbN0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 780e6e40
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 12 Mar 2026 13:48:53 +0000 (UTC)
Date: Thu, 12 Mar 2026 14:48:48 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, rbm@suse.com, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Boris Pismenny <borisp@nvidia.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 Simon Horman <horms@kernel.org>, Edward Cree <ecree.xilinx@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Harald Welte <laforge@gnumonks.org>,
 Antonio Quartulli <antonio@openvpn.net>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Oliver Neukum <oliver@neukum.org>, David Ahern <dsahern@kernel.org>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Parav Pandit <parav@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>,
 Kees Cook <kees@kernel.org>, Jianbo Liu <jianbol@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, Guillaume Nault <gnault@redhat.com>,
 Cosmin Ratiu <cratiu@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>,
 Alexandre Cassen <acassen@corp.free.fr>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "open list:INFINIBAND SUBSYSTEM" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NETRONOME ETHERNET DRIVERS" <oss-drivers@corigine.com>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 "open list:GTP (GPRS Tunneling Protocol)" <osmocom-net-gprs@lists.osmocom.org>,
 "open list:USB CDC ETHERNET DRIVER" <linux-usb@vger.kernel.org>,
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>,
 "open list:INTEL PRO/WIRELESS 2100, 2200BG,
 2915ABG NETWOR..." <linux-wireless@vger.kernel.org>, 
 "open list:ETHERNET BRIDGE" <bridge@lists.linux.dev>
Subject: Re: [PATCH 05/10 net-next v2] drivers: net: drop ipv6_stub usage and
 use direct function calls
Message-ID: <abLEQMx6mPM4vL4t@zx2c4.com>
References: <20260310153506.5181-1-fmancera@suse.de>
 <20260310153506.5181-6-fmancera@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310153506.5181-6-fmancera@suse.de>
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

On Tue, Mar 10, 2026 at 04:34:28PM +0100, Fernando Fernandez Mancera wrote:
> diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.c
> index 253488f8c00f..c362c78d908e 100644
> --- a/drivers/net/wireguard/socket.c
> +++ b/drivers/net/wireguard/socket.c
> @@ -136,8 +136,7 @@ static int send6(struct wg_device *wg, struct sk_buff *skb,
>  			if (cache)
>  				dst_cache_reset(cache);
>  		}
> -		dst = ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
> -						      NULL);
> +		dst = ip6_dst_lookup_flow(sock_net(sock), sock, &fl, NULL);
>  		if (IS_ERR(dst)) {
>  			ret = PTR_ERR(dst);
>  			net_dbg_ratelimited("%s: No route to %pISpfsc, error %d\n",

Rest in peace, stub.

For the WireGuard part,

    Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
