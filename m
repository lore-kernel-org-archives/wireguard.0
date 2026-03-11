Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433A103E2F0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Mar 2026 22:59:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 29155752;
	Wed, 11 Mar 2026 22:59:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7ef9d456
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Mar 2026 22:59:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E22A4437B;
 Wed, 11 Mar 2026 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D74BC4CEF7;
 Wed, 11 Mar 2026 22:59:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iPW66n68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1773269986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sy9Zwi13LYATgziwqUdxkmcUUvo4YWLt3PnTjZqv2kU=;
 b=iPW66n681C3YfmXx7ixB8/OrfAekPxh3on8GyzOtfLEK9ERUeqP97ANsFieKJuiggi0OL/
 ZEKhcnxAr1G3bDC2FMsLccPsa5EutyzUajshYbVVJSOx7yenan38j1p6QCncIIEzREpXtl
 shQs6PHduTQNOyGqfmHnGSQbbUzW9cM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f2398e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 11 Mar 2026 22:59:46 +0000 (UTC)
Date: Wed, 11 Mar 2026 23:59:43 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Valentin Spreckels <valentin@spreckels.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: prevent ipv6 addrconf via
 IFF_NO_ADDRCONF flag
Message-ID: <abHz3xcsLhIPc_Jn@zx2c4.com>
References: <20260208170545.31942-1-valentin@spreckels.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260208170545.31942-1-valentin@spreckels.dev>
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

Hi Valentin,

On Sun, Feb 08, 2026 at 06:05:45PM +0100, Valentin Spreckels wrote:
> Use the flag introduced in commit 8a321cf7becc6 ("net: add
> IFF_NO_ADDRCONF and use it in bonding to prevent ipv6 addrconf")
> instead of mangling the addr_gen_mode to prevent ipv6 addrconf.

Can you give some more context here? Why was IFF_NO_ADDRCONF added when
the IN6_ADDR_GEN_MODE_NONE method has been working fine? What's the
difference between these approaches? I don't doubt that your patch is
correct, but I would like to better understand this.

Jason
