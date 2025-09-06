Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F47CF2563
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea1dca70;
	Tue, 18 Nov 2025 17:26:23 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b735746d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757164932;
 bh=WuJjhnpVAljlL69bb7BMFtboVVhRumBRvD7e4BdACi0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O3J+fR624oSv3ySdbCx2BarAaQYFJR8TAxdaB7GcuXgRmuPbzHvlvD/5ZiwSD9ncv
 GE6N5x9WREsaDYQKVBhAkWuCgxa7JR40Ex+P+FNRKVmCNakhhfnxJGCReTKUO4ugdu
 erOh9hBWfj4Kmue+GGCV8bCn2MMJktm7n7GGLKPppwanRWdkuA2gC4CoZhXTR+sr0z
 S8PMkbTxuw1pXDAyDpeK4yd892mFhLu18g6cVGij3FyFp07JP54NygG505Z6LJ9sWG
 2ZwuAlwQ690SJUPrX8g2asaN5thk2jvK6dvsMZcR1irzsnPUZOvZao8DHChUqv/shZ
 qyDKYlRb9vKhQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 738776000C;
 Sat,  6 Sep 2025 13:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id B6DB6200438;
 Sat, 06 Sep 2025 13:22:01 +0000 (UTC)
Message-ID: <0a9a7c41-7deb-4078-8cc9-aee8f8784443@fiberby.net>
Date: Sat, 6 Sep 2025 13:22:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 06/11] tools: ynl-gen: don't validate nested
 array attribute types
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-6-ast@fiberby.net>
 <20250905172334.0411e05e@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20250905172334.0411e05e@kernel.org>
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

On 9/6/25 12:23 AM, Jakub Kicinski wrote:
> On Thu,  4 Sep 2025 22:01:29 +0000 Asbjørn Sloth Tønnesen wrote:
>> In nested arrays don't require that the intermediate
>> attribute type should be a valid attribute type, it
>> might just be an index or simple 0, it is often not
>> even used.
>>
>> See include/net/netlink.h about NLA_NESTED_ARRAY:
>>> The difference to NLA_NESTED is the structure:
>>> NLA_NESTED has the nested attributes directly inside
>>> while an array has the nested attributes at another
>>> level down and the attribute types directly in the
>>> nesting don't matter.
> 
> I don't understand, please provide more details.
> This is an ArrayNest, right?
> 
> [ARRAY-ATTR]
>    [ENTRY]
>      [MEMBER1]
>      [MEMBER2]
>    [ENTRY]
>      [MEMBER1]
>      [MEMBER2]
> 
> Which level are you saying doesn't matter?
> If entry is a nest it must be a valid nest.
> What the comment you're quoting is saying is that the nla_type of ENTRY
> doesn't matter.

I will expand this in v2, but the gist of it is that this is part of the
"split attribute counting, and later allocating an array to hold them" code.

The check that I remove for nested arrays, is an early exit during the
counting phase. Later in the allocation and parse phase it validates the
nested payload.

In include/uapi/linux/wireguard.h:
 > WGDEVICE_A_PEERS: NLA_NESTED
 >   0: NLA_NESTED
 >     WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 >     [..]
 >   0: NLA_NESTED
 >     ...
 >   ...

The current check requires that the nested type is valid in the nested
attribute set, which in this case resolves to WGDEVICE_A_UNSPEC, which is
YNL_PT_REJECT, and it takes the early exit and returns YNL_PARSE_CB_ERROR.
