Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35432CE8D6B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 00:57:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68b53c54;
	Tue, 18 Nov 2025 00:57:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 642b7f9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 00:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D672416BB;
 Tue, 18 Nov 2025 00:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD5CC4AF0D;
 Tue, 18 Nov 2025 00:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763427422;
 bh=Il89Mbvnt1csqkwQE2r+nkLyEwaXm5iNU4OXO4fn4Bw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o5fOMss99Y9LXK4WJw/FKdUw944OfO8aHJDlcaV9p22ErvbZ20Zhf+iNxGRb8OjOY
 H22PxwvwYo77HXlSNgO1D1CIJHAUukrXjnwC6/Ic2PRzOrEK+yM5RY2CzDtVe9INXy
 h6g38JwySY4jKbR3eNWhrkJD2BlOVkJ4bZv7TaGlQPaIJ8H99SZ/zVnVf0CH7YuiO7
 alWN2/mpVofoQ+Sva9LSsHkUWFX4m66glTgqni8X3mwnfczuQCADp/kxFmL4ctTrlF
 fgoiIOIGt1yP8O3bkv+iLQoft2/004dzwaVk/gV0sbqbeE/sHUr7FfMPOy3XkIv3kl
 MqukLPfKQ907A==
Date: Mon, 17 Nov 2025 16:56:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?=
 <ast@fiberby.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 00/11] wireguard: netlink: ynl conversion
Message-ID: <20251117165659.2dfd369e@kernel.org>
In-Reply-To: <aRvBOWHU5Zow65HD@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251110180746.4074a9ca@kernel.org> <aRQGIhazVqTdS2R_@zx2c4.com>
 <20251117161439.1dedf4b6@kernel.org> <aRvBOWHU5Zow65HD@zx2c4.com>
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

On Tue, 18 Nov 2025 01:43:37 +0100 Jason A. Donenfeld wrote:
> On Mon, Nov 17, 2025 at 04:14:39PM -0800, Jakub Kicinski wrote:
> > On Wed, 12 Nov 2025 04:59:30 +0100 Jason A. Donenfeld wrote:  
> > > Reviewing it this week. Thanks for bumping this in my queue.  
> > 
> > Sadness. We wait a week and no review materializes. I think the patches
> > are fine so I'll apply them shortly. The expected patch review SLA for
> > netdev sub-maintainers is 24h (excluding weekends and holidays)
> > https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html  
> 
> Sadness indeed. I've had some urgent matters come up, but this is now
> top of the stack, and I've given it a quick preliminary pass. I'd
> planned to take this through my wg tree.

Alright, I haven't pushed out yet, so let me drop these.
Looking forward to seeing them in a PR..
