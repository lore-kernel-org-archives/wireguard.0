Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E63C432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:46:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F5D214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="lnGCwqPn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76F5D214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc7aff10;
	Wed, 25 Sep 2019 08:46:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75e1113d
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 08:46:10 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f948fdd
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 08:46:10 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1569401168; bh=hdI2/8m1XWzYalolj8xZHSopkUVGhtQLUm6AD7C/6rE=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=lnGCwqPn8Xik4+dABeuye2OpcKR61gBj+tf2azZZoiepMCvLys5acy3IEAA+CySH2
 XpGvTv765iKAnzYQNUpf7Y00XFwVyGsUT3ShOReN/2rArjEsMh8kVdmUJaheeNA1Mw
 A8fSIQHBrNUzDQv6bAp2GpCkb/BFUB+646giQysI2lnfync3zPBY7ptF2QJpBStDF9
 c3Q4bwZw+CxdwrDkgOEvUpbi226xIFGNwDtCu+HCOGojbt8uZVyJx9lIwnUMXa59CM
 ikhH6E/y8/5YSbpJvWH3rya/lMZkr25jE3h7vDFC6/NaiaBhJubkJEM0MOqhlMJ26T
 KZU470eZglgHQ==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: WireGuard to port to existing Crypto API
In-Reply-To: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
References: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
Date: Wed, 25 Sep 2019 10:46:08 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v9tg3grz.fsf@toke.dk>
MIME-Version: 1.0
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hi folks,
>
> I'm at the Kernel Recipes conference now and got a chance to talk with
> DaveM a bit about WireGuard upstreaming. His viewpoint has recently
> solidified: in order to go upstream, WireGuard must port to the
> existing crypto API, and handle the Zinc project separately. As DaveM
> is the upstream network tree maintainer, his opinion is quite
> instructive.
>
> I've long resisted the idea of porting to the existing crypto API,
> because I think there are serious problems with it, in terms of
> primitives, API, performance, and overall safety. I didn't want to
> ship WireGuard in a form that I thought was sub-optimal from a
> security perspective, since WireGuard is a security-focused project.
>
> But it seems like with or without us, WireGuard will get ported to the
> existing crypto API. So it's probably better that we just fully
> embrace it, and afterwards work evolutionarily to get Zinc into Linux
> piecemeal. I've ported WireGuard already several times as a PoC to the
> API and have a decent idea of the ways it can go wrong and generally
> how to do it in the least-bad way.
>
> I realize this kind of compromise might come as a disappointment for
> some folks. But it's probably better that as a project we remain
> intimately involved with our Linux kernel users and the security of
> the implementation, rather than slinking away in protest because we
> couldn't get it all in at once. So we'll work with upstream, port to
> the crypto API, and get the process moving again. We'll pick up the
> Zinc work after that's done.

On the contrary, kudos on taking the pragmatic route! Much as I have
enjoyed watching your efforts on Zinc, I always thought it was a shame
it had to hold back the upstreaming of WireGuard. So as far as I'm
concerned, doing that separately sounds like the right approach at this
point, and I'll look forward to seeing the patches land :)

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
