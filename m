Return-Path: <SRS0=+n2a=LK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E40FC48BE8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 14:29:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91BE96101A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 14:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91BE96101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=afaics.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e79be443;
	Wed, 16 Jun 2021 14:27:07 +0000 (UTC)
Received: from outgoing.selfhost.de (mordac.selfhost.de [82.98.82.6])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ba98ea1a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 13:30:30 +0000 (UTC)
Received: (qmail 31378 invoked from network); 16 Jun 2021 13:30:29 -0000
Received: from unknown (HELO mailhost.afaics.de)
 (postmaster@xqrsonfo.mail.selfhost.de@87.160.250.28)
 by mailout.selfhost.de with ESMTPA; 16 Jun 2021 13:30:29 -0000
Received: from localhost (mailhost.afaics.de [local])
 by mailhost.afaics.de (OpenSMTPD) with ESMTPA id b31f51aa;
 Wed, 16 Jun 2021 13:30:28 +0000 (UTC)
From: Harald Dunkel <harri@afaics.de>
To: wireguard@lists.zx2c4.com
Cc: 
Subject: running wireguard company-wide?
Date: Wed, 16 Jun 2021 15:30:28 +0200
Message-ID: <87tulyos23.fsf@sylvester.afaics.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 16 Jun 2021 14:27:05 +0000
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

Hi folks,

how can I bind the private key to a specific host, eg. an office
Macbook? Esp on MacOS the private key is in plain sight in the
wireguard GUI, making it easy to reuse it for other, unintended
purposes.

For private installations this might be OK, but for a company-wide
deployment this is a major headache.

Every helpful hint is highly appreciated
Harri
