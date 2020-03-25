Return-Path: <SRS0=FIfu=5K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0294C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Mar 2020 12:56:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830202076A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Mar 2020 12:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdtZ1/Ns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830202076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0eaa334;
	Wed, 25 Mar 2020 12:48:12 +0000 (UTC)
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [2607:f8b0:4864:20::e43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 866c1d41
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Mar 2020 12:48:09 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id e138so1367316vsc.11
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=BCdUM4OvWkZ5WAlQ/2VOXu/nCmI9KaxyDYn86CZynR8=;
 b=LdtZ1/NstBGCkn5tZ/3DekGT7HTCjS2paXajU4OtUqrOVZUsXQaqE5mfVAtN5GLdxB
 ZIMyFefvl+ooUMSetERdjDmD0bISMxnU/JF+T1iNc1Fe32d0vPleAvqdby0RNNMD6guB
 aG+rjbJUk8dCOBbGzOxdHiA49lyjFw0N1ZkAvVG7qij3cQS7dvVXcFQHW46kgzQbhM3o
 POtZhLaMtLwFySYY+0X8hu+vb7JGzBKGmgPNOgRAxh28d9zSuUMgUN86Dhl+GXu+49OW
 dsCnxuTM5iY16p+/A0SA95yRX4EEg7ZQ9J0Q0UnXAivlDjzfbOpHWA3JNvVDVqRTQO2U
 x78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=BCdUM4OvWkZ5WAlQ/2VOXu/nCmI9KaxyDYn86CZynR8=;
 b=LuumllCHbtQIBJ9mQDxdkrf+fvOhDYOteRU/fwXROyiwrRkUrW9exk8RxPdw38nkEg
 Fweun/jpTqbKWj6Hvq49oFYTca06oKPNHOM+0X6AWJWBl8cDo8EgOyX6Y1POg+Smnvcd
 ixMZdKr0y595YkAEqX+/YLOJbGMk6Luj1DFFjahbVhU+LTvFnm0lzWea0Y2geYpyMqq+
 wI5IgYooxWAeNx78ohCqiCdGNputrpPsF80KeH5+rGa5rbeUGoE37+49F84DRii9RN9e
 uPGvRFYSsvifKKZev3LMJLdgYQy5BH53yoObVpxxs0KK8Ss3vQxfSzpBLWZjvGx6H7d9
 ZT2g==
X-Gm-Message-State: ANhLgQ1zeHGq4deoOsXaY1ujqPYVRBZOcQHZYWlF30ruhnxgK3tkxd0m
 8/Bv31DTbHREoatU2kBJVNYGbOp6b7KaYt9j9iyfdOuI
X-Google-Smtp-Source: ADFU+vsWXjihPpY5TGB8O31CxuOLCtLX2gabrhu0FF5BWgcNH5ArUbd6XwMhWfI4CcSRLI3tmFge4NAne9oK32SLJhY=
X-Received: by 2002:a67:d501:: with SMTP id l1mr2323160vsj.75.1585140923780;
 Wed, 25 Mar 2020 05:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200325121633.2991-1-tanioka404@gmail.com>
In-Reply-To: <20200325121633.2991-1-tanioka404@gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Wed, 25 Mar 2020 21:55:12 +0900
Message-ID: <CAA2ss9EmcPW=z9kRhGjDandHx=yGj6-UWx39EHsZx9qnfmCi1Q@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] Explicit indexing for
 'import_partial_success'
To: wireguard@lists.zx2c4.com
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

Or is it possible to apply this fix only to Japanese in crowdin?

2020=E5=B9=B43=E6=9C=8825=E6=97=A5(=E6=B0=B4) 21:19 Eiji Tanioka <tanioka40=
4@gmail.com>:
>
> When translate it to Japanese, values are exchanged.
> For example, '1 of 10' is '10 =E5=80=8B=E4=B8=AD=E3=81=AE 1'.
>
> So this string should be explicit indexed.
>
> Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> ---
>  ui/src/main/res/values/strings.xml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/src/main/res/values/strings.xml b/ui/src/main/res/values/=
strings.xml
> index 70d92c3..74c5be6 100644
> --- a/ui/src/main/res/values/strings.xml
> +++ b/ui/src/main/res/values/strings.xml
> @@ -13,8 +13,8 @@
>          <item quantity=3D"other">%d tunnels selected</item>
>      </plurals>
>      <plurals name=3D"import_partial_success">
> -        <item quantity=3D"one">Imported %d of %d tunnels</item>
> -        <item quantity=3D"other">Imported %d of %d tunnels</item>
> +        <item quantity=3D"one">Imported %1$d of %2$d tunnels</item>
> +        <item quantity=3D"other">Imported %1$d of %2$d tunnels</item>
>      </plurals>
>      <plurals name=3D"import_total_success">
>          <item quantity=3D"one">Imported %d tunnel</item>
> --
> 2.25.2
>
