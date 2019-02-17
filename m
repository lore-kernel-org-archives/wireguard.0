Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53193C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 19:05:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A645A21872
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 19:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajv5eWww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A645A21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 036c47fb;
	Sun, 17 Feb 2019 18:56:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3965ae02
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 18:56:51 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a167160
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 18:56:51 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id s198so7319663pgs.2
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 11:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEE+KaRIn+zpeWccH8r68sKOOcrmvtrXZPO0yRb6mfU=;
 b=ajv5eWwwJ1qdBC+0VZW111KwsC9AV0AsWpcEa+METWk3yl/Bw49sb9BvnBiaveUaZU
 qyMFoxKd1BxwISRIBGMFZPHzDnXbHbfaQT6SIjc/k3GnRJv6a4Wh/buXN4mtRWjW8/iz
 twyTSJZJeUyYzSOog/blAK+lSOQ7En8Z5PmmOKDbFsPhoSPVIWlPDXhU9oAVF3cNpkd5
 magIXKpyQ2MJwBQASXWg0XD3zCy6Tv4AW3cklMjSziK7e3CDXMqG6cKHghIYR8ZxUYVV
 64UAFgmWmP89cCsiSlB0VWemwyxSeWnsBj/tIMv7hfRBJaawN2FRa4w/6T+srTlvgdOM
 cXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEE+KaRIn+zpeWccH8r68sKOOcrmvtrXZPO0yRb6mfU=;
 b=LL28GXHZRXXWkF+9M34yH7oPclhVLapgiMR2gziPWHej1qB7CyXMVC/xQD86EwMQxd
 ZrnjTxA+6LL5v+u2q6poCWUQdCBNUEdQNIUpV4ERmRG4giUsd40MhaPWPN3vf76g0lFB
 I3pAT7w7Wr5iLm2w4VhmUwJwtrQagPhUvgQJAOyxqJvq+5CPEyyRezhdgPwUj58cEcZj
 5kyoLvDyYxAt9Pwsc9klEEtXHGRhpgWXe5JXSL9LejDZWO7bh3Q76AWPOY4ZYZTAswh6
 RhIiRYA/V2L+C/3OZq0dtonkGJlcDKN+ye8on3HLva4CeXrjDVdwCyn2z8eGfAyfpH7B
 8OwQ==
X-Gm-Message-State: AHQUAuYv2QBOzdz9vsy1THnqxxFaVWq532P9k4NsV9MvG45f272skgrm
 YpqkxKt86npryoDA+RHMADmY5Np2p3wsT8ac5Tg=
X-Google-Smtp-Source: AHgI3IakmJ9/uOvrwoXvudaz+fKtSpnT4v2s1ebUX/rU4smMNeZSxjxeLiZzXqxeuNQ1/BAd+gAAcrfcfnpjMJk3kAU=
X-Received: by 2002:a63:6ac5:: with SMTP id
 f188mr15404446pgc.165.1550430309654; 
 Sun, 17 Feb 2019 11:05:09 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qjTJbWYVr9cToXpfnshGkppcqVS5=iVzqsrjS+v_aF+w@mail.gmail.com>
In-Reply-To: <CAHmME9qjTJbWYVr9cToXpfnshGkppcqVS5=iVzqsrjS+v_aF+w@mail.gmail.com>
From: Le Sandie <lesandie@gmail.com>
Date: Sun, 17 Feb 2019 20:05:13 +0100
Message-ID: <CAKgwHq-ts=ih0DmdtMr3Wam10-mXjK=cjxqbav2+h3q=1ZLP8g@mail.gmail.com>
Subject: Re: WireGuard for macOS
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============0268435425968452131=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0268435425968452131==
Content-Type: multipart/alternative; boundary="000000000000db24ce05821baf5f"

--000000000000db24ce05821baf5f
Content-Type: text/plain; charset="UTF-8"

Awesome work guys

