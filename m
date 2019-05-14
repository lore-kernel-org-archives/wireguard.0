Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815C8C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 09:12:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163EF20675
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 09:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="hQgKxsDu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163EF20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffb28cf0;
	Tue, 14 May 2019 09:11:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75009924
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 09:11:56 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7a5a6ec
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=nh8Jhe/B8Z+DeUgHeR5H3X7tNur3bsdlOSe1geDfonU=; b=hQgKxsDuX8rAjJjxb1NGreoGTS
 lYi3TymxQCTmOYqW6aOwaMvf1L7p6fSeoDkw9pjglLIoEWbPMHtDgetViW3bYDonzbCwkSd1tPBPe
 B33Zp4sDXuZ6KWT7vygosP33knWS0nNy0tcxZJJ1FREet2O31Aad7Xz27tDk+aQTeHeMfgxbtLn01
 0N7s8dUOEiYzm7YAkHPu9R/OOdb6OZ6VxySkwFVaBL9uqGLuUbHt2B/DcP9YajRo03NqwrFNIN5ZP
 Dzr3vS6Y6T9RcasWl6fyHRukN1kW3TKZNJ+OCWdhjl++iNf3oow0z8KvXuv/9E0EiY4mgI44Tibqt
 cnh9FQj60m+6y7QmCOMVlEBmrhs7BqtwLdc2XMl1YrxNskLpQaPGzXZiBVBQmOqkk3qPLouBn1e0H
 16ovSlQQwJrEqdpxzrfN9JtwpseMZqBBh9nIx7x2oxxNHbVwX9lLuN5EKRTwj+wuFUg0qC1CbgYqV
 0JLUXur8AWlVF8Xg3XEO/5Tcfhp7k9RadvEVV08yybWLB17XOfykXtWTGRDA/Zgg8QElF0wv+uAyu
 687e70JBNO5DLqCsViReGQbCu0DOWvv986FX7QHgr1zc03iM6QCznrGm3i19kVmVn/tsIpxQOShu/
 2Liqh/sEhsSgcRlO64QWmgasyikx3abW3KZVUudV0=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1hQTTV-0007if-Js
 with ESMTPSA (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 for wireguard@lists.zx2c4.com; Tue, 14 May 2019 11:11:55 +0200
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: Add Wireguard to Linux staging tree
Message-ID: <9b657152-e9c9-5254-ea3e-0ff4c452fc36@bartschnet.de>
Date: Tue, 14 May 2019 11:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
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

Hi,

it seems activities adding Wireguard to the Linux kernel have stopped because of lack of audits and cryptographic weakness tests.
I suggest to offer adding Zinc/Wireguard to the Linux kernel staging tree to make it easily available for testing and auditing.

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
