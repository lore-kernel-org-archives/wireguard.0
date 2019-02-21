Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD44C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 22:58:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342B820838
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 22:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlp42SK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342B820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 888b0b92;
	Thu, 21 Feb 2019 22:49:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f418c7ba
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 22:49:05 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72942c1b
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 22:49:05 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id y4so352089qtc.10
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 14:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tG0/h/7RN/D+NjZ8j3SB8iNwAP1/z/fbNv1U6O7ou6E=;
 b=Dlp42SK92O/0+j6tnHKeXDaXXiu7QvM3MZzRJU1PRyrgnMg5Z6aILd0OH/yFW1Cotq
 rXdI7clv7IKUkoY1NNkmYjkdBnBclLDq6OpGJwyUsPL/9OvcmdmMxCDsxFGL3jqtbaYz
 64sbAq4EiUPeApmFErIzuCXJHIjFK5V95GMpXTYmogEr2fA+2/BKrUjv+1rHAQIkNFUs
 w4qzJYFmQ9uemZ00vqsZVNDib472RBXM41SQNSHyl+GjMSFFPyXUGc64e3f+wVcFk+Fn
 bmokvits7pWltxKckmYWM7WmyTfJr8cb5YbwIbTfkcQuvUPXn0GDjEFUj/yuFH7dSKi0
 +6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tG0/h/7RN/D+NjZ8j3SB8iNwAP1/z/fbNv1U6O7ou6E=;
 b=HlVQMnLYBeAcw09kp2bI+3LrFKJBrzfSKKOSq0XaDbki6V+vZ2ieUq2VwB8LanUQKB
 aFszL/kRo8vWPT4HhS5zziZC1x7ilZ4/mVJ06ptuu0l8W+cCzIHz/TxXN2HknBzB6jI/
 1yGBE8cytYsHEmGFbV2M59Co8eP5xFcVVMhdZwyo1ALy0iNMUOoUbbWMpd+8y6Nkyp99
 AragUYXq/yFgeOKEO8p75BIYs22vMKsbLoAb2Jglu2oD3FYAasEX7dr6DRfNjNtnfY6P
 4NqOZFTcermdIqfLmgD7nuLaDa6M120nhMDkRl7sZFunt4pzGVjlF/YDqz0TgUJZwBhh
 CEFQ==
X-Gm-Message-State: AHQUAuaI/1mnbwzUO4jLaXRC+A85rXdfCexZhDA4O9Y+GXPIoHbNYjnR
 MzFBDTAS08i9FZK3y5Pl4hurDgaveSmpaNMSE71I8iat
X-Google-Smtp-Source: AHgI3IaLyyL7eLgpR04CJGVH/ud6cjxVmweij6fuy4LGFaA51V8mV1BQRxW1bvtWM5BU9SzrE98Jx4z+Mtm/6cZjxdI=
X-Received: by 2002:ac8:372b:: with SMTP id o40mr702172qtb.73.1550789875662;
 Thu, 21 Feb 2019 14:57:55 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
 <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
In-Reply-To: <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
From: Arpit Gupta <g.arpit@gmail.com>
Date: Thu, 21 Feb 2019 14:57:43 -0800
Message-ID: <CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com>
Subject: Re: upgrading raspberry pi required me to re install wireguard
To: logcabin@fastmail.net
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
Content-Type: multipart/mixed; boundary="===============8183923725968165917=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8183923725968165917==
Content-Type: multipart/alternative; boundary="000000000000a905a605826f671e"

--000000000000a905a605826f671e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ya reboot did not solve this for me. I will read up on how I can execute
package pre/post install scripts.

Curious to know if the rebuild the module is the responsibility of the os
or the package after a kernel upgrade?

I will try to remember this next time there is a kernel upgrade =F0=9F=98=
=81.


--
Arpit

On Thu, Feb 21, 2019, 4:30 AM <logcabin@fastmail.net> wrote:

