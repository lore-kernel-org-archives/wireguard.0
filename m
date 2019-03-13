Return-Path: <SRS0=DyWu=RQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D553FC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Mar 2019 18:39:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD0520643
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Mar 2019 18:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD0520643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6acbfc9b;
	Wed, 13 Mar 2019 18:27:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cef00a5c
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 18:27:34 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 717eec26
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 18:27:34 +0000 (UTC)
Received: (qmail 4538 invoked by uid 500); 13 Mar 2019 18:38:18 -0000
Date: Wed, 13 Mar 2019 13:38:18 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Pre 5.1-rc1 build issue
Message-ID: <20190313183818.GA4501@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Commit 
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2c5c103b1337f590b7edf1509a6e294bdf22402
removed net/netfilter/nf_nat_core.h, which breaks wireguard builds for 
5.1.0-0.rc0.git5.2.fc31.x86_64.

It sounds like it isn't needed any more from the commit message.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
