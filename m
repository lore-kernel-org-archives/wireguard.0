Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD51DC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:53:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5E82075B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5E82075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 917b007f;
	Mon, 19 Nov 2018 20:47:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99c2995a
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:47:53 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0baaf997
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:47:53 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 2F31C1E3029;
 Mon, 19 Nov 2018 15:53:55 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-174-76-218-225.om.om.cox.net
 [174.76.218.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id DFD401E3011;
 Mon, 19 Nov 2018 15:53:54 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Seeking suggestions for a WG port to use with restrictive public
 wifi networks
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
Date: Mon, 19 Nov 2018 14:53:53 -0600
Message-Id: <020DC45A-7CA9-49E5-9A14-6300306F5476@lonnie.abelbeck.com>
References: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
To: John <graysky@archlinux.us>
X-Mailer: Apple Mail (2.3445.9.1)
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


> On Nov 19, 2018, at 2:33 PM, John <graysky@archlinux.us> wrote:
> 
> Should I stick with the "standard" udp service ports for my
> trial-and-error based approach?  Wikipedia has an article that lists
> many of these (List_of_TCP_and_UDP_port_numbers).  Any suggestions are
> welcomed.

Possibly: UDP/500 (IPSec IKE) or UDP/4500 (IPSec NAT-T)


Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
