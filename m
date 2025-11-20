Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AD7CF64AE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 03:23:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64817cc4;
	Thu, 20 Nov 2025 03:20:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce9f8e6b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 03:20:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0A9224363F;
 Thu, 20 Nov 2025 03:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A88C4CEF5;
 Thu, 20 Nov 2025 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763608799;
 bh=SnHtT1XSX2LRMY8qiz6OJtd2+7a2qULjOsCaX+Ox058=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tUxX61QoG9zh8dMM3E7bPKpkwMRYQ553n0hiVBARcxm+K/bb15eh7mT4ImDxsFd8E
 w3uiuV+mIJrtYWZKoysb2Lk87+fUwQEtVw078iAA4zKTuzyDUlLmo/AAZFgEg7W0w2
 1XkHKODQTMX3mQFKCwn8pn0cNIS5vNQ6kbG083Bqjrx/lqmMt3TTFF4NotVOIWJ98l
 sY4Vnjr3Fhgv8k8p33L7WEIVG3odnVC8ZKst9qSEwPUxh9Kc7ZR99W/CaQVJLkft9U
 1LmcVhbmbnt/GY7DG9rk4fp88fUiD8iy+MpL3V39/BRZtN8yWYFGXIGxgulhrInevT
 MAY0Zq6+pgFhg==
Date: Wed, 19 Nov 2025 19:19:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?=
 <ast@fiberby.net>, Donald Hunter <donald.hunter@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 11/11] wireguard: netlink: generate netlink
 code
Message-ID: <20251119191958.07d9de89@kernel.org>
In-Reply-To: <CAHmME9oO0sGnHrZUeETmL+CCj1UZ+aQx_CPArXKpFuBhE9UYbw@mail.gmail.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net>
 <aRyNiLGTbUfjNWCa@zx2c4.com>
 <d2e84a2b-74cd-44a1-97a6-a10ece7b4c5f@fiberby.net>
 <aRz4eVCjw_JUXki6@zx2c4.com> <20251118170045.0c2e24f7@kernel.org>
 <aR5m174O7pklKrMR@zx2c4.com> <20251119184436.1e97aeab@kernel.org>
 <CAHmME9oO0sGnHrZUeETmL+CCj1UZ+aQx_CPArXKpFuBhE9UYbw@mail.gmail.com>
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

On Thu, 20 Nov 2025 03:46:39 +0100 Jason A. Donenfeld wrote:
> > Do you care about the exact cmdline of the python tool, or can we just
> > append:
> >
> > /* To regenerate run: tools/net/ynl/ynl-regen.sh */  
> 
> The args are non-trivial, right?

They aren't all that complicated TBH, quoting slightly modified from
tools/net/ynl/ynl-regen.sh:

    $TOOL --mode $mode --$type --spec $KDIR/$yaml_spec $extra_args -o $output

The line just gets quote long for my taste with all the paths in place.

Somewhere along the line we added --cmp-out to make sure output isn't
modified on every regen attempt (for the benefit of incremental builds).

> The idea is so that these files can be regenerated in a few years
> when the ynl project has widely succeeded and we've all paged this
> out of our minds and forgotten how it all worked.

We run ./tools/net/ynl/ynl-regen.sh in our CI, checking if anything
diverged. Primarily because in early days, when codegen was modified
more often, I was worried we'll break the generation for some of the
specs.

The documentation also basically says "create the fake header where 
you want the file to be and run ./tools/net/ynl/ynl-regen.sh".

https://docs.kernel.org/userspace-api/netlink/intro-specs.html#generating-kernel-code

Admittedly most of this comes down to "what Jakub found convenient
when developing the specs" :S
