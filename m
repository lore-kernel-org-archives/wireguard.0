Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368E1C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:50:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B870F24655
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=revathskumar-com.20150623.gappssmtp.com header.i=@revathskumar-com.20150623.gappssmtp.com header.b="aEjBHm3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B870F24655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=revathskumar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c14863bb;
	Wed, 22 Jan 2020 19:48:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 045ddbe2
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 14:18:48 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f8b6876
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 14:18:48 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id z64so19007165oia.4
 for <wireguard@lists.zx2c4.com>; Thu, 16 Jan 2020 06:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=revathskumar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=A/1EvNjmjjgybake5TmGzdc2PYgGMqmoZyNZt4scd8U=;
 b=aEjBHm3iTjQpdZqIuy4AZRbJ6hXqPbhDYwVYVljMAJgT63pIpxXR/r3028qflLEoMs
 k07t+13iG2wsrk9B31ThnT+mJqM3vlR4BeHNvlD7wVONKT0wW/BHnx9uOarGDIo1yUnn
 MQ1vVAxS513ucHU5IdbXtWBfTu6HRGZ0QQlcFp46ToDXGQLbGKFj6zDeBl0onYpn7BWD
 flhYpgb5zntS9UVC0BSnMvn2deZ2poVu7hqvxFbm/f7N06bsBI/KjGPH0fXvAfm17pBL
 qII+vKmUIXphx23V+negjq8NlRsJacYvBQf2v/WvDW+P9toXpSNgfi9RWdrE6PeuT6y+
 Go8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=A/1EvNjmjjgybake5TmGzdc2PYgGMqmoZyNZt4scd8U=;
 b=liRwal5oG6ICPFupPsZwMKdDVDEfnr2zslhhCaAl9TReyb8L7D2WhxZHP94n6rESeI
 yH4EvbmcTaXuoSr+zalqqDUKbenMaOUeUQ+oUuawfLHSFvolz1AebLP97Tz0TDdGqQnw
 xlqPa1K/ZW7dyUqU7wePRqIMXX35/IejBrU70kvZp9AM2JgYAYdqPRZd6sHAWpNe03VW
 awv+njhtntz+llXHltI/U7bx3y+jyVsnU2/usaFMb+sV9cOvV+uaiAV7/cQP8dfncn3H
 zVT/Stx4EPlxxaQBLH8anI5OzvoHf/jPfjhCAvZx+95euW6boCwGpDYqlVhESWm8RKxN
 Fm8Q==
X-Gm-Message-State: APjAAAWGXk/6D/6R07x788dzMcxM3LIpq6KhPErZQzJ/ebNnsjREeXAH
 RFj1UZJLXxZHa1J+JDF+gh7VJ1ZknVi7bMNZ9RkmEAKNMnVtdA==
X-Google-Smtp-Source: APXvYqxbQlaRFyT4ADCy6lii33PtG2oPlHMgji47C0OQ2//d4mMD7Fxl+HHKRbwds/m0S6vi3wOk9gWS1UsPkiwujA0=
X-Received: by 2002:aca:f505:: with SMTP id t5mr4190768oih.136.1579184327942; 
 Thu, 16 Jan 2020 06:18:47 -0800 (PST)
MIME-Version: 1.0
References: <CAO=kRDJJ6m1RMad-nwLro6kp7FhST9j1gP+C45xQx1R7sC932g@mail.gmail.com>
In-Reply-To: <CAO=kRDJJ6m1RMad-nwLro6kp7FhST9j1gP+C45xQx1R7sC932g@mail.gmail.com>
From: Revath S Kumar <gmail@revathskumar.com>
Date: Thu, 16 Jan 2020 14:18:36 +0000
Message-ID: <CAO=kRDLXM+D+dfq6D4mkgPrE8saXknksrPxvQsw3E9EOK3gzhA@mail.gmail.com>
Subject: Re: Wireguard on MacOS (Catalina) not able to quit/deactivate
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:09 +0100
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
Content-Type: multipart/mixed; boundary="===============6269315873399267641=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6269315873399267641==
Content-Type: multipart/alternative; boundary="000000000000e7039b059c42805e"

--000000000000e7039b059c42805e
Content-Type: text/plain; charset="UTF-8"

Found the issue.
This is due to* On demand* option is *ON*.

Once *On demand *is OFF you can deactivate and quit.


On Wed, Nov 27, 2019 at 7:45 AM Revath S Kumar <gmail@revathskumar.com>
wrote:

> Hello all,
>
> I installed wireguard on MacOS (Catalina) recently.
> After I configured and activated once, I am not able to quit/deactivate
> the wireguard session.
> I am attaching Gifs for your reference. [1]
>
>  Even I tried to kill the process via Activity Monitor but a process names *WireguardNetworkExtension,
> *shows up again. [2]
>
> [1]: https://imgur.com/CEm4cXM
> [2]: https://imgur.com/xC8uCUy
>
> with regards,
> Revath S Kumar,
> JavaScripter / Rubyist
> https://blog.revathskumar.com/
>

