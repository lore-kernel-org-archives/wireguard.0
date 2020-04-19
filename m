Return-Path: <SRS0=IbIO=6D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D683FC2BA2B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Apr 2020 05:21:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334D02076A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Apr 2020 05:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaADC3Fy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 334D02076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0f56bdb;
	Sun, 19 Apr 2020 05:10:49 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cd091c65
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Apr 2020 05:10:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id e5so4718118edq.5
 for <wireguard@lists.zx2c4.com>; Sat, 18 Apr 2020 22:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gVZHULSPDFmLSNv+hmJcoGUCiIX6Lu6TwOdHjzl9mno=;
 b=oaADC3Fyz23NHEsSTGTwTYXtDlhbsf4U4viHYky0nhsPvkRPXpjwOwR/9ou0b66amR
 4yRsmpzFVGusZmj53+CY517+mYmhKY/Uy9JeYfu+G5U3ZReDxWMGsRGXMH7du0AAGciD
 NmjmgGOSvYkTePTQVs6W1wwtWIUHFyo99qIbkwtP/65QAtU3vz6dgOi6CpEcbGj36plC
 9znBoxGoGkhFhwl6FwxsPcYzuJC0jEaeLoSViuO+dJrWs7mhDnTMfSy9YpC3qvX58+P4
 +clo/hkqdqgKWnO1Wb8JxJwLPWA4XXg8Ul88cGvEpBmeflZVjgJTxHLKjCL+wJMkRnY6
 4SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gVZHULSPDFmLSNv+hmJcoGUCiIX6Lu6TwOdHjzl9mno=;
 b=LENMujPNdHsS3lW9AXjA9pEYQbfymqsBH7Zf1iuweNlICZZLvRiivxs8IFNrbNUtuU
 mXdLMxzFUGGpzBWKjF3kMyf1fL0d7irx0sTpcSdG/WOnKeTPsI45wMG4eOkCjZKmRiuV
 qeEoUDdUftNYWmfx9TIwG5SaohwwYu/Bas3srtX100X2KOJkM/xkP/ZONimPMkLGuLXq
 XGMTf4xnhTkH5Yz1M45/qZ+ezWhnXIY4HXI5cBvL3tlBg7fdxDPyCBuxNq/a4qzRrqU7
 QQhS2JTDEBRsPEWAR31MMrsrEjdJoQ2jqrhSL8Au5OvGsuZZx36OI1d6d7ZBT15t4ipo
 IKqQ==
X-Gm-Message-State: AGi0PubTChnzlTktoB3AMYn7y/J46JyqqvPBkOcq/xUgrCBXkBovwhJ1
 bgNlojybnzZ2B7wjoM7klL/JehzGsqzrZv/NonI0Yc7FNXs=
X-Google-Smtp-Source: APiQypKnwe0ReYBlDT1SOLBiR4I7ClsaWKedbxqGiOD0M/Wgdx7s2ew2RQ3Qv/FnQnanJNbbEs+ltFUwurVlF7YDM/k=
X-Received: by 2002:a50:ef09:: with SMTP id m9mr822308eds.321.1587273671468;
 Sat, 18 Apr 2020 22:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAA2ss9E8hAQqwKwA6aytcXCZPr905NX53LRdfY6-WG24m66AAA@mail.gmail.com>
 <CAHmME9rDA8ssOFodvgLp1WQ9usBj=Bc3xVBNdrvwkwyM+2kr5Q@mail.gmail.com>
 <59f5a401d768dfad8b60a0ed3f59a5b6@msfjarvis.dev>
In-Reply-To: <59f5a401d768dfad8b60a0ed3f59a5b6@msfjarvis.dev>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 19 Apr 2020 14:21:00 +0900
Message-ID: <CAA2ss9E0UnqPdj0uHF6rfLD0TdkAB5s=L=OXf6dH+1T20-TBAA@mail.gmail.com>
Subject: Re: Question about Crowdin operation
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, me@msfjarvis.dev
Cc: Simon Rozman <simon@rozman.si>, Roopesh Chander S <roop@roopc.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Harsh, Jason,
Thank you for quick response!

> The second option is perfectly fine, though you'll have better luck if yo=
u
> mention me or Jason since that will ensure Crowdin does not swallow up th=
e
> notifications.

> AFAICT, the "issue" flag sends us an email notification, which is a
> good thing if you need an answer.

I understood.
When I use comments is when I need a response, so I will try to use
the mention or issue flag.

2020=E5=B9=B44=E6=9C=8819=E6=97=A5(=E6=97=A5) 5:24 Harsh Shandilya <me@msfj=
arvis.dev>:
>
> April 19, 2020 1:38 AM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> > On Sat, Apr 18, 2020 at 9:56 AM Eiji Tanioka <tanioka404@gmail.com> wro=
te:
> >
> >> Hi,
> >>
> >> I'm translating WireGuard apps into Japanese.
> >> I have a question about operation in Crowdin.
> >>
> >> When translate, we translators need to clarify about original string's
> >> context or meaning. In that situation, which option is preferred?
> >>
> >> - send ML about question.
> >> - in Crowdin, use comment.
> >> - in Crowdin, use comment and flag "Issue".
> >> - in Crowdin, use Discussion.
> >>
> >> # I had used second option, but never mention to anyone.
> >> # Should I had to mention to ?
> >>
> >> Kind regards,
> >> Eiji Tanioka
> >
> > Hey Eiji,
> >
> > CC'ing Harsh, Simon, and Roopesh, as they might have different
> > opinions on what they prefer.
> >
> > From my end, any form of communication is fine, whether its on Crowdin
> > or on the mailing list, because lowering the barrier for people to
> > volunteer their hours translating strings for us seems like a good
> > thing.
>
> Same goes for me, I'll take whatever's the easiest route for translators
> and work with it.
>
> > I suppose one advantage of Crowdin is that the discussions are placed
> > beside the translations, which makes it easy for future people to
> > correlate the two, and most discussions tend to be clarifications on
> > particular strings, rather than interesting technical conversation
> > that would benefit from the archiving afforded by mailing lists.
> >
> > AFAICT, the "issue" flag sends us an email notification, which is a
> > good thing if you need an answer.
> >
> > Jason
>
>
> Harsh Shandilya
