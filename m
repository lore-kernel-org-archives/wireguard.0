Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23546CF258C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 06:04:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd00d990;
	Tue, 18 Nov 2025 17:29:49 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dd8a2452
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757805289;
 bh=nPyCEBL3SzibQsaSizD1nfxfHhjF0nqEeAFl/+cQcjM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=au2HTKcYXdNYLFsy5GGwZmaoF+fmwPTRaQX16l4IOR1haJWiDEvGJf+qGTLlwCOx0
 zBL5QDU6Lyj0x9dGUA+LZtyBDY68SShbbulfNnbSmDsdlLJ/K4NWUUMUAgAmgXg9F2
 /6JgSL3+TkiGzxiCtTzVKRUvnJOPZtHFo7tTOq6RV4PriXWlUFZG6/BKcKxFas/ifC
 y8a86qfhGOU14+IKHmIbVFdFQvUZ6+LHoekvpxzbySyqqPXzO9wnFlSjfzAldNe71Z
 JahPrs7Yj+Vs5QVhvRRs8rZ9cMhX9FkJVSmW/Nxced2OgV7Kob9l9yLWyG561q4x+g
 wvDMiLGcG4Bew==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id C8FBA60078;
 Sat, 13 Sep 2025 23:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 39B30202B83;
 Sat, 13 Sep 2025 23:14:36 +0000 (UTC)
Message-ID: <254c0f1c-da49-4ba4-a36b-a79753316662@fiberby.net>
Date: Sat, 13 Sep 2025 23:14:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 04/13] tools: ynl-gen: refactor local vars for
 .attr_put() callers
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-5-ast@fiberby.net> <20250912171954.7c020c60@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20250912171954.7c020c60@kernel.org>
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

On 9/13/25 12:19 AM, Jakub Kicinski wrote:
> On Thu, 11 Sep 2025 20:04:57 +0000 Asbjørn Sloth Tønnesen wrote:
>> +    def attr_put_local_vars(self):
>> +        local_vars = []
>> +        if self.presence_type() == 'count':
>> +            local_vars.append('unsigned int i;')
>> +        return local_vars
>> +
>>       def attr_put(self, ri, var):
>>           raise Exception(f"Put not implemented for class type {self.type}")
>>   
>> @@ -840,6 +846,10 @@ class TypeArrayNest(Type):
>>                        '}']
>>           return get_lines, None, local_vars
>>   
>> +    def attr_put_local_vars(self):
>> +        local_vars = ['struct nlattr *array;']
>> +        return local_vars + super().attr_put_local_vars()
> 
> Doesn't feel right. The Type method is a helper which is compatible
> with the specific types by checking presence, then you override it,
> and on top of that combine the output with super(). I don't like.

I prefer to keep the array variable as a detail isolated to TypeArrayNest,
so I have given it another spin in v4.
