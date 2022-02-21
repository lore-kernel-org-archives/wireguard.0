Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 19:20:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e597d2f8;
	Mon, 21 Feb 2022 19:18:50 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 84aff627
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 19:18:49 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A83EC4062C;
 Mon, 21 Feb 2022 22:18:49 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8DF9611A;
 Mon, 21 Feb 2022 22:16:47 +0300 (MSK)
Message-ID: <af812895-e232-bdfe-baed-012f95e23ded@msgid.tls.msk.ru>
Date: Mon, 21 Feb 2022 22:18:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: WireGuard Windows should have default MTU of 1280.
Content-Language: en-US
To: Michael Adams <unquietwiki@gmail.com>, wireguard@lists.zx2c4.com
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
 <de1ed6a8-89cd-ec19-40c5-27f6893f4b17@msgid.tls.msk.ru>
 <Mailbird-87f65eb5-1417-4955-ae28-858c7511900b@gmail.com>
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

BTW, tinc is quite good these days at figuring the right pMTU.
It fails only in case of completely broken network..

/mjt
