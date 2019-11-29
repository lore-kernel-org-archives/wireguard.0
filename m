Return-Path: <SRS0=ytco=ZV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D796C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Nov 2019 21:19:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A688F21771
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Nov 2019 21:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=trustiosity.com header.i=@trustiosity.com header.b="4vF/y7RA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A688F21771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trustiosity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97a66191;
	Fri, 29 Nov 2019 21:19:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 750fb6fc
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Nov 2019 21:18:57 +0000 (UTC)
Received: from mx.trustiosity.com (mx.trustiosity.com [54.186.28.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 318fd1fe
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Nov 2019 21:18:57 +0000 (UTC)
Received: from [192.168.212.66] (csm.ldm [192.168.212.66])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: zrm@trustiosity.com)
 by mx.trustiosity.com (Postfix) with ESMTPSA id 6651F423F61
 for <wireguard@lists.zx2c4.com>; Fri, 29 Nov 2019 16:18:55 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
 s=mx; t=1575062335; bh=dpIYZS3Cbpr94CA2fYcSRi6FDKOYB0/bT3WDvpOSRQk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=4vF/y7RA5vhbeTxzM6pDJ8+TvUhC/kiJuIqdOJwO3qGHM3XQJRzzszb+wGAW5XSFI
 igRu8Jj9aShgXwj1UJWfhEEZx7WbB4joST9K1abPTs7lpAh70rkTUcwIwCw4yxeHyd
 IuAy4B8ZUOmWlmACvq8JH/X6c4NCPXOGPlMzT4Vg=
Subject: Re: idle traffic considerations
To: wireguard@lists.zx2c4.com
References: <48f2826293c5cf93d123d8789b6afc15@ethergeist.de>
From: zrm <zrm@trustiosity.com>
Message-ID: <86ffb110-50f2-de38-ec25-698b0232b09b@trustiosity.com>
Date: Fri, 29 Nov 2019 16:18:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <48f2826293c5cf93d123d8789b6afc15@ethergeist.de>
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

On 10/17/19 06:29, Knuth wrote:
> Hey,
> 
> we are planning to deploy certain devices with an embedded sim cards in 
> different countries across the globe, for maintenance we need to be able 
> to connect to the devices with ssh.
> 
> Since the sim cards only provide us with a private IPv4 behind NAT 
> (because apparently IPv6 is still hard...) we need to reverse the 
> connection process to our control system,
> at the moment we consider doing this with wireguard (we are aware of the 
> "pre" release status), since we had good experiences with it on other 
> similar setups.
> 
> To calculate some rough estimated costs for the mobile connection 
> traffic volume, i'd love to know if there is a way to calculate the 
> amount of traffic caused by an idle wireguard connection kept alive 
> since we would be charged per MByte transferred.
> Or do we simply have to setup a few test subjects and monitor it over a 
> longer time, which in itself could be error prone.
> 
> 
> Thanks for your time
> Knuth

Ballpark estimate, round a keepalive packet to about a hundred bytes. 
You're also going to get a re-keys, call those two hundred bytes. If you 
have a keepalive every 30 seconds and a re-key every 120 seconds, that's 
around 18KB per hour per peer in each direction.

This scales inversely with the keepalive interval, and if it's longer 
than 120 seconds then the idle rekeys happen less often too. How short 
you can get away with depends on how long your network provider(s) 
continue to track idle UDP flows. RFC4787 Section 4.3 recommends five 
minutes and requires at least two minutes here, but you may still want 
to test and make sure you don't have a crappy network provider that 
violates the RFC.

It's also best to test the results empirically in any event. We can 
estimate about how big a keepalive packet is but if you've got a bug 
sending them every 60ms instead of every 60s you'll be happy to catch it 
before the bill comes in across your entire fleet.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
