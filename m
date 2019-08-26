Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F256C3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F1D206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F1D206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=intnet.mu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5245aa4;
	Mon, 26 Aug 2019 12:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f3a950c
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 11:45:02 +0000 (UTC)
Received: from smtp5.intnet.mu (mta140.intnet.mu [202.123.30.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1c76770
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 11:45:01 +0000 (UTC)
Received: from unknown (HELO ys-hkm-ysn-lbd.eh-zohr) ([197.226.216.158])
 by smtp5.intnet.mu with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 15:42:04 +0400
From: Vincent <mercier@intnet.mu>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
Date: Mon, 26 Aug 2019 15:44:57 +0400
References: <mailman.1.1566813601.6235.wireguard@lists.zx2c4.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <mailman.1.1566813601.6235.wireguard@lists.zx2c4.com>
Message-Id: <C86A2825-D825-4E9E-A7D4-9F518A61CEA3@intnet.mu>
X-Mailer: Apple Mail (2.3445.9.1)
X-Mailman-Approved-At: Mon, 26 Aug 2019 14:28:33 +0200
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

Wireguard not listed in OPNsense 19.7 plugins
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
