Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52471CA1013
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 01:05:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43964f96;
	Sat, 6 Sep 2025 00:25:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ddb223b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:25:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 239FD601B3;
 Sat,  6 Sep 2025 00:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4650AC4CEF1;
 Sat,  6 Sep 2025 00:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757118309;
 bh=yP/GDoclDLsfsIo4nhpvDpvK7+Yf36VKXuayJgr73bQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NdD/5E+mHevSw7FzcjQiumRERkotLTiplwKjQZ1RqAR++KZmRXYyEt13ydSu+2VPQ
 kOKKSojwkEJEgli6vwAOE3d3ch99BDSpdjR4EhjCLGsQj8TkyoSK39wAPKon6N7XOp
 dW28BImWwKZxRIGIi/Q/dnvWxS9mxnKhDCCmbk+4uWbMbCXwWiypn0+XfTSIVUrl45
 rRlHx+8F7HUNrs9rw4v9gEqlh5jZ/YdYFESbbS82lLVRThHAEytm5WnyzlfwBBTej6
 i2TlLh31TCMo3IJZul+zXG4gtAcNZlUQoXAF9f4PCGld0llyt53dLeZFFaL4BwQxsm
 kN/7VkLBdTHEw==
Date: Fri, 5 Sep 2025 17:25:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 07/11] tools: ynl-gen: rename TypeArrayNest to
 TypeIndexedArray
Message-ID: <20250905172508.45bbb3ef@kernel.org>
In-Reply-To: <20250904220156.1006541-7-ast@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-7-ast@fiberby.net>
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

On Thu,  4 Sep 2025 22:01:30 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> As TypeArrayNest can now be used with many other sub-types
> than nest, then rename it to TypeIndexedArray, to reduce
> confusion.

You need to also find all the local comments and variables which allude
to the name.