On Sat, Feb 16, 2019 at 2:27 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hey everyone,
>
> After many months of hard work, Roopesh, Eric, and I are pleased to
> announce an initial version of WireGuard for macOS:
>
> https://itunes.apple.com/us/app/wireguard/id1451685025?ls=1&mt=12
>
> This is built from the same code base as our existing iOS app and
> makes use of Apple's Network Extension API to provide native
> integration into the operating system's networking stack. The
> application lives in the status bar, and after importing a
> configuration, the ordinary System Preferences networking item may
> also be used to control each tunnel. Because it uses these deep
> integration APIs, we're only allowed to distribute the application
> using the macOS App Store (whose rejections, appeals, and eventual
> acceptance made for quite the stressful saga over the last week and a
> half). Compared to the current CLI integration, we expect the
> WireGuard experience using this app to be excellent.
>
> For curious folks without a Mac (or without the patience to cajole KVM
> into booting macOS), I've assembled a few screenshots:
> https://data.zx2c4.com/wireguard-for-macos-screenshots-february-2019/
>
> This is new software, and there will certainly be problems. Don't
> hesitate to email team@wireguard.com directly with bugs as you
> encounter them.
>
> Enjoy!
>
> Regards,
> Jason
>
> PS: Because people will inevitably ask: yes, a Windows client is on
> its way, and it will have a very similar interface to this macOS one.
> We're taking the long and careful route, writing a new TUN driver for
> Windows 7+ called "Wintun" that we expect to be safer and faster than
> the current popular OpenVPN TUN driver, and also suitable for all
> projects, not just for WireGuard. We already have packets flowing and
> things generally work well, but polish will require a bit of patience.
> If you'd like to help and have an appetite for NDIS drivers, Win32 GUI
> programming, or Go, please do get in touch.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>


-- 
Lt. Col. Sandie

--000000000000db24ce05821baf5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome work guys</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 16, 2019 at 2:27 AM Jason A. =
Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hey everyon=
e,<br>
<br>
After many months of hard work, Roopesh, Eric, and I are pleased to<br>
announce an initial version of WireGuard for macOS:<br>
<br>
<a href=3D"https://itunes.apple.com/us/app/wireguard/id1451685025?ls=3D1&am=
p;mt=3D12" rel=3D"noreferrer" target=3D"_blank">https://itunes.apple.com/us=
/app/wireguard/id1451685025?ls=3D1&amp;mt=3D12</a><br>
<br>
This is built from the same code base as our existing iOS app and<br>
makes use of Apple&#39;s Network Extension API to provide native<br>
integration into the operating system&#39;s networking stack. The<br>
application lives in the status bar, and after importing a<br>
configuration, the ordinary System Preferences networking item may<br>
also be used to control each tunnel. Because it uses these deep<br>
integration APIs, we&#39;re only allowed to distribute the application<br>
using the macOS App Store (whose rejections, appeals, and eventual<br>
acceptance made for quite the stressful saga over the last week and a<br>
half). Compared to the current CLI integration, we expect the<br>
WireGuard experience using this app to be excellent.<br>
<br>
For curious folks without a Mac (or without the patience to cajole KVM<br>
into booting macOS), I&#39;ve assembled a few screenshots:<br>
<a href=3D"https://data.zx2c4.com/wireguard-for-macos-screenshots-february-=
2019/" rel=3D"noreferrer" target=3D"_blank">https://data.zx2c4.com/wireguar=
d-for-macos-screenshots-february-2019/</a><br>
<br>
This is new software, and there will certainly be problems. Don&#39;t<br>
hesitate to email <a href=3D"mailto:team@wireguard.com" target=3D"_blank">t=
eam@wireguard.com</a> directly with bugs as you<br>
encounter them.<br>
<br>
Enjoy!<br>
<br>
Regards,<br>
Jason<br>
<br>
PS: Because people will inevitably ask: yes, a Windows client is on<br>
its way, and it will have a very similar interface to this macOS one.<br>
We&#39;re taking the long and careful route, writing a new TUN driver for<b=
r>
Windows 7+ called &quot;Wintun&quot; that we expect to be safer and faster =
than<br>
the current popular OpenVPN TUN driver, and also suitable for all<br>
projects, not just for WireGuard. We already have packets flowing and<br>
things generally work well, but polish will require a bit of patience.<br>
If you&#39;d like to help and have an appetite for NDIS drivers, Win32 GUI<=
br>
programming, or Go, please do get in touch.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Lt. Col. Sandie</div>

--000000000000db24ce05821baf5f--

--===============0268435425968452131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0268435425968452131==--
