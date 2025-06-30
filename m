Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCC1C8302D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 16:52:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e482082c;
	Mon, 30 Jun 2025 16:52:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 695f4f42
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 16:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 23638A53525;
 Mon, 30 Jun 2025 16:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8152C4CEE3;
 Mon, 30 Jun 2025 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751302368;
 bh=ynSULjvftMGEMlk5ALeUVxFoOeZH57lE+BBWW/McDyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f6c2sUEV2lZhr4RcULq52OO0QWjUVVSO3vfJqZW9A84yVZnzsmhTwdSC8stVTEqWi
 y0mscqT6CR3X1TcasuJQk4tli2MKnFa06KP88RMUZBrbaiCsAR+LRhYaMhnmLGsy0m
 vQv80hQa7vKFlbUAFLXSRgYy9QoA0BxSKLW325Dj9SVyRaLYfn/bMEbs3m+J9KyTWI
 ACHS7WqCtYRHnMOO6TSOVagXc6cascmuxySzg+MMkryREWOPAVZBlRo0GubY1IHIRo
 fFRuz+y5vN8jtz6/RRQtmhBdtz53GFwcBismX2jgLay0nB55/ckuwAM2pLbZk/DYdi
 yyosxfV32KEvw==
Date: Mon, 30 Jun 2025 17:52:44 +0100
From: Simon Horman <horms@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Message-ID: <20250630165244.GL41770@horms.kernel.org>
References: <20250619145501.351951-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619145501.351951-1-yury.norov@gmail.com>
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

On Thu, Jun 19, 2025 at 10:54:59AM -0400, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> function significantly simpler. While there, fix opencoded cpu_online()
> too.
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20250604233656.41896-1-yury.norov@gmail.com/
> v2:
>  - fix 'cpu' undeclared;
>  - change subject (Jason);
>  - keep the original function structure (Jason);

Reviewed-by: Simon Horman <horms@kernel.org>

