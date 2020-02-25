Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B898EC35E17
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 21:28:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5DC20838
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 21:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWi3Z/BN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F5DC20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea4f13e5;
	Tue, 25 Feb 2020 21:24:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8425003
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 21:24:45 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c2b7a23
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 21:24:44 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id r18so441672vso.5
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 13:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C1N2YkA2ynGxDHvBmFS3GZi1rynWN8Kq4jdYeuK4t08=;
 b=fWi3Z/BNh9oF2OwUlfWRadgePUwTaHGolyOV2us8hnF4nChJbnJPANJMolTP9dwy56
 bHFfeKF0e6Jz0f9/TTIH9Xl5OMRGeeUO0IaZdepjqmx2U00JmLs7FauHZwtp1KRkdeiF
 UpM4qoOYntLA4sWs/lc8PFEKf/FmA3NB7RN7Kk1g6h+6gRimCtdYxz4PFGBF+RFb5fmM
 hxG8UrmZRspWlMQjotjfT48+Jule/ruB4mbYBL7fj2arIFCPhBV6ng1aHTfMewvbEW4F
 sRgUHHSls70G+BC/Ah/kt55TYI4u+NB+GkzMkM8wjISoZ0rPoJGjwSVFWE7s+4mKEMBH
 7I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C1N2YkA2ynGxDHvBmFS3GZi1rynWN8Kq4jdYeuK4t08=;
 b=omGSXhP1937S8eu/8IVDYSEwV+ZgcgC964k06U57lPqsniAt06H8kFa6Wn5NbkL7M3
 5GhKrJxlrQoUNiWhjxEMt7h9b/Qw7C694ZBAoW/QTKODDUsPmY4oERPfUNZj5wpTLygU
 gHnSqtrH6wOW+n666lwnH/r3leIVX931agOVf5P588bjSZAl5dAFtm+055p/EKeH0NdT
 Jw4cQ7u26i9+M34rxpVF8jXKyGCrkXP86Ih1Dhz582MZFiaX2XTURFu0bC+k0cchaxyW
 VyQU0rkmi+WO1s7Hd+MVaq9q8lSdL2vbAI0YK9eI1NZVZrO0KiEAnnD8vbcadIhOWv+b
 eIQw==
X-Gm-Message-State: APjAAAXX+kOkJbFSAItrWuEP2TZfmL40gBHRMUmt2sp0R81dcWlk11DL
 Xy1N1LSdPRh/rBiK20/ZMsAWbL2O86u0/FDcyO75PYJ3HVk=
X-Google-Smtp-Source: APXvYqxou9tJnJ0wAOfrdvHWKs58Sb3ZOh0BjuhgRjEc/99452nj6jxeA5Bqnvm/XXqiGhTHSTgN3m8iT6Uogkc3z/U=
X-Received: by 2002:a67:7987:: with SMTP id u129mr1215772vsc.83.1582666098376; 
 Tue, 25 Feb 2020 13:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20200225154427.99376-1-tanioka404@gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0767622@PLANJAVA.amebis.doma>
In-Reply-To: <99D61A626FDA8A4B90A270669121BE10D0767622@PLANJAVA.amebis.doma>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Wed, 26 Feb 2020 06:28:07 +0900
Message-ID: <CAA2ss9EMhZM8KVmUFku_4x2RoHwiZp3+VNMd4qudv+gnS1xF9A@mail.gmail.com>
Subject: Re: [PATCH 1/2 wireguard-windows] Add Japanese translation to
 resources.rc
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8117684514148989982=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8117684514148989982==
Content-Type: multipart/alternative; boundary="00000000000097848e059f6d2a2c"

--00000000000097848e059f6d2a2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, failed to send message.gotext.json.
I will send it.

2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 2:17 Simon Rozman <simon@rozm=
an.si>:

