Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68917C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 17:45:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948CD20659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 17:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVGlzsm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948CD20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 148f4ec4;
	Sun, 29 Nov 2020 17:39:32 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b8bbcb6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 13:34:29 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id i17so12640559ljd.3
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 05:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYTyuzt9UvVcj7AkLpN0QS2LWQcsmTpK3KHOYB9ueno=;
 b=sVGlzsm8ECHdmvzsXzUgdqoDpPM8nb4phm3uDE5rK360DNemq8pIqT7PLFLs8U1iAR
 LfW/24JpmLSbTNYBjy2MdHR7zhd0nPvfUr7q3SPfLkUn7lzpazduDtPhpDupIeptS/W+
 NCrpx8/6c7l5+WY4WpnB0r8IPVCCf1eXMcktnkIMdk3pkx19mCN1UdxEdrMGd0TTnMyG
 vN7Ba8lugmqrlBlozLrI2AcItvR6r+0Z0UVumlWp7Bk83A1LI1bmgYYf0Dix2iciSkYT
 qDDcJh/qq/ytwnkDlr1y0AUHvKrb6mCUo1u/JNprtOWopKvoRRWBmFRGvMqTRxAMOQfs
 tbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYTyuzt9UvVcj7AkLpN0QS2LWQcsmTpK3KHOYB9ueno=;
 b=HBaJNRF7Jgbls8PBr+8Ev1s7mhy7DQn9o+eVqfGKBZH7nI75gGywV0QLTqiSC4DFuh
 3+7G6lNJokplO6wtjEIxBjYc1mFl5iWOW1z8p+FH1E/DZninpUNu/Z6mUD9q3Q1xvDV+
 DlKOsoNoBwOIHi5b+IReF5dXWwJENMqvKWyWCBwwH9Bqtwcql317l3gvICHT+4uk671i
 UVRUcMudR3JTGpUizeFSbMGR5Dqwag2kW45pjUEDQF8MI3XWs/X8/W4S6FVPt+b+m3sq
 yWdvKlIuYmnkTuic8iJmmTDJ47rGjGap2P3vszjba1BH9RCUHcK5w0UJCjN9zomipV7T
 aW9A==
X-Gm-Message-State: AOAM532j5ynrayeMaPsZ0uAZdQGFklaB/kMqgJcrDmdbQvd8O77vH+qV
 MZC8iLGMtw/H/hdNaLTZwQWmKPlJX99ZRSURrrQ=
X-Google-Smtp-Source: ABdhPJwfVU1Y0hTSV/Hd9n8aYfSSuluOHyTti8RA9lfVEPVqQosmKzqCAJf3yCwq82m6fh6cPgw0kJuHyucCX6ToJhk=
X-Received: by 2002:a2e:a376:: with SMTP id i22mr7797821ljn.217.1606657238124; 
 Sun, 29 Nov 2020 05:40:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
 <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
In-Reply-To: <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Sun, 29 Nov 2020 14:40:03 +0100
Message-ID: <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Adrian Larsen <alarsen@maidenheadbridge.com>, 
 Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 29 Nov 2020 18:39:31 +0100
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

Hi Jason,

I have been following the wider thread and maybe I misunderstood but
believe the solution requires some registry tweaks and membership to
the Network Operators Group, along with Windows Home requiring the
creation of a group not officially supported on that platform. Correct
or not?

It was with all the in mind that I wrote the two points.

"The topic is closed and the discussion over". Seems a little over the
top Jason. A year ago you concluded there would never be a solution
for Windows outside of full admin. End of discussion. Now we have
something that isn't full admin. Clearly times and positions can
change. But you might still not be at the final version, you might
want to incorporate a little more of the experience of your members to
get there.

Phill

On Sun, 29 Nov 2020 at 13:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Sun, Nov 29, 2020 at 1:09 PM Phillip McMahon
> <phillip.mcmahon@gmail.com> wrote:
> >
> > Interesting thread to follow.
> >
> > My larger concern here is that without an officially provided method
> > to run wg as non-admin on supported Windows platforms the following
> > may happen
>
> Maybe you should keep following the thread? There _is_ an officially
> provided method, and it has been released, and you can go to
> wireguard.com/install/ to download it and read all about it in the
> release notes posted to this list. This topic is closed and the
> discussion over.
>
> Then Adrian Larsen decided to jump in and request a totally unrelated
> feature, rather than starting a new thread for that. I indulged, and
> here we are.



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
