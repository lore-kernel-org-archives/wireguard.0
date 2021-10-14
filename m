Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F99C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 15:34:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E99360ED4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 15:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E99360ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gentoo.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d6fcece;
	Thu, 14 Oct 2021 15:34:34 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7e351d5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 03:25:12 +0000 (UTC)
Received: from [2a0c:b641:69c:e781::4] (port=49528 helo=proton)
 by muon with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.94) (envelope-from <heroxbd@gentoo.org>)
 id 1marMe-0002fb-E2; Thu, 14 Oct 2021 03:25:04 +0000
From: Benda Xu <heroxbd@gentoo.org>
To: uxDWzco-wg@moenia.de
Cc: wireguard@lists.zx2c4.com
Subject: Re: linux: bridging/bonding not possible
In-Reply-To: <78fa512a-82c6-0b0c-d759-162d31a134b4@moenia.de>
 (uxDWzco-wg@moenia.de's message of "Thu, 14 Oct 2021 04:45:32 +0200")
References: <78fa512a-82c6-0b0c-d759-162d31a134b4@moenia.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 14 Oct 2021 11:25:02 +0800
Message-ID: <87bl3sl241.fsf@proton.d.airelinux.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:34:33 +0000
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

Hi uxDWzco,

uxDWzco-wg@moenia.de writes:

> as I understand, linux needs the ability to change hardware-addresses
> on netdevs to put them into a bridge or bond, but wireguard-netdevs on
> linux don't support hw-addresses at all (at least in kernel 5.10).
>
> is it possible (or even planned) to add hw-addresses to the
> wireguard-netdevs or does this interfere with the concept of
> wireguard?

Bridging is an layer 2 network concept. But wireguard is a layer 3
connection.

For more information on OSI layer model, refer to,

  https://en.wikipedia.org/wiki/OSI_model

Cheers,
Benda
