Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D10C71157
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Jun 2025 18:47:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40cb475f;
	Wed, 18 Jun 2025 18:47:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 33110c15
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jun 2025 18:47:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D00C61F1F;
 Wed, 18 Jun 2025 18:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0988CC4CEE7;
 Wed, 18 Jun 2025 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750272456;
 bh=FyR+UvfwxWEdNAnzplUkLL3k4NbHwnAdaKieqxpQciM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WTc0h3rAr+3TfjIFOZN/QUl7rQ6l12DKhuiv2vV2HJzQesP80cDBJy11CQ2ityO3v
 6hL8wfICluxMLC6ze9n5xzgVaTxlPdPdyi0p6wyqXxwV37VpPgLJEsk/8vvWZaqg8p
 f4Gv2VkXxRGZbHrHLXydmgyCrQVHedLeb05oCctnmEcBhJP3i4YwWpEHaurtcESRev
 6OqDBUD6Lqc2lRv3wURGu9n38fxI19fIay5deazx0ObxWF2RYA8FN9bv9JQ1XEVspZ
 9EnWQgUY1J0LRFG1xYWfzu/pNsghHOLIH3XKNIjaYC7R3PEpAQVXbLroyuhcEQ2xzj
 VfDNbyzVC5r1g==
Date: Wed, 18 Jun 2025 11:47:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sharath Chandra Vurukala <quic_sharathv@quicinc.com>
Cc: <Jason@zx2c4.com>, <wireguard@lists.zx2c4.com>, <netdev@vger.kernel.org>
Subject: Re: Issue with rtnl_lock in wg_pm_notification
Message-ID: <20250618114735.5472f2cd@kernel.org>
In-Reply-To: <2c5257a7-e330-4983-8447-3e217b616b2e@quicinc.com>
References: <2c5257a7-e330-4983-8447-3e217b616b2e@quicinc.com>
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

On Tue, 17 Jun 2025 01:44:56 +0530 Sharath Chandra Vurukala wrote:
> I do not understand fully what wireguard functionality is, but
> considering that rtnl_lock is a global one, it does not seem to be a
> good design to have notification callback acquire this lock.

I'm not very familiar with the PM locks, but isn't the PM notification
lock also a global one? Again, not an expert but having PM lock outside
the rtnl_lock would be more intuitive to me.
