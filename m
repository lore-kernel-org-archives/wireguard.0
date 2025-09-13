Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6DFCF2583
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 06:11:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcef2a1c;
	Tue, 18 Nov 2025 17:29:50 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4689777d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757805289;
 bh=hdvUQ1mYN4bd9lUCkvNBWXP9pwpsysgRgSzVxZsOjKc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=v+zyZQA1XpyrYDKPYVquDr3wzJSpMv6MVpylqIT9EIjBomM1zdQSaflKqiMY6SA09
 CpqSn7ndm8yEBpWAUZLH8chwsd+9u6Geg/KkQFxI0cBAs6bBHGXvnhIS5Be2hZpPrn
 dTSth+QMpUvAMlCXwlFWx4BHEXj1sHW16ED30MgQQDwhbzSJMwIR7Js/Q8SxX1eeeg
 2eh11MlJW27R2MvdUCBDXgxvRtwcFcNjJSknUOUEMaCY57m3Y7iCMcbzwf7e20PAPO
 RH8YS0wG9qOO8hVAWz9hd0cfa/6bUrgGmL+10kAO+55T8Q8+ujxrw+eEIYUo9lB5hj
 YE1GF70r9zjYA==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id C68B66000C;
 Sat, 13 Sep 2025 23:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 8135920393F;
 Sat, 13 Sep 2025 23:14:40 +0000 (UTC)
Message-ID: <32fde530-f462-4ccf-99bf-7ee1e192b76a@fiberby.net>
Date: Sat, 13 Sep 2025 23:14:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 05/13] tools: ynl-gen: add
 CodeWriter.p_lines() helper
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-6-ast@fiberby.net> <20250912172124.57f96054@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20250912172124.57f96054@kernel.org>
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

On 9/13/25 12:21 AM, Jakub Kicinski wrote:
> On Thu, 11 Sep 2025 20:04:58 +0000 Asbjørn Sloth Tønnesen wrote:
>> Add a helper for writing an array of lines, and convert
>> all the existing loops doing that, to use the new helper.
>>
>> This is a trivial patch with no behavioural changes intended,
>> there are no changes to the generated code.
> 
> I don't see the need for this.

Ok, loop macros are only for C, not Python. :)

I have dropped this patch in v4, as it's not important for this
series.
