Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC30CF2570
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 06:01:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a60d4b38;
	Tue, 18 Nov 2025 17:29:39 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 000debe7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757805289;
 bh=8wDYtDrhpFgUUI+jhVG4Tnavlo0d2jYskZlAletJsXY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WzeHUuy6lg97Q2koIZK33Jw7f5uG4oTiq8dmQAFKifab5663vM5HUqqH/FCTn+LVB
 57n5vKQC+Xd0YHQJc/r39n0LGMiea81eyOqqivbXIF9GLLWSp3imOa2J3QJkuDjVWs
 OBPsWTymIEjGY+JN20FEiGdJfbio1kUMW0ueB5OGl/rHUWvPOqcFvobu9moMCxMZ8M
 MeVSB9BDkQGu57sL2SvZyQu0FwjqWFQ9oXsw/PAGarCpq42A8ll5PclZtRLL7+FDPK
 m6PnyaripS2mgYHC2GiGP+44coUBkslaEXSBizP6LB9jx+JLI/wO8V/HqfMcOnHxLo
 gkZT9sd5fzS5A==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id CB8FF600C4;
 Sat, 13 Sep 2025 23:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 924CD202FBF;
 Sat, 13 Sep 2025 23:14:38 +0000 (UTC)
Message-ID: <aba5915c-5246-4a31-a2ea-2eeedb4ab108@fiberby.net>
Date: Sat, 13 Sep 2025 23:14:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 06/13] tools: ynl-gen: deduplicate
 fixed_header handling
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-7-ast@fiberby.net> <20250912172418.1271771d@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20250912172418.1271771d@kernel.org>
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

On 9/13/25 12:24 AM, Jakub Kicinski wrote:
> On Thu, 11 Sep 2025 20:04:59 +0000 Asbjørn Sloth Tønnesen wrote:
>> Fixed headers are handled nearly identical in print_dump(),
>> print_req() and put_req_nested(), generalize them and use a
>> common function to generate them.
>>
>> This only causes cosmetic changes to tc_netem_attrs_put() in
>> tc-user.c.
>>
>> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
>> ---
>>   tools/net/ynl/pyynl/ynl_gen_c.py | 39 ++++++++++++++++----------------
>>   1 file changed, 20 insertions(+), 19 deletions(-)
> 
> This only makes the code longer and harder to follow.

We have 3 functions using put_attr():
* put_req_nested()
* print_req()
* print_dump()

I was just trying to align them a bit more so that they don't
do the same thing in three different ways. I would prefer to
make these functions more aligned, as it will hopefully make
it easier avoid issue like the missing local variables for
.attr_put().

I agree these clean up patches would also fit better in a
dedicated cleanup series, the only reason that I added this to
this series, was because you pushed back, then I said that the
`len` dedup, and other "make code look natural" cleanups might
not be for this series.

I have dropped this patch in v4, it's not important for this
series.
