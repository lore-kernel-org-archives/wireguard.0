Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FB9CF2582
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 06:01:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1676deb2;
	Tue, 18 Nov 2025 17:29:41 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c55542dc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757805289;
 bh=+X0K9xXdiMhcaEkHVTC+tVGGKcvuzFs/78YZvn5FjyA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tOV+nw/1UJhrDKxJST+XdYNNyzVTehWOnvxKaWp9fLnE6zALZJr62OSWXUs4M6Hgg
 nuv006MBvkwnvAumZIzgH+OT2FKywU8cteYu/rAcL5GXxnNXncy2h9+sajtUQXORgp
 9YXWDIs8XUWtub5430bQ/olj/jUgPVZGGR9+1mnH5mCjDf6a0O9e1D2r4RcPPw97Ec
 ef3uIH2Lihpqjot9aITUHmbv0nlC43LL1j4TcqH4e/SeDp+lLV9BbJlNOoIbMJb1VB
 kV8ggn6rqKBTWOVAZycuqZc280nW15ywckUF+QfprunwDx8pYay3EteaoGwacn5xa5
 i0bvR9WIaFWsw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 2C19B60128;
 Sat, 13 Sep 2025 23:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 7B4FC201010;
 Sat, 13 Sep 2025 23:14:33 +0000 (UTC)
Message-ID: <9211971b-a392-4568-b147-d7e97c69ca54@fiberby.net>
Date: Sat, 13 Sep 2025 23:14:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/13] tools: ynl-gen: only validate nested
 array payload
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-9-ast@fiberby.net> <20250912172742.3a41b81e@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20250912172742.3a41b81e@kernel.org>
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

On 9/13/25 12:27 AM, Jakub Kicinski wrote:
> On Thu, 11 Sep 2025 20:05:01 +0000 Asbjørn Sloth Tønnesen wrote:
>> +int ynl_attr_validate_payload(struct ynl_parse_arg *yarg,
>> +			      const struct nlattr *attr, unsigned int type)
>> +{
>> +	return __ynl_attr_validate(yarg, attr, type);
>> +}
> 
> Why not expose __ynl_attr_validate() to the callers?
> I don't think the _payload() suffix is crystal clear, we're still
> validating attr, _payload() makes it sound like we're validating
> what's inside attr?

I didn't wanna call __ynl_attr_validate() directly, as the only __ynl_*
function in ynl-priv.h is __ynl_attr_put_overflow(), and that is only
used in other static functions within that file. I agree, that _payload()
might not be the best given that we currently don't look deeper than
validating that the length a bit, so maybe _length() would have been
better.

In v4, I have changed it to just expose __ynl_attr_validate() in
ynl-priv.h, and changed ynl_attr_validate() to an inline function.
