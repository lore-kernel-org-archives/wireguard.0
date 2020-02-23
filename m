Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29FEC35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 08:23:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1182206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 08:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="J+YjZZwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1182206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cded874f;
	Sun, 23 Feb 2020 08:19:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c19daab0
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 08:19:48 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [IPv6:2a00:ee2:209:164::f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 057fcd20
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 08:19:48 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 5C5631002F94; Sun, 23 Feb 2020 09:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1582446180;
 bh=crGeBczpKsHx6yoVDOYmIloCFXtrDyIDzLv4CQ42DPk=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=J+YjZZwL4bsB06DcdlPm2wPUpDhfvXQ9kjUrQvQC6AZY2gR7IQk1i8c9VKwFJn5Of
 zFYSbQCyaggEuvftXxOSSxzSzv30b8K/SssKQK3yHKQ9/BOtp1GxynigOS5nzL2//m
 cpWamx3KIqBC5e389X3Q+n4F3WDEBzb+kSv1meqo=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id A29B01002F87;
 Sun, 23 Feb 2020 09:22:57 +0100 (CET)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0468.000; Sun, 23 Feb 2020 09:22:57 +0100
From: Simon Rozman <simon@rozman.si>
To: Eiji Tanioka <tanioka404@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] Add japanese translation.
Thread-Topic: [PATCH] Add japanese translation.
Thread-Index: AQHV4yYHU90nY+tQGEeolquzntujRqgbjDWAgAA8cxqAADQ0gIABldSAgAA824CACpTGgIAAGkq7
Date: Sun, 23 Feb 2020 08:22:56 +0000
Message-ID: <3a52d59c-0784-4eaf-aedd-ce7baba2f5c3@rozman.si>
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
 <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>,
 <CAA2ss9GG5P2QgRtO=sBSKywTqAniB4rfk7qSWOkvTtVnvPNsXg@mail.gmail.com>
In-Reply-To: <CAA2ss9GG5P2QgRtO=sBSKywTqAniB4rfk7qSWOkvTtVnvPNsXg@mail.gmail.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============4099217867221602795=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4099217867221602795==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3a52d59c07844eafaeddce7baba2f5c3rozmansi_"

--_000_3a52d59c07844eafaeddce7baba2f5c3rozmansi_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi!

Please, see the simple translation instructions in the sr/l18n branch READM=
E.md file.

If you don't have Windows at your disposal, I can generate an empty Japanes=
e messages.json file for you.

Best regards,
Simon
________________________________
From: Eiji Tanioka <tanioka404@gmail.com>
Sent: Sunday, 23 February 2020 08:49
To: Simon Rozman; wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Add japanese translation.

Hi Simon!

I finished wireguard-apple translation to Japanese.
So I will start to translate wireguard-windows.

How do I work on it?
I guess:
- checkout sr/i18n
- create locales/ja/messages.gotext.json
- translate "message" into "translation" field
- send patch to ML

Is this correct?
Thanks,

