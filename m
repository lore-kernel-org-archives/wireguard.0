Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DD1C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:48:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F6C218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noddingdog.org header.i=@noddingdog.org header.b="IOQgEbVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F6C218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noddingdog.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3399998;
	Wed, 20 Mar 2019 22:47:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66783e6d
 for <wireguard@lists.zx2c4.com>; Sat, 9 Mar 2019 07:09:51 +0000 (UTC)
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e4b90a7
 for <wireguard@lists.zx2c4.com>; Sat, 9 Mar 2019 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1552116039;
 s=strato-dkim-0002; d=noddingdog.org;
 h=Date:Message-ID:Subject:From:To:Reply-To:X-RZG-CLASS-ID:X-RZG-AUTH:
 From:Subject:Sender;
 bh=F+9oeyZ+v1PIU3cNrAV/hkhFfZHa5sexJfbQt/up7tE=;
 b=IOQgEbVMqvS48mAlJvXprHGe5UecBTP/0+1rkYuqxw+tYCEvWHGhTYAP2qgjWtlfk0
 maKpoqYgkUoChEWDhXDxrkUXAIVjzqxXMyj6ERCGGeGDJprieKbMU6FtkofDThtOdVt2
 gUqI6qD7xJ0S1Z1N17x0lAaMb/pJ/6/Xl2zQ391FjrEULSYZNK7Ln3plerdcuz7Uii0P
 uzB0T8mVOlHapiXaeRxf+6gKB2LSpxOC25Cjxj1U1f14wZQL+ASEgpmnSb6YTkmxnYBx
 hfts1N+pODd8B26Pjs9Gf42jVioeXUkF8D/Cn3tcV14M9oMuw1kE3T2/gi5Is7P0YQ3L
 DZuw==
X-RZG-AUTH: ":IGUXYVOIdfBKufcaBaD1VnaVHDFPyTRa+MRijjlybNMf0fcWFTusC9FRG/J1O6IB3CPWNrVF"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.123] by smtp.strato.de (RZmta 44.13 DYNA|AUTH)
 with ESMTPSA id Z00eecv297Kdpe7
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Mar 2019 08:20:39 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: NoddingDog <lists@noddingdog.org>
Subject: Android app feature suggestions here?
Message-ID: <31655861-2950-6531-e2b8-10c456980651@noddingdog.org>
Date: Sat, 9 Mar 2019 08:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:47:34 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: lists@noddingdog.org
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

Hello,

I'm quite new to Wireguard and new to this list.

I have a feature suggestion / request for the Android app (probably also 
valid for other clients). Is this the right place to post it, or is 
there a different channel for this?

Thanks in advance,
NoddingDog

-- 
---
-----------------------
lists@noddingdog.org
-----------------------
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