> Thank you very much. I have applied your patch to the sr/l18n branch.
>
> Looking forward to locales/ja/messages.gotext.json =F0=9F=98=8A
>
> Best regards,
> Simon
>
> > -----Original Message-----
> > From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Eiji
> > Tanioka
> > Sent: Tuesday, February 25, 2020 4:44 PM
> > To: wireguard@lists.zx2c4.com
> > Subject: [PATCH 1/2 wireguard-windows] Add Japanese translation to
> > resources.rc
> >
> > Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> > ---
> >  resources.rc | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/resources.rc b/resources.rc index 14c0ce0..b5b779a 100644
> > --- a/resources.rc
> > +++ b/resources.rc
> > @@ -56,6 +56,13 @@ VERSIONINFO_TEMPLATE(
> >    "https://www.wireguard.com/"
> >  )
> >
> > +LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT VERSIONINFO_TEMPLATE(
> > +  "041104b0", 0x411, 0x4b0,
> > +  "WireGuard: =E9=AB=98=E9=80=9F=E3=81=A7=E3=80=81=E7=8F=BE=E4=BB=A3=
=E7=9A=84=E3=81=A7=E3=80=81=E3=82=BB=E3=82=AD=E3=83=A5=E3=82=A2=E3=81=AA VP=
N =E3=83=88=E3=83=B3=E3=83=8D=E3=83=AB",
> > +  "https://www.wireguard.com/"
> > +)
> > +
> >  LANGUAGE LANG_SLOVENIAN, SUBLANG_DEFAULT  VERSIONINFO_TEMPLATE(
> >    "042404b0", 0x424, 0x4b0,
> > --
> > 2.25.0
> >
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000097848e059f6d2a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, failed to send message.gotext.json.<div>I will send=
 it.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 2:17 Simon Rozman &=
lt;<a href=3D"mailto:simon@rozman.si">simon@rozman.si</a>&gt;:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Thank you very much. I have =
applied your patch to the sr/l18n branch.<br>
<br>
Looking forward to locales/ja/messages.gotext.json =F0=9F=98=8A<br>
<br>
Best regards,<br>
Simon<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: WireGuard &lt;<a href=3D"mailto:wireguard-bounces@lists.zx2c4.co=
m" target=3D"_blank">wireguard-bounces@lists.zx2c4.com</a>&gt; On Behalf Of=
 Eiji<br>
&gt; Tanioka<br>
&gt; Sent: Tuesday, February 25, 2020 4:44 PM<br>
&gt; To: <a href=3D"mailto:wireguard@lists.zx2c4.com" target=3D"_blank">wir=
eguard@lists.zx2c4.com</a><br>
&gt; Subject: [PATCH 1/2 wireguard-windows] Add Japanese translation to<br>
&gt; resources.rc<br>
&gt; <br>
&gt; Signed-off-by: Eiji Tanioka &lt;<a href=3D"mailto:tanioka404@gmail.com=
" target=3D"_blank">tanioka404@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 resources.rc | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/resources.rc b/resources.rc index 14c0ce0..b5b779a 100644=
<br>
&gt; --- a/resources.rc<br>
&gt; +++ b/resources.rc<br>
&gt; @@ -56,6 +56,13 @@ VERSIONINFO_TEMPLATE(<br>
&gt;=C2=A0 =C2=A0 &quot;<a href=3D"https://www.wireguard.com/" rel=3D"noref=
errer" target=3D"_blank">https://www.wireguard.com/</a>&quot;<br>
&gt;=C2=A0 )<br>
&gt; <br>
&gt; +LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT VERSIONINFO_TEMPLATE(<br>
&gt; +=C2=A0 &quot;041104b0&quot;, 0x411, 0x4b0,<br>
&gt; +=C2=A0 &quot;WireGuard: =E9=AB=98=E9=80=9F=E3=81=A7=E3=80=81=E7=8F=BE=
=E4=BB=A3=E7=9A=84=E3=81=A7=E3=80=81=E3=82=BB=E3=82=AD=E3=83=A5=E3=82=A2=E3=
=81=AA VPN =E3=83=88=E3=83=B3=E3=83=8D=E3=83=AB&quot;,<br>
&gt; +=C2=A0 &quot;<a href=3D"https://www.wireguard.com/" rel=3D"noreferrer=
" target=3D"_blank">https://www.wireguard.com/</a>&quot;<br>
&gt; +)<br>
&gt; +<br>
&gt;=C2=A0 LANGUAGE LANG_SLOVENIAN, SUBLANG_DEFAULT=C2=A0 VERSIONINFO_TEMPL=
ATE(<br>
&gt;=C2=A0 =C2=A0 &quot;042404b0&quot;, 0x424, 0x4b0,<br>
&gt; --<br>
&gt; 2.25.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGua=
rd@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wire=
guard</a><br>
</blockquote></div>

--00000000000097848e059f6d2a2c--

--===============8117684514148989982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8117684514148989982==--
