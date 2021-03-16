Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09A3C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 11:34:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F12B64FED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 11:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F12B64FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99778116;
	Tue, 16 Mar 2021 11:33:58 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03d869fa
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 11:33:56 +0000 (UTC)
Received: from [192.168.129.206]
 (dslb-002-204-242-227.002.204.pools.vodafone-ip.de [2.204.242.227])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 058911C0CA5
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 12:33:55 +0100 (CET)
Subject: Re: Enhance the "AllowedIPs"
To: wireguard@lists.zx2c4.com
References: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
From: Chris <wireguard@spam-free.eu>
Message-ID: <b7fb35f2-5d82-b4d6-5add-e18f5d032010@spam-free.eu>
Date: Tue, 16 Mar 2021 12:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

Just in case:
I guess you have already thought about using the post script to add a separate 
route to 192.160.0.0/16 using the original path with a lower metric.

On 15/03/2021 08:57, Feng Li wrote:
> Hi,
>
> As we know, the AllowedIPs will set the route table. However, if we
> want to set the CIDR, but except for some CIDR range, it's not so easy
> and out of the box. For example, if I want to route my all traffic,
> except the 192.168.0.0/16. I have to calculate the two CIDR
> difference:
>
> AllowedIPs =
> 0.0.0.0/1 + 128.0.0.0/1 - 192.168.0.0/16
> =
> 0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2,128.0.0.0/2,192.0.0.0/9,192.128.0.0/11,192.160.0.0/13,192.169.0.0/16,192.170.0.0/15,192.172.0.0/14,192.176.0.0/12,192.192.0.0/10,193.0.0.0/8,194.0.0.0/7,196.0.0.0/6,200.0.0.0/5,208.0.0.0/4,224.0.0.0/3,10.99.0.0/24
>
> Is it possible to be built in Wireguard in the future? I think it's very useful.
>
> The discussion link is here:
> https://www.reddit.com/r/WireGuard/comments/m44fi5/enhance_the_allowedips/
>
> Thanks.

