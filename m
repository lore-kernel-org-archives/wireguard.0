Return-Path: <SRS0=ZjPO=TV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADAFC04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2019 13:58:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9CA421479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2019 13:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="V6Ty1RoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9CA421479
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbedcd3d;
	Tue, 21 May 2019 13:58:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef081a50
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 13:58:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0388b2d3
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 13:58:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5bf8319
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nnSPg2zm8xaQr1iP5Bn6cSYp21E=; b=V6Ty1R
 oHCiZjC1baZQrnnCYPDQCPMRo7swcNp26jaAOPvn8X+5rs9ikF92bZRtGlx/7H35
 GoAJDLv4J6WQh9n/H5n5cIC4WMJbHDBHFerMTkixPsHXEGA2SpSOV1dLFDOSIAN0
 /gXuvdhLPF9IFBN8cY2dm7QfRg00x8SMdK6sr1/BQwem+yhjKY2lp4PSsf1AgHn1
 not8R4D7rruIq5FFuBiQQzlQ9XsIeby2nBUGySjqrNxedCONPhU4Kb3Qc3ru14X1
 WiyQP+u97nvlmQez+6OoHalroCN6q1/gB9+XTe9M8v0wm27utu+jyHCKySermBoa
 Fht9IAXlb4Yp1gCA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id baffce91
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 13:28:52 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id i8so16361959oth.10
 for <wireguard@lists.zx2c4.com>; Tue, 21 May 2019 06:58:18 -0700 (PDT)
X-Gm-Message-State: APjAAAXmsg0wN/sPIblg0AY1K1CD0kmTQZegvjfuwt7FZ5h8IWBUYsaO
 mLoiE/5KjiL7mqmkY8kTOPX/xmGhXkkZAs5L1Mw=
X-Google-Smtp-Source: APXvYqypVvfUlKcR8geo4m8sLkO03rwaIwYMuQbhKLm4Miq3Oim7U+T03s/iT2d8HfVj31CWbPvxNIlMxQcy7e6MKWk=
X-Received: by 2002:a9d:6195:: with SMTP id g21mr43001otk.179.1558447096654;
 Tue, 21 May 2019 06:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
 <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
 <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
In-Reply-To: <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 May 2019 15:58:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9rJkejZJsuD5oCqgHCeKzz_Psry5ykaCE+rcj4acT87Dg@mail.gmail.com>
Message-ID: <CAHmME9rJkejZJsuD5oCqgHCeKzz_Psry5ykaCE+rcj4acT87Dg@mail.gmail.com>
Subject: Re: Wireguard andoird and Fire TV
To: Revath S Kumar <gmail@revathskumar.com>
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
Content-Type: multipart/mixed; boundary="===============3458507206822346412=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3458507206822346412==
Content-Type: multipart/alternative; boundary="00000000000098f1590589663d1d"

--00000000000098f1590589663d1d
Content-Type: text/plain; charset="UTF-8"

Samuel,

Looks like you added that in
https://git.zx2c4.com/wireguard-android/commit/app/src/main/res/layout/config_list_item.xml?id=dc7363845b3edacc5bac7be85eb7fc63790e97af
. Remember why?

Jason

On Tue, May 21, 2019, 15:57 Revath S Kumar <gmail@revathskumar.com> wrote:

