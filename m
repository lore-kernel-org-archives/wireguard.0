Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527E6C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 17:11:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E055C214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 17:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E055C214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a83ee81;
	Thu, 27 Dec 2018 17:09:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff0552f5
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 17:09:55 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 606f0262
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 17:09:55 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id E85551E3053;
 Thu, 27 Dec 2018 12:11:32 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-174-76-218-225.om.om.cox.net
 [174.76.218.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id A8F621E303B;
 Thu, 27 Dec 2018 12:11:32 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: wg-quick: Read private key from file?
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <c522bb63-f64a-6622-0966-7a4c3b936cf9@bartschnet.de>
Date: Thu, 27 Dec 2018 11:11:31 -0600
Message-Id: <9DC11372-EF4D-4909-8448-7FEA917F92CB@lonnie.abelbeck.com>
References: <c522bb63-f64a-6622-0966-7a4c3b936cf9@bartschnet.de>
To: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
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



> On Dec 27, 2018, at 10:51 AM, Rene 'Renne' Bartsch, B.Sc. Informatics <ml@bartschnet.de> wrote:
> 
> Hi,
> 
> does wg-quick allow to read the private key from a file instead of a .conf-file?
> 
> Regards,
> 
> Renne

You could create a wg-quick-wrapper script that aggregates files from where-ever you like before it calls wg-quick and then cleans-up tmp files.

Or just re-write wg-quick to suit your needs.

Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
