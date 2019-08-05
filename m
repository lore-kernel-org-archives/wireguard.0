Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5418C0650F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 19:14:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2F820B1F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 19:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuWad9jx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2F820B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45492271;
	Mon, 5 Aug 2019 19:14:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07aef934
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 19:13:59 +0000 (UTC)
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80a0b7a4
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 19:13:59 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id j11so29172756otp.10
 for <wireguard@lists.zx2c4.com>; Mon, 05 Aug 2019 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5pfKe2VJXIh4dhgLFINi3UBD/W4HO6fsTsMe0xyRCqc=;
 b=UuWad9jxUU5VaiWQ6GptKNnm6oXa+6jtJPK0SdftX6RDLR5K03f9xzlnLf/SHFd22B
 8kqJknMPg5aEgMi02gFxPSw/6AVAUmhv9ALLlG2xH/91Nz2LrkVM1ZsGMcBYHSjCV740
 agfPOmhyGHBc8jq6foLQ5sKvQo4Yeox9f9/bbZBW5q9ZPqB9eW9Pk8cNfRKpu2nq42nV
 3E6/aXvc/BeVGrTfA/JewRSO6GxXRwk5ccIVxcS+fMR+J5PD15uGfX7d1W+UbrihEfDf
 NlyLy+8GVwl9m1enGkNRB86uepQltwYZI20QjM8dzp+vK1sfq4aJBUh0DM1nlRwRFtlw
 Nt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5pfKe2VJXIh4dhgLFINi3UBD/W4HO6fsTsMe0xyRCqc=;
 b=iez+gP6esZCVMpyC5JfPQKBkpVo8LxIdWsSCw7GdzW/kAx6CCAidqDt1DNiULiESFe
 EFhY9R197d5qn5OykU0cZeDYol3PgjbMo8MBR3eCX2vM2hwDjgQhdgBtMTze0vHzgbhS
 ETj4K8EyxlUnyoQstVQU7oF1RR+WcE+zR4WqWAPjr0eOty5Bj1loVmudpj69eqTGG7+f
 /fL+PVgF9IaItYfx9c7JQvEUWdePt30AX1BTI54xvI5fPi1RmNXJebA2/qG+jDSK2xTJ
 aBUS2cu9zQUzGGuU/lu1ESfJUoaZhLcxFwilfPRfHbwo02OMh6poheLTCnUxLLqqy6KL
 dG2w==
X-Gm-Message-State: APjAAAX/ebYRfAdve55kZHwem9n++gT3XlvNNS7iOs2/bKtALzZbmQKq
 w8P7Cq45lj57GwEmDpZr3H4vAAu40fpEU792HlWYK+45
X-Google-Smtp-Source: APXvYqzi3m04MpMLcNBiSbv5hmX+vBcx5im7WCBxkqd8d2RKBRwvXVTZpSIMNu5fgoO6w3u8wgGh0iUaQN7ngJk5DLI=
X-Received: by 2002:a6b:2cc7:: with SMTP id s190mr5634994ios.164.1565032438877; 
 Mon, 05 Aug 2019 12:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190720122016.57765-1-ankur@lipidity.com>
 <CAHmME9pGLM9a3Ww-MNy7mNT6JEQQXv4qLF0LDrAqVFUbDDPrsg@mail.gmail.com>
In-Reply-To: <CAHmME9pGLM9a3Ww-MNy7mNT6JEQQXv4qLF0LDrAqVFUbDDPrsg@mail.gmail.com>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Mon, 5 Aug 2019 21:13:45 +0200
Message-ID: <CAA6-MF9hxZk5b8W-5SoYOwXO1F9hWxUydcYKt75EtwaVc37AkA@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: Fix alternate routing table syntax on OpenBSD
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
Content-Type: multipart/mixed; boundary="===============5393451992283092174=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5393451992283092174==
Content-Type: multipart/alternative; boundary="00000000000094d2eb058f638201"

--00000000000094d2eb058f638201
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

According to "man route" on openbsd, the -T is how its supposed to be run:

     The other commands relating to adding, changing, or deleting routes
have

     the syntax:


     *route* [*-dnqtv*] [*-T* rtable] *add* [modifiers] destination gateway



The manpage for "route" doesn't even contain "rdomain" so I would assume
Ankur is correct in that diff.


Den m=C3=A5n 5 aug. 2019 kl 20:47 skrev Jason A. Donenfeld <Jason@zx2c4.com=
>:

> Hi Ankur,
>
> Thanks for this. Could you provide your Signed-off-by line? Also, why
> is this required? Is this a recent change in syntax? A new syntax? Was
> the syntax always wrong? What's the deal?
>
> Thanks,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>


--=20
May the most significant bit of your life be positive.

--00000000000094d2eb058f638201
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">According to &quot;man route&quot; on ope=
nbsd, the -T is how its supposed to be run:<div><br><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 =C2=A0 =C2=A0</span>The other commands relating to addi=
ng, changing, or deleting routes have</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>the syntax:</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span><b>route</b> [<b>-dnqtv</b>] [<b>-T=
</b> </span><span class=3D"gmail-s2" style=3D"text-decoration-line:underlin=
e;font-variant-ligatures:no-common-ligatures">rtable</span><span class=3D"g=
mail-s1" style=3D"font-variant-ligatures:no-common-ligatures">] <b>add</b> =
[</span><span class=3D"gmail-s2" style=3D"text-decoration-line:underline;fo=
nt-variant-ligatures:no-common-ligatures">modifiers</span><span class=3D"gm=
ail-s1" style=3D"font-variant-ligatures:no-common-ligatures">] </span><span=
 class=3D"gmail-s2" style=3D"text-decoration-line:underline;font-variant-li=
gatures:no-common-ligatures">destination</span><span class=3D"gmail-s1" sty=
le=3D"font-variant-ligatures:no-common-ligatures"> </span><span class=3D"gm=
ail-s2" style=3D"text-decoration-line:underline;font-variant-ligatures:no-c=
ommon-ligatures">gateway</span></p><p class=3D"gmail-p1" style=3D"margin:0p=
x;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:n=
ormal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"=
><br></p></div></div></div><br><div class=3D"gmail_quote"><div class=3D"gma=
il_attr">The manpage for &quot;route&quot; doesn&#39;t even contain &quot;r=
domain&quot; so I would assume Ankur is correct in that diff.</div><div cla=
ss=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div=
><div dir=3D"ltr" class=3D"gmail_attr">Den m=C3=A5n 5 aug. 2019 kl 20:47 sk=
rev Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.c=
om</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi A=
nkur,<br>
<br>
Thanks for this. Could you provide your Signed-off-by line? Also, why<br>
is this required? Is this a recent change in syntax? A new syntax? Was<br>
the syntax always wrong? What&#39;s the deal?<br>
<br>
Thanks,<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">May the most significant bit of your life be pos=
itive.<br></div></div>

--00000000000094d2eb058f638201--

--===============5393451992283092174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5393451992283092174==--
