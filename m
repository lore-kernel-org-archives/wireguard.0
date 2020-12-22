Return-Path: <SRS0=UpYJ=F3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BE9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 18:13:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F09322286
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 18:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F09322286
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=meta-cti.com.br
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a337a648;
	Wed, 23 Dec 2020 18:04:05 +0000 (UTC)
Received: from vps.meta-cti.com.br (vps.meta-cti.com.br [45.226.248.2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ac1840be
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Dec 2020 15:48:26 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by vps.meta-cti.com.br (Postfix) with ESMTP id 32D181612A0
 for <wireguard@lists.zx2c4.com>; Tue, 22 Dec 2020 15:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at meta-cti.com.br
Received: from vps.meta-cti.com.br ([127.0.0.1])
 by localhost (vps.meta-cti.com.br [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wFIx6JfTvZE for <wireguard@lists.zx2c4.com>;
 Tue, 22 Dec 2020 12:57:35 -0300 (-03)
Received: by vps.meta-cti.com.br (Postfix, from userid 48)
 id 6C067487CFA; Tue, 22 Dec 2020 12:57:35 -0300 (-03)
Received: from 177.45.216.51
 (SquirrelMail authenticated user wireguard@meta-cti.com.br)
 by www.meta-cti.com.br with HTTP; Tue, 22 Dec 2020 12:57:35 -0300
Message-ID: <59a75f976f451cf4709fde65d1e308c4.squirrel@www.meta-cti.com.br>
Date: Tue, 22 Dec 2020 12:57:35 -0300
Subject: Issues using multiple interfaces between two servers
From: wireguard@meta-cti.com.br
To: wireguard@lists.zx2c4.com
User-Agent: SquirrelMail/1.4.23 [SVN]-1.el7.20190710
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
X-Mailman-Approved-At: Wed, 23 Dec 2020 19:04:04 +0100
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

Hello guys, I'm having problems with my wireguard setup and I don't know
how to solve it. I have two computers running linux in remote locations.
One, which I will call computer A, is in a data center where we advertise
a block of IPs using BGP. The other computer is in a different location
and has two links connecting to the internet and with different providers.
I configured on computer A two wireguard tunnels with different keys and
ports. On computer B I did the same and added two routing tables, one for
each WAN interface and using the ip rule I created rules with destination
on two different IPs of computer A so that they leave through different
links.

As soon as I start the wireguard interfaces of both computers everything
works normally and I can ping both addresses from both tunnels. Then I use
the bird with OSPF and ECMP to take a subnet from the block that is
advertised on computer A to computer B. Everything works normally.

When I execute the wg command on computers A and B, I can see both IPs of
computer B's WAN interfaces in the tunnel's "peer" fields, one from each
remote WAN.

After some time working, it can vary from minutes to a few hours, suddenly
I see that both tunnels started to work on a single WAN interface of
computers A and B. If at this moment I execute the wg command on computer
A, I see that now the "peers" have the same address as only one of the WAN
interfaces of computers A and B, even with the routing rule forcing
packets to go out through different interfaces. Has anyone experienced a
similar problem and knows how it can be solved?

When I run the traceroute command on both computers A and B with the
destination address in the remote computer's WAN IPs, they actually come
out through the correct interface.
