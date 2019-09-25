Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C31BC432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 18:27:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BAE21655
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 18:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vS20TquT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BAE21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e91292d7;
	Wed, 25 Sep 2019 18:27:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25c499ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 18:27:09 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6b7f387
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 18:27:09 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id u8so1337566iom.5
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygkpQETyUfroj7qj4sdduKRw1FfVxm25FAoj9Nc0eIE=;
 b=vS20TquTNE9J+EVR53qrqdzQ7G6Q605mkY3Lkhv2kS1zWCAwi+FdZeJ2wihcQExVSJ
 vMtUOVa8llPS9Fh7D+yLSjzhzZHTBLpaGML9XwB4LyKCtSWz3H3tB7BcgktVJr+uHL4f
 lO8rro/GN7hjTyMU7C2OyqU0wmXy5DbIhhSOLd/0Na4aOncxEOtTjpXVmxKy+zAWXzSo
 LqK/jZHccm4k/M4MYmWTRhRcsV5mbHVFyt7Szy1BTuNxZMgBCW7rFVQ9omrXYke4JblY
 Uwxu+ydJP6yf6zPm1ycPS0tXhs1ez1oWwcV+HVbSKTWcYPyS+MfHK5yeuY88uhiBhFT9
 UaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygkpQETyUfroj7qj4sdduKRw1FfVxm25FAoj9Nc0eIE=;
 b=i2C7Jtij9Lp7t+gVMwg9wAYR87CPkREergwnscO/N6NGX5iiEGuVEv0wv+/ZwE3ZFW
 1NNi+6y4a7mui9p9umt815h4w7H91AC0b1pa/f03fdjfZTt8ka+UQXvDCqA76tyskJk2
 RjjLMlY1mkuxftNLehFVcxxE0b3gWdzslcCflCKPjEvq749El5od6mWNecLh06kV8jXy
 7fdD1e+N5Qg6p8rT1rpTksKgUhKWTsvF3HKEWslCii92mG41ptwprEjkoMKBB+C5aB40
 z4YCV6bhCKNCvvU0fyah0X1nnE4SgUgkUVgyJ5V0l34qQ6ntMHjh9QNkHms16kUt5LYz
 aB5A==
X-Gm-Message-State: APjAAAWPeapkVCs4sQxKibjHXM+QBm8427xRKUMVgqpuSkyPHEzzKwmr
 si8evDmmcXmNJrqXvNBq2KLKa+zcS4dmoeuOOpw70BKV3Jo=
X-Google-Smtp-Source: APXvYqwPK/goG+VP03TnWgP2gWiqaFn8obkPyPGfWOwuY0liKztS8C5Z3bNZpOctbo2QoVjfxselNeOrJI1ZoLPYtVI=
X-Received: by 2002:a92:3854:: with SMTP id f81mr1456497ila.31.1569436028592; 
 Wed, 25 Sep 2019 11:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <573fbdd7-cc13-ee2a-e9a7-eaf095471e3a@noc23.de>
 <CAA6-MF-nK3Jm6jzdXuhk62cqfD4XACtG1md3jvUBCix3fcnuFw@mail.gmail.com>
 <97473dc6-22d5-0a13-f0e6-9ce6767f0ff7@noc23.de>
 <CAA6-MF8c+yxrzR_boA4zhd0-7X2zxJfk8rt9NiysJ87-qXr3eg@mail.gmail.com>
 <0a591f71-8387-a9fa-1097-ff654445bdae@noc23.de>
In-Reply-To: <0a591f71-8387-a9fa-1097-ff654445bdae@noc23.de>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Wed, 25 Sep 2019 20:26:57 +0200
Message-ID: <CAA6-MF9pHX4vvKSu+dLmSSx+K6hiaUpNCwkstuRsZfe3Nm=EBQ@mail.gmail.com>
Subject: Re: Build fail on OpenBSD 6.5 amd64
To: Ulrich Kalloch <ulli@noc23.de>
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
Content-Type: multipart/mixed; boundary="===============2580572361268962612=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2580572361268962612==
Content-Type: multipart/alternative; boundary="000000000000fb6801059364cc07"

--000000000000fb6801059364cc07
Content-Type: text/plain; charset="UTF-8"

I have no control over that script, but I think having a compiler in place
when building stuff is such a reasonable pre-requisite so that the script
would not have to look for it.


Den ons 25 sep. 2019 kl 16:23 skrev Ulrich Kalloch <ulli@noc23.de>:

