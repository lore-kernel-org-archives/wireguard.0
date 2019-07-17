Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95337C76186
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 09:56:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCA420818
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 09:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DCA420818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c44ad9c6;
	Wed, 17 Jul 2019 09:56:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a18633ca
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 09:56:12 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d703435d
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 09:56:12 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 7452520283;
 Wed, 17 Jul 2019 09:56:10 +0000 (UTC)
Date: Wed, 17 Jul 2019 14:56:10 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Yousong Zhou <yszhou4tech@gmail.com>
Subject: Re: Improve "[WireGuard] Header / MTU sizes for Wireguard"
Message-ID: <20190717145610.4da47bd0@natsu>
In-Reply-To: <CAECwjAjN1FUKsDy1tpa7ihvjZSZr9XqnWoVwbCdt07WOgQ13RA@mail.gmail.com>
References: <CAECwjAjN1FUKsDy1tpa7ihvjZSZr9XqnWoVwbCdt07WOgQ13RA@mail.gmail.com>
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, 17 Jul 2019 17:45:18 +0800
Yousong Zhou <yszhou4tech@gmail.com> wrote:

> For WireGuard overhead breakdown [1], maybe it's worth also mentioning
> that N the length of encrypted data will be padded to be multiples of
> 16.
> 
> I am only aware of this when fragmentation was spotted.  With 1500 as
> MTU for ethernet, PPPoE has MTU 1492 (1500 - 8).  I thought 1432 (1492
> - 60) for wireguard should work for ipv4-only traffic. It needs to be
> 1424 to avoid fragmentation.

1432 should work as long as you set it on *both* ends of your WireGuard tunnel.
I wrote about this here (expect mine was on IPv6, so all MTUs listed are 20
bytes lower): https://lists.zx2c4.com/pipermail/wireguard/2019-April/004078.html
Could you try 1432 on both endpoints and confirm it works (or not)?

So far I don't know any clear explanation of what's described in the above
referenced message. Also that was before the IPv6 fragmentation was allowed
for WG, so now it will change (likely will still work and send fragmented
packets, instead of all the "Fail" cases in the table).

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
