Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7E3C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 12:56:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3008C60FE6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 12:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3008C60FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kapsi.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d843d10;
	Mon, 30 Aug 2021 12:55:47 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [2001:67c:1be8::25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e4ed933a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKH6fuS6bnxVIZCFaxkbb04bZcS+aRljYiIdG8Hr5KQ=; b=uSw9x1zqLJk2zhSBuS1ajyqTaC
 9KqcIDzF249Zko00MQ+ng+IJbeMYQ0Y9XClUZXJCvDNtjaoCXq/RQCoLh2l6bmCmi3HIsvCYhVvE8
 LcvrCjWNJz+tWTO/vzBKvAnMKn7AWLPeH12cOa9djoZDFa5wR2cAGBTG07H7BGtWwL2SkChaZSTpL
 4Z12DZ+O0cJuCrUmfgcIonrAZWRnnk2BIokga18OUErDscLbWiOdr/Df6+kAid2qpNgvt3t9N3Cly
 LFkVvwtUMLK+9Gnkou7OT26SdlEywIkQyM0+73E2TtOeKjkEJ2Il43GGMw6+OhqST8Rgr32NOgn82
 wTQC2owQ==;
Received: from [2001:67c:1104:fa0:d861:1ce7:2a76:ba5a]
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <samip537@kapsi.fi>) id 1mKgpD-0001UX-PS
 for wireguard@lists.zx2c4.com; Mon, 30 Aug 2021 15:55:43 +0300
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
To: wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
 <20210828024454.1766744f@natsu>
 <7437f3e0-26ba-5e33-a175-0cf233635b3f@tootai.net>
From: =?UTF-8?Q?Skyler_M=c3=a4ntysaari?= <samip537@kapsi.fi>
Message-ID: <ba7f90b7-0810-7f1f-a1b9-285bee046a4a@kapsi.fi>
Date: Mon, 30 Aug 2021 15:55:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7437f3e0-26ba-5e33-a175-0cf233635b3f@tootai.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:1104:fa0:d861:1ce7:2a76:ba5a
X-SA-Exim-Mail-From: samip537@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 8/30/21 1:24 PM, Daniel wrote:

> Hi
>
> Le 27/08/2021 à 23:44, Roman Mamedov a écrit :
>> On Sat, 28 Aug 2021 07:05:45 +0930
>> Mike O'Connor <mike@pineview.net> wrote:
>>
>>> On a 1500 link I'm having to use 1280 to get ipv6 to successfully go
>>> over a wireguard link.
>> Then it is not a true 1500 MTU link, something in-between drops 
>> packets at a
>> lower bar. Or maybe not all of them, but just UDP, for example.
>>
>> But yeah, 1280 is worth trying as well, maybe Daniel has a similar 
>> issue.
>>
>> As for me I am using MTU 1412 WG over IPv6 on a 1492 MTU underlying 
>> link just
>> fine.
>
> After lot of few testings, I think the problem is elsewhere. Setup of 
> the server:
>
> . eth0 with one public ipv4 IP and ipv6 /64
>
> . 2 tunnels (one gre, one sit), each of them having one ipv4 and one 
> ipv6 /64. They take care on trafic from/to our /48 ipv6 range
>
> . 2 tun openvpn interfaces for customers with ipv6 address from our 
> /48 range
>
> . wireguard interface with ipv6 address from our /48 range
>
> Using tcpdump -i any I see the trafic coming to the gre interface and 
> that's all. But netstat show
>
> udp6       0      0 :::12345 :::* 0          125391     -
>
> and ps aux output is
>
> dh@peech:~$ ps ax|grep wg
>    6969 ?        I<     0:00 [wg-crypt-wig4to]
>    7026 ?        I      0:00 [kworker/1:2-wg-kex-wig4tootai]
>
> Question: is wireguard really listening on all ipv6 addresses ? If 
> not, how is the address choosen ?
>
> [...]
>
> Thanks for your help
>
Hi,

I'm having to use MSS 1380 for IPv4 and MSS 1360 for IPv6 with 
Wireguard, and it works great. However I'm not entirely sure what the 
underlying link MTU actually is because WAN says 1500, but pinging with 
`-m DO` sometimes doesn't work like it is in fact MTU 1500 all the way.