> Am 25.09.19 um 13:01 schrieb Janne Johansson:
> > Den ons 25 sep. 2019 kl 10:52 skrev Ulrich Kalloch <ulli@noc23.de>:
> >
> >>>> if you have installed firmware remove it if possible.
> >>> The install Process check that /usr/include/machine is empty.
> >>>> then check that the directory /usr/include/machine is empty.
> >>> If not clean it.
> >>> I think this part is way off and probably all the way into "bad
> advice".
> >>>
> >>> Cleaning /usr/include/machine is wrong, and fw_update seems completely
> >>> unrelated to either the contents of the C includes or building WG.
> >> but without cleaning /usr/include/machine the install Process fails ...
> >>
> > I made an amd64 VM to test and it went fine:
> >
> > ...
> >
> > golang.zx2c4.com/wireguard/tun
> >
> > golang.zx2c4.com/wireguard/device
> >
> > golang.zx2c4.com/wireguard
> >
> > install -d "/usr/local/bin" && install -m 0755 "wireguard-go"
> > "/usr/local/bin/wireguard-go"
> >
> > gmake: Leaving directory '/usr/src/wireguard/wireguard-go-0.0.20190908'
> >
> > [+] Cleaning up build directory
> >
> > comptest# ls /usr/include/machine/
> >
> >
> > _float.h            exec.h              limits.h
> rbus_machdep.h
> > _types.h            fenv.h              loadfile_machdep.h  reg.h
> > ...
> >
> > I think your comp-less box was messed up in more ways than you know,
> > probably because of the random "lets poke here, rerun unrelated fw_update
> > there" and you had no idea which of your actions made it back into a
> usable
> > shape again. Redo your test from scratch (without skipping the compiler
> > set) and post the output on a pastebin.
> >
> > If there is an error it needs to get fixed for real and not with
> > hand-wavingly delete include files needed for other things.
> >
> yes .. you are right. Thanks for your time to check.
>
> If i have a Server or VM with comp installed all is fine.
>
> but my first setup was without comp installed and the script fails.
>
> maybe you can build in a check for installed comp before?
>
> The Problem is only if comp is not installed.
>
> Thanks and sorry for the communication madness.
>
> Regards
>
> Ulli
>
>

-- 
May the most significant bit of your life be positive.

--000000000000fb6801059364cc07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have no control over that script, but I think having a c=
ompiler in place when building stuff is such a reasonable pre-requisite so =
that the script would not have to look for it.<div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den ons 25 sep=
. 2019 kl 16:23 skrev Ulrich Kalloch &lt;<a href=3D"mailto:ulli@noc23.de">u=
lli@noc23.de</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Am 25.09.19 um 13:01 schrieb Janne Johansson:<br>
&gt; Den ons 25 sep. 2019 kl 10:52 skrev Ulrich Kalloch &lt;<a href=3D"mail=
to:ulli@noc23.de" target=3D"_blank">ulli@noc23.de</a>&gt;:<br>
&gt;<br>
&gt;&gt;&gt;&gt; if you have installed firmware remove it if possible.<br>
&gt;&gt;&gt; The install Process check that /usr/include/machine is empty.<=
br>
&gt;&gt;&gt;&gt; then check that the directory /usr/include/machine is empt=
y.<br>
&gt;&gt;&gt; If not clean it.<br>
&gt;&gt;&gt; I think this part is way off and probably all the way into &qu=
ot;bad advice&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cleaning /usr/include/machine is wrong, and fw_update seems co=
mpletely<br>
&gt;&gt;&gt; unrelated to either the contents of the C includes or building=
 WG.<br>
&gt;&gt; but without cleaning /usr/include/machine the install Process fail=
s ...<br>
&gt;&gt;<br>
&gt; I made an amd64 VM to test and it went fine:<br>
&gt;<br>
&gt; ...<br>
&gt;<br>
&gt; <a href=3D"http://golang.zx2c4.com/wireguard/tun" rel=3D"noreferrer" t=
arget=3D"_blank">golang.zx2c4.com/wireguard/tun</a><br>
&gt;<br>
&gt; <a href=3D"http://golang.zx2c4.com/wireguard/device" rel=3D"noreferrer=
" target=3D"_blank">golang.zx2c4.com/wireguard/device</a><br>
&gt;<br>
&gt; <a href=3D"http://golang.zx2c4.com/wireguard" rel=3D"noreferrer" targe=
t=3D"_blank">golang.zx2c4.com/wireguard</a><br>
&gt;<br>
&gt; install -d &quot;/usr/local/bin&quot; &amp;&amp; install -m 0755 &quot=
;wireguard-go&quot;<br>
&gt; &quot;/usr/local/bin/wireguard-go&quot;<br>
&gt;<br>
&gt; gmake: Leaving directory &#39;/usr/src/wireguard/wireguard-go-0.0.2019=
0908&#39;<br>
&gt;<br>
&gt; [+] Cleaning up build directory<br>
&gt;<br>
&gt; comptest# ls /usr/include/machine/<br>
&gt;<br>
&gt;<br>
&gt; _float.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rbus_machdep.h<br>
&gt; _types.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fenv.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loadfile_machdep.h=C2=A0 reg.h<br>
&gt; ...<br>
&gt;<br>
&gt; I think your comp-less box was messed up in more ways than you know,<b=
r>
&gt; probably because of the random &quot;lets poke here, rerun unrelated f=
w_update<br>
&gt; there&quot; and you had no idea which of your actions made it back int=
o a usable<br>
&gt; shape again. Redo your test from scratch (without skipping the compile=
r<br>
&gt; set) and post the output on a pastebin.<br>
&gt;<br>
&gt; If there is an error it needs to get fixed for real and not with<br>
&gt; hand-wavingly delete include files needed for other things.<br>
&gt;<br>
yes .. you are right. Thanks for your time to check.<br>
<br>
If i have a Server or VM with comp installed all is fine.<br>
<br>
but my first setup was without comp installed and the script fails.<br>
<br>
maybe you can build in a check for installed comp before?<br>
<br>
The Problem is only if comp is not installed.<br>
<br>
Thanks and sorry for the communication madness.<br>
<br>
Regards<br>
<br>
Ulli<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">May the most significant bit of your life be pos=
itive.<br></div>

--000000000000fb6801059364cc07--

--===============2580572361268962612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2580572361268962612==--
