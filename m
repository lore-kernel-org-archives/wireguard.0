Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B630BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 02:39:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D849B610D1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 02:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D849B610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gentoo.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74c5a3e9;
	Fri, 15 Oct 2021 02:39:12 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 27a2d373
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 02:39:09 +0000 (UTC)
Received: from [2a0c:b641:69c:e781::4] (port=51614 helo=proton)
 by muon with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.94) (envelope-from <heroxbd@gentoo.org>)
 id 1mbD7f-0004df-Hs; Fri, 15 Oct 2021 02:39:04 +0000
From: Benda Xu <heroxbd@gentoo.org>
To: Svenne Krap <svenne@kracon.dk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Source IP for multihomed peer
References: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
Date: Fri, 15 Oct 2021 10:39:01 +0800
In-Reply-To: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk> (Svenne Krap's
 message of "Thu, 14 Oct 2021 10:30:27 +0200")
Message-ID: <87wnmfj9kq.fsf@proton.d.airelinux.org>
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

Hi Svenne,

We have met exactly the same problem.

Svenne Krap <svenne@kracon.dk> writes:

> [...]
>
> My question is twofold:
>
> 1) Does the above seem like a likely chain of events?
>
> 2) Is there any way to force the source ip of the connection from boxA
> to always use address boxA1 ?
>
> From the documentation Listenport only seems like the portnumber and
> there seems to be no way to set the source ip.

It has been discussed on the list several times.  But Jason seems not
convinced of the necessity of address binding.

  https://lists.zx2c4.com/pipermail/wireguard/2017-May/001280.html
  https://lists.zx2c4.com/pipermail/wireguard/2019-March/003938.html
  https://lists.zx2c4.com/pipermail/wireguard/2018-June/003013.html
  https://lists.zx2c4.com/pipermail/wireguard/2017-November/002017.html

Rulin and I tried to implement an address binding feature at,

  https://github.com/FireflyTang/linux-wireguard-bind

It was verified to work with Linux-5.7.

Yours,
Benda
