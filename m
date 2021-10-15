Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148B5C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 08:25:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44E5061181
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 08:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44E5061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gentoo.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3b82ee0;
	Fri, 15 Oct 2021 08:25:21 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2aff026d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 08:25:18 +0000 (UTC)
Received: from [2a0c:b641:69c:e781::4] (port=52792 helo=proton)
 by muon with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.94) (envelope-from <heroxbd@gentoo.org>)
 id 1mbIWf-000582-Bb; Fri, 15 Oct 2021 08:25:13 +0000
From: Benda Xu <heroxbd@gentoo.org>
To: Chriztoffer Hansen <ch@ntrv.dk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Source IP for multihomed peer
References: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
 <87wnmfj9kq.fsf@proton.d.airelinux.org>
 <CA+cYV6t=doigei7mH-77oZrq=_uMmCn_kRxhfXku+XC75moU=A@mail.gmail.com>
Date: Fri, 15 Oct 2021 16:25:11 +0800
In-Reply-To: <CA+cYV6t=doigei7mH-77oZrq=_uMmCn_kRxhfXku+XC75moU=A@mail.gmail.com>
 (Chriztoffer Hansen's message of "Fri, 15 Oct 2021 09:57:20 +0200")
Message-ID: <871r4mk848.fsf@proton.d.airelinux.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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

Hi Chriztoffer,

Chriztoffer Hansen <ch@ntrv.dk> writes:

> In the prototyping patch you developed for WireGuard, did you consider
> prototyping being able to bind to an interface, instead of explicitly
> specifying an IP address? 

No we did not.  We wanted to keep the patch as small as possible.  

That said, we could manage it by an auxiliary script.

> An example case for being able to bind to an interface could be a
> multi-wan connected firewall/router with dynamic public IP addresses
> offered by the upstream provider no at least one
> connection. E.g. Primary fiber line, backup DSL line.

Yeah, that's a common use case.

Cheers,
Benda
