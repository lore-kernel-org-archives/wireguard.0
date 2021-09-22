Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE2BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 00:30:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CB0B60F9E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 00:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CB0B60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ba76954;
	Wed, 22 Sep 2021 00:28:48 +0000 (UTC)
Received: from p-impout005.msg.pkvw.co.charter.net
 (p-impout005aa.msg.pkvw.co.charter.net [47.43.26.136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25b3c4f3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 00:28:45 +0000 (UTC)
Received: from [192.168.0.3] ([108.184.10.226]) by cmsmtp with ESMTP
 id Sq7umimGMEP0uSq7vmNlM9; Wed, 22 Sep 2021 00:28:43 +0000
X-Authority-Analysis: v=2.4 cv=d+AwdTvE c=1 sm=1 tr=0 ts=614a78bb
 a=x8oosPCBN5qOUqq8BNRqNA==:117 a=x8oosPCBN5qOUqq8BNRqNA==:17
 a=IkcTkHD0fZMA:10 a=UjH9h7NRxypSX1w-nq0A:9 a=QEXdDO2ut3YA:10
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: wireguard@lists.zx2c4.com
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <4634569d-1f93-3544-90be-c989dd32752b@attglobal.net>
Date: Tue, 21 Sep 2021 17:28:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4xfKH/II3l/iGFgErjHVsF1naz3uWmxb5efsaAguG59iovV8D5ttDbvoYq1nwumfh16Ej+Auf/aujVOkySLblkXfCY1tcwe9XLIGn5TE7+c4dMKo9YwL+E
 7diG0n+qbF4Y/8s/HlOHoVOXagPEbw8b4bNXTTrej3cBOQs1Lhv4QJLAPNCDZ2psV35oXRK5HfFVEp98Zs+W4eDZ9Wh92r8UA+E=
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
Reply-To: stunnel@attglobal.net
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 9/21/2021 5:23 PM, Eddie wrote:
> Title says it all.  On both iPhone and iPad.
>
> The configuration names still show, with the slider, but trying to 
> activate gives:  Activation failure.  Unable to retrieve tunnel 
> information from the saved configuration.
>
> Selecting a tunnel name doesn't show any configuration.
>
> Cheers.

Quick update.

The log shows:  [APP] Unable to open config from keychain:- 25300

Cheers.
