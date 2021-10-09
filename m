Return-Path: <SRS0=9Sn0=O5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C723C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Oct 2021 06:43:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6C460F90
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Oct 2021 06:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C6C460F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=pregonetwork.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f75694f;
	Sat, 9 Oct 2021 06:43:38 +0000 (UTC)
Received: from jeremyp3.stolon.network (jeremyp3.stolon.network
 [2a00:5880:1401:77:f4d5::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f4f6158
 for <wireguard@lists.zx2c4.com>; Sat, 9 Oct 2021 06:43:36 +0000 (UTC)
Received: from jeremyp3.stolon.network (localhost [127.0.0.1])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTP id 21a42539
 for <wireguard@lists.zx2c4.com>;
 Sat, 9 Oct 2021 08:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pregonetwork.net; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=postfix;
 bh=SrS/V3XLxovAwyl0EMCUMzcZliM=; b=A11ghvjva79Sw/fpE2uSqMujz9gB
 Y/LfdCyF1G+saOcwZbZ8khmTVcPAxLjLwWiwdLb/pHMjZJZDkx4EC3FnfZuN2PjX
 jX5zpNOdQnJuER56RFpbVmZj+Gl9tGYV65b61FrYe+KbgYnXP52+BHq5jmZ54hai
 L/CvOXokXbWBAmM79JqJqIaoAeAmRlD9cNJDcHqbrbTj03Yd/oFlh0JSfg0VJ5Oh
 83wiQmwBLHE2mpLDtCokdEVFhgIJ9lW2FfdeD/UUN44eDk9mBTyOOBvCWgdupd45
 R9SNhBa/jONl1+3Nf0ROVqaLfFsI2Gah1CpqXunu7qyhyuned+8paszheA==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pregonetwork.net; h=subject
 :to:references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=postfix; b=ZvX
 69QaF5ELhCcC19ho7QJQx1Vn68OJF9qrsjrpNa1u/XNAwCnpWqiQi6x0lPu7/nAE
 o7m0ROIhZTByF2O5cxfTI6qBRIrZIF+LMaJqY2ldblOvgGCLFqG01hMUROL74wVj
 o5RaoF2qm8mExNycyUl81w2+NCwOFoO5TpGsfwd3oTnQCw2uN0x+cKmRr3Va4vOP
 PX2O9yBAAddWeUTOvhyo/e/q0KYT0cb0RHozvdoc5XpYimlLsdq1yTW6olgZS/eT
 EFYrw05vJHoeS2icVpuvrvfZwElB2YEYUEf0NT2KY8UUn7lyO0jMZciGqaRFpUYh
 4qhW5U57b8opp/xIgXw==
Received: from [192.168.80.10] (backupmail.domain.tld [10.4.4.2])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTPSA id 26ef596e
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 9 Oct 2021 08:43:35 +0200 (CEST)
Subject: Re: [wireguard-apple] [iOS] 464xlat networks and On-demand roaming
 issue
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <BY5PR04MB6833078C93B5AE04028574EEA2AD9@BY5PR04MB6833.namprd04.prod.outlook.com>
From: =?UTF-8?B?SsOpcsOpbXkgUHJlZ28=?= <jeremy@pregonetwork.net>
Message-ID: <cdbbd387-a3d3-820e-563f-0631ec0df256@pregonetwork.net>
Date: Sat, 9 Oct 2021 08:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6833078C93B5AE04028574EEA2AD9@BY5PR04MB6833.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

Hello,

i have the exact same request for android, see my thread here:
https://lists.zx2c4.com/pipermail/wireguard/2021-September/007140.html

I regret that it is not configurable and that it does not use the 
default way of doing the system

Jerem

Le 04/10/2021 à 00:15, Kristof Mattei a écrit :
> I have an issue with the wireguard-apple on 464xlat connecting to a DNS endpoint with both an A and an AAAA record.
>
> The following line: https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardKit/DNSResolver.swift#n81 causes WireGuard to prefer the IPv4 address.
>
> Is there any reason why WireGuard prefers the IPv4 address?
>
> Why is this causing trouble? But this is what happens:
>
> When connecting to IPv6 the IPv4 address gets mapped to an IPv6 address which then acts as an IPv6->IPv4 proxy. The IP looks like [2607:7700:0:1a::17f3:f750]:51820.
>
> This causes issues when roaming from my home WiFi (on which WireGuard is disabled) to cellular (on which WireGuard is set to on-Demand).
>
> The initial connection that is set up for some reason does not work. There are reports about this on Reddit, e.g. https://www.reddit.com/r/WireGuard/comments/nk2o7m/anyone_got_it_working_with_tmobile_lte/
>
> I can fix it by setting the endpoint to the actual IPv6 address, and then it works like a charm, but that fails when I connect to a non-IPv6 network.
>
> Thanks,
> Kristof
>

