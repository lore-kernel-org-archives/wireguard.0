Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2809C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 00:03:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0B92083D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 00:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hfnet.de header.i=@hfnet.de header.b="RpBVIDnz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E0B92083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hfnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87301644;
	Mon, 5 Nov 2018 23:58:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6516165e
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 16:52:42 +0000 (UTC)
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2fb2b98
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1541437016;
 s=strato-dkim-0002; d=hfnet.de;
 h=In-Reply-To:Date:Message-ID:Cc:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=k2/sAuqrmCnkX0Lg5IAO+l4Z4CXohY37+52vI4TM1Ig=;
 b=RpBVIDnzF8HGTjT6bWuYiLipMTZsK9zn5KzmLRWpHK2i17bKJ+RcjraDOfLLCx0vzh
 huWCrKhNNOrIr0dgQcCn3bpLPmjkOU3wihS90h+Xjek2NhDLqUSZwn/andJBLsmNrc5z
 Eg+hHqJtk1+01mavP9zKSSik9Bug3Bng2GsxD/sPT4aqCtpEOLej3AORPh6hRQuN4aBw
 l/QWVDU9b9+779K+rzQOYG20O1odHFQ5Tr7aA1n9Mx5OiSga0qk5fdVpDDy0btlygXJl
 YJGzIOaRhM3w81G4V7OZH59Q22zhst0PwMOXByFBbdUw0fjYOrcqmZCylewNlcoWqmTJ
 VxDw==
X-RZG-AUTH: ":JGokfUamfuv/ajhQi2D1+32SMzobxf53DM2Iha6EVFrQWjxYnm0sTv1FMDIyoA=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.135] by smtp.strato.de (RZmta 44.3 DYNA|AUTH)
 with ESMTPSA id n083f8uA5GuqRcM
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 5 Nov 2018 17:56:52 +0100 (CET)
Subject: Re: WireGuard Android: Cached resolved host
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <523fbb0f-934e-4ba0-0948-718c9e1844a1@hfnet.de>
 <CAHmME9rm838UB=stvUPZkOVe1SuDQFNOvAyPHU7dhQscnCOahA@mail.gmail.com>
From: Heiko Friedel <hf@hfnet.de>
Message-ID: <661a8a32-98e7-bb19-ebfb-8a85d6b4ffb9@hfnet.de>
Date: Mon, 5 Nov 2018 17:56:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9rm838UB=stvUPZkOVe1SuDQFNOvAyPHU7dhQscnCOahA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 06 Nov 2018 00:58:54 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

How fast is turning on and off and on?

AddressCache.java already implements a cache with a fixed TTL of 2 seconds.

A quick fix was to re-resolve with every call to getResolvedEndpoint(). 
I'm testing this for a couple of days without issues.

Am 04.11.2018 um 18:25 schrieb Jason A. Donenfeld:

> It's mostly this way to prevent DNS lookup failures during the network
> connectivity changes, such as turning on and off and on a tunnel
> really fast. I agree the current implementation's behavior is
> suboptimal though. Probably instead we should invalidate based on the
> TTL.
> 
> The code in question lives at
> app/src/main/java/com/wireguard/config/InetEndpoint.java if you want
> to take a stab at fixing it.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
