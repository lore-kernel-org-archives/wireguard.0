Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40452C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 19:57:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 61c2f047;
	Mon, 21 Feb 2022 19:57:14 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f69adcf6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 19:57:12 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id 93FE85D4;
 Mon, 21 Feb 2022 19:57:11 +0000 (UTC)
Date: Tue, 22 Feb 2022 00:57:10 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard Windows should have default MTU of 1280.
Message-ID: <20220222005710.705a7023@nvm>
In-Reply-To: <6ba013e9-05db-17bc-995b-11ef1f279c91@msgid.tls.msk.ru>
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
 <de1ed6a8-89cd-ec19-40c5-27f6893f4b17@msgid.tls.msk.ru>
 <Mailbird-87f65eb5-1417-4955-ae28-858c7511900b@gmail.com>
 <6ba013e9-05db-17bc-995b-11ef1f279c91@msgid.tls.msk.ru>
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

On Mon, 21 Feb 2022 22:16:22 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 21.02.2022 22:11, Michael Adams wrote:
> > Throwing in my two cents: I was using MTU 1280 on Tinc a few years back, for IPv6 VPN support on Windows & Linux. It's good practice.
> 
> Lemme guess. The OP is routing wg packets over IPv6?  Can this be
> the problem here, because V6 has larger overhead so that 1420 is
> too large to fit into 1500 bytes together with IPv6 header?

1420 is picked specifically so that it fits into a 1500 byte packet with IPv6.

If you run WG exclusively over IPv4, you can use up to 1432.

However, if your ISP uses, say, PPPoE or L2TP, you need to reduce these
numbers accordingly, as the underlying interface will not have the full 1500
byte MTU.

-- 
With respect,
Roman
