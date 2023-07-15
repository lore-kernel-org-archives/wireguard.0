Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33805EB64DC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Jul 2023 04:48:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 249e3a42;
	Sat, 15 Jul 2023 04:48:54 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bd002e3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jul 2023 04:48:50 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4317614014;
 Sat, 15 Jul 2023 07:49:06 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CF48414D2F;
 Sat, 15 Jul 2023 07:48:48 +0300 (MSK)
Message-ID: <45a9cfad-7d77-1be7-9e38-165d12a31c08@tls.msk.ru>
Date: Sat, 15 Jul 2023 07:48:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ip netns del zaps wg link
Content-Language: en-US
To: Harry G Coin <hgcoin@gmail.com>, wireguard@lists.zx2c4.com
Cc: maarten@de-vri.es
References: <4fd6c9cb-c2cf-7a16-ee62-d958790652ea@gmail.com>
 <bbbf8973-de16-781f-68dd-739e5033e681@de-vri.es>
 <3a110fda-8fc0-d2d3-e866-2a975cce085b@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <3a110fda-8fc0-d2d3-e866-2a975cce085b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

15.07.2023 00:48, Harry G Coin wrote:
..

> [] allowing wireguard interfaces to behave 
> like all other interfaces when a namespace is destroyed  (moving back to the namespace where it was born and to which it retains connection anyhow) 

The thing is that all interface types behave like this when a network namespace is removed:
they're destroyed together with the namespace.  All which can be deleted anyway, for which
an `ip link del' command works, - like, physical NICs are the only exception here b/c you
can't remove a physical NIC from a physical machine this way.

So in this context, wg interfaces are *already* behaving like all other virtual interfaces,
and this is done by linux network/namespace subsystem, not by wireguard.

/mjt
