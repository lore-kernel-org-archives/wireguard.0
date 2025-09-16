Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25866CAC597
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 01:44:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2a24e9c;
	Tue, 16 Sep 2025 01:43:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 370841c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 01:43:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8D869600B0;
 Tue, 16 Sep 2025 01:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B423BC4CEF1;
 Tue, 16 Sep 2025 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757986994;
 bh=rGF9yBokwARP5IBwNwGP3vWFFb3W8fmlnGJn0AuxBqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=efDleR18yrK64kISRPQQgqhRMynbLbIII7j2IrQs1kT+cF+FHqnWJqcfRoQ03eA6y
 Sxs+O0DCeYfZ3QnwnpYCL6/hCUyCAhL8GD1wmlxNXbsxrIqUu/8JZqZHIL+xp1coo8
 HsWUNVBiqu1ULbwGF31amK5ZMWSHlBkMbdmeka5tmEFGGOFjRDckhGPTJ5ju+Kewmw
 Wb+dlJBoA6zDpBGYYplMCEVcIURgzU8MAF9JPczLaUYUCkcZTE+hNIE6tHtULc5xnc
 JYFmCb9MlbikUFVRl8BNK3WECQ1ons1GCZKadCD3fBdKCtwF98o7BCrvZfRqEFYSa2
 4epICkkiGuFJA==
Date: Mon, 15 Sep 2025 18:43:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 07/11] tools: ynl-gen: rename TypeArrayNest
 to TypeIndexedArray
Message-ID: <20250915184312.6a216d82@kernel.org>
In-Reply-To: <20250915144301.725949-8-ast@fiberby.net>
References: <20250915144301.725949-1-ast@fiberby.net>
 <20250915144301.725949-8-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Sep 2025 14:42:52 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Since TypeArrayNest can now be used with many other sub-types
> than nest, then rename it to TypeIndexedArray, to reduce
> confusion.
>=20
> This patch continues the rename, that was started in commit
> aa6485d813ad ("ynl: rename array-nest to indexed-array"),
> when the YNL type was renamed.
>=20
> In order to get rid of all references to the old naming,
> within ynl, then renaming some variables in _multi_parse().
>=20
> This is a trivial patch with no behavioural changes intended.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
