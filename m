Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF9EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 08:06:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7C5D60F3A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 08:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7C5D60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=meshify.app
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8293a2c9;
	Fri, 24 Sep 2021 08:05:58 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a64bbaa8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 08:05:54 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id e16so6127555qts.4
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=meshify-app.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+Y/f6kCrkj+kRKR6fqnGO2FkjE+jtSYxRjZQ2MlQZ0=;
 b=zDWG5jOmPoBNYIwZ2wrUMGx76zMyqXKU0y+oa986yOChrB0F5uJ7U6KGY/yun5DQG/
 ZqgwffJsGLXaEqSMi3VK8lU7mIg3b6c3IFZ8qwYQWeGC9zzhPw1QFZZSSU8Kft78NUKS
 gVSKUYwsC2Y8uuTJV67jCKsqauJkTGSxMEn+c8TQqdfVnGBf0/vSmv3S9f05MWL3CExZ
 w0j9x2G/+ZGuXTCxn4Yu5BVpKdy/E1RSHa65EtpAJUxcT+Y3p+13iKidwmW8qponUEQR
 d74Aptw9Fld1bzq3jBWauLbcvncnatPhuyEDfcIobFf7tKul6bYfNbwVs9YdpIq3OxNH
 Ohow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+Y/f6kCrkj+kRKR6fqnGO2FkjE+jtSYxRjZQ2MlQZ0=;
 b=ExcOtgHnM9u48wohe1qftXpv2ogCGrU2+1PmHgKzznImPi2WnI8OQmHIuR4joNchea
 4VkYNMVKcyzEPB8H8T34aOBaN66wedahmqmWu6jcwBHmezVvMb/JP9Tq+RF4XbsDOvim
 r+66nLJKKmLXJc0E/o0DIjyzabbyo5cUhotczdn9C4WRBSikdWNFaZEgVugFPNPzD7Mm
 siLbmt2sG3+0bXFYUDrBvbSrh7XFsWsY+7h8OyDKxAVu+Cxo2WaxjCZxK/5lqhIEK7sU
 FT2pDKnqzKCu/wUHWUYUOdodhdh6A0RWL6EK9X1xGm8t6EofjWS0wc9EKAS4rQWPKO5H
 jrBQ==
X-Gm-Message-State: AOAM5312orUjg2NGC9txrvsU2o7rVobRvKjMjKvLrWqmSEn+6PRlh8xc
 sIunsitSHpSmbXodrfOv1ekW29mrGTesU7MrECOkrrkXhr+HmQ==
X-Google-Smtp-Source: ABdhPJwFOso8F3qAIHFOvciteGiygLBxTE1fruMu1CLQ7xcNHP0yrSU/XIXOYTlBRmrRK9TRoYGCa7CB+p9Bg642xVA=
X-Received: by 2002:ac8:7594:: with SMTP id s20mr2780027qtq.158.1632470753334; 
 Fri, 24 Sep 2021 01:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
 <F238DB7D-1876-4821-ABC2-4FCF029FBB2B@anatoli.ws>
 <CAHmME9orYEOFa-33XvYs==XHjsUrxTn2BtOaVySwFuxS+oj+MQ@mail.gmail.com>
 <CAHmME9oH6s=x0W+aBvGumTtJ9=bj+a9SBy0TQxXv8ZtU-pnDBA@mail.gmail.com>
In-Reply-To: <CAHmME9oH6s=x0W+aBvGumTtJ9=bj+a9SBy0TQxXv8ZtU-pnDBA@mail.gmail.com>
From: Alan Graham <alan@meshify.app>
Date: Fri, 24 Sep 2021 01:05:41 -0700
Message-ID: <CAMeHLtwod6gk5Y5Dg4W2nX1AN=EWa-crixmR=ZpBd0e=vw5AqA@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Anatoli <me@anatoli.ws>, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I can confirm that upgrading wireguard, and then upgrading to iOS 15
works flawlessly with the released bits.

Best wishes,
Alan

On Thu, Sep 23, 2021 at 7:27 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Sep 23, 2021 at 11:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Thu, Sep 23, 2021 at 8:42 AM Anatoli <me@anatoli.ws> wrote:
> > > Please let us know in this thread when the update is in the AppStore.
> >
> > Indeed I will. It's been in the "waiting for review" state for about
> > 13 hours. So hopefully that'll change somewhat soonish.
>
> This has been released now. I'll send out an email in a new thread
> announcing this.
