Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DBAEE49B3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:20:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45d67ef2;
	Wed, 23 Aug 2023 16:15:47 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c27ad12
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 16:15:45 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by len.romanrm.net (Postfix) with SMTP id 1ED2D40118;
 Wed, 23 Aug 2023 16:15:45 +0000 (UTC)
Date: Wed, 23 Aug 2023 21:15:44 +0500
From: Roman Mamedov <rm@romanrm.net>
To: blurt_overkill882@simplelogin.com
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Header / MTU sizes for Wireguard
Message-ID: <20230823211544.7f3252ec@nvm>
In-Reply-To: <169230331253.7.2936868369217934671.167170975@simplelogin.com>
References: <169230331253.7.2936868369217934671.167170975@simplelogin.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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

On Thu, 17 Aug 2023 20:14:52 +0000
blurt_overkill882@simplelogin.com wrote:

> I see here[1] that if you're using IPv4 exclusively, you can get away with
> an MTU of 1440. If my client only has IPv4 internet, however the server
> issues an IPv6 address for use by the client, can the client still use 1440
> without fragmentation, or must the client use 1420, because even though
> their connection is IPv4, they are issued an IPv6 address within the tunnel?
> 
> [1] https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html

Yes they can. This is only affected by whether or not WG itself runs over
v4/v6, not whether you use v4 or v6 inside WG.

Be aware though that some residential Internet connections use MTU-reducing
tunnels for ISP authentication. The most popular one would be PPPoE with 8
bytes that you need to substract, but there also can be L2TP or PPTP with
larger overheads.

-- 
With respect,
Roman
