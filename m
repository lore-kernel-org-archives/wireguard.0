Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5E1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 09:27:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46DA1603E8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 09:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46DA1603E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36273f89;
	Mon, 27 Sep 2021 09:27:22 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with SMTP id 45e8b504
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 09:27:18 +0000 (UTC)
Received: (qmail 23016 invoked by uid 500); 27 Sep 2021 09:14:35 -0000
Date: Mon, 27 Sep 2021 04:14:35 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Roman Mamedov <rm@romanrm.net>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 el3xyz <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Message-ID: <20210927091435.GA10234@wolff.to>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210927123439.7a551913@nvm>
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

On Mon, Sep 27, 2021 at 12:34:39 +0500,
  Roman Mamedov <rm@romanrm.net> wrote:
>On Mon, 27 Sep 2021 02:11:30 -0500
>
>Don't over-estimate the resources available to DPIs, if there aren't easy
>ways to block, it might be almost as good as unblockable.
>
>And it is far from all cases that hiding traffic would result in bad
>consequences. Just hiding it enough so it evades the dumb automated filter,
>many people will thank you.

If someone is having their Wireguard traffic blogged, there is a good 
chance that they will be negative consequences to trying to evade the 
block. Just getting detected will often be enough to trigger these 
consequences, even if the traffic is getting through.

This isn't a simple problem. The assumption is that someone is seeing 
your network traffic and blocking it. They are still going to see it 
even if you disguise it. So you are going to need to disquise it as 
something that whoever is watching isn't going to care about. That 
is going to vary a lot depending on who is watching. You may also need 
to hide who you are communicating with. In some cases that will be even 
more important.

There are going to be a number of ways to detect Wireguard traffic and 
it is pretty unlikely that the bar for detection can be raised enough to 
be relevant with a few simple changes to the protocol.

This suggest that Wireguard is not the correct place to be doing these 
things. As suggested in another followup, this fits a lot closer to 
tor's mission and that would probably be a better place to look for 
help.
