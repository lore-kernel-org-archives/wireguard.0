Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A392C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 12:10:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de28fa07;
	Sun, 19 Feb 2023 12:10:15 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 91ea5dce
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 12:10:13 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id C17441FDCB;
 Sun, 19 Feb 2023 13:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676808593;
 bh=gh/xhcoK/qNZpYY8V7P5lkXZD8cPYyg058cSkEzTeOs=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=iX6H3cCaw3TCnusvDTr/ZvJuHfyIxVamnmb6bYzywnKtMfCottjfbwi0qAi243xkq
 RZkKyw/SIdSgPfoQYX2bF2OI1ETKBfKTyHrRdhkJB6HXdL2a/SebLTaoHipjWOri3x
 z+2EJo4giT1jRhKzeSvv+rdpQgH6JPSck5q2il5BHMe0zV8XTiP51G96gsrO9aGG+I
 PlcHpNMGaXs435AJBo2mPIbuqN7mgkPaw6+54K9B6yHXGn2PVZTIPAat4YuWdOKzXA
 AhOJxKdkmqyxMvyF9q82gGUytsKDDV1wtJMlsEMmjnUq/DG2dkSsKfmQ+wFLX1EfvF
 uHDgkYV+yGwSA==
Received: by blind.localdomain (Postfix, from userid 1000)
 id AF3D413A11F1; Sun, 19 Feb 2023 13:10:12 +0100 (CET)
References: <87bklqd7vb.fsf@ungleich.ch>
 <c83fee12-bef7-d09f-0cc5-d0a193d783c5@pineview.net>
 <875yby83n2.fsf@ungleich.ch>
 <60C522A0-DFAA-4A25-9E6C-8C4AF0962F5B@lists.m7n.se>
User-agent: mu4e 1.7.26; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Mikma <mikma.wg@lists.m7n.se>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, Mike O'Connor
 <mike@pineview.net>, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 13:04:39 +0100
In-reply-to: <60C522A0-DFAA-4A25-9E6C-8C4AF0962F5B@lists.m7n.se>
Message-ID: <873571dfff.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Hello Mikma,

Mikma <mikma.wg@lists.m7n.se> writes:

> Have you tried setting the preferred src address of the route(s) to the addresses you desire?
>
> From "man ip":
>
>> src ADDRESS the source address to prefer when sending to the destinations covered by the route prefix.

unfortunately this does not solve the problem. The expected behaviour of
wireguard is to reply with the same IP address, like nginx and the
kernel ICMP handler do, not with a route based outgoing interface IP address.

In a BGP based environment the route can vary dynamically and I showed a
stripped down version to make it easier to understand. In practices,
many of our systems have 4-7 different upstreams and the packet can come
in on any interface and should leave the machine on the current correct
interface depending on the route import.

In no case however, wireguard should change the response address,
because this breaks stateful firewalls.

As demonstrated in my last email, both the in-kernel ICMP handler as
well as user space applications like nginx behave correctly on the same
machine.

I briefly checked the wireguard source code and I did not right away
spot the network handling part that sets the source IP, so I am
wondering if this bug is due to wireguard not handling it at all?

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
