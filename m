Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341D4C47094
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:55:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F66610A1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F66610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fiberdirekt.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc9bff0c;
	Mon, 7 Jun 2021 11:55:08 +0000 (UTC)
Received: from smtp.layermesh.se (smtp.layermesh.se [151.236.207.67])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01c8309b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 11:55:06 +0000 (UTC)
Received: from [IPv6:2a02:470:0:10:8d7:94e:af41:5f85] (unknown
 [IPv6:2a02:470:0:10:8d7:94e:af41:5f85])
 (Authenticated sender: peter@fiberdirekt.se)
 by smtp.layermesh.se (Postfix) with ESMTPSA id 7BCD2206425;
 Mon,  7 Jun 2021 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiberdirekt.se;
 s=dkim; t=1623066905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaK/lR6UBpMCdACnQ95wx3WgAHqN5mqxSg0+gJ2wkY0=;
 b=fj6SeS84Q+XhqJogCl93AlJOoJI/vBA7xfZDro1xi4I8jViT0Ri6sCIpm593OeHeDP25Yj
 CUPADaXz2m/IJBrYF5hgSVuLfDiHE2SPOOfaJV+5VyMwXGB8QngQHCWCVnJVJmeHi72Gkx
 FdJLFVxWvDeAk8gWeqADw6ku/dXq8J8=
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
To: Roman Mamedov <rm@romanrm.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 zrm <zrm@trustiosity.com>, StarBrilliant <coder@poorlab.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>,
 Nico Schottelius <nico.schottelius@ungleich.ch>,
 Vasili Pupkin <diggest@gmail.com>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
 <20210607161313.764eb5d6@natsu> <YL4CjhvPcQ+/qtG1@zx2c4.com>
 <20210607164617.6bf015d1@natsu>
From: Peter Linder <peter@fiberdirekt.se>
Message-ID: <43c72c2d-3649-b329-5ee5-78e891c69f04@fiberdirekt.se>
Date: Mon, 7 Jun 2021 13:55:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607164617.6bf015d1@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

This is indeed the case for me, spot on.

On 2021-06-07 13:46, Roman Mamedov wrote:
> So this same host that just generated the 1574-byte encapsulated VXLAN packet
> with something it received via its eth0 port, now needs to send it further to
> its WG peer(s). For this to succeed, the in-tunnel WG MTU needs to be 1574 or
> more, not 1412 or 1420, as VXLAN itself can't be fragmented[1]; or even if it
> could, that would mean a much worse overhead ratio than currently.
