Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB4C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 19:59:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d1c1341e;
	Tue, 14 Jun 2022 19:59:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 79b808fc
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 19:59:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 140F8B81AF2;
 Tue, 14 Jun 2022 19:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D93C3411B;
 Tue, 14 Jun 2022 19:59:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="h05XDdiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655236768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TKV0ajws2PUci8JL+LkkaCjTOvclqBxHT3EHNri+Fjc=;
 b=h05XDdiI5L3X1ZFGYGCFvND6PI0dMafiiT+0paG9yc1URYcPQ0tRXv/JDCf/35w1664C47
 ls8f5W1AyLISILtp1vPUBoHEZIgwX+VRop3SrjzGi9I6ZBk6AODrmgFJiPPLB/h3ThgyNv
 czBgf+pxgbvxOSlCq0vMJQzoHBQ84os=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7e6ddf99
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 14 Jun 2022 19:59:28 +0000 (UTC)
Date: Tue, 14 Jun 2022 21:59:26 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Joseph Mingrone <jrm@FreeBSD.org>
Cc: wireguard@lists.zx2c4.com, decke@freebsd.org, mad@madpilot.net
Subject: Re: [PATCH] compat: Update version to handle sbcreatecontrol() changes
Message-ID: <YqjonnCu7RV0DC0j@zx2c4.com>
References: <20220614191526.70200-1-jrm@FreeBSD.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191526.70200-1-jrm@FreeBSD.org>
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

Hi Joesph,

On Tue, Jun 14, 2022 at 04:15:26PM -0300, Joseph Mingrone wrote:
> The sockbuf changes to merge two versions of sbcreatecontrol() into one
> occurred in b46667c63eb7 in the FreeBSD src repository.  The value of
> __FreeBSD_version at the time of that commit was 1400059, so check
> for systems with a version stamp less than 1400059.
> 
> Ideally __FreeBSD_version would have been bumped in b46667c63eb7,
> however it was set to 1400059 53 commits prior in 3a9a9c0ca44e and not
> bumped to 1400060 until 374 commits later in 85d7875d4291.  Thus, this
> is not a perfect solution because CURRENT systems built from 53 possible
> commits that require the adjustment will still fail to build the
> wireguard kernel module.  This is better than checking for systems with
> __FreeBSD_version < 1400057.  In that case, there are 767 different
> commits a CURRENT system may be built from where the module will fail to
> build.

Seems reasonable. Applied, thanks.

Jason
