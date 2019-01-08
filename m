Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8968FC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 12:54:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFA620827
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 12:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chmd-fr.20150623.gappssmtp.com header.i=@chmd-fr.20150623.gappssmtp.com header.b="iKeSRTWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFFA620827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chmd.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9117493f;
	Tue, 8 Jan 2019 12:50:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ab1def7
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 12:50:31 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed83dbb5
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 12:50:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b3so4132550ede.1
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chmd-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N7AjfR2ReQF6uh4suN1bfFWzY5y4W0CRCtmG8LGa91o=;
 b=iKeSRTWKm6cihgSsTWB1gE/67t5pWUyop/OHNM4f1VNk9PsMliqXHRKbWa9G5tE3N5
 ugA5lL+XrOIlsmZKpJXHY9El1/4cBFZtW0Qx23m0QKLwzqSMUL0+vom1vQTpDg48QJM3
 cgf2CqJsApIILjJqYrf/C+4oPy6h4soxLxcUU06FqDdo3oUd2cL8u9tkfzxsYRXANr7a
 Ilb4jetYZ8qI0OekQ+enUT6IwUs76N8GPopCZeUX4qi80jI0352umC4ws/Xiy5Cq1C96
 Fmp3D5dPSaIMGlLsSIziAqEgy4/N1VHJ3VkK5gerEd5bmpsr3De677nVYV7vnKxJW7yJ
 I2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N7AjfR2ReQF6uh4suN1bfFWzY5y4W0CRCtmG8LGa91o=;
 b=AJo4dEg5Fe4ppxkblZFi5/AJBV1OUeW/z9/6RG/HM0urNVW5NKe7ZFCW7UxWi4n/qM
 o+Z//oPz8BDv0+CRBUskTligSScSXyBD997HdXAlMxcCOMuqo7V59XVCLZpgCrEUQ3Mu
 EdIL/fqeQVFuvHoeSJxm5CoLXfqCcsceAO3ix79H1O/EPxH3BERU62rUmjeekkz6NFDO
 kx16eGCURw9UMXScnEVpxgPbawkGiuHdvud126h04drvpgW9KhD707PlGWzjxejFtVGJ
 i09Xt0Gqj2XCY/n0CxpmfPabKskE13o7TpKUw8NcQ5mIzdRWflNM6ifZTgzi20hgAP3z
 c1Xw==
X-Gm-Message-State: AJcUukcNwCnBeyzA2qcpdT4jvQfFbORdSV//0/oJwc7qwdzJ6r3vyH/r
 zYtw2l4u+ij/Xur4C6zbaUHNvNrdVZ0G6+HB64c=
X-Google-Smtp-Source: ALg8bN61mOxwW2oHnr9wCgosIJJFXjgvKuKs7md+eWCk9kKtKHIZ6VdKRs7KwBJ3r5VeqbzhRuNZcuejXKnY00qw06Y=
X-Received: by 2002:a05:6402:796:: with SMTP id
 d22mr2037192edy.81.1546952017087; 
 Tue, 08 Jan 2019 04:53:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHLp1Y=_RavxCeoV5nQ+R96GTiY+jF9gvNox25B2XO9CVU+jMQ@mail.gmail.com>
 <CAKXLc7f_aDxkasodm0YCBysd63we-L1FeTnsRoZbTvckzEUp0A@mail.gmail.com>
In-Reply-To: <CAKXLc7f_aDxkasodm0YCBysd63we-L1FeTnsRoZbTvckzEUp0A@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Tue, 8 Jan 2019 13:53:25 +0100
Message-ID: <CAHLp1Ykc8mA=WCX+P_fmfUi8DLmSSUo1DpNx6XKnV7wLWwf9uw@mail.gmail.com>
Subject: Re: [Android] Wireguard on the Amazon FireTV stick
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Cc: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============6804449466970054517=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6804449466970054517==
Content-Type: multipart/alternative; boundary="000000000000769225057ef1d5ad"

--000000000000769225057ef1d5ad
Content-Type: text/plain; charset="UTF-8"

>
> I guess it allows also a full shell... adb shell ?
>

Yes, adb shell works.


> No way to plug USB keyboard?
>

A keyboard would not help, you can't focus the area I need with the arrows.
You need a mouse. It is also impossible to connect a Bluetooth mouse on the
Fire TV stick (only on the regular Fire TV [1]).


> Or better controller: https://www.youtube.com/watch?v=QfmuXuYI288
>

This is their smartphone app, it does not give you better control of the
UI, it is just a virtual remote.


>
> https://git.zx2c4.com/wireguard-android/tree/app/src/main/AndroidManifest.xml#n49
>

So I guess the correct intent would be
com.wireguard.android.action.SET_TUNNEL_UP, but I guess I need to provide
the name of the interface as a payload? Thanks for the pointer, I'll dig in
the code to see how the payload needs to be provided.

[1]: https://www.amazon.com/gp/help/customer/display.html?nodeId=201739960 "You
cannot connect a keyboard or mouse to Fire TV Stick."

--000000000000769225057ef1d5ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess it allows also a full shell... adb shell ?<br></blockquote><div><br=
></div><div>Yes, adb shell works.<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
No way to plug USB keyboard?<br></blockquote><div><br></div><div>A keyboard=
 would not help, you can&#39;t focus the area I need with the arrows. You n=
eed a mouse. It is also impossible to connect a Bluetooth mouse on the Fire=
 TV stick (only on the regular Fire TV [1]).<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Or better controller: <a href=3D"https://www.youtube.com/watch?v=3DQfmuXuYI=
288" rel=3D"noreferrer" target=3D"_blank">https://www.youtube.com/watch?v=
=3DQfmuXuYI288</a><br></blockquote><div><br></div><div>This is their smartp=
hone app, it does not give you better control of the UI, it is just a virtu=
al remote.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<a href=3D"https://git.zx2c4.com/wireguard-android/tree/app/src/main/Androi=
dManifest.xml#n49" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.c=
om/wireguard-android/tree/app/src/main/AndroidManifest.xml#n49</a><br></blo=
ckquote><div><br></div><div>So I guess the correct intent would be com.wire=
guard.android.action.SET_TUNNEL_UP, but I guess I need to provide the name =
of the interface as a payload? Thanks for the pointer, I&#39;ll dig in the =
code to see how the payload needs to be provided.</div><div><br></div><div>=
[1]: <a href=3D"https://www.amazon.com/gp/help/customer/display.html?nodeId=
=3D201739960">https://www.amazon.com/gp/help/customer/display.html?nodeId=
=3D201739960</a> &quot;<span>You cannot connect a keyboard or mouse to Fire=
 TV Stick.&quot;</span></div></div></div></div></div>

--000000000000769225057ef1d5ad--

--===============6804449466970054517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6804449466970054517==--
