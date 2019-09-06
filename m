Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA13C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 15:00:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFF420674
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 15:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AFF420674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=activezone.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 582d46e4;
	Fri, 6 Sep 2019 15:00:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b030f256
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 15:00:53 +0000 (UTC)
Received: from vintage.nbg1-dc1.freebsdcloud.com
 (vintage.nbg1-dc1.freebsdcloud.com [159.69.229.98])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a4f1059
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 15:00:53 +0000 (UTC)
Received: from trinitron.activezone.de (trinitron.vl8-han.freebsdcloud.com
 [159.69.229.114])
 by vintage.nbg1-dc1.freebsdcloud.com (8.15.2/8.15.2) with ESMTPS id
 x86F0gD8014717
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 6 Sep 2019 17:00:43 +0200 (CEST)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: vintage.nbg1-dc1.freebsdcloud.com: Host
 trinitron.vl8-han.freebsdcloud.com [159.69.229.114] claimed to be
 trinitron.activezone.de
Received: from mitteilung.com by MTA1  with ESMTP id x86F0b4l063477;
 Fri, 6 Sep 2019 17:00:37 +0200 (CEST)
X-Authentication-Warning: trinitron.activezone.de: Host localhost [127.0.0.1]
 claimed to be mitteilung.com
MIME-Version: 1.0
Date: Fri, 06 Sep 2019 17:00:36 +0200
From: Markus Grundmann <markus@activezone.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: DMKS failed after Kernel Upgrade to 4.4.0-161-generic on Ubuntu
 16.04 LTS
In-Reply-To: <CAHmME9pTAY5X3h2xwwz6LPjqWpgtd2R+Lw4C3-ZPqxve=4HCSw@mail.gmail.com>
References: <a8a4d088-d5fd-5e3b-23ab-72e2c7932ff3@activezone.de>
 <CAHmME9pTAY5X3h2xwwz6LPjqWpgtd2R+Lw4C3-ZPqxve=4HCSw@mail.gmail.com>
Message-ID: <3a0ae2da89436159fbce7856a6a88d3e@activezone.de>
X-Sender: markus@activezone.de
User-Agent: Roundcube Webmail/1.3.9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

No! No! Jason! You do not have to apologize. I think we have to thank 
you for WireGuard!

-Markus

Am 2019-09-06 16:06, schrieb Jason A. Donenfeld:

> Sorry for the hassle. I'm not happy about the situation either, but it
> is what it is. Ubuntu isn't the best distro to deal with
> unfortunately.
> 
> I'll poke Egbert again to see if he can hurry up.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