> Yes, the kernel did get updated, causing the wg module dependencies to ge=
t
> out of sync. A reboot after the update should solve this, otherwise you m=
ay
> need to run the package's preinst script to get the modules back in sync.
> Should be no need to reinstall the wg packages.
>
> On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:
>
> Hi All
>
> I am running raspberry pi v3 and ran apt-get update and upgrade commands
> to get upto date. It also ended up updating the kernel i think. I should
> have paid more attention to what all was getting updated.
>
> After the update wireguard was not running and upon debugging i found tha=
t
> the wireguard kernel module was no longer present. So i uninstalled all
> wireguard packages and installed them again and the module showed up and =
on
> reboot system was back to normal. What i was curious was how should one g=
o
> about doing os/kernel updates in future in order to avoid this issue?
>
> I am running
> Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019
> armv7l GNU/Linux
> No LSB modules are available.
> Distributor ID: Raspbian
> Description: Raspbian GNU/Linux 9.8 (stretch)
> Release: 9.8
> Codename: stretch
>
> ii  wireguard                       0.0.20190123-1               all
>     fast, modern, secure kernel VPN tunnel (metapackage)
> ii  wireguard-dkms                  0.0.20190123-1               all
>     fast, modern, secure kernel VPN tunnel (DKMS version)
> ii  wireguard-tools                 0.0.20190123-1               armhf
>     fast, modern, secure kernel VPN tunnel (userland utilities)
>
> --
> Arpit
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000a905a605826f671e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ya reboot did not solve this for me. I will read up on ho=
w I can execute package pre/post install scripts.<div dir=3D"auto"><br></di=
v><div dir=3D"auto">Curious to know if the rebuild the module is the respon=
sibility of the os or the package after a kernel upgrade?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I will try to remember this next time the=
re is a kernel upgrade =F0=9F=98=81.<br><br><div data-smartmail=3D"gmail_si=
gnature" dir=3D"auto"><br>--<br>Arpit</div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 21, 2019, 4:30=
 AM  &lt;<a href=3D"mailto:logcabin@fastmail.net">logcabin@fastmail.net</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><u></u><div><div style=
=3D"font-family:Arial">Yes, the kernel did get updated, causing the wg modu=
le dependencies to get out of sync. A reboot after the update should solve =
this, otherwise you may need to run the package&#39;s preinst script to get=
 the modules back in sync. Should be no need to reinstall the wg packages.<=
br></div><div style=3D"font-family:Arial"><br></div><div style=3D"font-fami=
ly:Arial">On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:<br></div><bl=
ockquote type=3D"cite" id=3D"m_-2690143954488973293fastmail-quoted"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"=
font-family:Arial">Hi All<br></div><div><br></div><div>I am running raspber=
ry pi v3 and ran apt-get update and upgrade commands to get upto date. It a=
lso ended up updating the kernel i think. I should have paid more attention=
 to what all was getting updated.<br></div><div><br></div><div>After the up=
date wireguard was not running and upon debugging i found that the wireguar=
d kernel module was no longer present. So i uninstalled all wireguard packa=
ges and installed them again and the module showed up and on reboot system =
was back to normal. What i was curious was how should one go about doing os=
/kernel updates in future in order to avoid this issue?<br></div><div><br><=
/div><div>I am running<br></div><div>Linux raspberrypi 4.14.98-v7+ #1200 SM=
P Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux<br></div><div><div>No LSB m=
odules are available.<br></div><div>Distributor ID:<span style=3D"white-spa=
ce:pre-wrap"> </span>Raspbian<br></div><div>Description:<span style=3D"whit=
e-space:pre-wrap"> </span>Raspbian GNU/Linux 9.8 (stretch)<br></div><div>Re=
lease:<span style=3D"white-space:pre-wrap"> </span>9.8<br></div><div>Codena=
me:<span style=3D"white-space:pre-wrap"> </span>stretch<br></div><div><br><=
/div><div><div>ii=C2=A0 wireguard=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.0.20190123-1=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fa=
st, modern, secure kernel VPN tunnel (metapackage)<br></div><div>ii=C2=A0 w=
ireguard-dkms=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0.0.20190123-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fast, modern, secure kernel VPN tunnel (=
DKMS version)<br></div><div>ii=C2=A0 wireguard-tools=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.0.20190123-1=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0armhf=C2=A0 =C2=A0 =C2=A0 =C2=A0 fast, m=
odern, secure kernel VPN tunnel (userland utilities)<br></div></div><div><b=
r></div><div><div class=3D"m_-2690143954488973293fastmail-quoted-gmail_sign=
ature" dir=3D"ltr"><div dir=3D"ltr"><div>--<br></div><div style=3D"font-fam=
ily:Arial">Arpit<br></div></div></div></div></div></div></div></div></div><=
div>_______________________________________________<br></div><div>WireGuard=
 mailing list<br></div><div><a href=3D"mailto:WireGuard@lists.zx2c4.com" ta=
rget=3D"_blank" rel=3D"noreferrer">WireGuard@lists.zx2c4.com</a><br></div><=
div><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" target=
=3D"_blank" rel=3D"noreferrer">https://lists.zx2c4.com/mailman/listinfo/wir=
eguard</a><br></div><div><br></div></blockquote><div style=3D"font-family:A=
rial"><br></div></div>_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000a905a605826f671e--

--===============8183923725968165917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8183923725968165917==--
