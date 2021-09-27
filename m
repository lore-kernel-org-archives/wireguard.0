Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C04C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 07:25:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FA261041
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 07:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95FA261041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33c0a469;
	Mon, 27 Sep 2021 07:24:16 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with SMTP id 8d59b0bd
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 07:24:13 +0000 (UTC)
Received: (qmail 16859 invoked by uid 500); 27 Sep 2021 07:11:30 -0000
Date: Mon, 27 Sep 2021 02:11:30 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: el3xyz <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Message-ID: <20210927071130.GA13681@wolff.to>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <877df2d5px.fsf@ungleich.ch>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Mon, Sep 27, 2021 at 09:53:08 +0900,
  Nico Schottelius <nico.schottelius@ungleich.ch> wrote:
>
>I'd appreciate if wireguard upstream would take this in, maybe even
>supporting multiple / dynamic listen ports.

The problem is mostly orthogonal to Wireguard. There isn't going to be a 
one size fits all solution for hiding traffic. Failures in hiding traffic 
are potentially very bad for individuals. As such general solutions are 
not something you can recommend universally to people, as amateurs are 
not going to be able to make good decisions about the risks and some may 
get themselves tortured and killed.

This may not be something the developers for Wireguard want to be 
responsible for.
