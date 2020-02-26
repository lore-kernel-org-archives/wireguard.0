Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6CFC4BA09
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 02:47:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA0E2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 02:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0hAOzRj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDA0E2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8307d07;
	Wed, 26 Feb 2020 02:43:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2b60858
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 02:43:05 +0000 (UTC)
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5397e52
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 02:43:05 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 1so458999uao.1
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 18:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VjFO5c582s0Y/Mc3fybOCUxbgyLYmRbPOAQvSPIfIIM=;
 b=H0hAOzRjmfJuHoiM3kRCQ+IVc45CWdOsJIyf0r3m1ZUc0UM//c8OnHM43IVofJKwDl
 dF33vas3hFOehPBVx025uWPfZQjvKpyyZv5ToUvc+CAdJlj8CWHcF1hPSH68dy4cNAsy
 PqcnxE4MErCUwZE/JF3RNn9gZS8MyNUkBFQVG94w4xgb9mIdACCqxyYkuzirX8GFTews
 D+hFaVp+0PYv8YNvH7GDKV8WwW0gZRX58+hTznEdNz4XyyK7wL0oiC0i7k0eYz/5tPWQ
 20zYJb4tolGaU7R7j3+QwFL8fsxQAPiT+LQN1kh6cY7RR6OVco9ASy2BbFlnxwUsJU7B
 9usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VjFO5c582s0Y/Mc3fybOCUxbgyLYmRbPOAQvSPIfIIM=;
 b=nZ2xqjirJbkUUVRDNBtbqJdf4V1mUk1zsnGcFmWKUbpqlwFqAyIuWEeMRMGRe7Icpa
 1fUmmlsnuBnkp5W3wGu8e40cNT4Mmp/Nf0UKZskBmv6VtVE8eMVzgQzKyxzb5s1IBq5b
 k7T+buIfyFuC4a+3+St4TShple+/jeuFsAy7KSSenapouTX642dMH+BFAb/jqymYEgA6
 mb8QTYYg0hQiwy2QSDHv9rbgLvyKJ98GJUBlWHQG6KydM59kIbD8vKMd05CraKLDaarO
 SyWdEnLb9eogzXzExVfynIbVBw6Hlt32W1IKYTJH8n5ECOfO2L61h9jZ53pXLXDft/tG
 RitA==
X-Gm-Message-State: APjAAAXwIlKYy2sw0N1JPhPYaDC48f0tF26PXDumWsbw45/K0+RjmA1i
 4Ur1R/QWzizNzlXZ75TuqXL5/HUolk2IVl3cltv00RVoU64=
X-Google-Smtp-Source: APXvYqyb+3w/TIxDanuuh/fipRBBgt1+7Q4ke60Rs2PLc24yRhCRvHM8FBoOAboMV/R4SfZSKx5JiB17JFf1YB9uI4s=
X-Received: by 2002:ab0:634c:: with SMTP id f12mr2321058uap.48.1582685199670; 
 Tue, 25 Feb 2020 18:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20200225154427.99376-1-tanioka404@gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0767622@PLANJAVA.amebis.doma>
 <CAA2ss9EMhZM8KVmUFku_4x2RoHwiZp3+VNMd4qudv+gnS1xF9A@mail.gmail.com>
 <CAA2ss9HDT5+zU6Zz1Gt=zNRKqr+Dv8hc8z63=qJMJymhgRD=2Q@mail.gmail.com>
In-Reply-To: <CAA2ss9HDT5+zU6Zz1Gt=zNRKqr+Dv8hc8z63=qJMJymhgRD=2Q@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Wed, 26 Feb 2020 11:46:27 +0900
Message-ID: <CAA2ss9Ed9e34Ca1+c4dLrEH7kczf1cmwauArH3byQqbj+1-Myg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4390610168999408482=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4390610168999408482==
Content-Type: multipart/alternative; boundary="0000000000001e22b2059f719d03"

--0000000000001e22b2059f719d03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops! I missed mail from ML.

>The reason it is being held:
>    Message body is too big: 46986 bytes with a limit of 40 KB

2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 7:50 Eiji Tanioka <tanioka404=
@gmail.com>:

