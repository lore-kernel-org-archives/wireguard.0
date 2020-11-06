Return-Path: <SRS0=F3dT=EM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C03C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Nov 2020 01:15:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F1A20759
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Nov 2020 01:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ineufTY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F1A20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 223248f5;
	Fri, 6 Nov 2020 01:11:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6816c6c1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Nov 2020 01:11:42 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B78DF20759;
 Fri,  6 Nov 2020 01:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604625288;
 bh=ais4RAG5J5KbGpzBalzy6kY8SokXfVySb1Kn46M5B2E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ineufTY4gfwEtblPwybn2JPUuMn42nQHtjK9ZZboHE/r4v8AE6puMvjz89FsibJIr
 mWvWFo9wntDfjzuGjiEoCFLsrOHYw0THqpEFTeFm8/s3O5P5hU6Ki9oomXAJmCOu27
 rDr2v2YgGI3MDT2FxlO0YVh1g3XtAv3UqysVEiCc=
Date: Thu, 5 Nov 2020 17:14:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, Willem de Bruijn
 <willemb@google.com>
Cc: David Miller <davem@davemloft.net>, Alexey Kuznetsov
 <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Andrew
 Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Harald Welte <laforge@gnumonks.org>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 osmocom-net-gprs@lists.osmocom.org, wireguard@lists.zx2c4.com, Steffen
 Klassert <steffen.klassert@secunet.com>
Subject: Re: [PATCH net-next v2 03/10] tun: switch to net core provided
 statistics counters
Message-ID: <20201105171446.5f78f1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <30fd49be-f467-95f5-9586-fec9fbde8e48@gmail.com>
References: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
 <30fd49be-f467-95f5-9586-fec9fbde8e48@gmail.com>
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

On Wed, 4 Nov 2020 15:25:24 +0100 Heiner Kallweit wrote:
> @@ -1066,7 +1054,7 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
>  	return NETDEV_TX_OK;
>  
>  drop:
> -	this_cpu_inc(tun->pcpu_stats->tx_dropped);
> +	dev->stats.tx_dropped++;
>  	skb_tx_error(skb);
>  	kfree_skb(skb);
>  	rcu_read_unlock();

This is no longer atomic. Multiple CPUs may try to update it at the
same time.

Do you know what the story on dev->rx_dropped is? The kdoc says drivers
are not supposed to use it but:

drivers/net/ipvlan/ipvlan_core.c:               atomic_long_inc(&skb->dev->rx_dropped);
drivers/net/macvlan.c:  atomic_long_inc(&skb->dev->rx_dropped);
drivers/net/vxlan.c:            atomic_long_inc(&vxlan->dev->rx_dropped);

Maybe tun can use it, too?
