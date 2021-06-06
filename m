Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA22C4743E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 19:05:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E746108E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 19:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E746108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dceda36b;
	Sun, 6 Jun 2021 19:03:22 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45cd441d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 19:03:20 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id D4B9E306;
 Sun,  6 Jun 2021 19:03:18 +0000 (UTC)
Date: Mon, 7 Jun 2021 00:03:18 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, zrm
 <zrm@trustiosity.com>, StarBrilliant <coder@poorlab.com>, Baptiste Jonglez
 <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
Message-ID: <20210607000318.4d36b9cb@natsu>
In-Reply-To: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
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

On Sun, 6 Jun 2021 11:13:36 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Specifically the change would be to not allow IP fragmentation of the
> encrypted UDP packets. This way, in the case of a loop, eventually the
> packet size exceeds MTU, and it gets dropped: dumb and effective.
> Depending on how this discussion goes, a compromise would be to not
> allow fragmentation, but only for forwarded and kernel-generated
> packets, not not for locally generated userspace packets. That's more
> complex and I don't like it as much as just disallowing IP
> fragmentation all together.
> 
> Pros:
> - It solves the routing loop problem very simply.

Doesn't TTL already solve this?

> - Maybe people are running
> wireguard-over-gre-over-vxlan-over-l2tp-over-pppoe-over-god-knows-what-else,
> and this reduces the MTU to below 1280, yet they still want to put
> IPv6 through wireguard, and are willing to accept the performance
> implications.

Not only that. Sometimes transparent bridging of 1500 MTU LANs is required.

VXLAN does not allow tunnel endpoints to produce fragmented VXLAN packets.

With WG we can fragment them one level lower, *and* gain a higher efficiency
compared to hypothetical VXLAN's fragmentation, due to less header overhead on
2nd and further packets in a chain.

It would be unfortunate if this will become no longer possible.

It appears to me that people who might need to transparently join multiple
Ethernet LANs due to legacy network topologies they have to work with, weird
requirements, various legacy software etc, would outnumber those who even run
WG over WG at all, let alone getting themselves into a routing loop that way.

-- 
With respect,
Roman
