Return-Path: <SRS0=HyV5=TM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBCBC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 23:02:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40A620818
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 23:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40A620818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73553344;
	Sun, 12 May 2019 23:02:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 603082af
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 23:02:35 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be18e688
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 23:02:35 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id F06821E3062;
 Sun, 12 May 2019 19:02:34 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-81.om.om.cox.net
 [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id B18CA1E3046;
 Sun, 12 May 2019 19:02:34 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: Wireguard Bug?
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
Date: Sun, 12 May 2019 18:02:33 -0500
Message-Id: <398CDA20-DD9E-4434-AB16-D57A46B6E658@lonnie.abelbeck.com>
References: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
To: Ryan Whelan <rcwhelan@gmail.com>
X-Mailer: Apple Mail (2.3445.104.8)
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



> On May 12, 2019, at 8:44 AM, Ryan Whelan <rcwhelan@gmail.com> wrote:
> 
> I am building a system which coordinates the meshing of wireguard devices.  Currently, all the devices are running on an embedded platform (AMD Geode LX500) and works as expected.  However, when introducing a 64bit KVM host for testing, all the 32bit hosts running on the Geode platform, report the following warning and drop offline temporarily.  The CPU usage on KVM host spikes and all the CPU time is spent on the kernel threads servicing the WG interfaces.
> 
> I'm using kernel 4.19.41 and have seen the issue with both the last WG snapshot as well building from master.

Hi Ryan,

Did you mean "AMD Geode LX800 @500 MHz" ? (ex. ALIX/net5501)

If so, I have a couple of those using kernel 3.16.64 (i586) mixed with 3.16.64 (x86_64), and WG works well between them, no issues like you reported.  iperf3 over WG runs at 23.8 Mbits/sec.

Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
