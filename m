Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65F0C2D0D2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 798182176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCfOkPRZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 798182176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f6ba346;
	Thu, 19 Dec 2019 01:20:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7abed98
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 10:09:19 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ca4942a
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 10:09:19 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id a22so7090040ios.3
 for <wireguard@lists.zx2c4.com>; Wed, 11 Dec 2019 02:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XwcQSpDmWH7Fb3fRfWIEk7jqSBCGNhi7Z64HbgILDgg=;
 b=oCfOkPRZlLkRhS9cxfkrv0T+i3Rlt72/ebixSzSnHAGPqwhYRsxZj2PWHcxAL713g7
 zC9KZSt93+hLfo6TqPTkOmU28v2gOSUafuP38MwAxGPkgvJnX1IJPFAMtAWDziulkTCP
 hM/6194n4rzobd3eFWkQZbK+EE3nB/pkdDOYBcrf1GhCvGoS7nzAI5Ug+eAlh13vaC0n
 jfqc9O3iTu9bZeinPetLh3w1/i/skbXp/3EVm41ow25T7ZixJiO1gdMHyzrlFXJIIbDj
 AZ1SECRLrEI3mDSAeTGaw0TvGcvCZX8jAb22qdtN8fJvtKW9qONNEEQDMaJPC5jOK9m5
 cjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XwcQSpDmWH7Fb3fRfWIEk7jqSBCGNhi7Z64HbgILDgg=;
 b=hWo2UyQw8JT5hZ+KLZ0W8nQt0GDAmS8psSWUBJ/L+vZQTpOin/YL9sYQRPYOJciR8n
 Ar4bLqi9kAt7oxotBd+AlKjge1eX373yY8lqbk18QHVNApuf5G0PkRwgFC6xQEDllmFE
 YmFWdCzQ5uWn6FuHUU6XSJcvd23qDywomskRoKXjDl6lM1lJinj7cITQNAq3yfAzNFVW
 r0FgbCQjCHp7XrOtz7fancTtd42jyHMktEaem/csIw8mPgECtxW4ELlpCamGbqcnJbf0
 gzgcy0omVZNQkXOsl2z/WqGsbUqWXAUyMn+wLb/mKMTK0cV68S4iI25mwVgCr4IBDy4o
 T1Gw==
X-Gm-Message-State: APjAAAV3W2IboFmMWdR9YFF+qsOQDx5MNNk9nRrbQvtAvpVfZHeSoDCo
 HgebRT/Q5pFL4CL9kOXnP1pGTcArkF0WyddnKUbE+3kE
X-Google-Smtp-Source: APXvYqzI9nEn62wdW6jTlCLVp8x4QeyllOG+c4ZnDiQqMWhWZ976tpQ5pG9DwHGNldr+LJYhrNRvuP8MdhXbocHwnu4=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr2130492ioa.102.1576058958489; 
 Wed, 11 Dec 2019 02:09:18 -0800 (PST)
MIME-Version: 1.0
References: <000a01d5aff2$a17d7d80$e4787880$@istream.today>
In-Reply-To: <000a01d5aff2$a17d7d80$e4787880$@istream.today>
From: Fierascu Vlad <mythnick@gmail.com>
Date: Wed, 11 Dec 2019 12:09:07 +0200
Message-ID: <CAHyK+75Q7fOvnKjDNvJOZBjDWD+MzrBWGxM-a6L51c4LMbPf-g@mail.gmail.com>
Subject: Re: Limited speed 100Mbps Down 200Mbps UP
To: cristian.c@istream.today
X-Mailman-Approved-At: Thu, 19 Dec 2019 02:20:26 +0100
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
Content-Type: multipart/mixed; boundary="===============1271689809078827053=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1271689809078827053==
Content-Type: multipart/alternative; boundary="0000000000005dad4005996ad29f"

--0000000000005dad4005996ad29f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

more info about the server location, client location....

Peering might be the answer !

regards,
************************************************
Fierascu Vlad
mythnick@gmail.com
www.mythnick.com


=C3=8En mie., 11 dec. 2019 la 09:15, <cristian.c@istream.today> a scris:

> Hello,
>
>
>
>    I have installed Wireguard on multiple location, servers, on each of
> this server I have 1Gbps link, my problem is that I=E2=80=99m not able to=
 get more
> that ~100-120Mbps for download and ~200Mbps Upload, any idea why?
>
>
>
>   As a server I use CentOS 7 as for =E2=80=9Cclient=E2=80=9D I use Window=
s 10 with latest
> Wireguard client..
>
>
>
> Thank you in advance,
>
> Cristian
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000005dad4005996ad29f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">more info about the server location, client location....<b=
r><br>Peering might be the answer !<div><br clear=3D"all"><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div>regards,</di=
v></div><div><span style=3D"color:rgb(34,34,34);font-size:small">**********=
**************************************</span><br style=3D"color:rgb(34,34,3=
4);font-size:small"><span style=3D"color:rgb(34,34,34);font-size:small">Fie=
rascu Vlad</span><div style=3D"color:rgb(34,34,34);font-size:small"><a href=
=3D"mailto:mythnick@gmail.com" target=3D"_blank">mythnick@gmail.com</a><br>=
</div><div style=3D"color:rgb(34,34,34);font-size:small"><a href=3D"http://=
www.mythnick.com" target=3D"_blank">www.mythnick.com</a></div></div></div><=
/div></div></div></div></div></div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En mie., 11 dec. 2019 la =
09:15, &lt;cristian.c@istream.today&gt; a scris:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_=
6009355575683238049WordSection1"><p class=3D"MsoNormal">Hello,<u></u><u></u=
></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">=
=C2=A0=C2=A0 I have installed Wireguard on multiple location, servers, on e=
ach of this server I have 1Gbps link, my problem is that I=E2=80=99m not ab=
le to get more that ~100-120Mbps for download and ~200Mbps Upload, any idea=
 why?<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p cl=
ass=3D"MsoNormal">=C2=A0 As a server I use CentOS 7 as for =E2=80=9Cclient=
=E2=80=9D I use Windows 10 with latest Wireguard client..<u></u><u></u></p>=
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">Thank=
 you in advance,<u></u><u></u></p><p class=3D"MsoNormal">Cristian<u></u><u>=
</u></p><p class=3D"MsoNormal">=C2=A0 <u></u><u></u></p></div></div>_______=
________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000005dad4005996ad29f--

--===============1271689809078827053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1271689809078827053==--
