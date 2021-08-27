Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B79C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 21:46:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A7A60FD8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 21:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A7A60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 532adcf7;
	Fri, 27 Aug 2021 21:44:59 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acefedb0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 21:44:55 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id F343C69F;
 Fri, 27 Aug 2021 21:44:54 +0000 (UTC)
Date: Sat, 28 Aug 2021 02:44:54 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Mike O'Connor <mike@pineview.net>
Cc: Daniel <tech@tootai.net>, wireguard@lists.zx2c4.com
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
Message-ID: <20210828024454.1766744f@natsu>
In-Reply-To: <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 28 Aug 2021 07:05:45 +0930
Mike O'Connor <mike@pineview.net> wrote:

> On a 1500 link I'm having to use 1280 to get ipv6 to successfully go 
> over a wireguard link.

Then it is not a true 1500 MTU link, something in-between drops packets at a
lower bar. Or maybe not all of them, but just UDP, for example.

But yeah, 1280 is worth trying as well, maybe Daniel has a similar issue.

As for me I am using MTU 1412 WG over IPv6 on a 1492 MTU underlying link just
fine.

> I really think wireguard should be able to fragment and send via 
> multiply UDP packets.

It is able to, as long as the underlying link MTU is set to a correct value
(i.e. where largest-sized packets actually go through, and not get silently
dropped).

-- 
With respect,
Roman
