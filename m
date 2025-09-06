Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB4ACF2563
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18f57e5d;
	Tue, 18 Nov 2025 17:26:33 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1e030317
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757174351;
 bh=XzuoT0WSkJbb6iiSwS7U92Qd0e3ls3F0BkGucQXz1Wk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BhKe6DCS6msxct+OYYzo3wFMOUo2t7DP8KsaQkhrTgjY9mmBggADOXmB2wSJcsihs
 s+3HZqDxnYYhcwDdRovP9TEfAdjl1fpnPHKVIbIqO/VtMcsUzLvBb80gCoL+SBI259
 P8P3k/KVlTRw9nsBsK0ApOTbojRG8B4h4ii/Yua4vXHQUPDSHaPff3XUn0sFfexFxm
 uvyaUStaEWqgg6Fo5tx5T2Z5IEismxmGDI93gsqFs46UQuE6T92RuKiT9f7Bwn/A8j
 06Cq2n9Nj7DQzaekOe5O9MERpSC6mkSbFpaqLRF0nSozEB0lI/+xERcNkCgIVJcQ5B
 60icJeU/6N8KQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id BE8416000C;
 Sat,  6 Sep 2025 15:59:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 5FD50201DC8;
 Sat, 06 Sep 2025 15:59:07 +0000 (UTC)
Message-ID: <228eae2b-5a52-48c0-a3a2-afbd3e45adf2@fiberby.net>
Date: Sat, 6 Sep 2025 15:59:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/11] tools: ynl: add ipv4-or-v6 display hint
To: Donald Hunter <donald.hunter@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-11-ast@fiberby.net> <m2cy85xj9h.fsf@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <m2cy85xj9h.fsf@gmail.com>
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

On 9/5/25 10:53 AM, Donald Hunter wrote:
> Asbjørn Sloth Tønnesen <ast@fiberby.net> writes:
>> The attribute WGALLOWEDIP_A_IPADDR can contain either an IPv4
>> or an IPv6 address depending on WGALLOWEDIP_A_FAMILY, however
>> in practice it is enough to look at the attribute length.
>>
>> This patch implements an ipv4-or-v6 display hint, that can
>> deal with this kind of attribute.
>>
>> It only implements this display hint for genetlink-legacy, it
>> can be added to other protocol variants if needed, but we don't
>> want to encourage it's use.
>>
>> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
> 
> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
> 
> I suspect there are occurrences of ipv4 or ipv6 in the existing specs
> that really should be ipv4-or-ipv6 but the python code doesn't care.

I haven't been able to find any, containing 'ip' or 'addr'.

Speaking of display hints, then WGPEER_A_ENDPOINT is another interesting
case, it is struct sockaddr_in or struct sockaddr_in6, I have left that
as a plain binary for now, but maybe that could be a struct map, based
on struct length.

attribute-sets:
   -
     name: wgpeer
     [..]
     attributes:
       [..]
       -
         name: endpoint
         type: binary
         struct-map:
           - sockaddr_in
           - sockaddr_in6

With the requirement being, that all structs must have a unique length.
