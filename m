Return-Path: <SRS0=P56g=HA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A848C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 20:14:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F243864DE7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 20:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F243864DE7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd50603f;
	Fri, 29 Jan 2021 20:14:20 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f276fab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1611951254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOJxUdeoDOWW/CPfhU1dcNdoCWMNaKeVtaW2SdPW7ag=;
 b=Z129RkeqD+mDGXQmTQsnQA1fxVlxAWSKojqHquPQoNdnu0WZQPMjlIO1qJzX8drwhjXO9S
 aZzuO/P3/o0vneBVxk8TZxHvykZvKHMnc1URYqKyLoqlkBdl5XdXRt60ecIsvpFqXa/65V
 PIBAjiRRRF3A0O7DTS5gHtynrV853g8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5256cd01
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 20:14:14 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id b11so10093072ybj.9
 for <wireguard@lists.zx2c4.com>; Fri, 29 Jan 2021 12:14:14 -0800 (PST)
X-Gm-Message-State: AOAM533viobnNm0SjQp6WWAxmXbQ6Hq/hk/5FL5mWhzSSzde5r1G9NEF
 3f5Q0en1S2N11AxcQtLs0oDWql1W8i1lQpR6jG0=
X-Google-Smtp-Source: ABdhPJwSoEWfChhFjbwyw5yhluWGwMdAqscWbuu03h04gpB5bUtuF/wJElGWY8aGPBokGczD/zlcE5ZPItcK84oITlw=
X-Received: by 2002:a25:ca94:: with SMTP id a142mr8667429ybg.239.1611951253695; 
 Fri, 29 Jan 2021 12:14:13 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuuB=+ZDTsTaVs-pswd6fsu6CvZgO4b76HPGQZmwxssN0w@mail.gmail.com>
 <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
 <af71a4b2-989a-da04-2fa6-9467ec58997f@pineview.net>
 <CALaUSusBmLSAE3rYavFtEW5Bp+KoRVLfKFXga7Po+46KSGPbhg@mail.gmail.com>
In-Reply-To: <CALaUSusBmLSAE3rYavFtEW5Bp+KoRVLfKFXga7Po+46KSGPbhg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 29 Jan 2021 21:14:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9ozVtp6UCpksn9_nfb30nGMWqT2b2dYTHGqMi+jLg6oMQ@mail.gmail.com>
Message-ID: <CAHmME9ozVtp6UCpksn9_nfb30nGMWqT2b2dYTHGqMi+jLg6oMQ@mail.gmail.com>
Subject: Re: WireGuard for Windows tunnel deactivation after prolonged
 resolution failure during startup
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Hey Joshua,

Ahhh that's a good point -- users sometimes must manually connect. And
in this case, you're expecting for WireGuard to resolve those hosts
and turn on the second a connection is available.

I suppose it should be possible to detect when we're started at boot
(not sure how yet) and retry indefinitely in that case. That's a
little tricky to program because I'd still like the user to be able to
terminate the service. But not impossible. I'll think on it. And I've
added it to the TODO:
https://docs.google.com/document/d/1-jlULsy1uDun-b4ow3RvnNQJU5K_pAv87sqDAfK66Kk/edit

In case you're curious, the code in question is here at the moment:
https://git.zx2c4.com/wireguard-windows/tree/conf/dnsresolver_windows.go

Jason
