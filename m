Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DACC2BB40
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:00:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E082823715
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E082823715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=p-np.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae443c87;
	Thu, 17 Dec 2020 09:52:07 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 88ef4129
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 08:23:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4CxQFY0MBCzQlXm
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 09:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=p-np.de; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :subject:subject:references:in-reply-to:message-id:from:from
 :date:date:received; s=062016; t=1608193881; bh=T5s5FV5QOI8oHIHl
 PILtMEnSlJOW8xuIvnS9U1xNyVY=; b=NOIl3/HFNyUuBlFj+A4Zjwl+vVDvxmlV
 ipMT+GhGour2G66mAp0KNr2qrg9wdvOjdIjRbZbJaXT/sD9ajKCV1cBRB2ZaqIjm
 D40xvrG6+yQz7VLVIX+FnY3XJdPPtq39f8T/SQO9ao1sAdij17ePOVAcmJMxMwWB
 kD3nNK3/6Vc=
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id 4XJMWdAM6bqO for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 09:31:21 +0100 (CET)
Date: Thu, 17 Dec 2020 09:31:21 +0100 (CET)
From: wireguard@p-np.de
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <1143670031.15228.1608193881153@office.mailbox.org>
In-Reply-To: <CAHmME9ozv2UAe8NOUaBGDfQpohYS+SLY+Zix8A-q3dt8AKao+w@mail.gmail.com>
References: <CAHmME9ozv2UAe8NOUaBGDfQpohYS+SLY+Zix8A-q3dt8AKao+w@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardKit for iOS and macOS Released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.04 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4E1161893
X-Rspamd-UID: e640ec
X-Mailman-Approved-At: Thu, 17 Dec 2020 10:52:07 +0100
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

That's really cool, thank you!

Christian

> Jason A. Donenfeld <jason@zx2c4.com> hat am 15.12.2020 17:06 geschrieben:
> 
>  
> Hi folks,
> 
> For the last several weeks, Andrej from Mullvad has been working hard
> at modularizing the wireguard-apple repository, which contains the
> code we use to build WireGuard for macOS and WireGuard for iOS. The
> end result is WireGuardKit, an open source Swift PM package that
> anybody can use to easily build macOS and iOS applications that
> incorporate WireGuard tunnels. Instructions on usage are available
> here:
> 
> https://git.zx2c4.com/wireguard-apple/about/#wireguardkit-integration
> 
> Users of WireGuardKit will be able to instantiate a WireGuardAdapter
> inside of their PacketTunnelProvider network extension. The one that
> ships with WireGuard for macOS and iOS should serve as a simple
> reference of ~125 lines of boiler plate code:
> 
> https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
> 
> All of the heavy lifting has moved into the WireGuardKit, so that
> application writers do not need to concern themselves with low-level
> networking details.
> 
> In general, the WireGuardKit project has been a great example of
> positive collaboration between the WireGuard open source project and
> an industry stakeholder. As Mullvad's mobile apps depend on WireGuard,
> putting the development time into improving our upstream code so that
> their downstream code can more easily consume it, as well as
> contributing fixes and improvements in their downstream code back
> upstream, not only makes things easier for Mullvad, but also brings
> shared improvements to everyone else across the WireGuard ecosystem.
> 
> As more developers begin to use WireGuardKit, we're very interested to
> hear feedback, particularly about missing features or APIs that might
> be useful.
> 
> Enjoy!
> Jason
> 
> PS: Today we've also sent new versions of the WireGuard app up to the
> App Store approval process for iOS and macOS, with a bunch of
> performance improvements and also support for Apple Silicon. Who knows
> how long it will take for Apple to approve it -- we've experienced
> wait times between 1 day and over 1 month -- but keep your eyes peeled
> for the update.
