Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F392DCF64A6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 02:47:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b1ff86c;
	Thu, 20 Nov 2025 02:44:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7cf79b48
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 02:44:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 17D8640A7C;
 Thu, 20 Nov 2025 02:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1C9C4CEF5;
 Thu, 20 Nov 2025 02:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763606678;
 bh=ix0hqericVGB0EMLnx7+/jSBoCx0qtxlgsvyY0lfAwk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CbqHCvb6xuIDW4adOja7BpfssfDDeF8vwdsThdcJToGr5cSGuq7srO0KQtg6Z/Cdt
 kAVah/JwhElvIV82uO/0HXY3S2WC7NH0kqyeYX8gWpGwXbakF51wGpKng3plJVhowL
 QzDDTm7RCWCIDINIzmJixvUPDmfNjAJIpXJIdzr58uBZn3BLYpIzNxtFjvdQwPurrz
 32EzWzKeMw0plfZq4irDn8r1PVFjP8wit9GcdgE5YjpvLxkg/AglMhZUZzPMyO6pvi
 7sxxGjQro0gKd/PihkHyVjzxQE6iND53KFaquRqkZb43wYSGMO3RBQxJ6Z9SfMjucP
 Nr8YugoXPhwIg==
Date: Wed, 19 Nov 2025 18:44:36 -0800
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
Message-ID: <20251119184436.1e97aeab@kernel.org>
In-Reply-To: <aR5m174O7pklKrMR@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net>
 <aRyNiLGTbUfjNWCa@zx2c4.com>
 <d2e84a2b-74cd-44a1-97a6-a10ece7b4c5f@fiberby.net>
 <aRz4eVCjw_JUXki6@zx2c4.com> <20251118170045.0c2e24f7@kernel.org>
 <aR5m174O7pklKrMR@zx2c4.com>
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

On Thu, 20 Nov 2025 01:54:47 +0100 Jason A. Donenfeld wrote:
> On Tue, Nov 18, 2025 at 05:00:45PM -0800, Jakub Kicinski wrote:
> > On Tue, 18 Nov 2025 23:51:37 +0100 Jason A. Donenfeld wrote:  
> > > I mean, there is *tons* of generated code in the kernel. This is how it
> > > works. And you *want the output to change when the tool changes*. That's
> > > literally the point. It would be like if you wanted to check in all the
> > > .o files, in case the compiler started generating different output, or
> > > if you wanted the objtool output or anything else to be checked in. And
> > > sheerly from a git perspective, it seems outrageous to touch a zillion
> > > files every time the ynl code changes. Rather, the fact that it's
> > > generated on the fly ensures that the ynl generator stays correctly
> > > implemented. It's the best way to keep that code from rotting.  
> > 
> > CI checks validate that the files are up to date.
> > There has been no churn to the kernel side of the generated code.
> > Let's be practical.  
> 
> Okay, it sounds like neither of you want to do this. Darn. I really hate
> having generated artifacts laying around that can be created efficiently
> at compile time. But okay, so it goes. I guess we'll do that.
> 
> I would like to ask two things, then, which may or may not be possible:
> 
> 1) Can we put this in drivers/net/wireguard/generated/netlink.{c.h}
>    And then in the Makefile, do `wireguard-y += netlink.o generated/netlink.o`
>    on one line like that. I prefer this to keeping it in the same
>    directory with the awkward -gen suffix.

That should work, I think.

> 2) In the header of each generated file, automatically write out the
>    command that was used to generate it. Here's an example of this good
>    habit from Go: https://github.com/golang/go/blob/master/src/syscall/zsyscall_linux_amd64.go

You don't like the runes? :)

/* Do not edit directly, auto-generated from: */
/*	$YAML-path */
/* YNL-GEN [kernel|user|uapi] [source|header] */
/* YNL-ARG $extra-args */

Do you care about the exact cmdline of the python tool, or can we just
append:

/* To regenerate run: tools/net/ynl/ynl-regen.sh */
