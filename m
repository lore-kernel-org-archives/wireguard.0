Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A6DCFA441
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 19:51:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07e67bd1;
	Thu, 20 Nov 2025 19:49:38 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 166fa4f2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1763668174;
 bh=aaQG0ySZh1Xhb3rGAP0lpVyomQzOOTAj00uXOU0D6mo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RXZmxoDqsHM3U+fR6/ajCo/wBknWKev49UZoh23h/ZxTCcyrjiEGRa5zqya23A7c/
 +3ggLQd5LiX3wXgEoVRuWjGvZhlBHGFS6+MG5Tx8lFbDYLkb5w/hiIsTnT2WBJ2oQh
 14rB+E/PeVqpPhydZN1XGtl/bah0ZMu0jS7L2fBqeliK6FxWGGt8I6KgnWgXRNieDv
 Y/hSrA7LxZCLYwl4YO0LuxtE0zkm5q/nEBgeAXblijCetwyf8tuPk9ZkYwqI+erRxA
 WBBUtA5qX9d0xhoW/dtsj122s6v+aKav29kVtLwomUCIOMZzpIfsQ11tX4AyQx2m8L
 SnWYHfT2DEOOw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id E2038600FC;
 Thu, 20 Nov 2025 19:49:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 67C0D2002DF;
 Thu, 20 Nov 2025 19:49:08 +0000 (UTC)
Message-ID: <6eb6b171-31f5-4c30-aab6-277f32d48678@fiberby.net>
Date: Thu, 20 Nov 2025 19:49:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 11/11] wireguard: netlink: generate netlink
 code
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net> <aRyNiLGTbUfjNWCa@zx2c4.com>
 <d2e84a2b-74cd-44a1-97a6-a10ece7b4c5f@fiberby.net>
 <aRz4eVCjw_JUXki6@zx2c4.com> <20251118170045.0c2e24f7@kernel.org>
 <aR5m174O7pklKrMR@zx2c4.com>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <aR5m174O7pklKrMR@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/20/25 12:54 AM, Jason A. Donenfeld wrote:
> On Tue, Nov 18, 2025 at 05:00:45PM -0800, Jakub Kicinski wrote:
>> On Tue, 18 Nov 2025 23:51:37 +0100 Jason A. Donenfeld wrote:
>>> I mean, there is *tons* of generated code in the kernel. This is how it
>>> works. And you *want the output to change when the tool changes*. That's
>>> literally the point. It would be like if you wanted to check in all the
>>> .o files, in case the compiler started generating different output, or
>>> if you wanted the objtool output or anything else to be checked in. And
>>> sheerly from a git perspective, it seems outrageous to touch a zillion
>>> files every time the ynl code changes. Rather, the fact that it's
>>> generated on the fly ensures that the ynl generator stays correctly
>>> implemented. It's the best way to keep that code from rotting.
>>
>> CI checks validate that the files are up to date.
>> There has been no churn to the kernel side of the generated code.
>> Let's be practical.
> 
> Okay, it sounds like neither of you want to do this. Darn. I really hate
> having generated artifacts laying around that can be created efficiently
> at compile time. But okay, so it goes. I guess we'll do that.

I generally agree, but given this generates code across the tree, then I
prefer this, as side-effects are more obvious.

To complete Jakub's earlier argument of not complicating everyone's life,
then this code generator is Python-based and depends on yaml and jsonschema.
Even doing compile-time generation for a single family, would elevate those
packages from developer-dependencies to build-dependencies.

> I would like to ask two things, then, which may or may not be possible:
> 
> 1) Can we put this in drivers/net/wireguard/generated/netlink.{c.h}
>     And then in the Makefile, do `wireguard-y += netlink.o generated/netlink.o`
>     on one line like that. I prefer this to keeping it in the same
>     directory with the awkward -gen suffix.

Sure, there isn't much consistency across families anyway.
