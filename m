Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352D5C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 12:46:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49032081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 12:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/rSfqn2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49032081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc2529bb;
	Fri, 2 Nov 2018 12:42:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4162c75a
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 12:42:44 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8332021f
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 12:42:43 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id a132so2813973qkg.1
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKrvKZTOpRfOCiD19MAtYMEKgBG3zYwmPn2qKZZ/5Jw=;
 b=E/rSfqn2JgcpEP2IyZpISyRwMUt68wkxeWxE6CgHt9er5ziHIahFGbRU85vXas+m+n
 Iae8woBlt8vi4cGFO/OIinkNm+sly2Wlgq07Jy4Trov1HG8sQJC2jYgRPieI2100PqxK
 66ocSv8c4Xizr6VhkRFhVeTHn2c8KCt7u2M04oNi3zFNLgogQt+r2BoOG70MmpiQ6qBq
 KAhoEVAlhB32maxEGTbNENnC/rU4v6W0jjMpdHcSXmNQPKLIebAiHeriPWgWfYdf4VgD
 5aCxLxUpfqdDBd5pB2PKOmhuIUNpiDEYxnFFVI81+iP92bcmb8ifpfJCgj62mMtC3JO7
 xpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKrvKZTOpRfOCiD19MAtYMEKgBG3zYwmPn2qKZZ/5Jw=;
 b=rmgO8CPmDf2vNPlhwO1lzipcnL0EetePJEh4L4y/188o3JJfpf8hvDDYyRuayjXB6v
 aQrndWmtZBRMr+T/ysLIWVmDKUc3iXOJy9vdCVBhHx3oJYTa/V3SdzPBkmVzH59LGEvy
 CP60Rvvgostnr30/1mCzlcNTu4sTRAEeu2tOLOemobLspV3MqdmNAhoksgijERWezrF0
 4HVvH6NzrqaWyiXO7WFREEHYSGb87HOQGw6/mmUIXB1k++b5MKW/oUJ19bg9Th8Lb4j/
 Uf76d5DfnkE5UqcTFmoHpceORDUIpPkeLcTPn+QwKcnucnrq6x1HZIDWHeD6/EDazDRA
 puXg==
X-Gm-Message-State: AGRZ1gJLa1JOW+jTbF4nDNdLby5++R9THtIrR0H7JI569+h0xx//QHA0
 buPtf1+4F2V5ixhOJ/XmsfTU8YBbqHunHaOjCQk=
X-Google-Smtp-Source: AJdET5c9jpxqOuPY0tRAWGG6WxKRwx2WtbUqsuD9BRHhbSDqvrKGRwZ9niHQBxemp24+1Xe2RHMtn2k4sEuGLp2dxnA=
X-Received: by 2002:ac8:6bc5:: with SMTP id b5mr4086090qtt.182.1541162794464; 
 Fri, 02 Nov 2018 05:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
 <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
 <20181102121036.GA29314@sita-dell>
In-Reply-To: <20181102121036.GA29314@sita-dell>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Fri, 2 Nov 2018 14:46:21 +0200
Message-ID: <CANcuY=puD9s8hVoQMcyp=wvmXUZ_hiaC7jByEgyahJpU=TiLEg@mail.gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
To: Sitaram Chamarty <sitaramc@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0218109618944237033=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0218109618944237033==
Content-Type: multipart/alternative; boundary="000000000000e7bb840579adec94"

--000000000000e7bb840579adec94
Content-Type: text/plain; charset="UTF-8"

That's exactly the message i got.

On Fri, Nov 2, 2018, 14:10 Sitaram Chamarty <sitaramc@gmail.com wrote:

> On Fri, Nov 02, 2018 at 08:39:28AM +0100, Kalin KOZHUHAROV wrote:
> > On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ <laszlo.kertesz@gmail.com>
> wrote:
> > > The current FDroid build (version 0.0.20181031) is broken. The Gui
> starts but it states "Unknown userspace Go version" and the tunnel
> activation action results in an error.
> > >
> > Hmm... just installed (1st time) and started it, seems fine (haven't
> > configured it yet).
> > What is your configuration?
> >
> > Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on
> > XT1905 phone.
>
> I can confirm the problem, though the error I see is different:
>
>     Error bringing up tunnel: No implementation found for java.lang.String
>     com.wireguard.android.backend.GoBackend.wgVersion() (tried
> Java_com_wireguard_android...
>
> (I'm sorry I have n o idea how to expand that message to its
> full text, whatever it may have been)
>

--000000000000e7bb840579adec94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>That&#39;s exactly the message i got.<br><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 2, 2018, 14:10 Sitaram Cha=
marty &lt;<a href=3D"mailto:sitaramc@gmail.com">sitaramc@gmail.com</a> wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, Nov 02, 2018 at 08:39:28=
AM +0100, Kalin KOZHUHAROV wrote:<br>
&gt; On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ &lt;<a href=3D"mailto:la=
szlo.kertesz@gmail.com" target=3D"_blank" rel=3D"noreferrer">laszlo.kertesz=
@gmail.com</a>&gt; wrote:<br>
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

--000000000000e7bb840579adec94--

--===============0218109618944237033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0218109618944237033==--
