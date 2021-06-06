Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3C1C47095
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 14:13:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C47E61029
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 14:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C47E61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zorins.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cac2dd51;
	Mon, 7 Jun 2021 14:13:35 +0000 (UTC)
Received: from de01.edge.zorins.net (<unknown> [2607:5300:203:17b5::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26d02096
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 22:34:04 +0000 (UTC)
Received: from w6nzwbfjyoxbcejp6cjb4n3l6iupddqf3jk7y6s67fa7e4l6w2djuuqd.onion
 (mx2.tor1 [100.66.17.138])
 by de01.edge.zorins.net (Postfix) with ESMTP id 4Fyrrq1pHcz4WGg;
 Sun,  6 Jun 2021 22:34:03 +0000 (UTC)
Received: from [100.99.43.152] (unknown [88.103.227.174])
 (Authenticated sender: jwh@zorins.us)
 by w6nzwbfjyoxbcejp6cjb4n3l6iupddqf3jk7y6s67fa7e4l6w2djuuqd.onion (Postfix)
 with ESMTPA id 4Fyrrg6fPvzJGT; Sun,  6 Jun 2021 22:33:55 +0000 (UTC)
To: Roman Mamedov <rm@romanrm.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 zrm <zrm@trustiosity.com>, StarBrilliant <coder@poorlab.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <20210607000318.4d36b9cb@natsu>
From: Joe Holden <jwh@zorins.us>
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
Message-ID: <0cac2d72-debd-bff6-2404-6b3aabbdeb0d@zorins.us>
Date: Mon, 7 Jun 2021 00:33:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607000318.4d36b9cb@natsu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Jun 2021 14:13:34 +0000
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

On 2021-06-06 21:03, Roman Mamedov wrote:
> On Sun, 6 Jun 2021 11:13:36 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> 
>> Specifically the change would be to not allow IP fragmentation of the
>> encrypted UDP packets. This way, in the case of a loop, eventually the
>> packet size exceeds MTU, and it gets dropped: dumb and effective.
>> Depending on how this discussion goes, a compromise would be to not
>> allow fragmentation, but only for forwarded and kernel-generated
>> packets, not not for locally generated userspace packets. That's more
>> complex and I don't like it as much as just disallowing IP
>> fragmentation all together.
>>
>> Pros:
>> - It solves the routing loop problem very simply.
> 
> Doesn't TTL already solve this?
> 
>> - Maybe people are running
>> wireguard-over-gre-over-vxlan-over-l2tp-over-pppoe-over-god-knows-what-else,
>> and this reduces the MTU to below 1280, yet they still want to put
>> IPv6 through wireguard, and are willing to accept the performance
>> implications.
> 
> Not only that. Sometimes transparent bridging of 1500 MTU LANs is required.
> 
> VXLAN does not allow tunnel endpoints to produce fragmented VXLAN packets.
> 
> With WG we can fragment them one level lower, *and* gain a higher efficiency
> compared to hypothetical VXLAN's fragmentation, due to less header overhead on
> 2nd and further packets in a chain.
> 
> It would be unfortunate if this will become no longer possible.
> 
> It appears to me that people who might need to transparently join multiple
> Ethernet LANs due to legacy network topologies they have to work with, weird
> requirements, various legacy software etc, would outnumber those who even run
> WG over WG at all, let alone getting themselves into a routing loop that way.
> 
All of the above, really - not allowing "full" sized frames over WG
breaks a huge number of use cases - even simple ones, because regardless
of how much it's wished to be true, in reality pmtu isn't very useful
and doesn't work for many cases even in an environment where it isn't
completely broken by firewalls/misconfiguration.

A [probably common] simple example is where there are 1500 byte speakers
on either side of a WG link (e.g. the internet, or some satellite site)
- having a <1500 byte link in the middle will break many applications,
in particular especially UDP based protocols.

Unfortunately the better solution is likely to make it configurable, or
allow fragmentation for forwarded traffic (since the host already knows
the mtu, this solves the problem without requiring any user config) -
although understandably you don't want to add more complexity

thanks
