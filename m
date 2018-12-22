Return-Path: <SRS0=CAqW=O7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,URI_HEX autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EF9C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Dec 2018 05:58:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B6B21934
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Dec 2018 05:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfZ87Kl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B6B21934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6e06e3c;
	Sat, 22 Dec 2018 05:57:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cfad02d
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:57:05 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52bdca4c
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:57:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p6so7561294wmc.1
 for <wireguard@lists.zx2c4.com>; Fri, 21 Dec 2018 21:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=BpVblUksupJZXEexAnOYI4+y1Qto1UzV12rIDwiTKek=;
 b=OfZ87Kl/ssllKHr4F6m2ZbMipCF9Ih+w1amQWpxsxJQDpGsc27wibR9VOI50VWx1Qb
 RU1Te6eid0/lBIUyak+YlKOt4anATppgnXNwj1lhVAVTpbqZUpj/LJdxCrHfB6D/txjm
 Aye7AzWrhfREpHRHMy4mA1tnn+UeOka8bzaXa4gsxYX/xUVu+YhybwCIVoKD3pv0RjK8
 obpTXemc8QsmYTo2azh8/DiXQq3WBWm6O43LJ59ZaEHEnMJhj68UUpoVsShrl/ltnMxO
 8tLtK0rQWuPWhDaGFxb+DoPB7J0u6MSQ9neCs6X/nPfEh15rLjKW0KTm6aC3EHjsKUiK
 I9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BpVblUksupJZXEexAnOYI4+y1Qto1UzV12rIDwiTKek=;
 b=rJ3rtYY+d1rx/bBpz1AIBIemj41hcKjilc+VyDiPdEDSYRSuv7FHdgUNhqsiDbo4ve
 SiSEpQBiigUWM5aW0176JroBKuDAQgKf6ojjSPsNLnHPpOs3coxwD7TPeo7tTUt/6lZn
 op7ZnYqbHizTjVJXYVRWwAEzMoqrWLhHTCT0e+DgyMbVBhzXyljSciTnvsbvW85ZhfIe
 sY0dyY7DtgexCKqdnFMQsBMP49Wx9tCVxHW1w6iihH/h7Po/v+aCwcsG+epc+5/mupI3
 duO0NEp54FDsTqGvMEhs3KA/dBHjXDoYQDHy6+jt0EaseQDntpJuimgKa4dSlHH4fjJK
 a/HQ==
X-Gm-Message-State: AJcUukeVizzw8HxCqCPPHfO4RIcyWNwvoTStzoAZGAjFEEsQcIHBret2
 Ui3VC5a13ycaZjWt2vTrQJ7n2jegNBiw5b92njUMohAk
X-Google-Smtp-Source: AFSGD/UZQKef+PDbnTbZtVq5aXWIoaIk1GW34/rCdtto271RZi7wErfUZcYFnmd0vwFASQedoVEBvnycSu5Mq+GsyQs=
X-Received: by 2002:a1c:c483:: with SMTP id u125mr5202797wmf.14.1545458280204; 
 Fri, 21 Dec 2018 21:58:00 -0800 (PST)
MIME-Version: 1.0
References: <CAH0N1aTX3SYqGLER1nkWaGmCUqjFSyHbx6jj_mpN2pEh+fcZww@mail.gmail.com>
In-Reply-To: <CAH0N1aTX3SYqGLER1nkWaGmCUqjFSyHbx6jj_mpN2pEh+fcZww@mail.gmail.com>
From: Jason Edson <jaysonedson@gmail.com>
Date: Fri, 21 Dec 2018 21:57:49 -0800
Message-ID: <CAH0N1aS5sMrrrNbt--nXkDqQ3_Pg25qoU7aeocM-mhNYMd-CgQ@mail.gmail.com>
Subject: Re: Android 3.18 inline kernel build failure
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
Content-Type: multipart/mixed; boundary="===============6125212830727655745=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6125212830727655745==
Content-Type: multipart/alternative; boundary="000000000000ce90c3057d960b3f"

--000000000000ce90c3057d960b3f
Content-Type: text/plain; charset="UTF-8"

