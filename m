Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03501C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 04:28:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B17217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 04:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B17217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=intnet.mu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8b5ef16;
	Tue, 27 Aug 2019 04:28:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4eeea9a
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 04:28:51 +0000 (UTC)
Received: from smtp5.intnet.mu (mta140.intnet.mu [202.123.30.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79cb96d6
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 04:28:50 +0000 (UTC)
Received: from adsl-151-245.myt.mu (HELO ys-hkm-ysn-lbd.eh-zohr)
 ([41.212.151.245])
 by smtp5.intnet.mu with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 08:25:50 +0400
From: Vincent <mercier@intnet.mu>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [ANNOUNCE] OPNsense 19.7 supports WireGuard
Message-Id: <DDEE689A-E2B5-414A-8233-F08B06278F0B@intnet.mu>
Date: Tue, 27 Aug 2019 08:28:46 +0400
To: m.muenz@spam-fetish.org
X-Mailer: Apple Mail (2.3445.9.1)
Cc: wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Is there any particular tweeks required to install the announed wireguard in opnsense?
non listed under plugin and neither pkg install in opnsense 19.7.2


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
