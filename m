Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A48C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 19:02:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0040284b;
	Mon, 21 Feb 2022 18:53:28 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3d3ce569
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 18:53:27 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EF0F64062C;
 Mon, 21 Feb 2022 21:53:27 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C2D4511A;
 Mon, 21 Feb 2022 21:51:25 +0300 (MSK)
Message-ID: <de1ed6a8-89cd-ec19-40c5-27f6893f4b17@msgid.tls.msk.ru>
Date: Mon, 21 Feb 2022 21:53:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: WireGuard Windows should have default MTU of 1280.
Content-Language: en-US
To: Rujbin <rujbin@protonmail.com>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
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

19.02.2022 04:23, Rujbin wrote:
> Hello,
> 
> i am just confused. When i use default MTU the Performance on Windows is VERY poor. It is almost unuseable. It happens on multiple Windows devices. I started using MTU 1280 for a while, but why is it only Windows with that issue? First, the speed is limited to 100mbps maximum. Thats weird, when i use MTU 1280 i have 1gbps. https://i.imgur.com/ELGOWDQ.png

In our case with default MTU (of 1420 iirc), in-tunnel performance is near
the direct pefrormance. When lowering MTU to 1280, the speed reduces a bit
but not much (I guess due to larger overhead due to smaller packet size).

> This bug exists for a long time to me. I ran Wireguard on almost every provider, (i didnt check if it happens on Azure) but this bug exists on Hetzner, DigitalOcean, OVH. This is not normal. I am running the latest stable version of Wireguard Windows. Kernel module on servers and BoringTun.

I don't see a bug here.

/mjt
