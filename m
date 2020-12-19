Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB95C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 18:18:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 580692389F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 18:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 580692389F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be8886bf;
	Sat, 19 Dec 2020 18:08:03 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6ac4166c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 18:08:00 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0eff5db0
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=JGZGJuuQ/IeZBuFaIkAfgPMjhy4=; b=gxzzEk
 j8OytKo9bBfhJxRDBh4Ckh/gk9OYrKFZnidS/w6W6SUwka7aMDha6LmifqalkMr4
 TWVEX8Jt8QiEq8428lqs/oopKEkkifJdAbdhOeqPxJ/r+ZdkM3HjkXGM8dFxPk0l
 vHiHxSsm9r89MD8z3ZVLLIOIqtWBdrZ2PX75BbqbuwGsEmdTnkGADLI++ZWXxzE4
 HMRrUpODTeuZEyf35LNrEoBxHe4dNFQJ+4D06XBewM918Xc4cLAKVJAYBqbTmWpN
 L23BalPLcm+v2CgD7FdMP68a5QDsw0NR9JGvHY1aCvNUDZhXjPqNw0aNatdRUu94
 Pf+ez0h0134hmjbA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c35a4ccc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 18:08:46 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id w135so5029635ybg.13
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 10:16:48 -0800 (PST)
X-Gm-Message-State: AOAM530nVYPpCIe0IObsfCFPObNXMyO0dzDDp17pMKbNT4vswbVLwWub
 oPFQO/vQpXpnAnX74DY5CtwZsDuoTTBgvnY0NXw=
X-Google-Smtp-Source: ABdhPJxxjOD8+toICRZxZLwiQtmrv7K/U0K7WbIgNTten9sBdViajvtS/e5QriD7s88S/lF7vBME5o2o9P9BRIHRyeo=
X-Received: by 2002:a25:2cd6:: with SMTP id
 s205mr13096541ybs.279.1608401807814; 
 Sat, 19 Dec 2020 10:16:47 -0800 (PST)
MIME-Version: 1.0
References: <90c10d21558d31825a56aac48692b080@essd.nl>
 <CAHmME9qmYATYk2oV0T3OmnE4J1uTy49p09gyuRHdrGNZHKsejg@mail.gmail.com>
 <9c5569cf88048c3ceb343340e68d7564@essd.nl>
In-Reply-To: <9c5569cf88048c3ceb343340e68d7564@essd.nl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Dec 2020 19:16:37 +0100
X-Gmail-Original-Message-ID: <CAHmME9pjcBFBQM67iTOjG+HLH8OnMUhxNOX2rne2umiNW9bHew@mail.gmail.com>
Message-ID: <CAHmME9pjcBFBQM67iTOjG+HLH8OnMUhxNOX2rne2umiNW9bHew@mail.gmail.com>
Subject: Re: "BUG: scheduling while atomic" on 5.4 kernels with PREEMPT_RT
To: Erik Schuitema <erik@essd.nl>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Erik,

So far as I can tell, upstream is fine with this. I'd encourage you to
move to the newer LTS, 5.10. The compat stuff has always been pretty
meh. It was an important step in getting WireGuard bootstrapped, of
course, but just look at this horror:

https://git.zx2c4.com/wireguard-linux-compat/tree/src/compat/compat.h

I'll keep it working as people need, but folks should really really
move to the new LTS, now that it's out.

I've also backported upstream commit-by-commit to 5.4 (and android
4.19), for stable kernels, as used by Oracle, SUSE, Google, and so on:
https://git.zx2c4.com/wireguard-linux/log/?h=backport-5.4.y
This too is much preferable to using the compat stuff.

Jason
