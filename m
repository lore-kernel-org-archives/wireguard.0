Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D321FCF64A0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 00:55:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fcd77ce;
	Thu, 20 Nov 2025 00:55:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d785fef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 00:54:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1AB0B429FF;
 Thu, 20 Nov 2025 00:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAFAC4CEF5;
 Thu, 20 Nov 2025 00:54:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YjwsnnoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763600093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMOmny8d8deudNAgvKqA5B6ZSfjuWQary3xMXoxOMW0=;
 b=YjwsnnoZ/Qs/xgonwxaFwi7W5/6A3KZjh1E6M/wVCndmJvrPt2DtS4er7b6cOas4Z8lbUW
 5D5okw/FU3nqyStAZMQI6hJJAgx2SGKkqTN9BYbpLZokiq+riAwOY1lNkjcfdHMYoKoGpo
 1wOApy/x7JzLigkc/uPs6BiGe1PCU80=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eadb20d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 20 Nov 2025 00:54:52 +0000 (UTC)
Date: Thu, 20 Nov 2025 01:54:47 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 11/11] wireguard: netlink: generate netlink
 code
Message-ID: <aR5m174O7pklKrMR@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net>
 <aRyNiLGTbUfjNWCa@zx2c4.com>
 <d2e84a2b-74cd-44a1-97a6-a10ece7b4c5f@fiberby.net>
 <aRz4eVCjw_JUXki6@zx2c4.com> <20251118170045.0c2e24f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118170045.0c2e24f7@kernel.org>
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

On Tue, Nov 18, 2025 at 05:00:45PM -0800, Jakub Kicinski wrote:
> On Tue, 18 Nov 2025 23:51:37 +0100 Jason A. Donenfeld wrote:
> > I mean, there is *tons* of generated code in the kernel. This is how it
> > works. And you *want the output to change when the tool changes*. That's
> > literally the point. It would be like if you wanted to check in all the
> > .o files, in case the compiler started generating different output, or
> > if you wanted the objtool output or anything else to be checked in. And
> > sheerly from a git perspective, it seems outrageous to touch a zillion
> > files every time the ynl code changes. Rather, the fact that it's
> > generated on the fly ensures that the ynl generator stays correctly
> > implemented. It's the best way to keep that code from rotting.
> 
> CI checks validate that the files are up to date.
> There has been no churn to the kernel side of the generated code.
> Let's be practical.

Okay, it sounds like neither of you want to do this. Darn. I really hate
having generated artifacts laying around that can be created efficiently
at compile time. But okay, so it goes. I guess we'll do that.

I would like to ask two things, then, which may or may not be possible:

1) Can we put this in drivers/net/wireguard/generated/netlink.{c.h}
   And then in the Makefile, do `wireguard-y += netlink.o generated/netlink.o`
   on one line like that. I prefer this to keeping it in the same
   directory with the awkward -gen suffix.

2) In the header of each generated file, automatically write out the
   command that was used to generate it. Here's an example of this good
   habit from Go: https://github.com/golang/go/blob/master/src/syscall/zsyscall_linux_amd64.go

Jason
