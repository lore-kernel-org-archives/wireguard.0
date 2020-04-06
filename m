Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BAEC2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 05:13:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC322074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 05:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vEL50sOZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC322074F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 952a39bf;
	Mon, 6 Apr 2020 05:03:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc714045
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 05:03:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58efbe25
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 05:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=hHu7g8jIMFjo
 nnOsqsn9nWl5VgY=; b=vEL50sOZYscnlYcp62RcAIaAHu11ToG3QwDRiwYuKdTK
 kuxm7Q7I+f6GMfkCCGAQRLXPFAo1jmGu+PZiFxD9/6B9UzwgiiRGPPfuboMa9GDW
 jkwNdXrAUw7icL84SGjPkpxgoc+eUjN0v+L5a6WXd12XwP8IZ6EaSsMJoC7TXhho
 j2HD5ArTizlm8q/XBPgLDod0It/3GuDCxo6phCyPnxkXAeyXLQL+4BVWHfJCwBOv
 hCY6p8/crRMJu7tfdUJdZCTKcXKjwx2S1zLxwRJo3cPDS0wb+u9mipLhXRgsnYqM
 dXdxLPuEy9/1epV/1mz+9o+MKpoAZCxlsqtrJuquXw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3511b884
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 05:03:15 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id u2so935321iop.10
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 22:12:00 -0700 (PDT)
X-Gm-Message-State: AGi0PuaEvdwPv8PYFXdRRerImaX0HqFNDqFPD6o05Ix+ZrkuOgx0OZJD
 ndN35vVcYwGumFF5j7eTJrCjP0exeiK3mY4poqk=
X-Google-Smtp-Source: APiQypIzMvi/knORH+Ecv0yJPeHlXxCX+5vpZyXMBe9FLrXg9DiGhW0VspBKFcZbIklCf3+PsjzCsjbG8Tdcl5HXrtk=
X-Received: by 2002:a02:a68e:: with SMTP id j14mr1857415jam.86.1586149919854; 
 Sun, 05 Apr 2020 22:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <A37EAA6A-CB8A-4CA0-844A-C5A54152BF98@alexy-rousseau.com>
In-Reply-To: <A37EAA6A-CB8A-4CA0-844A-C5A54152BF98@alexy-rousseau.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Apr 2020 23:11:49 -0600
X-Gmail-Original-Message-ID: <CAHmME9okzeuM-830h8QtwM-szp5GcT2i5mYC1ZSKN+KLA=eqXQ@mail.gmail.com>
Message-ID: <CAHmME9okzeuM-830h8QtwM-szp5GcT2i5mYC1ZSKN+KLA=eqXQ@mail.gmail.com>
Subject: Re: Some difficulties to initiate a simple tunnel with Android
To: Alexy-Rousseau <contact@alexy-rousseau.com>
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

On Sun, Apr 5, 2020 at 11:03 PM Alexy-Rousseau
<contact@alexy-rousseau.com> wrote:
>
> Hello everyone,
>
> I want to create a very simple app where the user can connect itself to t=
he VPN without any configuration.
> If I understand everything clearly I just have to use the tunnel module w=
ho implements the wireguard-go version.
>
> I=E2=80=99m a little bit confused :
>
> - I read the source code of the tunnel path and the ui module and it seem=
s that there is some dependencies between ui and tunnel.
>
> I have some questions :
>
> - Is it possible to use very simply the tunnel module, without ui and ini=
tiate very simply a VPN connection?
>
> - Do I have a good idea by using now the tunnel? Will the compatibility o=
f the library be maintained with updates?
>
> - If the main difference between the Android & iOS app is the implementat=
ion of the tunnel module, is it a good idea to create a flutter UI with two=
 different ways to communicate with the library for each OS?
>
> Thanks in advance for your help!
>
> =E2=80=94
> Kind regards, Alexy ROUSSEAU

Things are now nicely modularized. Include this in your gradle:

dependencies {
    implementation 'com.wireguard.android:tunnel:1.0.20200329'
}

And then you'll be able to embed a tunnel in your Android app.

Documentation is available at:
https://javadoc.io/doc/com.wireguard.android/tunnel/latest/index.html

We're working on improving these docs, but here's a small sample
project that might help:
https://data.zx2c4.com/WireGuardTestApp-88b19fa5-8117-4835-b788-eac338113fa=
a.zip
