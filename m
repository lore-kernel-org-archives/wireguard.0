Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F15C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 02:52:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F25860EE4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 02:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F25860EE4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bd479e8;
	Thu, 23 Sep 2021 02:49:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 400f0b76
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 02:49:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC15A610D1
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 02:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Vu4/W/rD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632365377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/7W9RL0Tvhg4F6I6mPst+aHcSu2dPbYHa4DQ12FKxkE=;
 b=Vu4/W/rDwEV0R9f0mxNJX+69ubfumszvpa9HA0HKoNrkvpMjm+Ix5/LmNUlWm8IlfAJyGY
 GuRqXrz7f/fVqNKfsPHsIxzt/dMF+rbCfh7niKF8Vzzp6MDSZC0eQFbUNz9IG314zfhU/f
 g1xxzA16D1ouLcKfG5AnpA6pSsWGLec=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f06d0569
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 02:49:37 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id f130so17102510qke.6
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 19:49:37 -0700 (PDT)
X-Gm-Message-State: AOAM531CRKPESMUz8XjM/3sxZubM+MMJocbOlPojDbSqvN1L4e+Rpda9
 lyOO/DkmD6mq3nD5EMp07SEt83wMMr7aLNllJyQ=
X-Google-Smtp-Source: ABdhPJw30vR58fND0DpxR5H+60WJrpVYsDBhB7WCeaAITGH50qLgQJiU22TKkKQUeczPONpRtSA2z+xYHsMNsnIXDYs=
X-Received: by 2002:a5b:d48:: with SMTP id f8mr2697128ybr.449.1632365375641;
 Wed, 22 Sep 2021 19:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
In-Reply-To: <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 20:49:24 -0600
X-Gmail-Original-Message-ID: <CAHmME9r8cCPM39mM=oAFgA0nDGAbiEghnkD8m_Y_g76FV_PBOg@mail.gmail.com>
Message-ID: <CAHmME9r8cCPM39mM=oAFgA0nDGAbiEghnkD8m_Y_g76FV_PBOg@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>, 
 Roopesh Chander S <roop@roopc.net>, Miguel Arroz <miguel.arroz@gmail.com>,
 Alan Graham <alan@meshify.app>, oss@jacobwilder.org
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

Hi again,

I'm afraid the situation is somewhat bad...

It appears that iOS 15 has completely deleted the iOS 14's WireGUard
keychain items, at least as far as the WireGuard app can see. I've yet
to jailbreak or look at an image dump to see if it's still hiding
somewhere, but it also doesn't matter, because from the app's
perspective, the keychain appears totally empty.

Digging in just on the surface, it looks like the keychain references
from iOS 14 are something like "67656e7000000000000000f7", with that
f7 incrementing, while the ones from iOS 15 are
"67656e700167269751a94355a004bfa75f951cec" -- same prefix, but the
suffix is longer and seemingly random. Did the migration from one
format to the other go bad on upgrade? Did something else happen? I
don't really know much yet about the guts of this bug, but it does
seem like something is going on. We've never had any issues with the
keychain being emptied between iOS versions before.

So now we need to figure out what to do. I'm still holding out a tiny
sliver of hope that there's a mistake somewhere and this can all be
fixed by the app, but so far I've come up dry when looking around for
that. What if this really is an iOS 15 bug? I'll report it to Apple,
of course, but that doesn't help the immediate issue that people's
configs are being deleted. The behavior is at least detectable, so I
could detect the migration, delete all of the orphaned network
profiles (as before), and pop up a message box (resembling a
ransomware screen!) saying "Where Have All Your Configurations Gone?",
followed by an apologetic explanation. That's kind of unsatisfactory,
though. I'm all ears on other ideas if you've got any.

And if any Apple developers are hanging out on this list and want to
try their hand at a solution, that'd be much appreciated. (Plus, my
entreaty from March [1] remains.)

Jason

[1] https://lists.zx2c4.com/pipermail/wireguard/2021-March/006455.html
