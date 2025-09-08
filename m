Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E415CF2565
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09b29f49;
	Tue, 18 Nov 2025 17:26:35 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 236bf79c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757322503;
 bh=MhMgcHHloqdsvpGVS4XMV4EJ/KcTgELqX1VRtRedv10=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N8qUxz9GarM32aXEpFClgSN1X9YmPiA2/Cye3eCjKaljfvBxPtLiIRTL2SM0SAjf4
 VQdvRKI49OiqfOQ9IAHUsCg3Y4mwaUH61Eyy8qZCH0OeU5xRiPoDSYVIvphO5QCnsu
 WIoChJDkzakpAcbjpqctgm0FtGeW/0c/tQsNZlC7cSkOwSvww4M8EBOHGCPr/w5bPo
 9XsIaarbsNVskh/KaMCWXvM5jBPQDWatUyAMBPjGJHv0cHtbFSxcAjrc3V0w01Eqg0
 Go8a1IztY6bbh2sak9PiIM8uVIDdqoKplkrIB3UrgsSfjr/Nxse0wvCLx0mJJ5mZff
 wyKaKmCtOJehQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 754826000C;
 Mon,  8 Sep 2025 09:08:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 4D922200C27;
 Mon, 08 Sep 2025 09:08:17 +0000 (UTC)
Message-ID: <f574e4b9-d0ea-46ef-bbed-8f607ab7276f@fiberby.net>
Date: Mon, 8 Sep 2025 09:08:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
To: Johannes Berg <johannes@sipsolutions.net>,
 "Keller, Jacob E" <jacob.e.keller@intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
 <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
 <6e31a9e0-5450-4b45-a557-2aa08d23c25a@fiberby.net>
 <c1a4da4cb54c0436d5f67efacf6866b4bc057b3e.camel@sipsolutions.net>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <c1a4da4cb54c0436d5f67efacf6866b4bc057b3e.camel@sipsolutions.net>
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

On 9/8/25 7:54 AM, Johannes Berg wrote:
> On Sat, 2025-09-06 at 14:13 +0000, Asbjørn Sloth Tønnesen wrote:
>> Johannes introduced NLA_NESTED_ARRAY and the NLA_POLICY_NESTED_ARRAY()
>> macro in commit 1501d13596b9 for use in nl80211, and it's therefore
>> used in net/wireless/nl80211.c, but outside of that the macro is
>> only sparsely adopted (only by mac80211_hwsim.c and nf_tables_api.c).
>>
>> Wireguard adopts the macro in this RFC patch:
>> https://lore.kernel.org/netdev/20250904220255.1006675-2-ast@fiberby.net/
> 
 > I think the general consensus now is that preference should be towards
 > arrays being expressed by giving the attribute holding the array
 > multiple times, i.e. each occurrence of an attribute holds a single
 > entry of the array:
 >
 > [header][type1:a1][type2:b][type1:a2][type1:a3]
 >
 > resulting in an array
 >
 > [a1, a2, a3] and a separate value "b",
 >
 > rather than a nested array:
 >
 > [header][type1:[1:a1][2:a2][3:a3]][type2:b]
 >
 >
 > Of course if each entry has multiple values, then you'd still need
 > nesting:
 >
 > [header][type1:[subtype1:x1][subtype2:x2]][type1:[subtype1:y1][subtype2:y2]]
 >
 > would be an array
 >
 > [[x1, x2], [y1, y2]].

Thank you for the consensus write up. Should we prohibit indexed-array with sub-type
nest for families with a genetlink protocol?

It is currently only used in families with a netlink-raw or genetlink-legacy protocol.

> I can't get rid of the nested array types in nl80211 though, of course.

Wireguard is already in the same boat. It is not using the term, nor the policy,
but it is doing the validation in the handler through, so it can adopt a
NLA_POLICY_NESTED_ARRAY() policy, instead of a plain '{ .type = NLA_NESTED }'.

Comments on the protocol in include/uapi/linux/wireguard.h:
 > WGDEVICE_A_PEERS: NLA_NESTED
 >   0: NLA_NESTED
 >     WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 >     [..]
 >   0: NLA_NESTED
 >     ...
 >   ...

Given that, as Jacob pointed out, there are more families with nested arrays in
their YNL spec, than those using NLA_NESTED_ARRAY, then it appears that there
are more families already in the boat.
