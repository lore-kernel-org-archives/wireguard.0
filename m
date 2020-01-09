Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5583C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 08:43:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22DBD2067D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 08:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoHfENDr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22DBD2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37350187;
	Thu, 9 Jan 2020 08:43:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd85b6a6
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 08:43:35 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a22d440
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 08:43:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id cy15so4939704edb.4
 for <wireguard@lists.zx2c4.com>; Thu, 09 Jan 2020 00:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kE6SPbqC+mR3Gezs7mzI4Oejv7iBCIRczppfueR07UY=;
 b=DoHfENDro6sF19Xbq4U7/cpoCLDffMaH9V3qsnC7ql78+4GNMLJqYX/7waVcJFshS8
 aiIkNv/iUlnNK/p5ytbnXRR9bYFjTEYIEv4NiLcN1+lzO+V2KB9pH0O244laOChCgYLw
 z+Q9gEcaclvccZ//LCBjJMQ7Vl1bQCkK9mxYOVkA32wmkAq9DTF2G/GAN+txVBtxtpji
 CuSTZ13vmLxJqDc1cVB2ugRegyHpqBM62Zc/IH20eGVzuLEDypBR9oln6JPCiAAIlKvZ
 CImBRarUOgOtzHg3eyLGWII6DQPBrlh/oJjafzlvFQpTqx19aKyhI2a6P2R8cLLuQamP
 y/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kE6SPbqC+mR3Gezs7mzI4Oejv7iBCIRczppfueR07UY=;
 b=ChvNiGH1YkbPs26OzSt/C4nE8OjcRaRY/y+wyUBRUits1VrSpJ+l2ORGgOs8jnsG7B
 zRZpefR1FkZRQ44zhw/cNPVarKM+puvpZiBqlgtwPdyQD6AWq3nB9wNrxr8WDBKuCDjq
 7OZMGpOsAXK1sM39184WC1LF6DxSMJCuXuzeaIivhOKdYXZVVomD8ktFOJwFgaBgscrL
 OcSXLf+QPRW9A/BS5dSoJNmirVY6DnZlTgESvsj+fIP8Ncq4pBgmMBXQ99lbcnIFPgds
 vSy5mq21twSSoLIyIeldqh/AL49vmAjVBEmG6mUhMXhXQQJMBiHn2k0zokCeqXQJUeKX
 99wA==
X-Gm-Message-State: APjAAAXrlFUsH82w4WwG/pTiMgW1Qu/PiFmok0uTZJU5A4mfs+MRZqtQ
 1b5iQx4lpX4NQCFrRrPCd3GHZSI1SAfNTkO4GyQ12kqC1Nc=
X-Google-Smtp-Source: APXvYqwalqy+qIjBD7BpV+mfFBM+v6Duni8WuRrr1Xti51tokPMJDI0PVlns9fACNEnZGlMR8laxS7zCRq2+IzR9xDA=
X-Received: by 2002:a05:6402:17fb:: with SMTP id
 t27mr9837976edy.159.1578559414601; 
 Thu, 09 Jan 2020 00:43:34 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytL4bbuvHnPt1scJ1QAWSFw_zx3RGQQAdbC0d8D+rjiJ4A@mail.gmail.com>
In-Reply-To: <CAGCGytL4bbuvHnPt1scJ1QAWSFw_zx3RGQQAdbC0d8D+rjiJ4A@mail.gmail.com>
From: Kai Haberzettl <khaberz@gmail.com>
Date: Thu, 9 Jan 2020 09:44:55 +0100
Message-ID: <CA+CGqoLds_96+utWZV1jr9-On=oqNC4r9BLs5s0YT+_s2QVikQ@mail.gmail.com>
Subject: Re: Android: Cannot toggle the quick setting tile on a locked screen
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============4188124467673864467=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4188124467673864467==
Content-Type: multipart/alternative; boundary="0000000000002a0daf059bb101a2"

--0000000000002a0daf059bb101a2
Content-Type: text/plain; charset="UTF-8"

What Device and ROM are you using? Samsung OneUI has a specific setting as
to whether network settings should be available on the lock screen or not.
I don't see this in AOSP. Look for something like this in your settings, it
might help.

On Thu, Jan 9, 2020 at 7:10 AM Arpit Gupta <g.arpit@gmail.com> wrote:

> Hi
>
> I can't say for sure when this behavior changed where I cannot toggle
> quick setting option for WireGuard when the phone is locked.
>
> I know this was working in December so not sure if the December update for
> Android changed something or if this was an explicit change in the Android
> app.
>
> Wanted to see if any one else is seeing similar behavior and if there is
> anything that can be done about it?
>
> I was using Tasker to automate toggling the quick setting when ever I was
> not connected to a specific WiFi network. That automation no longer works
> because I need to unlock the phone before that setting can be toggled.
>
>
> --
> Arpit
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000002a0daf059bb101a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What Device and ROM are you using? Samsung OneUI has a spe=
cific setting as to whether=C2=A0network settings should be available on th=
e lock screen or not. I don&#39;t see this in AOSP. Look for something like=
 this in your settings, it might help.=C2=A0</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 7:10 AM =
Arpit Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com">g.arpit@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"auto">Hi<div dir=3D"auto"><br></div><div dir=3D"auto">I can&#39;t sa=
y for sure when this behavior changed where I cannot toggle quick setting o=
ption for WireGuard when the phone is locked.=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I know this was working in December so not sure=
 if the December update for Android changed something or if this was an exp=
licit change in the Android app.=C2=A0</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Wanted to see if any one else is seeing similar behavior and=
 if there is anything that can be done=C2=A0about it?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">I was using Tasker to automate toggling the q=
uick setting when ever I was not connected to a specific WiFi network. That=
 automation no longer works because I need to unlock the phone before that =
setting can be toggled.</div><div dir=3D"auto"><br><div dir=3D"auto"><br>--=
<br>Arpit</div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000002a0daf059bb101a2--

--===============4188124467673864467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4188124467673864467==--
