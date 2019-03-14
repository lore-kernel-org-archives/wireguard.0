Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7E1C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 18:52:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE17E217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 18:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zDmEoJhb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE17E217F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c63b2ac;
	Thu, 14 Mar 2019 18:40:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c1d4bd1
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:40:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4af78207
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:40:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd458688
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=RWbGc5rVCdTMu3k2NHZqs1Mxi30=; b=zDmEoJ
 hbIRgDRRW1hsCIwJbA16bMg1sme/yjm9hW7Ev9ibPL6bZlc1zZ8MJoQkgRUPkCiG
 iLE4F6rrxazCP+ZyFtm/+MQ4NeVvHkJslmLTQQpWL66Up6L72pcb2c3aCj5zi0Bm
 xpo0Ths7rfXs93sn/QPpnu0T8Yzmgsowf1abAMYY+/kE3yUZ5+WBNskIKgZAeqjh
 PuUPCWWwykR59v/HK69B8AOMUZElTxET72Vx/U7UWc0kUOzNq8hOVmKnGXhGPygq
 66RqkS1zWWpP7XewihuR7AYcOF7SPF41E6DzMilSQUXqLzBo0GH7Hl5yTVbsEPze
 nhtfEnnpedfuescQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8f2a3f26
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 18:31:27 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id q24so6117759otk.0
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2019 11:52:13 -0700 (PDT)
X-Gm-Message-State: APjAAAVG4fGd5PmhcbxtDyTfMG+n9BZl0euxt1dFBiLwrpNBuHIwGZ3Z
 T/5dQykjGPqW3F9h/WknG4wky/oB9XtabwX9+do=
X-Google-Smtp-Source: APXvYqxO+i+9UdULcz+TBTp/RYqjK1niISwqy5POQ8YDTM89s/1o7m3T3Zi7OmfaFJNw2SPP98o7Gt3dKptA5czYZAU=
X-Received: by 2002:a9d:7404:: with SMTP id n4mr33221498otk.54.1552589532656; 
 Thu, 14 Mar 2019 11:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190314182534.23660-1-bruno@wolff.to>
In-Reply-To: <20190314182534.23660-1-bruno@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Mar 2019 12:52:01 -0600
X-Gmail-Original-Message-ID: <CAHmME9px1AuNAv30=Cz+09_-gk8WgLp6f40dFCsH-2WYnkzm+A@mail.gmail.com>
Message-ID: <CAHmME9px1AuNAv30=Cz+09_-gk8WgLp6f40dFCsH-2WYnkzm+A@mail.gmail.com>
Subject: Re: [PATCH] net/netfilter/nf_nat_core.h was removed by
 d2c5c103b1337f590b7edf1509a6e294bdf22402
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

On Thu, Mar 14, 2019 at 12:26 PM Bruno Wolff III <bruno@wolff.to> wrote:
>
> It looks like net/netfilter/nf_nat_core.h isn't needed any more and things
> seemed to work without it.
>
> Signed-off-by: Bruno Wolff III <bruno@wolff.to>

Thanks. Merged here with a slightly different message:
https://git.zx2c4.com/WireGuard/commit/?id=df681f4afe2e8a50cc2c1ee3af27b1f42c070472
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
