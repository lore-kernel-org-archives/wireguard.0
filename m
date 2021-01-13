Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C27C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 17:04:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6E32310F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 17:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6E32310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5825b281;
	Wed, 13 Jan 2021 17:04:45 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56b79967
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 15:13:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i9so2503891wrc.4
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=4HQhGasRzUutZ5SWj8MTCHgFQPOwpnkuvtoD03mpfGQ=;
 b=aFsp1AUh9h9aNieycsOI6qtik0aeCtWGPCeOvQchU9l9YGbzwDjo2/o0A1ogqyNeHF
 awbMF/YeQcvAkpauq2D5SUHg6XX9/1HPGdEEVR9rCk+4BWDwzFI9jc+6nxCf5+g6VWuo
 FPEbYYotB9HtmKaRZtTrmBHJOjRNjlSPTFnjnLbPHPRPc9Kif+5wf0y2txP+7+yYt3nu
 whYuXrOPTk0GxF/dOapu3819bVe+xcTwKJ+GIZ+MsW5vo3WSmrcKmAOQLX6MkHKzg8wR
 Su7arlPLz2pI/l8klYJDnuGIZxGdWwv5hMW9fuu5FfsFQh9CzIkpg9hcYytYHtk+cAqW
 IcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4HQhGasRzUutZ5SWj8MTCHgFQPOwpnkuvtoD03mpfGQ=;
 b=sP+uI5elXgdRfuDCaCb7/vKO0ghivi02F/dphFxSEhNUq1IXw+K3xqR59UMNB0+klb
 jyvGIwz5LItHoBisATwC+KkTJV9mGYV0M8hSodZCuvV3PIwoRvRXuWpamJh3EMKegLnw
 YXpjlecI0Wawn1rT862dJRLqiA2D3z/VbpNHcl2ffrAJThU/H7KCIEdw8lQpjw4yf8Mr
 N6tu3k5or68297lJsMcd3LOhJIsvjLs+0a0Dl53m7hkD5huUNbP0quJASvm1cK4aQNja
 Xm/Y/M6LJffx0jMhQxqU2NqUP38blQtN/mVINBdRc9Yc1tcV6hxlvlc87MmS0PFhB93a
 CLjg==
X-Gm-Message-State: AOAM530qT3Wap3a6IaPeNtcq2IR1AIUX7lqaShLWF6pdUSqM/+D499PN
 9NQnwNh7fCvxnt5Uc/slMM3VxbDknyCAyw==
X-Google-Smtp-Source: ABdhPJxp36l8uLa9gdu3cGSFQJ4Y4EIESmh8FgweSUrQXMS1zHDmuEbi5dwfQagvZnBKM6pySfXoaQ==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr1617313wrr.366.1610550801217; 
 Wed, 13 Jan 2021 07:13:21 -0800 (PST)
Received: from [192.168.25.202] ([91.110.152.239])
 by smtp.gmail.com with ESMTPSA id b127sm3576999wmc.45.2021.01.13.07.13.20
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 07:13:20 -0800 (PST)
Subject: Re: Problems with Windows client over PulseSecure VPN
From: Peter Whisker <peter.whisker@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
 <2dc629e2-93c9-4ed9-ea57-4318c8b62a73@gmail.com>
Message-ID: <397bedc7-3913-08bb-a6f3-691d9fab663c@gmail.com>
Date: Wed, 13 Jan 2021 15:13:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2dc629e2-93c9-4ed9-ea57-4318c8b62a73@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 13 Jan 2021 17:04:44 +0000
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

Hi

I have managed to work around the issue caused by Wireguard sending 
packets via default route interface even though the route to the peer is 
over a different interface (the issue caused by IP_UNICAST_IF). My 
Wireguard peer is down a corporate Pulse Secure tunnel.

I use a PreUp and PostDown script as follows:

PreUp
=====

for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do 
if not defined ip set ip=%%a
route add 0.0.0.0 mask 128.0.0.0 %ip% METRIC 1
route add 128.0.0.0 mask 128.0.0.0 %ip% METRIC 1
route delete 0.0.0.0 mask 0.0.0.0

PostDown
========

for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do 
if not defined ip set ip=%%a
route add 0.0.0.0 mask 0.0.0.0 %ip% METRIC 1
route delete 0.0.0.0 mask 128.0.0.0
route delete 128.0.0.0 mask 128.0.0.0

This replaces the /0 default route by two /1 routes before bringing up 
the WireGuard interface. Traffic to the peer then gets sent down the 
correct route (why is this different from having a default route?). When 
the WireGuard instance is closed, it recreates the default route and 
removes the two /1 routes.

Is there a way this could be done better in the Wireguard executable (I 
am currently using 0.3.4).

Thanks

Peter

On 26/11/2020 13:11, Jason A. Donenfeld wrote:
>> Is PulseSecure not setting up a /0 route? If so, then this is a known
>> issue with the lack of policy routing on Windows.
