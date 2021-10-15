Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19868C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 21:17:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359E460EB4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 21:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 359E460EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc7eaa10;
	Fri, 15 Oct 2021 21:17:16 +0000 (UTC)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [2a00:1450:4864:20::142])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ffb4dd2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 21:17:14 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id g36so30186123lfv.3
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 14:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6nLcVSiNqzhg2S1sknImdCwn7GT+pc7DUm8nVUgbFLg=;
 b=afuBa0yUkMSe43YAbJKDWWQt36P8nyh5xBbjMauTXQDYlA3ijB5BugQKJ4cp7VPfqN
 8HjWtGa1E+TFGMI16Mmlv+sYkXUCzmhNi2k20YncxkDT6suA9wtuz28/TAoHMZxODpD6
 kNsmAJYbLuGfG1R9nmWtFa/cG/lP/TRHGoEnZQnYYAmgqJ1QFxMOA5t/wXoNr/uuF81N
 3jEK2tv+VF8jBKR52oS9czS8iPulLdTk5gCQQLhdbgs2hfQ7atV10+9yk6YsMOCjJ8Dh
 NrEbOGFDJHUNjj8+8nFq0yqTyeM9A8BV13HkNwUHbCUC9og/tHxwfv73571pJdywxU9M
 wRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6nLcVSiNqzhg2S1sknImdCwn7GT+pc7DUm8nVUgbFLg=;
 b=5ZsGnOR2CqES71nzl3xdXiBNZWoO03X+DKSCjSrYiFAc73vy5PDWgFTHIhN0Hhqfpk
 tvLoF6b4UUmo6/XosDLBw+xvoK++rGJelx9K4VZMKvBg8cazH2G+12QjmwM64vt3ZvIB
 a8o2Q4RfCE6t1hJEUuF6LgMXQrRsiTb8U2eV7csVr0tguclzgZKiFOmLRpI7EMM4BQQr
 4dq5WKREAS62fuf+LnjE+2eocCT5aLlU+71og0l0cepPZ7HE4GeORQUaXRT4JWT3+4Zb
 yzB/qZmXpfiyQXH3S2eUTPsHRn6mU6XUFxsw/bBpeMRhu0Dn7B/uI7UhY9jIggzxl2rY
 Uf9Q==
X-Gm-Message-State: AOAM530PfQK/DkAryvB44P3VHlyLM6RuFOIqZ1tClJKxvLmwFQEb2mWP
 KkpobLZ0U31GU1xDzQpH1ooQBy3Qbw6Fj20qxavYCdDwO5Q=
X-Google-Smtp-Source: ABdhPJy5gwEk1tC81Q/FpptCySqdQRCzMXIouLImK+kS/YwH4NHSwC44mfzaFrIPT+ZDtRZuQxK5qqr8Ddu2zwVmwkQ=
X-Received: by 2002:a05:6512:5c2:: with SMTP id
 o2mr12804422lfo.207.1634332634126; 
 Fri, 15 Oct 2021 14:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9p9XxAhh4WgZgRiMRFxahp2wabPr-KuW=AdVQyRsHaD+A@mail.gmail.com>
 <CAJhSV8uZ3nGOL9-oUu=wL1CiY7Eeux0UYzsL4psMWeR1D73VMQ@mail.gmail.com>
In-Reply-To: <CAJhSV8uZ3nGOL9-oUu=wL1CiY7Eeux0UYzsL4psMWeR1D73VMQ@mail.gmail.com>
From: Matthew Poletiek <matthew.poletiek@gmail.com>
Date: Fri, 15 Oct 2021 16:17:07 -0500
Message-ID: <CAJhSV8vEJs4zhBTzKP2n8n4db87bBmBpFys9C5UYPkMdDbX+pg@mail.gmail.com>
Subject: Re: [WARNING - iOS 15] Update WireGuard to >=1.0.15-26 *before*
 updating to iOS 15
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Disregard. I figured it out. I have a different issue now, but am
working on more details. Tunnel immediately disconnects after
connecting.

-------------------------------------------
Matthew Poletiek
303.810.9082
matthew.poletiek@gmail.com
www.matthewpoletiek.com



On Fri, Oct 15, 2021 at 2:58 PM Matthew Poletiek
<matthew.poletiek@gmail.com> wrote:
>
> Hi,
>
> Thanks for the update Jason.
>
> Unfortunately I wasn't reading and didn't prepare properly. In XCode,
> does anyone know the best way to upgrade the wireguard-apple package
> so my custom app can leverage the latest fixes?
>
> Thanks again,
> -------------------------------------------
> Matthew Poletiek
> 303.810.9082
> matthew.poletiek@gmail.com
> www.matthewpoletiek.com
>
>
>
> On Thu, Sep 23, 2021 at 9:25 PM Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> >
> > Hello list,
> >
> > Due to buggy changes Apple has made to the Keychain on iOS 15, older
> > versions of WireGuard on iOS will *eat your VPN configurations* when
> > upgrading to iOS 15. This has been fixed by [1], which is now
> > available as of version =E2=89=A51.0.15-26. If you are still on iOS 14,=
 before
> > updating to iOS 15, please remember to update the WireGuard app to
> > this latest version in the App Store.
> >
> > Sorry for the hassle.
> >
> > Jason
> >
> > [1] https://git.zx2c4.com/wireguard-apple/commit/?id=3D03a59ff38e96fb3b=
b5dde2f15fe42198d1dfb995
