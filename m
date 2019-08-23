Return-Path: <SRS0=nxOL=WT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32207C3A5A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Aug 2019 06:20:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B5A22CF7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Aug 2019 06:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=labrat.space header.i=@labrat.space header.b="Bio2FAq+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B5A22CF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=labrat.space
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90ace52b;
	Fri, 23 Aug 2019 06:19:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acd0db38
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Aug 2019 06:19:56 +0000 (UTC)
Received: from mariecurie.labrat.space (mariecurie.labrat.space
 [116.203.185.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b51f12d9
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Aug 2019 06:19:56 +0000 (UTC)
Received: from labrat.space (xdsl-188-155-234-211.adslplus.ch
 [188.155.234.211])
 by mariecurie.labrat.space (Postfix) with ESMTPSA id EFCA52EBDE2
 for <wireguard@lists.zx2c4.com>; Fri, 23 Aug 2019 08:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=labrat.space;
 s=201904; t=1566541155;
 bh=yfPCs9I/X/1jcczp9zMvZrOIVbo2EVMBsDPI0ZTtvjY=; l=842;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:From:To:CC:Date:
 Subject:Content-Type:Content-Disposition:Reply-To:In-Reply-To:
 MIME-Version:Message-ID:References;
 b=Bio2FAq+8Kkf6ODignv/OmAJBiVEkxZ2WN//Za+/HToOFUTOeRmgUURaOTQt5Y3mt
 +ydkYHhoSOUtdBohMuSNCagI/qvB/4inv74aZhLyp9yGPCgImcCARlTsAtOpk2ug2z
 j1vUcH7tCAGl/7PqOfV0Lf2YjP0k7oF5OnN/u9pby+eRNGWtEPFUnO+YH72sz07aXM
 llvmqWG93t5vBJs6r6KMWNTrq4JAzcWpsvW+KqFzFVKyL3GdHFZzYI1Y05GVOGZ8ma
 djA6KLbHDUAuvl5l9TN8Wj4xD1IdVQkoaE8HqtxPkfmR4dFkpAFABDutxXz/EfJG5Z
 XpPJEguBPvaEg==
Date: Fri, 23 Aug 2019 08:19:51 +0200
From: Reto <reto@labrat.space>
To: wireguard@lists.zx2c4.com
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
Message-ID: <20190823061951.yfno7xqln7yfj4xj@feather.localdomain>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
 <20190818170928.ps2fymkisd4giefv@feather.localdomain>
 <c8accebb-1a7f-7b3e-26b5-2d0b13347fb3@bartschnet.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8accebb-1a7f-7b3e-26b5-2d0b13347fb3@bartschnet.de>
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

On Thu, Aug 22, 2019 at 10:54:56AM +0200, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> Anyone with access to the running machine or malicious software can read the
> keys on hard-disk.

No. That depends entirely on how you set it up. Permissions are a thing and you
don't need to constantly keep the corresponding storage unlocked either.

> How do you de-crypt the encrypted disk on a headless machine which has to
> reboot autonomously on error conditions?

How do you do that with a security token? It's the same issue really.
Either allow ssh access without the tunnel or use a serial connection or
vitalization thereof to unlock the secret and bring up the vpn.

> The point of security-tokens is you never get access to the private key.

Yes, my point is wg already allows you to do that, so what more do you need?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