2020=1B$BG/=1B(B2=1B$B7n=1B(B16=1B$BF|=1B(B(=1B$BF|=1B(B) 23:13 Eiji Taniok=
a <tanioka404@gmail.com>:
>
> Hi Simon,
>
> Sure! I will be pleased to help wireguard-windows localization.
> Currently, I'm working on wireguard-apple translation. When finished,
> I will try to translate wireguard-windows to Japanese.
>
> Regards,
> Eiji
>
>
> 2020=1B$BG/=1B(B2=1B$B7n=1B(B16=1B$BF|=1B(B(=1B$BF|=1B(B) 18:40 Simon Roz=
man <simon@rozman.si>:
> >
> > Hi Eiji!
> >
> >
> >
> > I wonder if you might be willing to contribute Japanese translation for=
 the wireguard-windows as well?
> >
> >
> >
> > The wireguard-windows has pending localization support here https://git=
.zx2c4.com/wireguard-windows/log/?h=3Dsr/l18n. I have translated it to Slov=
enian already. Furthermore, I should get the French translation to integrat=
e soon too.
> >
> >
> >
> > Regards, Simon
> >
> >
> >
> > From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Eiji T=
anioka
> > Sent: Saturday, February 15, 2020 11:23 AM
> > To: Samuel Holland <samuel@sholland.org>
> > Cc: wireguard@lists.zx2c4.com
> > Subject: Re: [PATCH] Add japanese translation.
> >
> >
> >
> > Thank you for applying my patch!
> >
> >
> >
> > I'm now translating wireguard-apple into Japanese. When finished, I wil=
l send patch.
> >
> > Next time, I will not forget your advice.
> >
> >
> >
> > Thanks,
> >
> >
> >
> > 2020=1B$BG/=1B(B2=1B$B7n=1B(B15=1B$BF|=1B(B(=1B$BEZ=1B(B) 15:14 Samuel =
Holland <samuel@sholland.org>:
> >
> > On 2/14/20 11:27 PM, Eiji Tanioka wrote:
> > > Hi, Samuel.
> > >
> > > Thank you for your reply!
> > > I re-created patch.
> >
> > Thanks, applied:
> > https://git.zx2c4.com/wireguard-android/commit/?id=3D822f72df956ecd3aaa=
6a2b254e059e38ba5122e4

--_000_3a52d59c07844eafaeddce7baba2f5c3rozmansi_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12.=
0pt; line-height:1.3; color:#1F497D">
Hi!<br>
<br>
Please, see the simple translation instructions in the sr/l18n branch READM=
E.md file.<br>
<br>
If you don't have Windows at your disposal, I can generate an empty Japanes=
e messages.json file for you.<br>
<div><br>
</div>
<div id=3D"x_signature-x" class=3D"x_signature_editor" style=3D"font-family=
:Calibri,Arial,Helvetica,sans-serif; font-size:12.0pt; color:#1F497D">
Best regards,<br>
Simon<br>
</div>
</div>
<hr style=3D"border:none; height:1px; color:#E1E1E1; background-color:#E1E1=
E1">
<div style=3D"border:none; padding:3.0pt 0cm 0cm 0cm"><span style=3D"font-s=
ize:11.0pt; font-family:Calibri,Arial,Helvetica,sans-serif"><b>From:</b> Ei=
ji Tanioka &lt;tanioka404@gmail.com&gt;<br>
<b>Sent:</b> Sunday, 23 February 2020 08:49<br>
<b>To:</b> Simon Rozman; wireguard@lists.zx2c4.com<br>
<b>Subject:</b> Re: [PATCH] Add japanese translation.<br>
</span></div>
<br type=3D"attribution">
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Simon!<br>
<br>
I finished wireguard-apple translation to Japanese.<br>
So I will start to translate wireguard-windows.<br>
<br>
How do I work on it?<br>
I guess:<br>
- checkout sr/i18n<br>
- create locales/ja/messages.gotext.json<br>
- translate &quot;message&quot; into &quot;translation&quot; field<br>
- send patch to ML<br>
<br>
Is this correct?<br>
Thanks,<br>
<br>
2020=1B$BG/=1B(B2=1B$B7n=1B(B16=1B$BF|=1B(B(=1B$BF|=1B(B) 23:13 Eiji Taniok=
a &lt;tanioka404@gmail.com&gt;:<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; Sure! I will be pleased to help wireguard-windows localization.<br>
&gt; Currently, I'm working on wireguard-apple translation. When finished,<=
br>
&gt; I will try to translate wireguard-windows to Japanese.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Eiji<br>
&gt;<br>
&gt;<br>
&gt; 2020=1B$BG/=1B(B2=1B$B7n=1B(B16=1B$BF|=1B(B(=1B$BF|=1B(B) 18:40 Simon =
Rozman &lt;simon@rozman.si&gt;:<br>
&gt; &gt;<br>
&gt; &gt; Hi Eiji!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I wonder if you might be willing to contribute Japanese translati=
on for the wireguard-windows as well?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The wireguard-windows has pending localization support here <a hr=
ef=3D"https://git.zx2c4.com/wireguard-windows/log/?h=3Dsr/l18n">
https://git.zx2c4.com/wireguard-windows/log/?h=3Dsr/l18n</a>. I have transl=
ated it to Slovenian already. Furthermore, I should get the French translat=
ion to integrate soon too.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards, Simon<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; From: WireGuard &lt;wireguard-bounces@lists.zx2c4.com&gt; On Beha=
lf Of Eiji Tanioka<br>
&gt; &gt; Sent: Saturday, February 15, 2020 11:23 AM<br>
&gt; &gt; To: Samuel Holland &lt;samuel@sholland.org&gt;<br>
&gt; &gt; Cc: wireguard@lists.zx2c4.com<br>
&gt; &gt; Subject: Re: [PATCH] Add japanese translation.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thank you for applying my patch!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I'm now translating wireguard-apple into Japanese. When finished,=
 I will send patch.<br>
&gt; &gt;<br>
&gt; &gt; Next time, I will not forget your advice.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; 2020=1B$BG/=1B(B2=1B$B7n=1B(B15=1B$BF|=1B(B(=1B$BEZ=1B(B) 15:14 S=
amuel Holland &lt;samuel@sholland.org&gt;:<br>
&gt; &gt;<br>
&gt; &gt; On 2/14/20 11:27 PM, Eiji Tanioka wrote:<br>
&gt; &gt; &gt; Hi, Samuel.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thank you for your reply!<br>
&gt; &gt; &gt; I re-created patch.<br>
&gt; &gt;<br>
&gt; &gt; Thanks, applied:<br>
&gt; &gt; <a href=3D"https://git.zx2c4.com/wireguard-android/commit/?id=3D8=
22f72df956ecd3aaa6a2b254e059e38ba5122e4">
https://git.zx2c4.com/wireguard-android/commit/?id=3D822f72df956ecd3aaa6a2b=
254e059e38ba5122e4</a><br>
</div>
</span></font>
</body>
</html>

--_000_3a52d59c07844eafaeddce7baba2f5c3rozmansi_--

--===============4099217867221602795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4099217867221602795==--