> Hmm...
> I had sent patch by 'git send-email', and CC to me was delivered,
> but it seems not delivered to ML.
>
> Is there any limitation about sending patch to ML?
> For example, maximum body line count.
> (messages.gotext.json patch have 1234 lines)
>
> Regards,
>
> 2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 6:28 Eiji Tanioka <tanioka4=
04@gmail.com>:
>
>> Sorry, failed to send message.gotext.json.
>> I will send it.
>>
>> 2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 2:17 Simon Rozman <simon@r=
ozman.si>:
>>
>>> Thank you very much. I have applied your patch to the sr/l18n branch.
>>>
>>> Looking forward to locales/ja/messages.gotext.json =F0=9F=98=8A
>>>
>>> Best regards,
>>> Simon
>>>
>>> > -----Original Message-----
>>> > From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Eiji
>>> > Tanioka
>>> > Sent: Tuesday, February 25, 2020 4:44 PM
>>> > To: wireguard@lists.zx2c4.com
>>> > Subject: [PATCH 1/2 wireguard-windows] Add Japanese translation to
>>> > resources.rc
>>> >
>>> > Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
>>> > ---
>>> >  resources.rc | 7 +++++++
>>> >  1 file changed, 7 insertions(+)
>>> >
>>> > diff --git a/resources.rc b/resources.rc index 14c0ce0..b5b779a 10064=
4
>>> > --- a/resources.rc
>>> > +++ b/resources.rc
>>> > @@ -56,6 +56,13 @@ VERSIONINFO_TEMPLATE(
>>> >    "https://www.wireguard.com/"
>>> >  )
>>> >
>>> > +LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT VERSIONINFO_TEMPLATE(
>>> > +  "041104b0", 0x411, 0x4b0,
>>> > +  "WireGuard: =E9=AB=98=E9=80=9F=E3=81=A7=E3=80=81=E7=8F=BE=E4=BB=A3=
=E7=9A=84=E3=81=A7=E3=80=81=E3=82=BB=E3=82=AD=E3=83=A5=E3=82=A2=E3=81=AA VP=
N =E3=83=88=E3=83=B3=E3=83=8D=E3=83=AB",
>>> > +  "https://www.wireguard.com/"
>>> > +)
>>> > +
>>> >  LANGUAGE LANG_SLOVENIAN, SUBLANG_DEFAULT  VERSIONINFO_TEMPLATE(
>>> >    "042404b0", 0x424, 0x4b0,
>>> > --
>>> > 2.25.0
>>> >
>>> > _______________________________________________
>>> > WireGuard mailing list
>>> > WireGuard@lists.zx2c4.com
>>> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>

--0000000000001e22b2059f719d03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oops! I missed mail from ML.<div><br><div>&gt;The reason i=
t is being held:</div>&gt;=C2=A0 =C2=A0 Message body is too big: 46986 byte=
s with a limit of 40 KB</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">2020=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4)=
 7:50 Eiji Tanioka &lt;<a href=3D"mailto:tanioka404@gmail.com">tanioka404@g=
mail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">Hmm...<div>I had sent patch by &#39;git send-email&#39;,=
 and CC to me was delivered,</div><div>but it seems not delivered to ML.</d=
iv><div><br></div><div>Is there any limitation about sending patch to ML?</=
div><div>For example, maximum body line=C2=A0count.</div><div>(messages.got=
ext.json patch have 1234 lines)</div><div><br></div><div>Regards,</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2020=
=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 6:28 Eiji Tanioka &lt;<a href=3D"=
mailto:tanioka404@gmail.com" target=3D"_blank">tanioka404@gmail.com</a>&gt;=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">Sorry, failed to send message.gotext.json.<div>I will send it.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2020=
=E5=B9=B42=E6=9C=8826=E6=97=A5(=E6=B0=B4) 2:17 Simon Rozman &lt;<a href=3D"=
mailto:simon@rozman.si" target=3D"_blank">simon@rozman.si</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Thank you very much. I h=
ave applied your patch to the sr/l18n branch.<br>
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
</blockquote></div>

--0000000000001e22b2059f719d03--

--===============4390610168999408482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4390610168999408482==--
