Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A36CF6481
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:54:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fc9bbc1;
	Tue, 18 Nov 2025 17:33:44 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d1d45889
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 12:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1763467832;
 bh=PW0Ba5WBdUEev84fiTtUqYn0ryT2ZNpF7ayFuhtjL1E=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=jRJJFAjyqBKS/RnfxoMguDUCD6xe+wdqKLpm2XZorwT9u9bZQ02JqFPayIsHPBbOa
 l3Dia30mG2TQjhWHBKy7OW2BegUOvVSbWK3MoHlzO/eF5fHQ4Ubq4H4utnubyJnA6q
 +AspxsamqIAovqOXhKZGXT5PODs9NTgLDsAciXRZ3/5f4xOmrYC++3b0dAa5DWSgvm
 LNDuaP9vLbuUFbFTETaydUZEnIt03LHieUGbhXy68Cs4bBUubPutTV/f5BazCobX7K
 s3n9Nz6CmpZB3qshSYZ+UcLXLna5cJH6PbgXssuM0pdqtLTvIkC4R2wAWcJrhuXZGO
 zso4sjzdcMu9w==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 2A2CD600C1;
 Tue, 18 Nov 2025 12:10:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 03A0B203E83;
 Tue, 18 Nov 2025 12:08:20 +0000 (UTC)
Message-ID: <f21458b6-f169-4cd3-bd1b-16255c78d6cd@fiberby.net>
Date: Tue, 18 Nov 2025 12:08:20 +0000
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
Content-Language: en-US
In-Reply-To: <aRvWzC8qz3iXDAb3@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

Hi Jason,

Thanks for the review.

On 11/18/25 2:15 AM, Jason A. Donenfeld wrote:
> On Wed, Nov 05, 2025 at 06:32:13PM +0000, Asbjørn Sloth Tønnesen wrote:
>> +name: wireguard
>> +protocol: genetlink-legacy
> 
> I'll need to do my own reading, I guess, but what is going on with this
> "legacy" business? Is there some newer genetlink that falls outside of
> versioning?

There's a few reasons why the stricter genetlink doesn't fit:
- Less flexible with C naming (breaking UAPI).
- Doesn't allow C struct types.

diff -Naur Documentation/netlink/genetlink{,-legacy}.yaml
>> +c-family-name: wg-genl-name
>> +c-version-name: wg-genl-version
>> +max-by-define: true
>> +
>> +definitions:
>> +  -
>> +    name-prefix: wg-
> 
> There's lots of control over the C output here. Why can't there also be
> a top-level c-function-prefix attribute, so that patch 10/11 is
> unnecessary? Stack traces for wireguard all include wg_; why pollute
> this with the new "wireguard_" ones?

It could also be just "c-prefix".

Jakub, WDYT?

>> +        doc: The index is set as ``0`` in ``DUMP``, and unused in ``DO``.
> 
> I think get/set might match the operations better than the underlying
> netlink verbs? This is a doc comment specific to getting and setting.

Sure, I could change that. Originally opted for the C-style, as I kept the
C-style from your original text in the rest of the doc comments.

> On the other hand, maybe that's an implementation detail and doesn't
> need to be specified? Or if you think rigidity is important, we should
> specify 0 in both directions and then validate it to ensure userspace
> sends 0 (all userspaces currently do).

As is, the YNL-based clients are taking advantage of it not being validated.
Changing that would require adding some new YNL type properties.
See this series[1] for my earlier attempt to extend YNL in this area.

[1] https://lore.kernel.org/r/20251022182701.250897-1-ast@fiberby.net/

The modern way would be to use multi-attrs, but I don't think it's worth it
to transition, you mainly save a few bytes of overhead.

WGDEVICE_A_IFINDEX
WGDEVICE_A_PEERS2: NLA_NESTED
   WGPEER_A_PUBLIC_KEY
   [..]
   WGPEER_A_ALLOWEDIPS2: NLA_NESTED
     WGALLOWEDIP_A_FAMILY
     [..]
   WGPEER_A_ALLOWEDIPS2: NLA_NESTED
     WGALLOWEDIP_A_FAMILY
     [..]
WGDEVICE_A_PEERS2: NLA_NESTED
   [..]

>> +        The kernel will then return several messages (``NLM_F_MULTI``).
>> +        It is possible that all of the allowed IPs of a single peer
>> +        will not fit within a single netlink message. In that case, the
>> +        same peer will be written in the following message, except it will
>> +        only contain ``WGPEER_A_PUBLIC_KEY`` and ``WGPEER_A_ALLOWEDIPS``.
>> +        This may occur several times in a row for the same peer.
>> +        It is then up to the receiver to coalesce adjacent peers.
>> +        Likewise, it is possible that all peers will not fit within a
>> +        single message.
>> +        So, subsequent peers will be sent in following messages,
>> +        except those will only contain ``WGDEVICE_A_IFNAME`` and
>> +        ``WGDEVICE_A_PEERS``. It is then up to the receiver to coalesce
>> +        these messages to form the complete list of peers.
> 
> There's an extra line break before the "So," that wasn't there in the
> original.

It's collapsed when rendered, added them to reduce diff stat for future changes.
A new paragraph in .rst requires a double line break, but I can remove them.

>> +        While this command does accept the other ``WGDEVICE_A_*``
>> +        attributes, for compatibility reasons, but they are ignored
>> +        by this command, and should not be used in requests.
> 
> Either "While" or ", but" but not both.
> 
> However, can we actually just make this strict? No userspaces send
> random attributes in a GET. Nothing should break.

I agree that nothing should break, just tried to avoid changing UAPI in the
spec commit, but by moving the split ops conversion patch, then I can eliminate
this before adding the spec.

>> +      dump:
>> +        pre: wireguard-nl-get-device-start
>> +        post: wireguard-nl-get-device-done
> 
> Oh, or, the wg_ prefix can be defined here (instead of wireguard_, per
> my 10/11 comment above).

The key here is the missing ones, I renamed these for alignment with
doit and dumpit which can't be customized at this time.
