Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78378ECDE44
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E65920685
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hfnet.de header.i=@hfnet.de header.b="slwn1DZL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E65920685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hfnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eac6d553;
	Sun, 4 Nov 2018 17:07:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7306b12
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Oct 2018 16:37:32 +0000 (UTC)
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57649467
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Oct 2018 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1540312809;
 s=strato-dkim-0002; d=hfnet.de;
 h=Date:Message-ID:Subject:From:To:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=2qm9Sad5BXX4BKjcBdxSD4pZG56UTEfOz6oUoARMXVI=;
 b=slwn1DZL80VU8o1jeH9SBZoVlhARHKd70uGnizGGK72PXD/RE8/H9eP8UElkle2o8J
 MMd8vBTieq6cxUs9L4GUiXzJ3mFMYHP53t+bZ9VXof35ZGXNG2UeHl+Y6E21YVDHsT7A
 QcPo/FBXgUCec7bA9V2o1gMHy/8DYzV4PxoL9tIeNvx+2FygjLjQtWaG4bCCCDs2fhN0
 twGpP9QHtIeZOEcqFfu30sWQ5h02CVDdR9U6GX9h/7+3dtpAq8VJXKC2JoAQKStI0+QP
 rErkinJDaG5rhLYFPTi04ivNTqsQnygZ6IC05lpPoIywPBXyy3X4xScxk4q5B2VA0IqP
 ObxQ==
X-RZG-AUTH: ":JGokfUamfuv/ajhQi2D1+32SMzobxf53DM2Iha6EVFGNk+2fFi7qsB2VHO8="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.208] by smtp.strato.de (RZmta 44.3 AUTH)
 with ESMTPSA id n083f8u9NGe8zCo
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Oct 2018 18:40:08 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Heiko Friedel <hf@hfnet.de>
Subject: WireGuard Android: Cached resolved host
Message-ID: <523fbb0f-934e-4ba0-0948-718c9e1844a1@hfnet.de>
Date: Tue, 23 Oct 2018 18:40:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:07:23 +0100
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

Hi all!

I'm using WireGurad on Android to connect to my home server with a 
dynamic IP address. It can change from time to time.

When I need to reconnect due to achanged IP address, it seems that 
WireGurad is using a cached hostname and not re-resolving it. I have to 
"force stop" the app.

Is there a specific reason for caching the hostname?

It would also be great if WireGurad re-resolves the hostname when the 
handshake (keep alive) has timed out.

Thank you,
Heiko








_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
