Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D876E71D2D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Sep 2023 13:13:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ed0098e;
	Fri, 29 Sep 2023 13:13:01 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79f62b20
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2023 13:12:59 +0000 (UTC)
Received: janet.servers.dxld.at; Fri, 29 Sep 2023 15:12:58 +0200
Date: Fri, 29 Sep 2023 15:12:57 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: labawi-wg@matrix-dream.net
Cc: wireguard@lists.zx2c4.com
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <20230929131257.4uyp3fkxkxt7qg3f@darkboxed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPP7tab5OqR39RcY@matrix-dream.net>
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

Hi Ivan,

> IMO, a good tunnel solution may be if what is now called AllowedIPs,
> were functionally split into:
>  - AcceptIPS (to be different from AllowedIPs)
>  - RouteIPs
> Perhaps with a default shorthand of, say, IPs, setting both, as
> AllowedIPs historically caused confusion wrt. it's meaning.

That would be one way to paint the shed, yes.

This alone doesn't really address the crux of the problem though:
scalability.

> Wireguard API is a bit clunky, but I think one could dynamically manage
> routes in reasonably efficient ways without extra interfaces and layers.

The entire idea with the new route attribute is to put this functionality
into the right (pre-existing) layer and not invent a new way of expressing
this. We even get scalability for free. Win-Win.

--Daniel

PS: Your mail didn't reach my inbox for some reason, I randomly found it
while looking at the wg list archives. Consider configuring your mail
client to To/CC people you're replying to in order to better handle flaky
list servers.
