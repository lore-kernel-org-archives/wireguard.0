Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1998C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 19:16:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9b13a2a0;
	Mon, 21 Feb 2022 19:16:25 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 944d8999
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 19:16:23 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 693BC4062C
 for <wireguard@lists.zx2c4.com>; Mon, 21 Feb 2022 22:16:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3B47E11A
 for <wireguard@lists.zx2c4.com>; Mon, 21 Feb 2022 22:14:22 +0300 (MSK)
Message-ID: <6ba013e9-05db-17bc-995b-11ef1f279c91@msgid.tls.msk.ru>
Date: Mon, 21 Feb 2022 22:16:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: WireGuard Windows should have default MTU of 1280.
Content-Language: en-US
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
 <de1ed6a8-89cd-ec19-40c5-27f6893f4b17@msgid.tls.msk.ru>
 <Mailbird-87f65eb5-1417-4955-ae28-858c7511900b@gmail.com>
To: wireguard@lists.zx2c4.com
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <Mailbird-87f65eb5-1417-4955-ae28-858c7511900b@gmail.com>
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

21.02.2022 22:11, Michael Adams wrote:
> Throwing in my two cents: I was using MTU 1280 on Tinc a few years back, for IPv6 VPN support on Windows & Linux. It's good practice.

Lemme guess. The OP is routing wg packets over IPv6?  Can this be
the problem here, because V6 has larger overhead so that 1420 is
too large to fit into 1500 bytes together with IPv6 header?

Speaking of the good practice - it really depends.

/mjt
