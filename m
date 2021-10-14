Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D25C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 07:53:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A5361027
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 07:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39A5361027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84c3e1be;
	Thu, 14 Oct 2021 07:53:21 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1d43a674
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 07:53:20 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id 821505B9;
 Thu, 14 Oct 2021 07:53:19 +0000 (UTC)
Date: Thu, 14 Oct 2021 12:53:18 +0500
From: Roman Mamedov <rm@romanrm.net>
To: uxDWzco-wg@moenia.de
Cc: wireguard@lists.zx2c4.com
Subject: Re: linux: bridging/bonding not possible
Message-ID: <20211014125318.0e569dfc@nvm>
In-Reply-To: <78fa512a-82c6-0b0c-d759-162d31a134b4@moenia.de>
References: <78fa512a-82c6-0b0c-d759-162d31a134b4@moenia.de>
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

On Thu, 14 Oct 2021 04:45:32 +0200
uxDWzco-wg@moenia.de wrote:

> as I understand, linux needs the ability to change hardware-addresses on
> netdevs to put them into a bridge or bond, but wireguard-netdevs on
> linux don't support hw-addresses at all (at least in kernel 5.10).
> 
> is it possible (or even planned) to add hw-addresses to the
> wireguard-netdevs or does this interfere with the concept of wireguard?

Hello,

It is not a matter of hw-addresses;

Wireguard is L3 interface, transferring IPv4 and IPv6 packets.

For bridging you would need an L2 interface, which transfers Ethernet frames.

It is possible to do a bridge with WG, by using an L2-over-L3 tunnel such as
VXLAN or GRETAP over WG, and bridging that. Of course this leads to additional
overhead and MTU reduction.

If you would prefer to have an L2 VPN directly, there are other solutions such
as Tinc and OpenVPN.

-- 
With respect,
Roman
