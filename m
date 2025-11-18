Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9025CF6484
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 22:10:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a40a9ab;
	Tue, 18 Nov 2025 22:00:40 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 63100e6e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1763503234;
 bh=wSq9nkMhOrqUYoM5UqOfCd2cKo+gg7tNC4z9SKtDj4w=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=dYjl3/bQdM0hW+WrDre6UuCHpWvPcVo/N42mZ2IbStpO4QvSci5Ph6N9dQgKFFkGJ
 8C7K1ZKVcZ3ExJDzp9oFaf8cvNgWNhyTy5zE+r68cUm2Z0m5TESm91JCBZ3Mi9VplQ
 CN2tzNF93bpSV6MXB3SC9pYrAEwS5wzejbgWJF8xWTRthN09fTeFYP9wXjOQ2tftQV
 b7IAxDrGOPXepLM+GcfiT2I7f/N0x41X3KGIZUAjfH/8j8nfiAjMUhJz29W92WpTor
 vgD/W0QBpHhsgfd8FRcNi0rsjPFTrK1/3Fw90sOzufW2xiPpPE7rRaHjHOdAKcM0kJ
 aUb1YMmVFc/Dg==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 46794600FC;
 Tue, 18 Nov 2025 22:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id D2457203EA5;
 Tue, 18 Nov 2025 21:59:45 +0000 (UTC)
Message-ID: <9871bdc7-774d-4e35-be5f-02d45063d317@fiberby.net>
Date: Tue, 18 Nov 2025 21:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Subject: Re: [PATCH net-next v3 04/11] netlink: specs: add specification for
 wireguard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-5-ast@fiberby.net> <aRvWzC8qz3iXDAb3@zx2c4.com>
 <f21458b6-f169-4cd3-bd1b-16255c78d6cd@fiberby.net>
 <aRyLoy2iqbkUipZW@zx2c4.com>
Content-Language: en-US
In-Reply-To: <aRyLoy2iqbkUipZW@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/18/25 3:07 PM, Jason A. Donenfeld wrote:
> On Tue, Nov 18, 2025 at 12:08:20PM +0000, Asbjørn Sloth Tønnesen wrote:
>>> There's lots of control over the C output here. Why can't there also be
>>> a top-level c-function-prefix attribute, so that patch 10/11 is
>>> unnecessary? Stack traces for wireguard all include wg_; why pollute
>>> this with the new "wireguard_" ones?
>>
>> It could also be just "c-prefix".
> 
> Works for me.

Unfortunately, it isn't that simple.

The functions are defined as:
name = c_lower(f"{family.ident_name}-nl-{op_name}-doit")
name = c_lower(f"{family.ident_name}-nl-{op_name}-dumpit")
and
name = c_lower(f"{family.ident_name}-nl-{op_name}-{op_mode}it")

The "c-prefix" would replace "family.ident_name" aka. "wireguard",
but the "-nl-" would remain, which isn't in the current naming.

So "c-function-prefix" or something might work better.

My idea with "c-prefix" was to also cover the family and version defines,
but they are eg. WG_GENL_NAME where the default would be *_FAMILY_NAME.

>>>> +      dump:
>>>> +        pre: wireguard-nl-get-device-start
>>>> +        post: wireguard-nl-get-device-done
>>>
>>> Oh, or, the wg_ prefix can be defined here (instead of wireguard_, per
>>> my 10/11 comment above).
>>
>> The key here is the missing ones, I renamed these for alignment with
>> doit and dumpit which can't be customized at this time.
> 
> Oh, interesting. So actually, the c-prefix thing would let you ditch
> this too, and it'd be more consistent.

The pre and post still needs to be defined as they aren't used by default.