Yeah that was it. Sorry I didn't think of that before. I figured it was on
my end since nobody else reported it. Thanks for the quick reply.

On Fri, Dec 21, 2018 at 9:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Are you using ccache? If so, clear your ccache and try again. The
> exact path may change depending on your build but generally this
> should cut it:
>
> $ rm -rf "$HOME/.ccache"


On Fri, Dec 21, 2018 at 9:03 PM Jason Edson <jaysonedson@gmail.com> wrote:

> When building with the latest source that the wireguard importer script
> fetches (http://WireGuard-0.0.20181218.zip) I am getting this error:
>
>   AS      net/wireguard/crypto/zinc/chacha20/chacha20-arm64.o
> fixdep: error opening config file:
> ../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/chacha20/chacha20-arm64.S:
> No such file or directory
> make[3]: ***
> [/media/otherhd/benzorom/kernel/google/marlin/scripts/Makefile.build:301:
> net/wireguard/crypto/zinc/chacha20/chacha20-arm64.o] Error 2
>
> I'm assuming that it's trying to go to the wrong path with ../ but I can't
> figure it out and so I don't know where to look in the wireguard source. I
> can remove the importer script and go back to an old version (ex
> http://WireGuard-0.0.20181119.zip) and all is well.
>
> Any help would be appreciated.
>
> Jason
>

--000000000000ce90c3057d960b3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v dir=3D"ltr"><div class=3D"gmail_default">Yeah that was it. Sorry I didn&#=
39;t think of that before. I figured it was on my end since nobody else rep=
orted it. Thanks for the quick reply.</div></div><div class=3D"gmail-HOEnZb=
 gmail-adL"><div class=3D"gmail-adm" style=3D"margin:5px 0px"></div><div cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Fri, Dec 21, 2018 at 9:29 PM Jason A. Donenfeld &lt;<=
a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Are you =
using ccache? If so, clear your ccache and try again. The<br>exact path may=
 change depending on your build but generally this<br>should cut it:<br><br=
>$ rm -rf &quot;$HOME/.ccache&quot;</blockquote></div></div></div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Dec 21, 2018 at =
9:03 PM Jason Edson &lt;<a href=3D"mailto:jaysonedson@gmail.com">jaysonedso=
n@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div class=3D"gmail_default" style=3D"font-size:small">When building wi=
th the latest source that the wireguard importer script fetches (<a href=3D=
"http://WireGuard-0.0.20181218.zip" target=3D"_blank">http://WireGuard-0.0.=
20181218.zip</a>) I am getting this error:</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small"><div class=3D"gmail_default">=C2=A0 AS=C2=A0 =C2=A0 =C2=
=A0 net/wireguard/crypto/zinc/chacha20/chacha20-arm64.o</div><div class=3D"=
gmail_default">fixdep: error opening config file: ../../../../../../kernel/=
google/marlin/net/wireguard/crypto/zinc/chacha20/chacha20-arm64.S: No such =
file or directory</div><div class=3D"gmail_default">make[3]: *** [/media/ot=
herhd/benzorom/kernel/google/marlin/scripts/Makefile.build:301: net/wiregua=
rd/crypto/zinc/chacha20/chacha20-arm64.o] Error 2</div><div class=3D"gmail_=
default"><br></div><div class=3D"gmail_default">I&#39;m assuming that it&#3=
9;s trying to go to the wrong path with ../ but I can&#39;t figure it out a=
nd so I don&#39;t know where to look in the wireguard source. I can remove =
the importer script and go back to an old version (ex=C2=A0<a href=3D"http:=
//WireGuard-0.0.20181119.zip" target=3D"_blank">http://WireGuard-0.0.201811=
19.zip</a>) and all is well.</div><div class=3D"gmail_default"><br></div><d=
iv class=3D"gmail_default">Any help would be appreciated.</div><div class=
=3D"gmail_default"><br></div><div class=3D"gmail_default">Jason</div></div>=
</div></div></div></div>
</blockquote></div>

--000000000000ce90c3057d960b3f--

--===============6125212830727655745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6125212830727655745==--
