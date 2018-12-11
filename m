Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1015C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:29:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2891218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.noconroy.net header.i=@mail.noconroy.net header.b="iRqNJmS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2891218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.noconroy.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e72b388;
	Wed, 2 Jan 2019 19:27:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5b65d2c
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 21:14:09 +0000 (UTC)
Received: from mail.noconroy.net (mail.noconroy.net [108.61.103.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d706c0d5
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 21:14:09 +0000 (UTC)
Received: from authenticated-user (mail.noconroy.net [108.61.103.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.noconroy.net (Postfix) with ESMTPSA id CAC483E90E;
 Tue, 11 Dec 2018 22:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.noconroy.net;
 s=mail; t=1544563379;
 bh=In3N2GNyPTuLRr8+V9DAH3mf0l4DrEdN3o88xhxwGpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iRqNJmS5XAgxD7+UugLrJQO97eqN9yFX4ew2jnMcAgWIpgwE6KgXLrozsOwdy8l3h
 pFpSAUUpvdDK5DazZa3EdxPxzhUhQWFAFTpAIi3wqB6dL1IXY+hY+nJMOtnkRIyRrB
 HE1mgW/PiCdfEmYg1z+JWVqnG+uV7h4qYtdpC+9hR7gkU/6SMjsPYhax7Y/qsizLbO
 BIj/5wJI/NuPUi28iPYlBNYazGqxd49TaCJZUbuS0ISd28VOiYGJiMrgGt6qK/Ak8K
 9Z2diWSS5pGVt0kPw7RdLRx+qSfCphltzkD2ASyEz1zTjeA7j/MjLy+YpHXsHLuqHU
 NLijcWJRwNLqA==
Date: Wed, 12 Dec 2018 08:22:53 +1100
From: Matt <ncon@mail.noconroy.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: OpenBSD kernel implementation
Message-ID: <20181211212217.qf7xzrf66osabyg3@vertex.local>
References: <20181211132437.cooi2kwvx2j3llem@vertex.local>
 <d9c01aa2-9dab-44b0-d743-a93ff7936e38@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9c01aa2-9dab-44b0-d743-a93ff7936e38@zx2c4.com>
X-Info: Keep It Simple, Stupid.
X-Mailman-Approved-At: Wed, 02 Jan 2019 20:27:09 +0100
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

On Tue, Dec 11, 2018 at 04:29:40PM +0100, Jason A. Donenfeld wrote:
> Hi Matt,
> 
> Exciting to see you working on this. However, I'm afraid the
> implementation you describe sounds deeply flawed and kind of misses
> the point of WireGuard.
> 
> On Tue, Dec 11, 2018 at 2:24 PM Matt wrote:
> > Currently, I want to take all the code that doesn't need to be in the
> > kernel and move it to userspace, which is essentially the handshake
> > code, timeout timers and state machine functions. What is left is
> > essentially the transport function (IPSEC transform equivalent),
> > peforming simple crypto on incoming/outgoing packets. This design is
> > somewhat similar to how IPSEC is currently implemented in OpenBSD. I
> > believe this is a reasonable approach, but welcome comments on things I
> > may not have considered.
> 
> Do not do this. This is entirely unacceptable and wholly contrary to
> the design approach of WireGuard. The transport layer and handshake
> layer exist on the same state machine, and I designed the handshake
> specifically to be extremely simple and implementable in kernel space.
> I'm happy to help you clean up your current approach -- which seems
> nicer and closer to the goal -- but your proposed separated approach
> is really deeply flawed, and overly complex. Do not make this mistake.

I don't think I can (morally, or logically) oppose such an argument.
Perhaps I did get a bit too excited and off track.
 
> Rather, let's clean up your current WIP together. If you're on IRC,
> I'm happy to discuss with you there (I'm zx2c4 on Freenode) and we can
> get this into shape.

This sounds like a reasonable way forward.

Cheers,
Matt
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
