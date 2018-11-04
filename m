Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B377C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 15:30:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E912082E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 15:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vlVra2xg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E912082E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db5e344d;
	Sun, 4 Nov 2018 15:25:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5511dcae
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:25:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15fa3f8c
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 15:25:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61c9b7e0;
 Sun, 4 Nov 2018 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=M8k5+nOyfoeIDSvhZdm+F8MKzVo=; b=vlVra2x
 gCXlimyNBLIw9/cURWAlgUH5M254Xb+07IsKGfmHS66wwNX8qHSzME/280aHEM+e
 O95fbTV/918LaFtV15JIiOc8ZuZ2dBQl/f3w8uoZuPbT/DupHRTM2+NB4Y8leW3u
 6pEjh/BOB3fiJCqW4zZRGXEhOs1nyuszeFGgwZwgvU8IaTwO7RQ/4Hv3AWkkeQDD
 NFyCp18Atc/rc/eb6MVgaqfbL+WeDK6AUok4IE8YrvRfbNXdchTOv2RIXF9xROsZ
 Pk2J4P3rYmwzkK9PQ9QHkH55t3UfpBu2XSTJQtdzXuUn4Z56Smc/7URVoBy+boFV
 YT2wE0kXIOcU1eA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6948c956
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Sun, 4 Nov 2018 15:25:37 +0000 (UTC)
Date: Sun, 4 Nov 2018 16:29:42 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: Re: match on wg packets and redirect
Message-ID: <20181104152940.GB30264@zx2c4.com>
References: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
 <20181104151424.GA30264@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181104151424.GA30264@zx2c4.com>
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


On Sun, Nov 04, 2018 at 04:14:25PM +0100, Jason A. Donenfeld wrote:
> On Sun, Nov 04, 2018 at 11:09:03AM +0200, Adrian Sevcenco wrote:
> > Hi! Is there a way to use iptables to match wireguard packets incoming 
> > on 443 and the redirect them to the actual port?
> 
> iptables -t nat -A PREROUTING -p udp --dports 80,443,53,67,68,546,547,10000,4500,123,161,5223 -j REDIRECT --to-ports 51820

Er, sorry, slightly better is below:

iptables -t nat -A PREROUTING -i eth0 -p udp -m multiport --dports 80,443,53,67,68,546,547,10000,4500,123,161,5223 -j REDIRECT --to-ports 51820

You might also just remove "-m multiport --dports ..." all together, and
have it accept _any_ incoming UDP packet, which could be handy.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
