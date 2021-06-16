Return-Path: <SRS0=+n2a=LK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A08C48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 14:29:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 617F26101A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 14:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 617F26101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a742785c;
	Wed, 16 Jun 2021 14:26:46 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [2a07:2ec0:3002::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 241f4f02
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 13:25:07 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1ltVXW-00035w-2q
 for wireguard@lists.zx2c4.com; Wed, 16 Jun 2021 15:25:06 +0200
Date: Wed, 16 Jun 2021 15:24:57 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: wireguard@lists.zx2c4.com
Subject: passing-through TOS/DSCP marking
Message-ID: <YMn7qQ/7s/CciRNy@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 16 Jun 2021 14:26:45 +0000
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

Hi everyone,

First of all, I'm sorry if this topic has been dealt with before and I've
just not been able to find the answer in the archives.

I'm currently helping to setup a bunch of Wireguard links for a
non-profit humanitarian organization (using OpenWrt, ie. using the Linux
implementation on both ends). As these tunnels are carrying a diverse mix
of data, including VoIP, I was wondering if Wireguard passes-through the
TOS/DSCP marking of tunneled packages to the outer package's headers,
similar to what the 'passtos' option of OpenVPN is doing.

I would assume this is true by default, but I haven't found any
information about it, and as VoIP performance under load isn't as great
as I was expecting, I'm now writing to you here, hoping for a meaningful
answer which will preserve me from having to read the actual code...


Thank you for all the great work!


Best regards


Daniel
