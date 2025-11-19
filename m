Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D766ECF6499
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 23:58:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21667db2;
	Wed, 19 Nov 2025 19:20:07 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6401f310
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Nov 2025 19:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1763579999;
 bh=0o+sGUVZev9fr7qLJnF2Qyzc60L4WQBdRLP4ge47zGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L/aGmNKHW9vNFv9rZTEg4cC5ahBfD0qCPHT9ZnyPpXgVNPyR/ysBBqcmg2/rkdiKM
 MzBLC33oyhcRTzDywwHEGpmZ9yl7lCAG0UZCnhCmmtzA1BRq1OyJDYhcKwuZ6K0F8U
 XS5YUTddIqoYPkEDZbat06yiJ+zrgAGaP119IzAgZ/SKAol3CTlD7Tku25Rri70Ko6
 KM/xqdjhsqMBoOSyGzC2CeOfjueyCakVSb/GX7xk+FUljIJxGW3X1nPgIiG8kV3PsX
 8I/uJv3OggsIBLZu2IKWYiGTcxmuIiHDsR9tO7XFS5e9cZ9DgeaNNkF8C9es5yk1Em
 Ve7yXcq9afoDw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 70A14600FC;
 Wed, 19 Nov 2025 19:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 0152D20177D;
 Wed, 19 Nov 2025 19:19:28 +0000 (UTC)
Message-ID: <f4d147da-3299-4ae7-b11e-b4309625e2c9@fiberby.net>
Date: Wed, 19 Nov 2025 19:19:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 04/11] netlink: specs: add specification for
 wireguard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-5-ast@fiberby.net> <aRvWzC8qz3iXDAb3@zx2c4.com>
 <f21458b6-f169-4cd3-bd1b-16255c78d6cd@fiberby.net>
 <aRyLoy2iqbkUipZW@zx2c4.com>
 <9871bdc7-774d-4e35-be5f-02d45063d317@fiberby.net>
 <aRz4rs1IpohQpgWf@zx2c4.com> <20251118165028.4e43ee01@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20251118165028.4e43ee01@kernel.org>
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

On 11/19/25 12:50 AM, Jakub Kicinski wrote:
> On Tue, 18 Nov 2025 23:52:30 +0100 Jason A. Donenfeld wrote:
>> On Tue, Nov 18, 2025 at 09:59:45PM +0000, Asbjørn Sloth Tønnesen wrote:
>>> So "c-function-prefix" or something might work better.
>>
>> Also fine with me. I'd just like consistent function naming, one way or
>> another.
> 
> IIUC we're talking about the prefix for the kernel C codegen?
> Feels a bit like a one-off feature to me, but if we care deeply about
> it let's add it as a CLI param to the codegen. I don't think it's
> necessary to include this in the YAML spec.

IIUC then adding it as a CLI param is more work, and just moves family details
to ynl-regen, might as well skip the CLI param then and hack it in the codegen.

Before posting any new patches, I would like to get consensus on this.

Options:

A) As-is and all 4 functions gets renamed.

    Stacktraces, gdb scripts, tracing etc. changes due to the 4 function renames.

B) Add a "operations"->"function-prefix" in YAML, only one funtion gets renamed.

    wg_get_device_start(), wg_get_device_dump() and wg_get_device_done() keep
    their names, while wg_set_device() gets renamed to wg_set_device_doit().

    This compliments the existing "name-prefix" (which is used for the UAPI enum names).

    Documentation/netlink/genetlink-legacy.yaml |  6 ++++++
    tools/net/ynl/pyynl/ynl_gen_c.py            | 13 +++++++++----
    2 files changed, 15 insertions(+), 4 deletions(-)

C) Add a "call" in YAML to override the default doit/dumpit names.

    All 4 functions can keep their current names.

    This compliments the existing "pre" and "post" (which are only rendered when set).

    How these map to struct genl_split_ops:

       kind \ YAML | pre        | call    | post
      -------------+------------+---------+------------
       do          | .pre_doit  | .doit   | .post_doit
       dump        | .start     | .dumpit | .done

D) Add it as a ynl_gen_c.py CLI param and make ynl-regen set it for wireguard?

While A is a no-op, then B is simpler to implement than option C, as the names are
generated in multiple places, where as it's simple to just use a prefix.
So option C might require some more refactoring, than is worth it for an one-off feature.
OTOH option C is more flexible than option B.

Jason, would option B work for you?

Jakub, would option B or C be acceptable?

WDYT?
