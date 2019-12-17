Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C7C2D0D1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03BF82176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=carmickle.com header.i=@carmickle.com header.b="XVfOBYc5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03BF82176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carmickle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6548239c;
	Thu, 19 Dec 2019 01:20:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c13c9ea
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 15:32:25 +0000 (UTC)
Received: from mail.carmickle.com (mail.carmickle.com
 [IPv6:2600:3c03::f03c:91ff:fe6e:212c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57a4088e
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 15:32:25 +0000 (UTC)
Received: from fcmbp14.carmickle.com (fcmbp14.carmickle.com
 [IPv6:2001:470:1f07:6f1:ee1a:59ff:fe3d:a9f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.carmickle.com (Postfix) with ESMTPSA id A20815877F15;
 Tue, 17 Dec 2019 15:32:24 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Getting some troubles when setting up the VPN
From: Frank Carmickle <frank@carmickle.com>
In-Reply-To: <CAHC_4XPNXxVHD02qDXFpgOdYN0ojpmUWyq4t==DuTSwe6s7fUg@mail.gmail.com>
Date: Tue, 17 Dec 2019 10:32:23 -0500
Message-Id: <25228A87-3310-44DB-A00A-2536C7C0CEF5@carmickle.com>
References: <CAHC_4XPNXxVHD02qDXFpgOdYN0ojpmUWyq4t==DuTSwe6s7fUg@mail.gmail.com>
To: Franck MESSAOUDI <frank.messaoudi@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=carmickle.com;
 s=20160808-mail; t=1576596744; bh=CdXadQd7LeeesGR6dy2hmVB5PyMZ492EmY/RxqcQeko=;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 b=XVfOBYc5rgqA9CBCNRcSNLTvffja+MjIMxVpWeAlzNBqOwNJ3W5LzCfof2PMuMX1vLJn5Q0MXiDvRbu0bBJ0TimVWlOhPEVv+RD39iI0CgddygD7WDcxhY2bEvkoo9JopZVbK2lFp3/flnIYW82wScLNrFN/WyYrgn5RWyTCanM=
X-Mailman-Approved-At: Thu, 19 Dec 2019 02:20:26 +0100
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

Hello Franck,

> On Dec 17, 2019, at 10:14 AM, Franck MESSAOUDI <frank.messaoudi@gmail.com> wrote:
> 
> Dear members, 
> 
> I am using the wireguard to create VPN in order to access my VMs in openstack.
> The thing is that I am getting some troubles when I chage the network or the access point.
> Indeed, I have two wifi networks and one via ethernet. the VPN is working only for one wifi access network, for the two others it does not work. I do not understand why this behaviour? is it due the routing tables?

Almost certainly it is do to missing routes, but we don't have enough information to really know. Remember you need a route to the network of openstack systems, as well as a route from the openstack systems back to the networks you are trying to access the systems from.

HTH
--FC

> 
> You will be very kind if some of you could reply with an answer.
> 
> In advance, thank you.
> 
> Best regards, 
> 
> Franck
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
