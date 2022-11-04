Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB938C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Nov 2022 20:13:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c79cb504;
	Fri, 4 Nov 2022 20:10:36 +0000 (UTC)
Received: from mail.isletech.net (mail.isletech.net [2001:470:1d:c44::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad2214d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2022 20:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=isletech.net; s=isle2020; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GmZ5pPyCvL7cW/DfAwuO/0KIj//rLaRGyIkYXDOpPAo=; b=sSpuTptZfCidRYorDWy3XmqEVZ
 +pfYoNtjB96rd8nXZlDXKLAT7LRy6XZ0DOPCWHTsYG5CnqvaQxrigqwZZrXx6XL1++BjC7cDBwlL7
 1iWDqMd6biAB5R/Zxw8gVz7+kQTpoXEgzy/hOHTcqN4MnXh8GvufcPcOgdp9LSY6IF6g=;
Message-ID: <b63e8f6b-9ea9-3851-c388-ef0c94ee5004@isletech.net>
Date: Fri, 4 Nov 2022 16:10:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: absolutely terrible wireguard performance on a 4ghz box - need
 tuning help
Content-Language: en-CA
To: wireguard@lists.zx2c4.com
References: <CACsaVZ+rAuNX=iTbtmm18Dbq2y66Fxj=_3Vf-PHwLR03ENQEBQ@mail.gmail.com>
From: Daryl Richards <daryl@isletech.net>
In-Reply-To: <CACsaVZ+rAuNX=iTbtmm18Dbq2y66Fxj=_3Vf-PHwLR03ENQEBQ@mail.gmail.com>
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

On 2022-10-25 2:58 a.m., Kyle Sanderson wrote:
> hi wireguard,
> 
> APU2C4 - AMD Embedded G series GX-412TC, 1 GHz quad Jaguar core with
> 64 bit and AES-NI support
> 
> There has to be a way to improve this. I'm getting 20-40MB/s (causing
> a system load of 6 on this poor box) where SSHFS in comparison is
> still able to fly. Traffic not traversing the tunnel is also,
> strangely, impacted as well. I have the Intel i210AT controller, which
> doesn't appear to have any offloading to it when wireguard is present.
> 
> ksoftirqd/0 spins at around 50%, ksoftirqd/1 spins around 20%, and the
> other 12(!) wg-crypt threads hover around 20% respectively.
> If I disable wg I'm able to get line-rate through acceleration.
> The other 2 ksoftirqds sit around 5% respectively. kworker events
> jumping between 10-25%.
> 
> Regrettably openwrt doesn't appear to have perf available...

Perhaps this is an OpenWRT issue? I have a number of these APUs with 
astlinux installed, doing wireguard, and can easily do 300-400mbps, and 
that's across the internet so perhaps faster if on a test bench.

The APU isn't the problem..
