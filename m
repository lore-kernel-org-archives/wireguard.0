Return-Path: <SRS0=Fp2b=TH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39231C004C9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 May 2019 13:37:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC1B20578
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 May 2019 13:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisbox.org header.i=@chrisbox.org header.b="dVzg26dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC1B20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chrisbox.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a2c750f;
	Tue, 7 May 2019 13:37:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58fc4536
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 06:49:11 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c9d3e08
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 06:49:11 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id u17so8128419pfn.7
 for <wireguard@lists.zx2c4.com>; Mon, 06 May 2019 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrisbox.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXPeggsYsY69hGpJwNSjBClmb/hymHYYVZZnPljuk1A=;
 b=dVzg26drtsprXa9f4pmMogauAmwSGdTWBypcToGFGc7k0ePYqaJx2oZqsiyFPp0rtw
 2BAbooMIrjobwyyxYyVHbaO/GgFFmf3DYtVttuEaG9gTRQE7Ae2F+GvuILPTk1nEm3JU
 Dw/duFTUGMqtOg4+Mutmu9sf9Z6B/8AITG8wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXPeggsYsY69hGpJwNSjBClmb/hymHYYVZZnPljuk1A=;
 b=aUuyh6NxfG2UjmD8ETxHti2BNaycPNPLu98S+DoF3LLMrqht1578Yz2rVMaA+gxDlS
 i5pqdJo9CbXLvN//LOGl7bz9kMABgNnsIhaco4nWNATQ27tSYFV57OpgPJ8gC4zjujKl
 yPMVMQhugaxCJV7DB35Asn4qzeEeGsfrTpxeyxbt+RSa/vo6Hu4k2nycxLjdoenBH+LS
 0tyENS5ctOEYoPuCzh1H2rk/R9iJhlXNdF8u85Fam+r6SXyPgNZzZ5HNt5Xp+gvzjaD+
 kymIoJU44PLusuheOFCF34qE2rnlOeC2/HUCVEgQ0psxxuRV5qu6D1pB6Y1O0BRUIfN7
 Op/Q==
X-Gm-Message-State: APjAAAWHtQ0ht4ajUP/q/P0LaBO+YWA+O97Fro1KP+9xoZv5u4zBcf6t
 qmMsIzaRVOUREud6Bx7+SS0FpfIporX+fHnFh4e72Q==
X-Google-Smtp-Source: APXvYqz7Ar9+e+ElsbFwYwa/rXLRN1SRLmrooRRCZMBdeUbhv7LJLcKSDoOtBLmL2DaLPIvYuclq2KEQNjwoSyFVluQ=
X-Received: by 2002:aa7:8251:: with SMTP id e17mr40432136pfn.147.1557211749884; 
 Mon, 06 May 2019 23:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR08MB3522DC4AA812C933D8285AFCD43B0@AM0PR08MB3522.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB3522DC4AA812C933D8285AFCD43B0@AM0PR08MB3522.eurprd08.prod.outlook.com>
From: Christopher Bachner <hello@chrisbox.org>
Date: Tue, 7 May 2019 08:49:16 +0200
Message-ID: <CAKJniYTK46MhL39KEpZoL+Ndpe7Kos+777fA4DF9UPEu8TU6VA@mail.gmail.com>
Subject: Re: Deploy a wireguard on 2 raspberry pi to connect 2 remote lan -
 Lan2Lan
To: Paulo Lopes <plopes1960@hotmail.com>
X-Mailman-Approved-At: Tue, 07 May 2019 15:37:40 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1388428720647956304=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1388428720647956304==
Content-Type: multipart/alternative; boundary="00000000000031368d0588469dd7"

--00000000000031368d0588469dd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You have to tell the gateway (router) on each side where to route the IP
range of the other side. Usually you route it over the VPN computer, which
you have to configure to allow routing.

- Chris

On Mon, May 6, 2019, 22:42 Paulo Lopes <plopes1960@hotmail.com> wrote:

> Hi all!!!
>
> First, let me thank for the amazing vpn protocol that Wireguard is!!!!
>
> I need your advise. As you can see on the picture attach, I have 2
> raspberry pi. One as a vpn server and the other as a vpn client to connec=
t
> 2 remote Lan.
>
> Can you point me what I need to do, if I want to replace the openvpn for
> the wireguard?
>
> I can connect 2 rpi with wireguard, but, the others ip machinies on the
> server and client side can=C2=B4t see each other.
>
> With openvpn I needed to inser iroute and add a static route on both
> routers. What I need to with the wireguard?
>
> Once again many tahnks for all the help you can give me=F0=9F=98=89
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000031368d0588469dd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You have to tell the gateway (router) on each side where =
to route the IP range of the other side. Usually you route it over the VPN =
computer, which you have to configure to allow routing.=C2=A0<div dir=3D"au=
to"><br></div><div dir=3D"auto">- Chris</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 6, 2019, 22:42 Pau=
lo Lopes &lt;<a href=3D"mailto:plopes1960@hotmail.com">plopes1960@hotmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Hi all!!!</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
First, let me thank for the amazing vpn protocol that Wireguard is!!!!</div=
>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I need your advise. As you can see on the picture attach, I have 2 raspberr=
y pi. One as a vpn server and the other as a vpn client to connect 2 remote=
 Lan.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Can you point me what I need to do, if I want to replace the openvpn for th=
e wireguard?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I can connect 2 rpi with wireguard, but, the others ip machinies on the ser=
ver and client side can=C2=B4t see each other.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
With openvpn I needed to inser iroute and add a static route on both router=
s. What I need to with the wireguard?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Once again many tahnks for all the help you can give me=F0=9F=98=89</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0</div>
</div>

_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--00000000000031368d0588469dd7--

--===============1388428720647956304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1388428720647956304==--
