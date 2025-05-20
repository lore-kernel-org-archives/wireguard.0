Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E6C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 14:22:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07e4b596;
	Tue, 20 May 2025 23:25:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 125a7fa2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 23:25:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C8E4A4A1EC;
 Tue, 20 May 2025 23:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AEAC4CEE9;
 Tue, 20 May 2025 23:25:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="RV9O4OWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747783506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xuu/7fl+tvtLIiwh+f++ddFznWSzjojrQ3mv7QSHujE=;
 b=RV9O4OWGpOsDv0b941CB9fcNkOMiPf2bglBs7GjAWJjhMu3xLREPvgsRWIfC8jHxzhcLwf
 lMN57OCXhxhEScopjHlW1W6Y4SuP0Q75dGz2MILftnatZp+nLWHXYRaEFFFV4YRJlP1XYQ
 5fnenIq989iGrT9Z+ial96fMTvOvtfw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67eaa621
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 May 2025 23:25:06 +0000 (UTC)
Date: Wed, 21 May 2025 01:25:04 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jordan Rife <jordan@jrife.io>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v3 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <aC0PUO0V_osG_ZrN@zx2c4.com>
References: <20250517192955.594735-1-jordan@jrife.io>
 <20250517192955.594735-2-jordan@jrife.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250517192955.594735-2-jordan@jrife.io>
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

On Sat, May 17, 2025 at 12:29:52PM -0700, Jordan Rife wrote:
> Introduce a new flag called WGALLOWEDIP_F_REMOVE_ME which in the same
> way that WGPEER_F_REMOVE_ME allows a user to remove a single peer from
> a WireGuard device's configuration allows a user to remove an ip from a
> peer's set of allowed ips. This enables incremental updates to a
> device's configuration without any connectivity blips or messy
> workarounds.
 
Applied as:
  https://git.zx2c4.com/wireguard-linux/commit/?h=devel&id=8f697b71a615c5dfff98fe93554036a2643d1976

And the userspace changes have been released already:
  https://lists.zx2c4.com/pipermail/wireguard/2025-May/008789.html

Thanks for this! And sorry it took so long to get it applied. I'll send
this up via net-next in a few days after a bunch of testing.

Jason
