Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19744C47094
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:19:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B92A6101A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B92A6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c13e0e2f;
	Mon, 7 Jun 2021 11:18:04 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 59d0960f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 11:18:03 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 3E42C1FFDC;
 Mon,  7 Jun 2021 13:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1623064683; bh=pM7goAGYBN6bnW9H3kWmefOYdKItBU8pOdsdaq+QuYw=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=C1LiIKS60KXM57LhjxiEeMOPnKs2vJcnO9FKoY3AYww/7H1ZPbA3y7AzK5DKfEXj9
 lLVE+bQGnymQoBvblN9RltyBUpRKzjwFPggZnSfID4q0JXfo3Ua9IsWO619NUO0eIS
 4OJcxyNZ2xgxXSxHdz14DUnWhlAcjrzKdfjTkVPDCch15g3OtrWISe4lSxqr3QBYfQ
 cHjo5YzxL7x8DxuXxBXgiOWIHOlF0ZKZ7xXW7BQnu/nfS8Hj2jDLZfr7v6ca7bn1vk
 BhKFoWtFzg7+mC7149ACoZq5yBhhuL8rhrH/fb0hCRKpGk2g51s9yi2LWvXgGnLcTn
 780RdpVTJFfOw==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 1C89E14C4153; Mon,  7 Jun 2021 13:18:35 +0200 (CEST)
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, Roman Mamedov
 <rm@romanrm.net>, zrm <zrm@trustiosity.com>, StarBrilliant
 <coder@poorlab.com>, Baptiste Jonglez <baptiste@bitsofnetworks.org>, Joe
 Holden <jwh@zorins.us>, Nico Schottelius <nico.schottelius@ungleich.ch>,
 Vasili Pupkin <diggest@gmail.com>, peter@fiberdirekt.se
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
In-reply-to: <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
Date: Mon, 07 Jun 2021 13:18:35 +0200
Message-ID: <87fsxtvs6s.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Hey Jason,


Jason A. Donenfeld <Jason@zx2c4.com> writes:

> Hey folks,
>
> There seems to be a bit of confusion about *which* stage of
> fragmentation would be affected by the proposal, so I drew some
> diagrams to help illustrate what I'm talking about. Please take a
> look:
>
> https://data.zx2c4.com/potential-wg-fragmentation-proposal.png

I love the math: 2792 = 1420 + 1420 = 1500 + 1500

Joke aside, ...

> 1) Ingress fragmentation would not be affected by this and is not
> relevant for this discussion. This is the case in which a computer
> gets a packet for forwarding out of the wireguard interface, and it's
> larger than the interface's mtu, so the computer fragments it before
> passing it onto that interface. I'm not suggesting any change in this
> behavior.

I believe this is something wireguard cannot influence *anyway* as the
sending side can send any sized packet towards us.

> 2) Local egress fragmentation WOULD be affected by this and is the
> most relevant thing in this discussion. In this case, a packet that
> gets encrypted and winds up being larger than the mtu of the interface
> that the encrypted packet will go out of gets fragmented. In this
> case, we could likely respond with an ICMP packet or similar in-path
> error. But keep in mind this whole situation is local: it usually will
> only happen out of misconfiguration. The best fix for the diagram I
> drew would be for the administrator to decrease the MTU of the
> wireguard interface to 1412.

So how does that behave in the situation that the upstream interface or
routes change? Let's say WG MTU = 1412, original PMTU = 1500, decreases
to 1420. Would that reduce the WG mtu automatically to 1332? I guess
not. So what happens with packets arrive with size = 1420?

> 3) Path egress fragmentation COULD be affected by this, but doesn't
> have to be. In this case, we simply set "don't fragment" on encrypted
> egress packets, which means they won't be fragmented by other
> computers along the path.

That's true, but then it would be required to fragment them locally,
wouldn't it?

I'm trying to wrap my head around this in comparison to IPv6/IPv4: In
the IPv6 world we don't have fragmentation on the path, it's always
client based. In the IPv4 world routers can dis/re-assemble packets on
the way.

If I understand it correctly, you are somewhat suggestion that wireguard
behaves a bit like an IPv6 router, albeit for both the v6 and the v4
world. Is that comparison making sense somehow?

I think it would be easier to understand, if there was a demo case, a
sample tunnel that rejects packets, if fragmentation is needed. What
would be the appropriate ICMP message for an IPv4 packet that does not
include the DF bit?

So far, I'm not fully convinced the approach is a smart way, especially
not when it comes to handling network debugging and given that we do
already have a TTL that should be a loop prevention as well.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
