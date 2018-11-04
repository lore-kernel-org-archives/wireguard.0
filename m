Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4262EC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 15:14:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A05502082A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 15:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="axlelKwS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A05502082A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77158c0e;
	Sun, 4 Nov 2018 15:10:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aab078dd
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:10:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 405402dd
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:10:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9974f51b;
 Sun, 4 Nov 2018 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=nOWb+PL0Pp6crmGOvTD9AZad7pw=; b=axlelKw
 S/uL5BnSLNC1N89PnGNR15rgsfjr43VU0AlDmb6RJEfCanHTlQ7NRj9Z0uUhh05i
 qasIr4WTbTgaRNUft7Rdkgs9oh/duaeXnavWTbDT3AP0R0n3TA5FLbaf27LERhVH
 BPHJi3Hj6z48hmKFg7F0AG6UeHTBOIOwoSa3Lv0Em5Mnq61lDIMLUUJKxKH1zJBZ
 LUdDAGJCJOSpmxF9P9AfddaguARllSZgwhcEPLkxl7/rqlflHPsop8aZPxzvkPO5
 1aQIahykZTswcQv5b6yb9IJzBXMD7aKe68w6bW3sP6Fuo1y7Hwv5ekIkbUyIYFyy
 YalklGW2SULorVg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9f58f0f1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Sun, 4 Nov 2018 15:10:20 +0000 (UTC)
Date: Sun, 4 Nov 2018 16:14:25 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: Re: match on wg packets and redirect
Message-ID: <20181104151424.GA30264@zx2c4.com>
References: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Nov 04, 2018 at 11:09:03AM +0200, Adrian Sevcenco wrote:
> Hi! Is there a way to use iptables to match wireguard packets incoming 
> on 443 and the redirect them to the actual port?

iptables -t nat -A PREROUTING -p udp --dports 80,443,53,67,68,546,547,10000,4500,123,161,5223 -j REDIRECT --to-ports 51820
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
