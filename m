Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC63C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 16:04:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9B320657
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 16:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ak0aXD+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9B320657
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8c94d7f;
	Fri, 2 Nov 2018 16:00:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d6dbc06
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 16:00:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 237224c0
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 16:00:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f8ec106
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=SbCCZAtrosCAadV6xOly7nKero0=; b=Ak0aXD
 +9tbjh17L2DrjZU03tewfzk3qPkAAEz8ZoSyw/AsLVVvsgbDm9jH3PDkVqYyZEEB
 Q7KdHWWDELcHnTYqkoM05z4awaKwfFkygipMsW4i8bd+Tw/8LUGjoT6ca4Tcq+UO
 IgPBrRANno4sTBUja9hXgmJRunacdZoW8VvqB6zv3sI3LPxWM/kz94Ih50jHHqaS
 2HVytG2uunDmNr4fldh5tJdmz6TMH5H8ucgemCSrQP+scI2fTaqiyqoAPlInTWRS
 oRvmgw0MhPYIGJsYFDdJ2IMVF/0ePdNE/SlOoXOdHZxLmh0T9+1csy36IRCleCsZ
 R0e7HaDTmaRd8mdg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d2e31134
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 16:00:49 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id q5so2090076otl.13
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 09:04:41 -0700 (PDT)
X-Gm-Message-State: AGRZ1gLB3qi9vK+K+tMMABq/JJj1L4uAcMFzyCA70up93eWVgjRqU7fF
 8gqh0o+zJYK110XPlO374d2s1fdwhkwD561l0s4=
X-Google-Smtp-Source: AJdET5cUK6VkoNe8E5OwgG1HwlbI4M0DAbP4JkSJcyDtKZSovASOLMAufC4Mrqyyd/bgryg6BpnR2kIdqXbr7xzU1lQ=
X-Received: by 2002:a9d:837:: with SMTP id 52mr7042297oty.143.1541174680823;
 Fri, 02 Nov 2018 09:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
 <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
 <20181102121036.GA29314@sita-dell>
 <CANcuY=puD9s8hVoQMcyp=wvmXUZ_hiaC7jByEgyahJpU=TiLEg@mail.gmail.com>
In-Reply-To: <CANcuY=puD9s8hVoQMcyp=wvmXUZ_hiaC7jByEgyahJpU=TiLEg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Nov 2018 17:03:10 +0100
X-Gmail-Original-Message-ID: <CAHmME9ozeZ_vvhKAC63JDbVtpSe76Kziws7ov=eWNNBU8+sEVw@mail.gmail.com>
Message-ID: <CAHmME9ozeZ_vvhKAC63JDbVtpSe76Kziws7ov=eWNNBU8+sEVw@mail.gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
To: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4984132834472723853=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4984132834472723853==
Content-Type: multipart/alternative; boundary="0000000000006334e70579b0b1d6"

--0000000000006334e70579b0b1d6
Content-Type: text/plain; charset="UTF-8"

Yikes! Will have this fixed by tonight.

On Fri, Nov 2, 2018, 13:53 Laszlo KERTESZ <laszlo.kertesz@gmail.com wrote:

> That's exactly the message i got.
>
> On Fri, Nov 2, 2018, 14:10 Sitaram Chamarty <sitaramc@gmail.com wrote:
>
>> On Fri, Nov 02, 2018 at 08:39:28AM +0100, Kalin KOZHUHAROV wrote:
>> > On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ <laszlo.kertesz@gmail.com>
>> wrote:
>> > > The current FDroid build (version 0.0.20181031) is broken. The Gui
>> starts but it states "Unknown userspace Go version" and the tunnel
>> activation action results in an error.
>> > >
>> > Hmm... just installed (1st time) and started it, seems fine (haven't
>> > configured it yet).
>> > What is your configuration?
>> >
>> > Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on
>> > XT1905 phone.
>>
>> I can confirm the problem, though the error I see is different:
>>
>>     Error bringing up tunnel: No implementation found for java.lang.String
>>     com.wireguard.android.backend.GoBackend.wgVersion() (tried
>> Java_com_wireguard_android...
>>
>> (I'm sorry I have n o idea how to expand that message to its
>> full text, whatever it may have been)
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000006334e70579b0b1d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yikes! Will have this fixed by tonight.</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 2, 2018, 13:53 Laszlo KERTE=
SZ &lt;<a href=3D"mailto:laszlo.kertesz@gmail.com">laszlo.kertesz@gmail.com=
</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div>=
That&#39;s exactly the message i got.<br><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Fri, Nov 2, 2018, 14:10 Sitaram Chamarty &lt;<a href=3D"ma=
ilto:sitaramc@gmail.com" target=3D"_blank" rel=3D"noreferrer">sitaramc@gmai=
l.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Nov 02, 20=
18 at 08:39:28AM +0100, Kalin KOZHUHAROV wrote:<br>
&gt; On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ &lt;<a href=3D"mailto:la=
szlo.kertesz@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">las=
zlo.kertesz@gmail.com</a>&gt; wrote:<br>
&gt; &gt; The current FDroid build (version 0.0.20181031) is broken. The Gu=
i starts but it states &quot;Unknown userspace Go version&quot; and the tun=
nel activation action results in an error.<br>
&gt; &gt;<br>
&gt; Hmm... just installed (1st time) and started it, seems fine (haven&#39=
;t<br>
&gt; configured it yet).<br>
&gt; What is your configuration?<br>
&gt; <br>
&gt; Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on<=
br>
&gt; XT1905 phone.<br>
<br>
I can confirm the problem, though the error I see is different:<br>
<br>
=C2=A0 =C2=A0 Error bringing up tunnel: No implementation found for java.la=
ng.String<br>
=C2=A0 =C2=A0 com.wireguard.android.backend.GoBackend.wgVersion() (tried Ja=
va_com_wireguard_android...<br>
<br>
(I&#39;m sorry I have n o idea how to expand that message to its<br>
full text, whatever it may have been)<br>
</blockquote></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000006334e70579b0b1d6--

--===============4984132834472723853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4984132834472723853==--
