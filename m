Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40350C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 23:14:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E9661131
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 23:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88E9661131
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0629de4b;
	Wed, 22 Sep 2021 23:14:04 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6e5b27c
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 23:14:00 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id F06C91E00BCA;
 Wed, 22 Sep 2021 23:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=vnptcm0lqn; t=1632352368;
 bh=V+2b+9TWBvUBAyt1ARATwS0txMTPcY5BQMg9OEUfk0c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=JnsLzwL+U32YtCHWdsuTWfVho9oAMuj4hgjvFbvVIDGXJB4FYcJAzb7ialSkkTYwj
 A5CadjhOtBZvbDC/70WR4/CeqS+O2khLHs8ueU8WCSRuvtg7ZU51e43QvKJeJMFjpW
 t0sn/SiDQ9IyTzmS/LAQy3p+cBwCVE6WbhhDh1bqQfxHwmzTkaSXOQ13EeuyXOgtiI
 WzgE0fs0YzyJh9KE0NJJV4UWD6BbBYp1E1VVKsir2XcAxJXDvuLei59aFxLzXmKf6F
 2P1AaQHYh2K0lyJ4CSEKCv4hwojlgqIwLQ3b8I5gnNNo3CtWRCU8fHd9oDYxubKfsA
 8sN6rRRVso/Rg==
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <B096024B-E199-462E-978C-73B2C1D4C8D2@anatoli.ws>
 <CAHmME9pjuin565o4Ckmj2rHEhO9bAd4uaGarMA9SAMmP=85_wQ@mail.gmail.com>
From: Anatoli <me@anatoli.ws>
Message-ID: <23be4054-af4f-b9a2-c01f-6e6dc33096a4@anatoli.ws>
Date: Wed, 22 Sep 2021 20:12:45 -0300
Mime-Version: 1.0
In-Reply-To: <CAHmME9pjuin565o4Ckmj2rHEhO9bAd4uaGarMA9SAMmP=85_wQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Sorry, I replied before I've got your mail about the new version.

This is how the old version was behaving. Haven't tested yet the new version.
I'll test it and report today or tomorrow.


On 22/9/21 19:26, Jason A. Donenfeld wrote:
> On Wed, Sep 22, 2021 at 4:24 PM Anatoli <me@anatoli.ws> wrote:
>>
>> I can confirm that recreating the tunnel from scratch does work. So the problem is that the tunnel settings become corrupted when iOS is upgraded from 13.x / 14.x to 15.0.
> 
> What are you testing? The new version of the app or the old one? Does
> the new one corrupt settings or only the old one? Precision is
> important here.
> 