--000000000000e7039b059c42805e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Found the issue. <br></div><div>This is due to<b> On =
demand</b> option is <b>ON</b>. <br></div><div><br></div><div>Once <b>On de=
mand </b>is OFF you can deactivate and quit.<br></div></div><br><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 27, 2=
019 at 7:45 AM Revath S Kumar &lt;<a href=3D"mailto:gmail@revathskumar.com"=
>gmail@revathskumar.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div>Hello all,</div><div><br></div=
><div>I installed wireguard on MacOS (Catalina) recently.</div><div>After I=
 configured and activated once, I am not able to quit/deactivate the wiregu=
ard session.</div><div>I am attaching Gifs for your reference. [1]<br></div=
><div><br></div><div>=C2=A0Even I tried to kill the process via Activity Mo=
nitor but a process names <b>WireguardNetworkExtension, </b>shows up again.=
 [2]<br></div><div><br></div><div>[1]: <span style=3D"background:unset;back=
ground-blend-mode:unset;border:unset;border-radius:unset;display:unset;floa=
t:unset;clear:unset;vertical-align:unset;overflow:unset;isolation:unset;bre=
ak-after:unset;break-before:unset;break-inside:unset;columns:unset;column-f=
ill:unset;column-rule:unset;opacity:unset;mix-blend-mode:unset;font:unset;f=
ont-synthesis:unset;writing-mode:unset;text-orientation:unset;image-orienta=
tion:unset;border-collapse:unset;empty-cells:unset;caption-side:unset;borde=
r-spacing:unset;color:unset;text-transform:unset;text-indent:unset;word-bre=
ak:unset;text-justify:unset;text-align-last:unset;text-align:unset;letter-s=
pacing:unset;word-spacing:unset;white-space:pre-wrap;text-emphasis:unset;li=
ne-break:unset;text-combine-upright:unset;list-style:unset;quotes:unset;mar=
gin:unset;outline:unset;padding:unset;width:unset;min-width:unset;max-width=
:unset;height:unset;min-height:unset;max-height:unset;box-sizing:unset;obje=
ct-fit:unset;object-position:unset;table-layout:unset;text-overflow:unset;t=
ext-decoration:unset;ime-mode:unset"><a href=3D"https://imgur.com/CEm4cXM" =
target=3D"_blank">https://imgur.com/CEm4cXM</a></span></div><div><span styl=
e=3D"background:unset;background-blend-mode:unset;border:unset;border-radiu=
s:unset;display:unset;float:unset;clear:unset;vertical-align:unset;overflow=
:unset;isolation:unset;break-after:unset;break-before:unset;break-inside:un=
set;columns:unset;column-fill:unset;column-rule:unset;opacity:unset;mix-ble=
nd-mode:unset;font:unset;font-synthesis:unset;writing-mode:unset;text-orien=
tation:unset;image-orientation:unset;border-collapse:unset;empty-cells:unse=
t;caption-side:unset;border-spacing:unset;color:unset;text-transform:unset;=
text-indent:unset;word-break:unset;text-justify:unset;text-align-last:unset=
;text-align:unset;letter-spacing:unset;word-spacing:unset;white-space:pre-w=
rap;text-emphasis:unset;line-break:unset;text-combine-upright:unset;list-st=
yle:unset;quotes:unset;margin:unset;outline:unset;padding:unset;width:unset=
;min-width:unset;max-width:unset;height:unset;min-height:unset;max-height:u=
nset;box-sizing:unset;object-fit:unset;object-position:unset;table-layout:u=
nset;text-overflow:unset;text-decoration:unset;ime-mode:unset">[2]: <span s=
tyle=3D"background:unset;background-blend-mode:unset;border:unset;border-ra=
dius:unset;display:unset;float:unset;clear:unset;vertical-align:unset;overf=
low:unset;isolation:unset;break-after:unset;break-before:unset;break-inside=
:unset;columns:unset;column-fill:unset;column-rule:unset;opacity:unset;mix-=
blend-mode:unset;font:unset;font-synthesis:unset;writing-mode:unset;text-or=
ientation:unset;image-orientation:unset;border-collapse:unset;empty-cells:u=
nset;caption-side:unset;border-spacing:unset;color:unset;text-transform:uns=
et;text-indent:unset;word-break:unset;text-justify:unset;text-align-last:un=
set;text-align:unset;letter-spacing:unset;word-spacing:unset;white-space:pr=
e-wrap;text-emphasis:unset;line-break:unset;text-combine-upright:unset;list=
-style:unset;quotes:unset;margin:unset;outline:unset;padding:unset;width:un=
set;min-width:unset;max-width:unset;height:unset;min-height:unset;max-heigh=
t:unset;box-sizing:unset;object-fit:unset;object-position:unset;table-layou=
t:unset;text-overflow:unset;text-decoration:unset;ime-mode:unset"><a href=
=3D"https://imgur.com/xC8uCUy" target=3D"_blank">https://imgur.com/xC8uCUy<=
/a></span></span></div><div><br></div><div><div dir=3D"ltr"><div dir=3D"ltr=
"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">with re=
gards,<br>Revath S Kumar,<br><div><span>JavaScripter / </span>Rubyist <br><=
/div><div><a href=3D"https://blog.revathskumar.com/" target=3D"_blank">http=
s://blog.revathskumar.com/</a></div></div></div></div></div></div></div></d=
iv></div></div></div>
</blockquote></div>

--000000000000e7039b059c42805e--

--===============6269315873399267641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6269315873399267641==--
