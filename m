Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5BEC47095
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:19:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3B161078
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3B161078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a732def9;
	Mon, 7 Jun 2021 11:13:18 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4000be10
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 11:13:17 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 64FF91EF;
 Mon,  7 Jun 2021 11:13:14 +0000 (UTC)
Date: Mon, 7 Jun 2021 16:13:13 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, zrm
 <zrm@trustiosity.com>, StarBrilliant <coder@poorlab.com>, Baptiste Jonglez
 <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>, Nico Schottelius
 <nico.schottelius@ungleich.ch>, Vasili Pupkin <diggest@gmail.com>,
 peter@fiberdirekt.se
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
Message-ID: <20210607161313.764eb5d6@natsu>
In-Reply-To: <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 7 Jun 2021 11:34:21 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> 2) Local egress fragmentation WOULD be affected by this and is the
> most relevant thing in this discussion. In this case, a packet that
> gets encrypted and winds up being larger than the mtu of the interface
> that the encrypted packet will go out of gets fragmented. In this
> case, we could likely respond with an ICMP packet or similar in-path
> error. But keep in mind this whole situation is local: it usually will
> only happen out of misconfiguration. The best fix for the diagram I
> drew would be for the administrator to decrease the MTU of the
> wireguard interface to 1412.

In the L2 tunneling scenario the large VXLAN packets are generated locally, as
it will be common for the same host (aka "the router") to be both a WG peer
and a VXLAN VTEP, so it is going to be affected.

> So, of those concerned about this, which concerns are actually about
> (2) and (3)? Of those, which ones are about (2)? If you have concerns
> specifically about (2) that couldn't be fixed with reasonable system
> administration, I'd like to hear why and what the setup is that leads
> to that situation.

My described case is being able to transparently bridge two Ethernet LANs.

Hopefully the answer isn't "you don't really need to do that" or "apply
reasonable system administration and set up routing instead".

> As an aside, Roman asked about TTL. When tunneling, the outer packet
> header always must take the new TTL of the route to the tunnel
> endpoint, and not do anything with the potentially much smaller inner
> TTL.

As far as I can see the inner TTL is not smaller than usual on WG tunnels (64).
You could inherit it to the outside of the tunnel, like GRE does:
https://serverfault.com/questions/827239/gre-tunnel-ttl-number
But of course that's leaking a tiny bit of information about the encrypted
tunnel, dunno how critical that would be.

-- 
With respect,
Roman
