Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25235EE49A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:19:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08965a2a;
	Wed, 23 Aug 2023 16:07:18 +0000 (UTC)
Received: from iedub0.y7.hu (iedub0.y7.hu [2a05:d018:563:7900::25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07bf2afb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Aug 2023 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=y7.local;
 s=may2017; h=Content-Type:MIME-Version:Subject:Message-ID:Date:To:From:
 List-Unsubscribe; bh=mCPzq0K+xM2hoDN57yT7NYR8K1MSrA5RFKfGwM8pQdQ=; b=dG+ZBkmX
 213BjaMHqetr8bIfWM7yjAmsAaoY1pSf9JHrFZTbRwRzcfSmnnNuf6N3h+Xn2k4zJ2k/2ULrMWwgd
 oscuOfqtMCqT6WehNsG2o/yLNyfyFpSwS6YTrtOTfW16/PaUNhC+S5H7+29DI4f2ub4m6ov28dxLn
 jgAjDbeMXSyCVx9Qm+m08+JW79dQyH4PL0jC7E+gv9K0Ri+1m5KsZafIn0aRhCaaIytdj/2rTLrYv
 J5R0Rzv4riZaexRxWMudTuDi2AADryNwxSnO6DHAqqqqXEToRxbtaI7a61WejAfvQ63Jxy7W2O2kJ
 rsyQOzrowfdbCFDG4dLewACZ3Q==;
Received: from [::ffff:158.255.211.76] (port=55340 helo=[44.128.141.22])
 by mta01.defra0.y7.local with esmtpa (Exim 4.96)
 (envelope-from <e@y7.local>) id 1qXcNT-00G35d-0T;
 Sun, 20 Aug 2023 06:57:35 +0000
From: Endre Szabo <e@y7.local>
To: <wireguard@lists.zx2c4.com>
Date: Sun, 20 Aug 2023 08:57:32 +0200
Message-ID: <18a11bc0f60.28a6.38ae7defbc00cf30cde15e5f7bfb2d02@y7.local>
In-Reply-To: <NborxNu--3-9@diyaa.ca>
References: <NborxNu--3-9@diyaa.ca>
Subject: Re: Wireguard Dynamic ARP entries
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Aug 2023 16:07:07 +0000
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

I guess it is a normal thing on windows as Cisco VPN Client works the same way.

--
Endre

On August 19, 2023 22:31:33 Diyaa Alkanakre <diyaa@diyaa.ca> wrote:

> Hello everyone,
>
> I am seeing lots of ARP dynamic entries on Windows when typing "arp -a" on 
> the command line on windows. I am wondering if that is a normal behavior? 
> when I set a wireguard peer with a default route "0.0.0.0/0, ::/0" I end up 
> spending about 2 minutes to get to the bottom of the CLI when I type "arp -a".
>
> I am just wondering if that is a normal behavior? why is this happening??
>
> Thank you in advance,
>
> Diyaa



