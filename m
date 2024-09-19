Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BB7D10F3A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 01:45:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff8ff9b0;
	Mon, 18 Nov 2024 01:37:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ffea2c2a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Sep 2024 12:16:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DAD5FA43CA8;
 Thu, 19 Sep 2024 12:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CBFC4CEC4;
 Thu, 19 Sep 2024 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726748181;
 bh=8h7FfpZzbjTFptTnA/Z5o6GwaFEX7ZWJDqJwd67LE6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQK/+r/OHF9GbsIUMvKBZuSfh7EgjoyUP3Z8wjOxeCTMWxxbkzon97XcEq/WwH8dR
 pL7IACEPTmo76JnpbQvOQggSS4cRBzAg61VabHLkLp/NmjP0+xD5xbQhRZESJPzgy2
 9zb7Hr6Edmq0yLb2MSto0N1fE3IdJVc8aoPJJXUsvl1F5C1FGWAI7Art76CFpzQhot
 z8fMIx4gjg6hR2FD49qCcw2VmqNC8h9SQXbl6xNCL8gh15PvP2/M+5MBgxAdrOWdSD
 xWVlAqUxvy0Asn+InM0JmRGfolw7b+B3jA6WGhNHZOZtOOjBjc7qENbZmX9IMd9Poc
 PsNFys0TR6tFg==
Date: Thu, 19 Sep 2024 13:16:16 +0100
From: Simon Horman <horms@kernel.org>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] wireguard: Omit unnecessary memset of netdev
 private data
Message-ID: <20240919121616.GF1044577@kernel.org>
References: <20240919085746.16904-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919085746.16904-1-tklauser@distanz.ch>
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

On Thu, Sep 19, 2024 at 10:57:46AM +0200, Tobias Klauser wrote:
> The memory for netdev_priv is allocated using kvzalloc in
> alloc_netdev_mqs before rtnl_link_ops->setup is called so there is no
> need to zero it again in wg_setup.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Reviewed-by: Simon Horman <horms@kernel.org>

...
