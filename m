Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477DEC47094
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:27:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC07610A8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DC07610A8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3fa4aa2;
	Mon, 7 Jun 2021 11:27:23 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ba26e3f7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623065232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yswz1C4AzBHZFjz/58bVLrJMcWtRPt6sZj86zZIgk1Q=;
 b=F7w8Ffra2/Fen7HS28csC68IgafEFrmLFo8sGN9BiPNHu8R8USi6PTABc0yX9x1y9rxDmc
 I7AINdgStkttWzhErcpk/AxyAnsl2v3FpTS3tQ/csEgteOuN5ZSGrzWIgFPsFsx5ig1ANq
 OddMCPWX4W0HodU0XV9KumTn0IwAShk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9097ee9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 7 Jun 2021 11:27:12 +0000 (UTC)
Date: Mon, 7 Jun 2021 13:27:10 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Roman Mamedov <rm@romanrm.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 zrm <zrm@trustiosity.com>, StarBrilliant <coder@poorlab.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>,
 Nico Schottelius <nico.schottelius@ungleich.ch>,
 Vasili Pupkin <diggest@gmail.com>, peter@fiberdirekt.se
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
Message-ID: <YL4CjhvPcQ+/qtG1@zx2c4.com>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
 <20210607161313.764eb5d6@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607161313.764eb5d6@natsu>
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

Hi Roman,

On Mon, Jun 7, 2021 at 1:13 PM Roman Mamedov <rm@romanrm.net> wrote:
> In the L2 tunneling scenario the large VXLAN packets are generated locally, as
> it will be common for the same host (aka "the router") to be both a WG peer
> and a VXLAN VTEP, so it is going to be affected.

Can you walk me through your use case a bit more, so I can wrap my mind
around the requirements?

ingress --plain--> wireguard --wireguard[plain]--> vxlan --vxlan[wireguard[plain]]--> egress

So my question is, why can't you set wireguard's MTU to 80 bytes less
than vxlan's MTU? What's preventing that or making it infeasible?

Jason
