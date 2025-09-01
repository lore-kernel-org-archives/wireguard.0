Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AE0CEE352
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 19:42:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d47aabcd;
	Tue, 18 Nov 2025 17:25:02 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57bb91e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1756761055;
 bh=7ur5mmjPY/HIn1XlTa0BTe/FlH1pt8Kop8wrtPnCpFY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c573L+J4XCXPrbL6GKALIco6pSO4IlbDMIFF8QerLU6myV28ZFFR8Qpyq1kgcQVtz
 KWq9Noc8+5M9hN8wrOt2/cOJD02yWK4QC2BnBoZC8/jD3TMofD5GeELKjBW0D5u9EM
 rXZmSGKlhYveRwKlidnOIElPbKJfDqn4NdT0eqLaOlErcPr3st9OfsC2fWmw1eGVDd
 gHiK7kxrzbmrLDPKWWwNm2wrU7yUZyU9DY/IiB2TVve9pAVgUZKQLQ2ZL0lCXUgFjR
 twTOADwA/WpOTSMfzMdbtncEgyqRnfw6YUp2/CXSB7QYV8WlifI7nsFrh4g4sDqKbY
 AOMsoCSYJN6Lw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 25BF560078;
 Mon,  1 Sep 2025 21:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 7B057201924;
 Mon, 01 Sep 2025 21:10:41 +0000 (UTC)
Message-ID: <be3fe50a-437d-40b5-8ff3-1db558f6e964@fiberby.net>
Date: Mon, 1 Sep 2025 21:10:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/4] tools: ynl-gen: use macro for binary min-len check
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Stanislav Fomichev
 <sdf@fomichev.me>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250901145034.525518-1-ast@fiberby.net>
 <20250901145034.525518-3-ast@fiberby.net>
 <20250901115208.0cc7e9a6@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <20250901115208.0cc7e9a6@kernel.org>
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

Thank you for the quick reviews.

On 9/1/25 6:52 PM, Jakub Kicinski wrote:
> On Mon,  1 Sep 2025 14:50:21 +0000 Asbjørn Sloth Tønnesen wrote:
>> This patch changes the generated min-len check for binary
>> attributes to use the NLA_POLICY_MIN_LEN() macro, and thereby
>> ensures that .validation_type is not left at NLA_VALIDATE_NONE.
> 
> Please test this well and include the results in the commit message.
> I'm pretty sure it's fine as is.

You are right, because .type is unset, then .validation_type doesn't matter.

Sorry, I didn't do enough testing for the fixes, I had looked at the NLA_BINARY
case in validate_nla(), not NLA_UNSPEC.

Will re-post for net-next without fixes, and a new commit message.
