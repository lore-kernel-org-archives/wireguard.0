Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BE1C3F2D1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528AD20870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldWrrr/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528AD20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18c845d1;
	Tue, 3 Mar 2020 23:08:50 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab0c6993
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 22:24:08 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id v22so2632673qtp.10
 for <wireguard@lists.zx2c4.com>; Sun, 01 Mar 2020 14:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhB5FoYDLcMgXyxTOwlUxe0YJIbnHpD5VvR8R5NZQx0=;
 b=ldWrrr/iHCUFu2Jipn+p2pTEGOFYo8j7Pk0S3w0uOnYeZRXHVL+lSNwZAVcjIJy6c1
 FMNKlOtIlSZF+E/v4nRfAMpm0+xqJ/xqnFlaWMKqgj4Vc9dG7hVp/AK+9Xn9o7+KYmcV
 6BM1mLB46gyHfp6tlyc96aQ7uCln6essb/8NjW0PeCMfxpmHPbGP06gA6Z3MzOLLZEmw
 c1Rwz+OrboGYBB1id0adlqE0YI+aWo9GFfLi186LPkXC/SZrW5oEyLbDvJuQ7F1vLzb/
 7Hc/jINeHBu7mxvXYbisLeOkHhSRtyZg69p39Khel4v0YEioVr5dnPimkKIeGXsPY61W
 Vp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhB5FoYDLcMgXyxTOwlUxe0YJIbnHpD5VvR8R5NZQx0=;
 b=nOeLSo5DLugvUMoHvo3P9dly5OIM+DPqAz3OxSn9z/y6VqsbgBHRVoaY3efizMBW0P
 SwNjeSdewWx0vLeVy1wUQrFDjwTTocAIKIRm13svimsYmbYBfqDMLcF7zCKE+KxJltMC
 6QW6oh9AqwRXAA5VBJb7n+CByNJ3kV90binAga+s9ar9F70NAMGkoD1QMAMSL1Tc1pHD
 64ZRS4SET/kdAQIiyF87IN+kmdLUFVWsq4VtHPNwOB141GmWTY7v2nSYoIy1CkX88syT
 HjSA+joc0SxY4c0EYs1HqFFUxE5OmwfxRTsmXu/4IQpjiB9bZEb1czKBk8IqKVJOJs4k
 RI1Q==
X-Gm-Message-State: ANhLgQ2b7oKzLV7RUTA2tu0f1loi2bbnzjL8o+vmpt9hA0gPzUfaoM6G
 Wa1ObQF2lzdoIl8f1uenQQUxwIVzKXGEdGaYuWY2ard5
X-Google-Smtp-Source: ADFU+vvMG7rhfCVHp3hVNORrXW/ERoWL4eLYfdIT+rI0HVJ/FTLUGG7prvuuOuCcqwWeJpSZ9WuabS6sjSOgSdBnvcY=
X-Received: by 2002:ac8:7109:: with SMTP id z9mr3131116qto.146.1583101700504; 
 Sun, 01 Mar 2020 14:28:20 -0800 (PST)
MIME-Version: 1.0
References: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
In-Reply-To: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
From: Andrew Long <andrew.longiii@gmail.com>
Date: Sun, 1 Mar 2020 14:28:09 -0800
Message-ID: <CAKVe9vztS3LA1xc1Xz80Z9NrTvR_gi8k10YKSnneqMDh3L_bUg@mail.gmail.com>
Subject: Re: macOS Catalina failing https
To: Sean Baildon <sean@baildon.co>
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:45 +0100
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2372907753926512966=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2372907753926512966==
Content-Type: multipart/alternative; boundary="000000000000807f11059fd29647"

--000000000000807f11059fd29647
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

im not experiencing any issues on catalina, mac mini  drsktop device, i
tthink fo the last 2 osX updates


On Sat, Feb 29, 2020, 03:39 Sean Baildon <sean@baildon.co> wrote:

> Hey,
>
> Recently purchased and upgraded a new MBP to Catalina.
>
> Requests to https enabled sites over the VPN no longer work, even
> using my old configuration. Requests to insecure sites=E2=80=94ex.
> http://example.com=E2=80=94work just fine.
>
> My iOS devices work as expected. I've tried using the iOS
> configurations on the laptop, but it's the same behaviour; hanging.
>
> I'm using the Mac App Store version of wireguard on a vanilla install
> of macOS Catalina. Are there any known issues? Happy to provide any
> useful debug
>
> Thanks,
> Sean
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000807f11059fd29647
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">im not experiencing any issues on catalina, mac mini=C2=
=A0 drsktop device, i tthink fo the last 2 osX updates<div dir=3D"auto"><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Feb 29, 2020, 03:39 Sean Baildon &lt;<a href=3D"mailto:sean@=
baildon.co">sean@baildon.co</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hey,<br>
<br>
Recently purchased and upgraded a new MBP to Catalina.<br>
<br>
Requests to https enabled sites over the VPN no longer work, even<br>
using my old configuration. Requests to insecure sites=E2=80=94ex.<br>
<a href=3D"http://example.com" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">http://example.com</a>=E2=80=94work just fine.<br>
<br>
My iOS devices work as expected. I&#39;ve tried using the iOS<br>
configurations on the laptop, but it&#39;s the same behaviour; hanging.<br>
<br>
I&#39;m using the Mac App Store version of wireguard on a vanilla install<b=
r>
of macOS Catalina. Are there any known issues? Happy to provide any<br>
useful debug<br>
<br>
Thanks,<br>
Sean<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000807f11059fd29647--

--===============2372907753926512966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2372907753926512966==--
