Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D558C4742C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 03:58:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBCA42063A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 03:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeG9ireB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBCA42063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec89c95e;
	Tue, 10 Nov 2020 03:54:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 169ca6ca
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 03:54:35 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC48B2054F;
 Tue, 10 Nov 2020 03:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980693;
 bh=LYd6sGtqAyllUZ+TrvpQ0ZyMTLKy+YxG+IC0lRSP0tg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PeG9ireBIMzUv7Q12nrOYnN4Q8LVc3jZHg2H91I8KoS4gDGeTGasfMomSW9KGU4zm
 PriQL/3QKFPXnDXQAPN8fZzHi6/H5q39LcJ68hn9LVI5dYFWE0um2AkZsH5pcX0q5v
 cGixoTXrRdTRFjj/0r+ZKnEplwPxM7H1iEuSDhkU=
Date: Mon, 9 Nov 2020 19:58:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
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
Subject: Re: [PATCH net-next v3 00/10] net: add and use dev_get_tstats64
Message-ID: <20201109195811.7be5882c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
References: <99273e2f-c218-cd19-916e-9161d8ad8c56@gmail.com>
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

On Sat, 7 Nov 2020 21:48:13 +0100 Heiner Kallweit wrote:
> It's a frequent pattern to use netdev->stats for the less frequently
> accessed counters and per-cpu counters for the frequently accessed
> counters (rx/tx bytes/packets). Add a default ndo_get_stats64()
> implementation for this use case. Subsequently switch more drivers
> to use this pattern.
> 
> v2:
> - add patches for replacing ip_tunnel_get_stats64
>   Requested additional migrations will come in a separate series.
> 
> v3:
> - add atomic_long_t member rx_frame_errors in patch 3 for making
>   counter updates atomic

Applied, thank you!
