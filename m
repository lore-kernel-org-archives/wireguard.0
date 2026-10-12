Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCD0CA9ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2026 19:15:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5ef5bab4;
	Mon, 12 Oct 2026 19:15:08 +0000 (UTC)
Received: from mail.posixcafe.org (mail.posixcafe.org [45.76.19.58])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6f779cb6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2026 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posixcafe.org;
 s=20200506; t=1791832464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bjNTDOhrYZ4yi5ml3ketfwRGrK2hq27gyZv6/91JfOI=;
 b=MzT0FxHxiGOKSxEmqP23BT3WS7K9xLgocDBcpMfNEjcHQI33q5yhz+oFHAj7i0UdgKnQ+C
 n66EBfjpGA0g/esmQ7JXDEw73MufyXorM2dJueGCRQQ9lr84w5PTxO029Ahm06cmXZWnqO
 LvE1RQkIPoc2X43bjrEgY4FOuESE2gU=
Received: from [192.168.168.98] (173-26-212-115.client.mchsi.com
 [173.26.212.115])
 by mail.posixcafe.org (OpenSMTPD) with ESMTPSA id 8e086519
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2026 14:14:24 -0500 (CDT)
Message-ID: <e71fde9b-3e2d-4a1f-9f17-6e64b73103ad@posixcafe.org>
Date: Mon, 12 Oct 2026 14:14:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implementation for the 9front operating system
From: Jacob Moody <moody@posixcafe.org>
To: wireguard@lists.zx2c4.com
References: <0ab57e49-8904-4e4b-bc3a-38e10b214ab3@posixcafe.org>
Content-Language: en-US
Autocrypt: addr=moody@posixcafe.org; keydata=
 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
 kA7wyn9tHMM41bDH8w==
In-Reply-To: <0ab57e49-8904-4e4b-bc3a-38e10b214ab3@posixcafe.org>
Content-Type: text/plain; charset=UTF-8
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

On 8/4/26 16:08, Jacob Moody wrote:
> All,
> 
> I've been working on an implementation of wireguard for 9front.
> I am starting to get to the point where I feel like the implementation is getting
> pretty close, and its in a good spot to review before I do some tighter integration into 9front.
> 
> I know in the past I've seen some desire from the wg community to ensure that code using the wireguard
> name at least be somewhat decent. So I wanted to share it here and get feedback if people felt inclined.
> 
> Grab the code from your choice of git hosts:
> 	git://shithub.us/moody/wg
> 	https://github.com/majiru/wg
> 
> I am happy to answer any questions regarding plan 9/9front specifics.
> 
> One note is that there's some stubs right now, the dynamic runtime addition
> and subtraction of peers, and likewise the condition under which we send
> cookie's is not implemented, that's pending the more tighter integration.
> 
> Thanks,
> moody
> 

Just giving a bump to this, sorry I had sent two mails because I was not sure if the first got dropped with the
moderation queue taking so long.

It's totally fine if there's no interest, 9front is fairly niche, I just wanted to avoid a faux pas
in shipping something without consulting the broader community.

With that said, after haven taken a break from this for a bit I plan to work on this a bit more and upstream it.
If folks are interested but just need more time to look and would prefer that happen before I merge anything just LMK.

Thanks,
moody
