Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500D2C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 11:32:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8414887;
	Tue, 20 May 2025 19:54:33 +0000 (UTC)
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79f0784f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2025 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1739429731; x=1770965731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y6vhqwcHgjQ9crHQuKcOHH1ChdkHGoRglO+wy/6/WSQ=;
 b=RYN5sa0ElC5vozUBCDoSrnX60JjyUy3mx3NBFaKoOqnAW9x6bAclh6ll
 3I1SVgTOBhLMQhdxU4aArMrn5fMkTIfMn4QDavIc8keHYTyIr9LES+uHN
 rCMsQS3qB42GiQ5sfl0V5TUkxVvr3iS1YopcMft2z2B9y/cO6OBmC5RJt M=;
X-IronPort-AV: E=Sophos;i="6.13,282,1732579200"; d="scan'208";a="270777830"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:55:26 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:9280]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.246:2525]
 with esmtp (Farcaster)
 id 0c153c97-2bf1-4a6b-942d-4cbd218ce4f6; Thu, 13 Feb 2025 06:55:25 +0000 (UTC)
X-Farcaster-Flow-ID: 0c153c97-2bf1-4a6b-942d-4cbd218ce4f6
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 13 Feb 2025 06:55:24 +0000
Received: from 6c7e67bfbae3.amazon.com (10.37.244.7) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 13 Feb 2025 06:55:16 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <shaw.leon@gmail.com>
CC: <alex.aring@gmail.com>, <andrew+netdev@lunn.ch>,
 <b.a.t.m.a.n@lists.open-mesh.org>, <bpf@vger.kernel.org>,
 <bridge@lists.linux.dev>, <davem@davemloft.net>, <donald.hunter@gmail.com>,
 <dsahern@kernel.org>, <edumazet@google.com>, <herbert@gondor.apana.org.au>,
 <horms@kernel.org>, <kuba@kernel.org>, <kuniyu@amazon.com>,
 <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-ppp@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-wpan@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <netdev@vger.kernel.org>, <osmocom-net-gprs@lists.osmocom.org>,
 <pabeni@redhat.com>, <shuah@kernel.org>, <stefan@datenfreihafen.org>,
 <steffen.klassert@secunet.com>, <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v9 03/11] net: Use link netns in newlink() of
 rtnl_link_ops
Date: Thu, 13 Feb 2025 15:55:06 +0900
Message-ID: <20250213065506.8720-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250210133002.883422-4-shaw.leon@gmail.com>
References: <20250210133002.883422-4-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.37.244.7]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

From: Xiao Liang <shaw.leon@gmail.com>
Date: Mon, 10 Feb 2025 21:29:54 +0800
> These netdevice drivers already uses netns parameter in newlink()
> callback. Convert them to use rtnl_newlink_link_net() or
> rtnl_newlink_peer_net() for clarity and deprecate params->net.
> 
> Signed-off-by: Xiao Liang <shaw.leon@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>


> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> index 8151e91395e2..ab7e5b6649b2 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> @@ -122,8 +122,8 @@ static int rmnet_newlink(struct net_device *dev,
>  			 struct netlink_ext_ack *extack)
>  {
>  	u32 data_format = RMNET_FLAGS_INGRESS_DEAGGREGATION;
> +	struct net *link_net = rtnl_newlink_link_net(params);

nit: reverse xmas tree


>  	struct nlattr **data = params->data;
> -	struct net *src_net = params->net;
>  	struct nlattr **tb = params->tb;
>  	struct net_device *real_dev;
>  	int mode = RMNET_EPMODE_VND;
