Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C045FC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 21:36:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB7C360F58
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 21:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB7C360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pineview.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da20465c;
	Fri, 27 Aug 2021 21:35:51 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 349b5c03
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 21:35:48 +0000 (UTC)
Received: from airtime.pineview.net (airtime.pineview.net [203.33.246.51])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id DC7668013C;
 Sat, 28 Aug 2021 07:05:44 +0930 (ACST)
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
To: Daniel <tech@tootai.net>, wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
From: Mike O'Connor <mike@pineview.net>
Message-ID: <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
Date: Sat, 28 Aug 2021 07:05:45 +0930
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

On a 1500 link I'm having to use 1280 to get ipv6 to successfully go 
over a wireguard link.

I really think wireguard should be able to fragment and send via 
multiply UDP packets.

wireguard works very well other than this issue, performance is 
extremely good.

Mike

On 28/8/21 2:46 am, Daniel wrote:
> Hi ROman
>
> Le 27/08/2021 à 18:14, Roman Mamedov a écrit :
>> On Thu, 26 Aug 2021 13:14:00 +0200
>> Daniel <tech@tootai.net> wrote:
>>
>>> Correction
>>>
>>> Le 25/08/2021 à 17:25, Daniel a écrit :
>>>> Hi list,
>>>>
>>>> I setup wireguard on a server running Debian 11 and get it to work 
>>>> with
>>>> 2 clients (Debian 11 and Ubuntu 20.04). Clients and server are on
>>>> separate networks, one client behind a FW the other direct on 
>>>> Internet,
>>>> no FW at all (VPS).
>>>>
>>>> With this setup and ipv4 connection to the public IP of the server,
>>>> everything is working as expected, ipv4 as well as ipv6 are passing
>>>> smoothly.
>>>>
>>>> Now I want to connect using the ipv6 address of the wg interface as 
>>>> both
>>>> clients and server have ULA ipv6.
>>> Here is GUA to read.
>>>
>>>> This fail, wg show that connection is
>>>> established but VPN is not usable. It's not a FW problem as I can 
>>>> ssh to
>>>> the ipv6 address, as well as a netcat test from/to server IP -from 
>>>> each
>>>> client- on an UDP port is working properly. Also,
>>>> net.ipv6.conf.all.forwarding=1 is activated in sysctl.conf
>>>>
>>>> All network stuff is done in /etc/network/interfaces which call the
>>>> config file. The ipv6 address of the server is affected _to the
>>>> wireguard interface_ (in ipv4 it's another interface who take care of
>>>> the public address)
>>>>
>>>> Server version is wireguard-tools v1.0.20210223.
>>>>
>>>> If someone have any hint, thanks to share ;)
>> IPv6 requires the in-WG MTU to be 20 bytes less than when running 
>> over IPv4.
>> Try reducing it accordingly.
>
> Tried 1400, 1396 and 1392, problem stay.
>
> Thanks for your help
>

