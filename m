Return-Path: <SRS0=wOns=UK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A2DC4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jun 2019 17:29:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8A120874
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jun 2019 17:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WE+2YTmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF8A120874
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f76bba1;
	Tue, 11 Jun 2019 17:29:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83509215
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 17:29:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91235729
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 17:29:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d7327f9
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+u8oQcfbn9hBql0/jFVIL+wR0Ag=; b=WE+2YT
 mX/AYlE7Rg+cbRuF1arIcwm3pGzjdFmarZ2RA0UkGGSM4liPCYDCrw2aFbobqfYs
 +Ha1xPU5GCeEO4ZKyQao+1FshTyo89NHoIuVVZ6eD5T0zccZuKdDq+iNTT8mZZzO
 bD+tQ1OIEpOp/SEX43r/iXJ/7/mSC5NP5Qe4zIAAkkEWQznAJDxhp2C1U7qSrEIY
 rogAcVk8/4PHKvq5VbE9Um2QytUtNHG9Kr5HARQyU4Bl1ihrhKhUKW9ggP3XrTf8
 kCFFHUBCQAwCsmzbYLAsfim2v+KOu47xtEvRY9QjkxmJrTdB7rlWt9T1esWieNd9
 qksNQ9FejowrcmCQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19b70516
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 16:56:51 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id q186so9594585oia.0
 for <wireguard@lists.zx2c4.com>; Tue, 11 Jun 2019 10:29:00 -0700 (PDT)
X-Gm-Message-State: APjAAAU6xBWEDD8T4JcaCM8+Wr/Ic/LVe8DBrPoDYvYyx0wn8eFlIEv3
 urfKSiAc5h/bE3MDLYEFMJTxSMsALoPTUIRm5Kg=
X-Google-Smtp-Source: APXvYqwQd3Cd2MGkdmVC+wjPQTCO4psL0JhbUIcFloIowSSLooZDJWzpbQiUFwwGF28TdgAimv3Qcpf7JVInGoydnRc=
X-Received: by 2002:aca:ac4d:: with SMTP id v74mr15507401oie.66.1560274139462; 
 Tue, 11 Jun 2019 10:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
In-Reply-To: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 Jun 2019 19:28:48 +0200
X-Gmail-Original-Message-ID: <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
Message-ID: <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>, Luis Ressel <aranea@aixah.de>
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

Hey Lonnie,

I gave it a stab in this branch:
https://git.zx2c4.com/WireGuard/commit/?h=jd/syncconf Try it out and
let me know if it does what you had in mind?

One of the things that always goes wrong with "sync" algorithms in
software -- and the commit above at the moment is no exception -- is
that they're kind of racey. In order to synchronize, we have to read
the current state, compare it, and then set our new state. But in
between, the state could have changed out from underneath us. One
strategy for this is to just do nothing and put some notice in the man
page. Another strategy is to read back the result at the end, compare
it, and loop like this until we reach the stable state. This then
requires implementing some equality function.

The other thing I was wondering is: aside from performance and races
as described above, why not just make this the functionality of
`setconf`? Then there's be no need to introduce a new subcommand. In
otherwords, the idea would be to make `setconf` not destroy existing
peers if we're going to be re-adding them again.

Thoughts?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
