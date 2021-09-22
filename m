Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8EDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 04:05:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F84C610E8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 04:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F84C610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9e66403;
	Wed, 22 Sep 2021 04:05:32 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff390b98
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 04:05:28 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id 0827E1E00BCA
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 04:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=vnptcm0lqn; t=1632283458;
 bh=+RfxNjWOCNqd8Z8H1tmj2U1Mt4C56DytaIguZWXLRBw=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=iy/aelHAJxms6Y0OTg2WeuIb8S3FK2Q402BSIvqOz7TTXz/KISIv27wRdHCwPC3Tg
 e5lkwcgDJ/SwKmP62LPwSf7tjP79FRbr2xtbie6UwihFo5LhQGJUUU+PUK0fi00CG5
 eUpJcphzW5bMYVX3h7S1Ha6hEhYsehsjlCH3nGmH0/FKqmNjqSm5x9lJmIpYgf4Fvh
 MLqLJkAEBsM0p9OzLMK+clyPKkLyjxJNB/gV06OtszzV0guwlWxQwNE49nc9x+RSwT
 M8eTENaxDWOG3mWeArl7uovz3o6OK0S+CWCK9SQ+OC72pOj3AjC0AmJfc0V2a4DQAW
 brwZjwpEityVg==
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: wireguard@lists.zx2c4.com
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
From: Anatoli <me@anatoli.ws>
Message-ID: <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
Date: Wed, 22 Sep 2021 01:04:16 -0300
Mime-Version: 1.0
In-Reply-To: <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
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

Hi All,

Same here.

After recreating the tunnel from scratch and activating it, the tunnel is
established, the server sees the handshake, but the iPhone doesn't have any
connectivity, can't connect to anywhere while the tunnel is activated.

After turning it off, internet starts working again.

I guess the problems is not just the configs not being re-imported.

Regards,
Anatoli

On 22/9/21 00:14, Jason A. Donenfeld wrote:
> Hi Eddie,
> 
> On Tue, Sep 21, 2021 at 6:26 PM Eddie <stunnel@attglobal.net> wrote:
>>
>> Title says it all.  On both iPhone and iPad.
>>
>> The configuration names still show, with the slider, but trying to
>> activate gives:  Activation failure.  Unable to retrieve tunnel
>> information from the saved configuration.
>>
>> Selecting a tunnel name doesn't show any configuration.
> 
> Thanks for the report. I had seen murmurs of this on IRC and Reddit
> too. This post [1] mentions that they just get deleted... I'm
> decrustifying my Apple setup, updating phones and macOS and Xcode and
> will hopefully have a patch out soon enough, and then hopefully not
> too rough of a time with the dreaded app store review process. I'm
> also CCing Roopesh who might be able to whip something up faster than
> me.
> 
> Jason
> 
> [1] https://www.reddit.com/r/WireGuard/comments/prhb3k/ios_15_released_on_monday/
> 
