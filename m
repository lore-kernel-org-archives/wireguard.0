Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF54C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Nov 2022 20:59:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac99d5ad;
	Fri, 4 Nov 2022 20:56:49 +0000 (UTC)
Received: from mail.core.gen.tr (ns1.core.gen.tr [50.116.31.210])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 801ba14f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2022 20:56:48 +0000 (UTC)
References: <CACsaVZ+rAuNX=iTbtmm18Dbq2y66Fxj=_3Vf-PHwLR03ENQEBQ@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=core.gen.tr; s=mail;
 t=1667595406; bh=6V8+0ifeDj+v4JvEoWL68Ph9/G/28i2Kto8O08c3SEs=;
 h=References:From:To:Subject:Date:In-reply-to;
 b=KjF167aPkSsHpS8AEeiaJjvZGL6K2/yJqu4YgWlPRQH4R37t0psBRzMm8V23iVVgh
 wQkp0R7SgpE2on0jXDX/NJqz56jLgkrSZmQOm18n+7WHrr4xDE1O9Aw4yHNQjxzFbc
 qu50gmFxY87bSnrv4iMOlUjK0GhwgtJ4SBq2eSSQ=
From: Metin Evrim Ulu <evrim@core.gen.tr>
To: wireguard@lists.zx2c4.com
Subject: Re: absolutely terrible wireguard performance on a 4ghz box - need
 tuning help
Date: Fri, 04 Nov 2022 23:55:36 +0300
In-reply-to: <CACsaVZ+rAuNX=iTbtmm18Dbq2y66Fxj=_3Vf-PHwLR03ENQEBQ@mail.gmail.com>
Message-ID: <871qqiphfk.fsf@core.gen.tr>
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


Kyle Sanderson <kyle.leet@gmail.com> writes:

> hi wireguard,
>
> APU2C4 - AMD Embedded G series GX-412TC, 1 GHz quad Jaguar core with
> 64 bit and AES-NI support
>

Um, I don't recall any Rijndael/AES in WG implementation, any particular
reason for mentioning AES-NI? 

best,
evrim.
