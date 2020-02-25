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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C810C4BA04
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 22:51:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02AF920732
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 22:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKPk3ZaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02AF920732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9051018;
	Tue, 25 Feb 2020 22:47:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e0c7d26
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 22:47:04 +0000 (UTC)
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20bc733f
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 22:47:04 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id x18so579366vsq.4
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 14:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vK0j8RSmfJZCXek0QX0wTfyrN1CkC77gXJoyVzRBcNA=;
 b=QKPk3ZaQh8bW+CFWg3FuuEHHiiesuSOHZKAA/dDLSNaUEv5UAq39OuKh1cTDBK96Tc
 pdEZ3MtMOr7lSRNdy4xL8Shx/I412/gF3k56y5Gsds/UXWMB2musz4WyCsM4VAX5vu7x
 IStpwx5Qu+OgRMKCSMzxKPkoo4vLgGPQJR4PG2xTbMj5W8WVQneUuY8IZqs7zI9ygSn+
 +IeaZhG/FLh3xbrOt1/LoHl2c9lr+RnvDETI2rrxfadPZqPxwSpaxIrfljkymYBAblze
 aCo4cwgXZeOtq9Kkuv0KmREMlv6BnGV5qQswRW/DC8HJgJLViSF79w/qHaj634Bl/8fl
 dj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vK0j8RSmfJZCXek0QX0wTfyrN1CkC77gXJoyVzRBcNA=;
 b=lUQ3vpR6xOq5o5fz4Doqfp9kN5nmZ1qgNisWhiyXWXAoLrxmNqxubPYUnDltMmWINx
 Cp2zNedcm0y+TA5KbitChKV6QPHzEBeWhhNtwiuyBey3Z66/Hd49OrMBDkHNAdi8ktQ4
 iLcnpI/kW6Il/haeJhzPRfHe3YVUOGzehOBxd0LTyrUDzAtSG/kXQ64LEwuKRh6DQmlR
 NbifiFeDeYhc3ct23FdsdRk6r8+frlTu2GmS/3fgnJI+00dAN55d81sUhW/OjqnKhjZr
 K4y7dr/VahjuIYqOD6pJwsvR6r60HZehYI+vtXVNFtvz1SLFWhM10TlB8SJ3H6tfZEE8
 xQ9Q==
X-Gm-Message-State: APjAAAU0daQ8xQsP5J1UGkW3io/ZLJ+gBI8XiVFi/aSaRyVBmfCX+vFw
 yuuT8iN14ja2zTS1ikq3VyHndHz4G9g26Pa9LEovHy6A0Qk=
X-Google-Smtp-Source: APXvYqzIctf/w2CE46lddo6pYOuLgZnbkgu+XW0NWc2F1bQ+Vs2JUkRT3hO1fnrUL2XO6CmwjzRAUNUPSZgnxBalZUc=
X-Received: by 2002:a67:ef03:: with SMTP id j3mr1418892vsr.102.1582671038717; 
 Tue, 25 Feb 2020 14:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20200225154427.99376-1-tanioka404@gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0767622@PLANJAVA.amebis.doma>
 <CAA2ss9EMhZM8KVmUFku_4x2RoHwiZp3+VNMd4qudv+gnS1xF9A@mail.gmail.com>
In-Reply-To: <CAA2ss9EMhZM8KVmUFku_4x2RoHwiZp3+VNMd4qudv+gnS1xF9A@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Wed, 26 Feb 2020 07:50:27 +0900
Message-ID: <CAA2ss9HDT5+zU6Zz1Gt=zNRKqr+Dv8hc8z63=qJMJymhgRD=2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2 wireguard-windows] Add Japanese translation to
 resources.rc
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1059478626075453062=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1059478626075453062==
Content-Type: multipart/alternative; boundary="0000000000000f2129059f6e519a"

--0000000000000f2129059f6e519a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm...
I had sent patch by 'git send-email', and CC to me was delivered,
but it seems not delivered to ML.

Is there any limitation about sending patch to ML?
For example, maximum body line count.
(messages.gotext.json patch have 1234 lines)

Regards,

2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 6:28 Eiji Tanioka <tanioka404=
@gmail.com>:

> Sorry, failed to send message.gotext.json.
> I will send it.
>
> 2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 2:17 Simon Rozman <simon@ro=
zman.si>:
>
>> Thank you very much. I have applied your patch to the sr/l18n branch.
>>
>> Looking forward to locales/ja/messages.gotext.json =F0=9F=98=8A
>>
>> Best regards,
>> Simon
>>
>> > -----Original Message-----
>> > From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Eiji
>> > Tanioka
>> > Sent: Tuesday, February 25, 2020 4:44 PM
>> > To: wireguard@lists.zx2c4.com
>> > Subject: [PATCH 1/2 wireguard-windows] Add Japanese translation to
>> > resources.rc
>> >
>> > Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
>> > ---
>> >  resources.rc | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/resources.rc b/resources.rc index 14c0ce0..b5b779a 100644
>> > --- a/resources.rc
>> > +++ b/resources.rc
>> > @@ -56,6 +56,13 @@ VERSIONINFO_TEMPLATE(
>> >    "https://www.wireguard.com/"
>> >  )
>> >
>> > +LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT VERSIONINFO_TEMPLATE(
>> > +  "041104b0", 0x411, 0x4b0,
>> > +  "WireGuard: =E9=AB=98=E9=80=9F=E3=81=A7=E3=80=81=E7=8F=BE=E4=BB=A3=
=E7=9A=84=E3=81=A7=E3=80=81=E3=82=BB=E3=82=AD=E3=83=A5=E3=82=A2=E3=81=AA VP=
N =E3=83=88=E3=83=B3=E3=83=8D=E3=83=AB",
>> > +  "https://www.wireguard.com/"
>> > +)
>> > +
>> >  LANGUAGE LANG_SLOVENIAN, SUBLANG_DEFAULT  VERSIONINFO_TEMPLATE(
>> >    "042404b0", 0x424, 0x4b0,
>> > --
>> > 2.25.0
>> >
>> > _______________________________________________
>> > WireGuard mailing list
>> > WireGuard@lists.zx2c4.com
>> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--0000000000000f2129059f6e519a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hmm...<div>I had sent patch by &#39;git send-email&#39;, a=
nd CC to me was delivered,</div><div>but it seems not delivered to ML.</div=
><div><br></div><div>Is there any limitation about sending patch to ML?</di=
v><div>For example, maximum body line=C2=A0count.</div><div>(messages.gotex=
t.json patch have 1234 lines)</div><div><br></div><div>Regards,</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2020=
=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 6:28 Eiji Tanioka &lt;<a href=3D"=
mailto:tanioka404@gmail.com">tanioka404@gmail.com</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Sorry, failed t=
o send message.gotext.json.<div>I will send it.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2020=E5=B9=B42=E6=9C=
=8826=E6=97=A5(=E6=B0=B4) 2:17 Simon Rozman &lt;<a href=3D"mailto:simon@roz=
man.si" target=3D"_blank">simon@rozman.si</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Thank you very much. I have applied your=
 patch to the sr/l18n branch.<br>
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
</blockquote></div>

--0000000000000f2129059f6e519a--

--===============1059478626075453062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1059478626075453062==--
