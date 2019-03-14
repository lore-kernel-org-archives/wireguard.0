Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF21C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 18:58:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747F62186A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 18:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RM9Br8fE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747F62186A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a111308;
	Thu, 14 Mar 2019 18:47:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80bf47b5
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:47:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45f22be5
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:47:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6eafa9ca
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=p7Gqb3sUIRu64PjFfe4V45he/bw=; b=RM9Br8
 fEfrMizIHrKEhSfgc62C0Rf11RLJXx1UgdVZ2qLl9gqwD7GNu5Ojzm1FyRiWsdwa
 MkS5Qj6tDuI50QEra+Ju3zqOlrVmjLYSPS2U6AufI14yNWEASilJb4SPI3ax+yi3
 LOigXSKtorhMyTwk1zjvSrJm22kgzpr4G+38TUqKJ7LQiips3mdnLFC6FvEnWIYR
 V/GXWX3CVbXgAVXeHn45yvDkccAvlow/p1uDOG8r8J3P1aSvLdhiwMVnOM96EHUJ
 DfCtQXPvfnJFP3z2BSZFy/UL6lGIoD2/yQfFM5lOV2K+++K/GLdfqBPREmCcVc2/
 zsNyWDNj/Nr0NXzw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9cb2da7e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:38:07 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id z25so6137293otk.2
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2019 11:58:52 -0700 (PDT)
X-Gm-Message-State: APjAAAUNH+R/NAuLH/nCVnRSqu7GuH+Q3ohNW353V8KdEXp8/nliWOyw
 Jb5vShLny532AD+gper40ffWMsMVj4A6jWqjYi8=
X-Google-Smtp-Source: APXvYqxZj1d0a70s3r6iFns1NZwOBN+WoykdRIESWHFisOkA/dUiTi44pAFHGAL553brL9W2i0GupKJy8Xu/06FHgTs=
X-Received: by 2002:a9d:5501:: with SMTP id l1mr31913362oth.143.1552589932160; 
 Thu, 14 Mar 2019 11:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190314051608.9798-1-bruno@wolff.to>
 <20190314123211.GA20943@wolff.to> <20190314171033.GB23073@wolff.to>
In-Reply-To: <20190314171033.GB23073@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Mar 2019 12:58:41 -0600
X-Gmail-Original-Message-ID: <CAHmME9r-CrGs8JFPnWSkd8kKwgJqokOwFbi5g_DfVk+MKFXPzQ@mail.gmail.com>
Message-ID: <CAHmME9r-CrGs8JFPnWSkd8kKwgJqokOwFbi5g_DfVk+MKFXPzQ@mail.gmail.com>
Subject: Re: [PATCH] Merge two rcu types
To: Bruno Wolff III <bruno@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Ideally the way to fix this would be to replace our usages with the
proper non-_bh ones, and then in compat, based on a version
comparison, define the non-_bh to the _bh. The problem is that
ratelimiter.c uses non-_bh already, and it's unclear how bad it would
be if this suddenly became _bh on old kernels.

IIRC, the _bh variant of those functions has been aliased to non-_bh
since a few versions. Do you know the first time it was the same?
Perhaps if that's far enough back, then it'd be worth the effort to
try to qualify the breakage of improperly _bh-ing ratelimiter.c would
be on those kernels. On the other hand, if it's too recent or if the
breakage would actually be significant, we could always fallback to
the `#ifndef COMPAT_CANNOT_*` pattern used in a few other places
(which gets stripped out automatically for upstream submissions).
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