> Hello Samuel,
>
> Thanks for the reply. That tip helped me.
> I am not a Andorid developer, but tried to look into the code to fix
> this problem with help of some friends.
> Seems like the issue is due to `
> android:descendantFocusability="blocksDescendants"` in
> tunnel_list_item.xml [1].
>
> Is there any reason why the value is `blocksDecendants`?
> When I remove that line it seems to work fine (gif link)[2].
>
> I can send a patch if this is the only change needed.
>
> [1]:
> https://git.zx2c4.com/wireguard-android/tree/app/src/main/res/layout/tunnel_list_item.xml#n32
> [2]: https://imgur.com/a/f3nbA7R
>
> with regards,
> Revath S Kumar,
> JavaScripter / Rubyist
>
> On Sun, May 12, 2019 at 5:37 PM Samuel Holland <samuel@sholland.org>
> wrote:
>
>> On 5/6/19 4:27 AM, Revath S Kumar wrote:
>> > Hello all,
>> >
>> > I tried to side load the wireguard android on Fire TV stick.
>> > I was successfully able to install and create a new config.
>> > But once the config is created I was not able to enable the config.
>> >
>> > The navigation using the FireTV remote never gets focus on config
>> toggle button.
>> >
>> > Any plan to support TV sooner?
>>
>> See https://lists.zx2c4.com/pipermail/wireguard/2019-January/003768.html
>>
>> It's possible to get it working with the remote, but that would require
>> someone
>> to write (and test!) the code to do so. Right now there's nobody working
>> on the
>> Android app.
>>
>> > with regards,
>> > Revath S Kumar,
>> > JavaScripter / Rubyist / PHP
>>
>> Cheers,
>> Samuel
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000098f1590589663d1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Samuel,<div dir=3D"auto"><br></div><div dir=3D"auto">Look=
s like you added that in=C2=A0<a href=3D"https://git.zx2c4.com/wireguard-an=
droid/commit/app/src/main/res/layout/config_list_item.xml?id=3Ddc7363845b3e=
dacc5bac7be85eb7fc63790e97af">https://git.zx2c4.com/wireguard-android/commi=
t/app/src/main/res/layout/config_list_item.xml?id=3Ddc7363845b3edacc5bac7be=
85eb7fc63790e97af</a> . Remember why?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Jason</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, May 21, 2019, 15:57 Revath S Kumar &lt;<a =
href=3D"mailto:gmail@revathskumar.com">gmail@revathskumar.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Samuel,</div><div><br></div><=
div>Thanks for the reply. That tip helped me.<br></div><div>I am not a Ando=
rid developer, but tried to look into the code to fix this=C2=A0problem wit=
h help of some friends.</div><div>Seems like the issue is due to `<code>and=
roid:descendantFocusability=3D&quot;blocksDescendants&quot;</code>` in tunn=
el_list_item.xml [1].</div><div><br></div><div>Is there any reason why the =
value is `blocksDecendants`? <br></div><div>When I remove that line it seem=
s to work fine (gif link)[2].</div><div><br></div><div>I can send a patch i=
f this is the only change needed.<br></div><div><br></div><div>[1]: <a href=
=3D"https://git.zx2c4.com/wireguard-android/tree/app/src/main/res/layout/tu=
nnel_list_item.xml#n32" target=3D"_blank" rel=3D"noreferrer">https://git.zx=
2c4.com/wireguard-android/tree/app/src/main/res/layout/tunnel_list_item.xml=
#n32</a><br></div><div>[2]: <a href=3D"https://imgur.com/a/f3nbA7R" target=
=3D"_blank" rel=3D"noreferrer">https://imgur.com/a/f3nbA7R</a><br></div><di=
v><br></div><div><div dir=3D"ltr" class=3D"m_3256788809890159877gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">with reg=
ards,<br>Revath S Kumar,<br><div><span>JavaScripter / </span>Rubyist<br></d=
iv></div></div></div></div></div></div></div></div></div></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May =
12, 2019 at 5:37 PM Samuel Holland &lt;<a href=3D"mailto:samuel@sholland.or=
g" target=3D"_blank" rel=3D"noreferrer">samuel@sholland.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/19 4:27 A=
M, Revath S Kumar wrote:<br>
&gt; Hello all,<br>
&gt; <br>
&gt; I tried to side load the wireguard android on Fire TV stick.<br>
&gt; I was successfully able to install and create a new config.<br>
&gt; But once the config is created I was not able to enable the config.<br=
>
&gt; <br>
&gt; The navigation using the FireTV remote never gets focus on config togg=
le button.<br>
&gt; <br>
&gt; Any plan to support TV sooner?<br>
<br>
See <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2019-January/003=
768.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.zx2=
c4.com/pipermail/wireguard/2019-January/003768.html</a><br>
<br>
It&#39;s possible to get it working with the remote, but that would require=
 someone<br>
to write (and test!) the code to do so. Right now there&#39;s nobody workin=
g on the<br>
Android app.<br>
<br>
&gt; with regards,<br>
&gt; Revath S Kumar,<br>
&gt; JavaScripter / Rubyist / PHP<br>
<br>
Cheers,<br>
Samuel<br>
</blockquote></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--00000000000098f1590589663d1d--

--===============3458507206822346412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3458507206822346412==--
