Return-Path: <SRS0=pWoz=ET=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BEDC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 02:57:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E9F20B80
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 02:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXP6LUOg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E9F20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ac227de;
	Fri, 13 Nov 2020 02:53:38 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 18c78856
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 02:53:36 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id u21so8294369iol.12
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 18:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=TzzYCXINiS2SCTOrP7lvZoJLxJngPTi/sD3uZCslVoQ=;
 b=sXP6LUOgvgauluutKbDvxiR0Iw1XO7wCzKWmyPh/cKCiETUnUMY1Jw7QM4it5J7eK3
 c6Dl5OyBE8PDiPoPUznND7F7GVRKb5MLVQA59NKnuFgeYHsp2Vml4MJb3P0qNxdUDErv
 AID/9ZpsCM7FGP8Pt7IyATknIOfyk5K2Qvc4J7lXPZQK20S2PoD5caV2K4CYCykmJtQf
 ySDHMivtTJYXlPmTlrtL6J8znmMizvm8wbvaPziXtL6ufqxHTQNrrFTn0Vji3hEp1dj4
 DcOozXUq7jNV+28ZTRFgRdArzlG162LjCMxsqEackPft9XGkclyoOlYyEw7/Zr3MJ6ow
 0JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=TzzYCXINiS2SCTOrP7lvZoJLxJngPTi/sD3uZCslVoQ=;
 b=hmaKL1MHDwAtKWlRNt5XShc09xKUsDgHPXk+QPVbA8ja7Sg6tSIQ04kKCiu0vi1T4h
 P7AMru4d/bQTDoPTxFp1Chr8USQLpfK3vUi3YK98PGYTjWapkhFgkhfF3zgd+NZWAkCu
 jSPx5JMqI8TNHd8zLHkO2vw7YTOTYms4KXHk1wHNhTZ5Fj13gEwJMY/EZ2oILpDU7Pry
 olGvv4loq8sdc5Fjr3rKWNAlLou8t2SFEzFQAmLDd7B5NG5f6AmWdKxOxTiQ4vOBxY3e
 A0x4Zll2cKbshoxzuvn9r9pMmEEahvK7urQq0gJLz4CXQySpVFO0q3eHFY+Zlc1f52Nu
 1gKw==
X-Gm-Message-State: AOAM532E4JoRzoi+OLri5fdHHvx2Lhj9HNmA9SdBJkt5Y8Nl+jYC/ucI
 6QjC7xh+6zperFE9lLLvUc1eMu7b34Bdd/j2y38zRDUNe/c=
X-Google-Smtp-Source: ABdhPJxBDxUoa/zfl7yoahQfAV8BE69yOQMEtcKN/wjl9NPS63XGtAol4D4YxDIeznCBnMWajVsIAMQnkNAk2f4PgRA=
X-Received: by 2002:a05:6602:2dd3:: with SMTP id
 l19mr242728iow.124.1605236258336; 
 Thu, 12 Nov 2020 18:57:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
 <20201112090313.GB3500@trivini.no>
In-Reply-To: <20201112090313.GB3500@trivini.no>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 12 Nov 2020 21:56:59 -0500
Message-ID: <CAH8yC8=azrpN=EOP9XsTDe2NwmqQquSpEuqidtS2rVFw8x+5Ew@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: =?UTF-8?Q?Berge_Schwebs_Bj=C3=B8rlo?= <berge@trivini.no>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, Nov 12, 2020 at 6:36 PM Berge Schwebs Bj=C3=B8rlo <berge@trivini.no=
> wrote:
>
> On Thu, Nov 12, 2020 at 09:46:32AM +0100, Phillip McMahon wrote:
> > Take a look here
> >
> > https://gs.statcounter.com/os-version-market-share/windows/desktop/worl=
dwide
> >
> > Would seem to suggest Windows 7 is in decline but still represents
> > around 25% of OS footprint out there.
>
> I read 16% from that graph, but that's still considerable.

My bad, try this:
https://www.netmarketshare.com/operating-system-market-share.aspx?options=
=3D%7B%22filter%22%3A%7B%22%24and%22%3A%5B%7B%22deviceType%22%3A%7B%22%24in=
%22%3A%5B%22Desktop%2Flaptop%22%5D%7D%7D%5D%7D%2C%22dateLabel%22%3A%22Trend=
%22%2C%22attributes%22%3A%22share%22%2C%22group%22%3A%22platformVersion%22%=
2C%22sort%22%3A%7B%22share%22%3A-1%7D%2C%22id%22%3A%22platformsDesktopVersi=
ons%22%2C%22dateInterval%22%3A%22Monthly%22%2C%22dateStart%22%3A%222019-11%=
22%2C%22dateEnd%22%3A%222020-10%22%2C%22segments%22%3A%22-1000%22%7D

I tried to trim the long URL but it lost detail.

The view with the long URL selected "Operating Systems" =E2=86=92 "Desktop
Versions" in the left side bar.

Jeff
