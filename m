Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DFC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Nov 2021 12:04:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b20f4b03;
	Wed, 24 Nov 2021 12:04:27 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6abf4397
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Nov 2021 12:04:24 +0000 (UTC)
Received: from [203.33.246.51] (airtime.pineview.net [203.33.246.51])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 9ABEB800CC;
 Wed, 24 Nov 2021 22:34:21 +1030 (ACDT)
Message-ID: <3171350c-543d-92c9-c897-3cb752a811cf@pineview.net>
Date: Wed, 24 Nov 2021 22:34:20 +1030
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: Dynamic routes
Content-Language: en-US
To: Chriztoffer Hansen <ch@ntrv.dk>, Robert.Dahlem@gmx.net
Cc: "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
References: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
 <CA+cYV6s2jMh4z5eUz-AAY5MO9CBpszWZtiUbkWY8XeFw7pLaFg@mail.gmail.com>
From: Mike O'Connor <mike@pineview.net>
In-Reply-To: <CA+cYV6s2jMh4z5eUz-AAY5MO9CBpszWZtiUbkWY8XeFw7pLaFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 24/11/21 9:48 pm, Chriztoffer Hansen wrote:
> On Mon, 22 Nov 2021 at 18:20, Robert Dahlem <Robert.Dahlem@gmx.net> wrote:
>> I could always install Quagga or Bird and use OSPF. But that might be a
>> bit of an overkill for a simple active/passive failover.
> RIP, OSPF, BGP, EIGRP. Either can work. And would IMO be sufficiently
> simple to set up and maintain. Either way, you will need a daemon to
> maintain monitoring of the packets being able to flow over the tunnel.
> If you select a routing demon or another daemon. ... take a pick.
>
Correct, not the job of Wireguard.


Cheers

Mike

