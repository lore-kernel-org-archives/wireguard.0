Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93897C072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:34:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d136779;
	Sun, 19 Nov 2023 13:34:39 +0000 (UTC)
Received: from mariecurie.slightlybroken.com (mariecurie.slightlybroken.com
 [116.203.185.229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d5e71ac1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2023 16:19:16 +0000 (UTC)
Received: from slightlybroken.com (46-127-146-24.dynamic.hispeed.ch
 [46.127.146.24])
 by mariecurie.slightlybroken.com (Postfix) with ESMTPSA id 8E5DE50EAE7F
 for <wireguard@lists.zx2c4.com>; Fri, 29 Sep 2023 18:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=slightlybroken.com;
 s=20220918; t=1696004356;
 bh=+iUN+9q2aU01uOTMwvgVv1V5kyUZneZi/kTJNobVG+c=;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:From:To:CC:Date:
 Subject:Content-Type:Content-Disposition:Reply-To:In-Reply-To:
 MIME-Version:Message-ID:References;
 b=BOyG59vtVuj60wWVrqBZNQo59TZSNcYQSa6BuoOb3xxS6yftMe5hugGKEJuCKH0PI
 ++94+f9x4t5ZCe/sOSn0qrSh+SAB+esXcS7XPI8jFJKVMKSCb9EvLmxost/iI9cvoz
 /lhdHIYEt7RdL/gSQDSih9tILXCxfPs1ibM8prWw=
Date: Fri, 29 Sep 2023 18:19:15 +0200
From: Reto <reto@slightlybroken.com>
To: wireguard@lists.zx2c4.com
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <fbajo774tkhkkbzo66nkvfrr2el2yowtr5uffdgyduaty735i2@m2cjrphubr52>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <ZPP7tab5OqR39RcY@matrix-dream.net>
 <20230929131257.4uyp3fkxkxt7qg3f@darkboxed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230929131257.4uyp3fkxkxt7qg3f@darkboxed.org>
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

On Fri, Sep 29, 2023 at 03:12:57PM +0200, Daniel Gröber wrote:
> PS: Your mail didn't reach my inbox for some reason, I randomly found it
> while looking at the wg list archives. Consider configuring your mail
> client to To/CC people you're replying to in order to better handle flaky
> list servers.

Well...

Date: Sun, 3 Sep 2023 03:21:25 +0000
From: Ivan Labáth <labawi-wg@matrix-dream.net>
To: Daniel Gröber <dxld@darkboxed.org>
Cc: Juliusz Chroboczek <jch@irif.fr>, Kyle Rose <krose@krose.org>,
        bird-users@network.cz, babel-users@alioth-lists.debian.net, wireguard@lists.zx2c4.com
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <ZPP7tab5OqR39RcY@matrix-dream.net>

They did.

Cheers,
Reto
