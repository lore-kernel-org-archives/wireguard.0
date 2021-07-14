Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82158C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716FA60E78
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 716FA60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cock.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 035e3e39;
	Sun, 8 Aug 2021 22:58:43 +0000 (UTC)
Received: from mail.cock.li (mail.cock.li [37.120.193.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d97201aa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jul 2021 23:55:15 +0000 (UTC)
Date: Thu, 15 Jul 2021 01:55:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
 t=1626306914; bh=DrNNs4wjw5kDrkpXWrFzCIJZh1n99vgamswGCAVewYY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=k7DoFhbeqB5e2cTz4SvuaEhFlwrc6p+Rq86pbFckcG/YAs3ASTEE3H7B8CshQI+uV
 tXlaVHz+ZQyvLjev0mAmbcm+KIc7q8eEGsrS3p22J57FzKioAIC0DAIPdgTCb4Qy8g
 5KTUdCflFOPurBFaFGlqh6X8io24NGAEWyWNSlpMF2mSkk86cXqE3GFZZcEoo7xZKI
 bmlcczTJ/hy8fUXksXLcEgZwDjmndQshVZmUSzJJchfDhZxO2ZKKAMzIXiJ+1ny4la
 HP+m4efOaeU3iGQDOoYsHj4HjbO/nsfHaWsE5ol8HXbEghKk59CPNgFG34evHPDKRz
 cTl2Q7drfIsrA==
From: iiiiiiiiiiii <iiiiiiiiiiii@cock.li>
To: wireguard@lists.zx2c4.com
Subject: Re: Android: more than one tunnel
Message-ID: <20210714235513.zmgf663ukvjb5dqy@cock.li>
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
 <e8e94195-b1f0-df62-4393-929f20f762a3@spam-free.eu>
 <d994accd-d1a9-4f9a-bbf9-d6b99036b177@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d994accd-d1a9-4f9a-bbf9-d6b99036b177@www.fastmail.com>
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:58:42 +0000
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

I have experienced the same issue without overlapping AllowedIPs
subnets, so I believe it is Android-specific.

On 21/07/15 10:09AM, Eric Light wrote:
> Hi Chris!
> 
> I don't have any experience with the Android implementation specifically... but most likely, your two tunnels have overlapping AllowedIPs ranges.  When this happens, bringing up the second interface will override the routing created by the first interface.
> 
> Most commonly, this happens when someone configures both interfaces with AllowedIPs = 0.0.0.0/0.  To fix this problem, make sure there's no overlap of AllowedIPs in your tunnel definitions.
> 
> I hope this helps  :)
> 
> (my apologies if the problem is something Android-specific that I don't know about)
> 
> E
> 
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
> 
> On Wed, 14 Jul 2021, at 17:49, Chris wrote:
> > I have two distinct tunnels defined on Android.
> > However, I can only toggle between the two. I cannot have both activated at the 
> > same time.
> > I need both connections.
> > Am I missing anything?
> > Why not several tunnels with several wg servers???
> > Why is this being prevented?
> > 
> > BR
> > Chris
> > 
> > 
