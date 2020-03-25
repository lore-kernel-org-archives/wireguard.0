Return-Path: <SRS0=FIfu=5K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60834C1975A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Mar 2020 14:54:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF7420722
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Mar 2020 14:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF7420722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d75e69c1;
	Wed, 25 Mar 2020 14:47:34 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7799c873
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Mar 2020 14:47:31 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x3so2818680qki.4
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 07:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=thy0RU+/w4bLEePmDmO2flS1Epd2jzwiRBJV8I/eUUg=;
 b=PZyy0FKbTA9WxQXOrjqSwmc3EzVLRlib/tSF4h4ilcOQq+ntGwSQkJmRkkigcP1hqR
 oNumgS0QN5gZ7ipQc+D9yBn+IvCiI9oMEkvKYz3Dw/Nj9OLAPQPTBaLoZGrQsIk0zyXM
 E8YvKehTuyDSwidJNNdKHfw9uPTJhd8P210SAuKmhfGciHYelJUDIesjKkI5/YM9jDX5
 Ci7C7gtCraSZaDdAy195VNwFr3JeY9/hmGRmuQCsWxmwWxFC2I2y5cQSGxZBhBImaI6N
 X/VQmyYinJIihEZ/QbIEs/tITyXQUmL+ZCTK6BwNhKaPbmmizIn3YxdKoDlyMlpKoDpm
 O2MA==
X-Gm-Message-State: ANhLgQ0s6iKZ68VHfgWw0bIUECRb5ZZzjuABhdA4feYuv9Jhbyy1L6hl
 D4YC8q3wu1WDVeXj079bqGC8Lq5pLjc=
X-Google-Smtp-Source: ADFU+vvjhLWIK+c7be5kH83YXp8drhofVYV7BE9mekJYdhx6fuMsW4N/o4sWrYCsDL//Opb7MqpfCw==
X-Received: by 2002:a37:bd81:: with SMTP id n123mr3229228qkf.269.1585148086724; 
 Wed, 25 Mar 2020 07:54:46 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id y5sm15946449qkb.123.2020.03.25.07.54.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 07:54:46 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i4so1311483ybl.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 07:54:46 -0700 (PDT)
X-Received: by 2002:a25:2a81:: with SMTP id q123mr6326886ybq.80.1585148086047; 
 Wed, 25 Mar 2020 07:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200325121633.2991-1-tanioka404@gmail.com>
 <CAA2ss9EmcPW=z9kRhGjDandHx=yGj6-UWx39EHsZx9qnfmCi1Q@mail.gmail.com>
In-Reply-To: <CAA2ss9EmcPW=z9kRhGjDandHx=yGj6-UWx39EHsZx9qnfmCi1Q@mail.gmail.com>
From: Harsh Shandilya <me@msfjarvis.dev>
Date: Wed, 25 Mar 2020 20:24:34 +0530
X-Gmail-Original-Message-ID: <CALpmF+GcKO3VZ_GBhWgyJWw6=NmOPXd_rOO+dYFx+ziGypPHKQ@mail.gmail.com>
Message-ID: <CALpmF+GcKO3VZ_GBhWgyJWw6=NmOPXd_rOO+dYFx+ziGypPHKQ@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] Explicit indexing for
 'import_partial_success'
To: Eiji Tanioka <tanioka404@gmail.com>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, 25 Mar 2020 at 18:26, Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Or is it possible to apply this fix only to Japanese in crowdin?

There's no need to do that, this fix is applicable to all languages
including the default English.

> 2020=E5=B9=B43=E6=9C=8825=E6=97=A5(=E6=B0=B4) 21:19 Eiji Tanioka <tanioka=
404@gmail.com>:
> >
> > When translate it to Japanese, values are exchanged.
> > For example, '1 of 10' is '10 =E5=80=8B=E4=B8=AD=E3=81=AE 1'.
> >
> > So this string should be explicit indexed.
> >
> > Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> > ---
> >  ui/src/main/res/values/strings.xml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/ui/src/main/res/values/strings.xml b/ui/src/main/res/value=
s/strings.xml
> > index 70d92c3..74c5be6 100644
> > --- a/ui/src/main/res/values/strings.xml
> > +++ b/ui/src/main/res/values/strings.xml
> > @@ -13,8 +13,8 @@
> >          <item quantity=3D"other">%d tunnels selected</item>
> >      </plurals>
> >      <plurals name=3D"import_partial_success">
> > -        <item quantity=3D"one">Imported %d of %d tunnels</item>
> > -        <item quantity=3D"other">Imported %d of %d tunnels</item>
> > +        <item quantity=3D"one">Imported %1$d of %2$d tunnels</item>
> > +        <item quantity=3D"other">Imported %1$d of %2$d tunnels</item>
> >      </plurals>
> >      <plurals name=3D"import_total_success">
> >          <item quantity=3D"one">Imported %d tunnel</item>
> > --
> > 2.25.2
> >

Applied, thanks!
