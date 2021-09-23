Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187D7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:19:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB0A60F39
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FB0A60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 934a9f21;
	Thu, 23 Sep 2021 03:19:37 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 257c5812
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:19:33 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id k17so4445923pff.8
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 20:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Tm0zF+uiLYlbpfEeTo5cCA1h3uycP/Nmntles38ziXE=;
 b=RdFOIeJrPMehOCV+1dEvQ3Zx4s0d5tIw2Jao+j1XsR67BioRi47AeiM/Rf8h6nZfW1
 3ky4Xcsfl8Ddifs7mhWRd+0ob1jT7UdLzkAEb9T6WNUST48oTEfHoaoMUNEWvEUC4Gql
 AMyndAKT6/ZoRY4DaJoVpbhD7eyJg7jZPLz/nXGK85AwyYXFezq/syRhZ4x5jw3pQxsl
 bg6UBWbMs56bhIiJBUzgeAXHyUa5L2j/ktf42LAuzeLK5cQDvOhzNgwLf0HW5Lmd8kgJ
 d+bZgPHNknaB6PJAPlEE8QUJmcHs+OhAPNQ0JkAeOQre9rWHerDw2vxis5WT49aQQ98V
 z8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Tm0zF+uiLYlbpfEeTo5cCA1h3uycP/Nmntles38ziXE=;
 b=CEN7clcL3hZwtFpqfl/EBsY17Bn1j1hUYZ8R2ROLmu1D8KgAv0Fw0HRwP4Mq3ymhR5
 220FVz1L04VOZRo8G06qgP8fQBQk0FRiLlky9//ti64X/xTBUEFq/yH2tKlKIm9+uOJA
 O4kIZ1frHuwNr/azc0GAIhIPFFXunSf8FF1K7SwzS3aJxdQ1NfMqqqFO9J9uN6rHHw0s
 CpoJSQ46OGL8NiDHdl7sX2xVL0Lbhe5xfpJ0brMwJbWHWSwwLngS1qBxZw1NdxlgrcXG
 K1pwvmViyVg1w/XDkw7p52aTENltHPTOuoIDo4YrCU2E4ynGxXSb01AvcdW1E+FlykWY
 7TSw==
X-Gm-Message-State: AOAM530Vzhi2F2ZIsqASlIXm5O2n6sDebdFnZ1+6DlKgpVMprMwWuVsI
 P6inBs0Pr+TAZhEoZRkZgj4=
X-Google-Smtp-Source: ABdhPJxTsMbeXDQvjQlUrjAzZQGhfVd7DFziD6UZzp8bzaWR9JaB2AcB+UvvdLvwBOXjU2T38G4NKA==
X-Received: by 2002:a63:1748:: with SMTP id 8mr2113980pgx.350.1632367172009;
 Wed, 22 Sep 2021 20:19:32 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id p4sm4056706pgc.15.2021.09.22.20.19.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 20:19:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
Date: Wed, 22 Sep 2021 20:19:30 -0700
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>,
 Roopesh Chander S <roop@roopc.net>, Alan Graham <alan@meshify.app>,
 oss@jacobwilder.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B181919-09C0-4908-82F2-DD5661C53FD0@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
 <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
 <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi,

> On Sep 22, 2021, at 8:09 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Oh, I didn't realize that was happening. Are you *sure* about that? Is
> the tunnel actually working? Or is it on, but crashing? When I go to
> enable the tunnel from the system preferences view of it, it starts
> and then stops, indicating the network extension couldn't open the
> keychain ref either. And in the log, I see the [NET] process indeed
> failing in the same spot as the [APP] process.
>=20
> Jason

  Yeah, I=E2=80=99m 100% sure they were working fine after the update =
but before I launched the app and touched the on/off switch there. I =
only noticed the problem due to the emails here, as the tunnel itself =
was working smoothly (I only have one per device and it=E2=80=99s =
on-demand, so I rarely interact with the app itself).

  My initial assumption was, after iOS upgrade, the network extension =
was able to read the data to create the tunnel, but the app corrupted it =
as soon as I tried to turn the tunnel off through the app.

  Regards,

Miguel Arroz=20

