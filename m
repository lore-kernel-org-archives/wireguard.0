Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F510C47082
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 09:34:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B37D60FF1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 09:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B37D60FF1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 831a6e0a;
	Mon, 7 Jun 2021 09:34:40 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26d44d80
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 09:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623058472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AfZXQLCRyFKgHnOtIByGsxK7e1CaGR+nUm0kXcbMz9M=;
 b=QM1JL2rfouNOTRzpt8K1YWKqjbhtcVOZ7V0FvB4N4UakYmFKbhLNV5+Dlq0ghthkKTE7+m
 meE1qX72vQtFOJwVyIa01SAnWzE7LkLdoxVhT5cPfpziYyYfHPJXWKTvAS09mD1yNFxFZq
 crwhLMzsvdUPFHvUCtBmR1DLFQgefuc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5a8f41d5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 09:34:32 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id g142so4639397ybf.9
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jun 2021 02:34:32 -0700 (PDT)
X-Gm-Message-State: AOAM531ZB0NuczwA8rGV9IP1baz0GY9ej5yELB7l9qGE6I9xIHyuUsmq
 NtLXhp6gjyGNW/8My+IEsXYl1K8nnJl8pSvvr/c=
X-Google-Smtp-Source: ABdhPJyL4MCzS+ZFVOW6hYhGaLIvNBOqXyAgQ4zcEdfImZ/R/KaiYjKTSX8eVtKtSZi5sJiPORTLFqgXvWCplooHGFs=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr17402473ybi.178.1623058471757; 
 Mon, 07 Jun 2021 02:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
In-Reply-To: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Jun 2021 11:34:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
Message-ID: <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Roman Mamedov <rm@romanrm.net>, zrm <zrm@trustiosity.com>, 
 StarBrilliant <coder@poorlab.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>, 
 Joe Holden <jwh@zorins.us>, Nico Schottelius <nico.schottelius@ungleich.ch>, 
 Vasili Pupkin <diggest@gmail.com>, peter@fiberdirekt.se
Content-Type: text/plain; charset="UTF-8"
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

Hey folks,

There seems to be a bit of confusion about *which* stage of
fragmentation would be affected by the proposal, so I drew some
diagrams to help illustrate what I'm talking about. Please take a
look:

https://data.zx2c4.com/potential-wg-fragmentation-proposal.png

1) Ingress fragmentation would not be affected by this and is not
relevant for this discussion. This is the case in which a computer
gets a packet for forwarding out of the wireguard interface, and it's
larger than the interface's mtu, so the computer fragments it before
passing it onto that interface. I'm not suggesting any change in this
behavior.

2) Local egress fragmentation WOULD be affected by this and is the
most relevant thing in this discussion. In this case, a packet that
gets encrypted and winds up being larger than the mtu of the interface
that the encrypted packet will go out of gets fragmented. In this
case, we could likely respond with an ICMP packet or similar in-path
error. But keep in mind this whole situation is local: it usually will
only happen out of misconfiguration. The best fix for the diagram I
drew would be for the administrator to decrease the MTU of the
wireguard interface to 1412.

3) Path egress fragmentation COULD be affected by this, but doesn't
have to be. In this case, we simply set "don't fragment" on encrypted
egress packets, which means they won't be fragmented by other
computers along the path.

So, of those concerned about this, which concerns are actually about
(2) and (3)? Of those, which ones are about (2)? If you have concerns
specifically about (2) that couldn't be fixed with reasonable system
administration, I'd like to hear why and what the setup is that leads
to that situation.

As an aside, Roman asked about TTL. When tunneling, the outer packet
header always must take the new TTL of the route to the tunnel
endpoint, and not do anything with the potentially much smaller inner
TTL. So with tunneling, you can't quite rely on the TTL to drop to
zero as you'd wish. Hence, I'm interested in using the natural packet
size expansion instead.

Thanks for the discussion so far. I'm very interested to read
clarifying points about applicability to case (2) (and to a lesser
extent, about case (3)).

Thanks,
Jason
