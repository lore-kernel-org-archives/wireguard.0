Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27DCC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 21:44:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f08806c3;
	Mon, 21 Feb 2022 21:44:46 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2cdc176a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 21:44:45 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id 4BC1F6A9;
 Mon, 21 Feb 2022 21:44:44 +0000 (UTC)
Date: Tue, 22 Feb 2022 02:44:43 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard Windows should have default MTU of 1280.
Message-ID: <20220222024443.1efe2c02@nvm>
In-Reply-To: <20220222005710.705a7023@nvm>
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
 <de1ed6a8-89cd-ec19-40c5-27f6893f4b17@msgid.tls.msk.ru>
 <Mailbird-87f65eb5-1417-4955-ae28-858c7511900b@gmail.com>
 <6ba013e9-05db-17bc-995b-11ef1f279c91@msgid.tls.msk.ru>
 <20220222005710.705a7023@nvm>
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

On Tue, 22 Feb 2022 00:57:10 +0500
Roman Mamedov <rm@romanrm.net> wrote:

> On Mon, 21 Feb 2022 22:16:22 +0300
> Michael Tokarev <mjt@tls.msk.ru> wrote:
> 
> > 21.02.2022 22:11, Michael Adams wrote:
> > > Throwing in my two cents: I was using MTU 1280 on Tinc a few years back, for IPv6 VPN support on Windows & Linux. It's good practice.
> > 
> > Lemme guess. The OP is routing wg packets over IPv6?  Can this be
> > the problem here, because V6 has larger overhead so that 1420 is
> > too large to fit into 1500 bytes together with IPv6 header?
> 
> 1420 is picked specifically so that it fits into a 1500 byte packet with IPv6.
> 
> If you run WG exclusively over IPv4, you can use up to 1432.

Correction: 1440.

https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg01856.html

I'm just used to subtracting 8 everywhere, because my ISP *does* use PPPoE. :)

-- 
With respect,
Roman
