Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F312ACF2562
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b0798dd;
	Tue, 18 Nov 2025 17:26:19 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4d9692a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757086477;
 bh=wtTFmaz+N02R+TrK0pbOOzB15g2M3Ec/dVGk2zh3GXY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CempboGfU5BbL6MvuQKGRxTq8ENz2ywbtLsQw+a5bYzwe9C35xnI3k5YCaHBxwGjn
 Sl6s3hIRoVSzYWnBsWgXc9ZJVTVFnG0jhqmZpgfHqGkXzh6D6usbMe/GWYh4wO9hv5
 CTG81e9yn3QpQ5HZDhmA2D1WxxdYguvLXgUJRNtLxLtMBvzy2Z6arqa1rgdAfdGm5l
 qSFYqUl6IqMCiF+6t4r61zioeI1EjaCvWGP37SCPLK7I3q7nMOJCa2RK3WfoSqCns5
 9fhR/ceX5G3OnsdGCZGWXAsI2UrsZa05wFw0gQf4F6oEOrVBMkWptZFw8+Rn9DdcbL
 2qEyYp8mCXUow==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 2E4A960078;
 Fri,  5 Sep 2025 15:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 1923B200402;
 Fri, 05 Sep 2025 15:34:33 +0000 (UTC)
Message-ID: <ab1ee9d4-8cf6-46ae-8c97-56d9a27fbb32@fiberby.net>
Date: Fri, 5 Sep 2025 15:34:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/11] tools: ynl: encode indexed-array
To: Donald Hunter <donald.hunter@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-9-ast@fiberby.net> <m2ldmtxjh6.fsf@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <m2ldmtxjh6.fsf@gmail.com>
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

Hi Donald,

Thanks for the reviews.

On 9/5/25 10:49 AM, Donald Hunter wrote:
> Asbjørn Sloth Tønnesen <ast@fiberby.net> writes:
> 
>> This patch adds support for encoding indexed-array
>> attributes with sub-type nest in pyynl.
>>
>> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
>> ---
>>   tools/net/ynl/pyynl/lib/ynl.py | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
>> index 4928b41c636a..a37294a751da 100644
>> --- a/tools/net/ynl/pyynl/lib/ynl.py
>> +++ b/tools/net/ynl/pyynl/lib/ynl.py
>> @@ -564,6 +564,11 @@ class YnlFamily(SpecFamily):
>>               nl_type |= Netlink.NLA_F_NESTED
>>               sub_space = attr['nested-attributes']
>>               attr_payload = self._add_nest_attrs(value, sub_space, search_attrs)
>> +        elif attr['type'] == 'indexed-array' and attr['sub-type'] == 'nest':
>> +            nl_type |= Netlink.NLA_F_NESTED
>> +            sub_space = attr['nested-attributes']
>> +            attr_payload = self._encode_indexed_array(value, sub_space,
>> +                                                      search_attrs)
>>           elif attr["type"] == 'flag':
>>               if not value:
>>                   # If value is absent or false then skip attribute creation.
>> @@ -617,6 +622,9 @@ class YnlFamily(SpecFamily):
>>           else:
>>               raise Exception(f'Unknown type at {space} {name} {value} {attr["type"]}')
>>   
>> +        return self._add_attr_raw(nl_type, attr_payload)
>> +
>> +    def _add_attr_raw(self, nl_type, attr_payload):
>>           pad = b'\x00' * ((4 - len(attr_payload) % 4) % 4)
>>           return struct.pack('HH', len(attr_payload) + 4, nl_type) + attr_payload + pad
>>   
>> @@ -628,6 +636,15 @@ class YnlFamily(SpecFamily):
>>                                              sub_attrs)
>>           return attr_payload
>>   
>> +    def _encode_indexed_array(self, vals, sub_space, search_attrs):
>> +        attr_payload = b''
>> +        nested_flag = Netlink.NLA_F_NESTED
> 
> This line is not doing anything, right?

Right, that line shouldn't be there, it is a remain of an early version, where
I didn't add the indexes, as NLA_NESTED_ARRAY is actually an unindexed-array.

The wireguard kernel code only sends zero types, and it doesn't care that user-
space sends an indexed array back, eg. when setting multiple allowed ips.

>> +        for i, val in enumerate(vals):
>> +            idx = i | Netlink.NLA_F_NESTED
>> +            val_payload = self._add_nest_attrs(val, sub_space, search_attrs)
>> +            attr_payload += self._add_attr_raw(idx, val_payload)
>> +        return attr_payload
>> +
>>       def _get_enum_or_unknown(self, enum, raw):
>>           try:
>>               name = enum.entries_by_val[raw].name

-- 
pw-bot: cr
