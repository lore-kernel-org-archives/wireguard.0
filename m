Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10CBC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 09:38:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCE060F70
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 09:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DCE060F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46f1eb07;
	Mon, 27 Sep 2021 09:36:32 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c87bb962
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 09:36:29 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by rin.romanrm.net (Postfix) with SMTP id 0385269F;
 Mon, 27 Sep 2021 09:36:28 +0000 (UTC)
Date: Mon, 27 Sep 2021 14:36:28 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Bruno Wolff III <bruno@wolff.to>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, el3xyz
 <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Message-ID: <20210927143628.36c2ceab@nvm>
In-Reply-To: <20210927091435.GA10234@wolff.to>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
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

On Mon, 27 Sep 2021 04:14:35 -0500
Bruno Wolff III <bruno@wolff.to> wrote:

> This isn't a simple problem. The assumption is that someone is seeing 
> your network traffic and blocking it.

The assumption is that there's an appliance at the ISP which has a DROP rule
for UDP with 4 fixed bytes at a fixed offset. It has five hundreds other rules
to process as well, so it can't spend "too much" time on specifically WG.

> They are still going to see it  even if you disguise it.

With obfuscation there would be UDP packets of random junk, and it would be a
much harder job to come up with a rule to drop those without affecting
anything else.

> So you are going to need to disquise it as  something that whoever is
> watching isn't going to care about. That is going to vary a lot depending on
> who is watching. You may also need to hide who you are communicating with.
> In some cases that will be even more important.

You are going full-on "Enemy of the state" movie. The reality is most often a
lot simpler and more benign.

> There are going to be a number of ways to detect Wireguard traffic and 
> it is pretty unlikely that the bar for detection can be raised enough to 
> be relevant with a few simple changes to the protocol.

That's not a justification for not trying at all.

-- 
With respect,
Roman
