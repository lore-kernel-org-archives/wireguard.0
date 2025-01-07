Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9994DC54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:10:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f97476f;
	Tue, 20 May 2025 19:38:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da92f50a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2025 20:38:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8AB125C5EAC;
 Tue,  7 Jan 2025 20:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582D5C4CED6;
 Tue,  7 Jan 2025 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736282287;
 bh=xVENo9muNO/TQ5xVqUKOs/5Q4+G96PW1sKSnQr73q9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IincHyk5dnHSj14WBxB3nZ8H+ad7Wv7JCDFqB3ioz1CyxVIL28f/wayA5OfnPboFy
 w4bYeV8oyIpNsDF2th/1YTvksDeeiWBKLOGweUN5unnHCsYuY6UO9/ov33L1S7sVm+
 1K3BnLtTw6iZPtOBVnjoMMzolL2SbZULRRKu+YNbYACOMPPIofT1Am+zEPd/PAx/vs
 ld0p/Rkjj2unh6Png65S7WHaBoyC3nNe0ZjG8UBnxGV+bt8cBPNwF55J92ceGMmf0M
 9p3XnJzVS37fvnQRlLFc7Do5qJjEPxgQYy5375IiG9MyjZthi5D9QPQCuQtvR2QVYT
 LbPjcwrrJqcnA==
Date: Tue, 7 Jan 2025 12:38:05 -0800
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
Subject: Re: [PATCH net-next v7 02/11] rtnetlink: Pack newlink() params into
 struct
Message-ID: <20250107123805.748080ab@kernel.org>
In-Reply-To: <20250104125732.17335-3-shaw.leon@gmail.com>
References: <20250104125732.17335-1-shaw.leon@gmail.com>
 <20250104125732.17335-3-shaw.leon@gmail.com>
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

On Sat,  4 Jan 2025 20:57:23 +0800 Xiao Liang wrote:
> -static int amt_newlink(struct net *net, struct net_device *dev,
> -		       struct nlattr *tb[], struct nlattr *data[],
> -		       struct netlink_ext_ack *extack)
> +static int amt_newlink(struct rtnl_newlink_params *params)
>  {
> -	struct amt_dev *amt = netdev_priv(dev);
> +	struct netlink_ext_ack *extack = params->extack;
> +	struct net_device *dev = params->dev;
> +	struct nlattr **data = params->data;
> +	struct nlattr **tb = params->tb;
> +	struct net *net = params->net;
> +	struct amt_dev *amt;

IMHO you packed a little too much into the struct.
Could you take the dev and the extack back out?
