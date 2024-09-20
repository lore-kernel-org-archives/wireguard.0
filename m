Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1436FD10F3C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 01:45:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f92c0295;
	Mon, 18 Nov 2024 01:37:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b2dd124
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Sep 2024 15:27:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F1A15C571A;
 Fri, 20 Sep 2024 15:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73877C4CEC3;
 Fri, 20 Sep 2024 15:27:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="M76hI5HT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1726846034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPtVSjCsw7hP74dB48c+epdRVIHu9uZkO6i/klxH/8U=;
 b=M76hI5HTs+ZhqaNTsppdKlQmLSFAbINKYlYOnmQ0D9LMQfzuHPblpCuj3B7zN9mmDxf+AX
 sWizT7Ekr01Ki8DDUavVCqi9T3JOXIgFdDiqlJbucI91YiuzgzxPG6GUbeJQfN4EFkIKpu
 n26I0IOwyNIjDRKRdz8Lkx5jtwkvE44=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 605a5579
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 20 Sep 2024 15:27:14 +0000 (UTC)
Date: Fri, 20 Sep 2024 17:27:12 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] wireguard: Omit unnecessary memset of netdev
 private data
Message-ID: <Zu2UUGtENfHmtnOc@zx2c4.com>
References: <20240919085746.16904-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Thanks. Seems reasonable to me. I'll queue it up in the wireguard tree.

Jason
