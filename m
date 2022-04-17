Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3302C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 67d8d3d2;
	Thu, 21 Apr 2022 23:48:57 +0000 (UTC)
Received: from schauer.tech (schauer.tech [2a03:4000:24:7af::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 99193b14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Apr 2022 09:26:59 +0000 (UTC)
Received: from fairemail.op8t.kilian.schauer.tech
 (p5de48493.dip0.t-ipconnect.de [93.228.132.147])
 by schauer.tech (Postfix) with ESMTPSA id 01F7A401AE;
 Sun, 17 Apr 2022 11:26:58 +0200 (CEST)
Date: Sun, 17 Apr 2022 09:26:57 +0000 (UTC)
From: Kilian Schauer <kilian@schauer.tech>
To: Hendrik Friedel <hendrik@friedels.name>
Cc: wireguard@lists.zx2c4.com
Message-ID: <9ff861ea-6d25-4e63-ba43-615afe1b655b@schauer.tech>
In-Reply-To: <emdff71c03-470a-45f8-ade7-0343b0b698ab@envy>
References: <emdff71c03-470a-45f8-ade7-0343b0b698ab@envy>
Subject: Re: ipv6 vs. ipv4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <9ff861ea-6d25-4e63-ba43-615afe1b655b@schauer.tech>
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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


17.04.2022 10:20:03 Hendrik Friedel <hendrik@friedels.name>:

> Hello,
> 
> I understood that wireguard prefers ipv6 over ipv4 by default.
> Nevertheless, on both Windows and Android I do not get a connection (only sent bytes no received bytes) when using my domain (friedel.dynv6.net). If I use the IP (2a00:6020:1bfb:c700:ba27:ebff:fe3e:6c55), I get a normal connection.
> I can imagine that WG uses ipv4 (the A-record is set, I cannot change that, but it points to an invalid ip)
> 
> How can I -when using the domain- enforce that ipv6 is really used?
> 
> Apart from that, my suspicion is that ipv4 is in fact used here... How can I really find out, why I get no bytes on the received counter?
> 
> Best regards,
> Hendrik

Hi Hendrik,

the WireGuard mobile apps prefer IPv4 for connecting to the peer, since this helps roaming between networks (where many are still IPv4-only). If the A record of the Endpoint domain is broken, it won't work.
If you want to force an IPv6 transport, you either need to put a raw IPv6 address into Endpoint, or use an AAAA-only domain.

Hope this helps,
Kilian
