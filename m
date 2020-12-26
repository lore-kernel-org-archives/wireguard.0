Return-Path: <SRS0=HI6M=F6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A252C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Dec 2020 10:33:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2785221E7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Dec 2020 10:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2785221E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=labrat.space
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48405ed3;
	Sat, 26 Dec 2020 10:22:35 +0000 (UTC)
Received: from mariecurie.labrat.space (mariecurie.labrat.space
 [116.203.185.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bae310f6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Dec 2020 10:22:31 +0000 (UTC)
Received: from labrat.space (adsl-178-38-56-54.adslplus.ch [178.38.56.54])
 by mariecurie.labrat.space (Postfix) with ESMTPSA id D7CDF157835A;
 Sat, 26 Dec 2020 11:31:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=labrat.space;
 s=201904; t=1608978679;
 bh=97uyjgmSOPuLT9Y7Cs+AiYLazyH3kblBNVWdbKG/bAM=; l=467;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:From:To:CC:Date:
 Subject:Content-Type:Content-Disposition:Reply-To:In-Reply-To:
 MIME-Version:Message-ID:References;
 b=mmWeKqJmdsC4eIUC6cy9cJWJBs41XnLu5gJ/hDdmEMBElofzp6fDrvAGpQsIHxIWa
 NthQ4J2a28saM1xKiD77UL/MKkSDga64qm2pOC/m03re7/s/E7theNOtS0fw7eQx7F
 ciPBeYxQjq50pzDwxpSYJFvwymxDHF854zO3zx3EX/g6/eI80GvX1pBFzSzxlTYMcB
 S8H+SpKPLhflEZU4eCPf2tdTSWcLyUENjNdqafukiTLKrTmYUKnGoYZZIVtX2MNknp
 zeLkvgvD7VEhKidNh7+D2t6iLbpLuVKbj5q+5nIBhcKVt1oVRSOrK3M0aYUAwx8H+u
 sDZigvQAjYe1w==
Date: Sat, 26 Dec 2020 11:32:02 +0100
From: Reto <reto@labrat.space>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Rachel Kroll <rachelbythebay@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: "Wireguard [sic]: great protocol, but skip the Mac app" blog post
Message-ID: <20201226103202.q2netyh65ymfmbel@feather.localdomain>
Mail-Followup-To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Rachel Kroll <rachelbythebay@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9qUN7qTRGU3mFTGHZVGPXE-csdojziZQ-kX460W7pssJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qUN7qTRGU3mFTGHZVGPXE-csdojziZQ-kX460W7pssJw@mail.gmail.com>
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

Hi Jason,
Please don't let blog posts like this get to you.
Following this list, as well as the IRC channel, it's very clear that you care
and go over great pains to make wireguard useful to all.

Rest assured that a lot of people, including me, are very grateful for all that
you do and for your nice work all over the place in the kernel.

I don't write blog posts that trend on hacker news I'm afraid... So this email
has to do ;)

Kind regards,
Reto
