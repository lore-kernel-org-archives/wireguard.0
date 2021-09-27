Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F70C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 07:35:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85646023D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 07:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C85646023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2173f924;
	Mon, 27 Sep 2021 07:34:44 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cbefcd75
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 07:34:41 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by rin.romanrm.net (Postfix) with SMTP id 6759F4B3;
 Mon, 27 Sep 2021 07:34:40 +0000 (UTC)
Date: Mon, 27 Sep 2021 12:34:39 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Bruno Wolff III <bruno@wolff.to>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, el3xyz
 <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Message-ID: <20210927123439.7a551913@nvm>
In-Reply-To: <20210927071130.GA13681@wolff.to>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
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

On Mon, 27 Sep 2021 02:11:30 -0500
Bruno Wolff III <bruno@wolff.to> wrote:

> On Mon, Sep 27, 2021 at 09:53:08 +0900,
>   Nico Schottelius <nico.schottelius@ungleich.ch> wrote:
> >
> >I'd appreciate if wireguard upstream would take this in, maybe even
> >supporting multiple / dynamic listen ports.
> 
> The problem is mostly orthogonal to Wireguard. There isn't going to be a 
> one size fits all solution for hiding traffic. Failures in hiding traffic 
> are potentially very bad for individuals. As such general solutions are 
> not something you can recommend universally to people, as amateurs are 
> not going to be able to make good decisions about the risks and some may 
> get themselves tortured and killed.
> 
> This may not be something the developers for Wireguard want to be 
> responsible for.

No need to make DPI's job especially easy either.

Don't over-estimate the resources available to DPIs, if there aren't easy
ways to block, it might be almost as good as unblockable.

And it is far from all cases that hiding traffic would result in bad
consequences. Just hiding it enough so it evades the dumb automated filter,
many people will thank you.

As far as I understand right now WireGuard is very vulnerable to being
blocked, due to the fixed 4 bytes at the beginning(?) of each packet. At least
that needs to be randomized/encrypted. Just make the entire packet look like
random noise - that's the sign of good crypto, right? It is even somewhat
surprising as to why that's not the case already.

-- 
With respect,
Roman
