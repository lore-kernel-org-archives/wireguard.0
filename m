Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03F1C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:03:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2580B20665
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgjF04XZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2580B20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aa8a280;
	Tue, 8 Jan 2019 02:00:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e52fd514
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 06:39:55 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e66c29a6
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 06:39:54 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id e7so20223345vsc.2
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 22:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/YWNgKoidYFpE5yHO7LIRHRyK+evOztH8479Mpa7kxc=;
 b=sgjF04XZckt8xoB1YZxey+rJGDBu/JviviLkJieSxtSm2+ylJV6jHijEwI+CS2+bDK
 wh4Z3qOZ1/BEgk0q/qWz3PqmoG2QZSaoMT8miKRUfJTF29tDVRUKuZdu3y6AEbA9z+7o
 z1lBrP8/tZ+kKkw5DLPUni/h2A5yv8zGx0kZV8Gc5hPsOVwkVcDSrWgek1fVIdPrlNcD
 I9c9N+LsLxvJqlRAaWgP3jRvLus0kBA29UKY1ljs0rXO6Cig072VdUtEuq6ZUYj1p07L
 jKgyaWoM/P8d9fFkEgXMJ2P6CqdHrpZufy7F+WGloy6H7+6BXR7ZgtHJ32oz4GIeB63t
 AaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/YWNgKoidYFpE5yHO7LIRHRyK+evOztH8479Mpa7kxc=;
 b=Xi/GlmHQXCnIgAZHwDq/hmBhRa+y10/NSm66YQ4qm+sXEYFyWltUX+KyFsN3Mtoe3h
 mRoDbwh+jzL2qKRL6B3zh3dAvhzUINNcpqlj5da/XOJTKlwz0bsEnrPXffW3hjV0XGqp
 PvQ6R87JQp5xmfNqoQdkLFGnw6/HA9SlByjsm16dqXVGP5PO74Ue2J6/nAemfqo46p/j
 C+3Q3lOadLDB5m3EsKUBDvDWnqVg24wn4+yCx1+F15HbUjAPxdf/5/TBkLO9DkGFjGrd
 DNV6X5fjRVmGRw44o2bOSD5rCur/k34QuRxtLRE6LWTdHq6hyPZgY7E4U3jdQGP0x7gs
 qt2Q==
X-Gm-Message-State: AA+aEWaE/za2/zCUQXX+FORulVT6VdMkzjSCo6C6vsKmMIcS8rMJ2kc9
 oS6qgthXQceYE9yshYVQq3P5/pJkuw8DWGotjMY=
X-Google-Smtp-Source: ALg8bN45J7/14EPCT/3Cp6zmIlhN8pz0k/kO0Ha3qygRs+suqV4fMrsM3IwwdcrpSLj/3PH6iQd3rjF18wHT9emI6d0=
X-Received: by 2002:a67:6d42:: with SMTP id i63mr18703625vsc.158.1546497742061; 
 Wed, 02 Jan 2019 22:42:22 -0800 (PST)
MIME-Version: 1.0
References: <CAOAvjy2V3WBFOtKp6dKztFh3gYHwW4=sfnz_ZxtRvDM=9fwQpw@mail.gmail.com>
 <CAKiCHuOeimfJ3y7k1PWxxN_YXSs8AFA8L7++4C3XFAMLjNM21A@mail.gmail.com>
In-Reply-To: <CAKiCHuOeimfJ3y7k1PWxxN_YXSs8AFA8L7++4C3XFAMLjNM21A@mail.gmail.com>
From: Subin Abid <subinabid@gmail.com>
Date: Thu, 3 Jan 2019 12:10:29 +0530
Message-ID: <CAOAvjy2h_1xHvAUH5BOyCz+Fa_aBkrTDxcsvzgg9XrYnVNHe4Q@mail.gmail.com>
Subject: Re: Google Chromecast
To: Martin Eskdale Moen <martinmoen@gmail.com>
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:00:05 +0100
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
Content-Type: multipart/mixed; boundary="===============7612773255745480611=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7612773255745480611==
Content-Type: multipart/alternative; boundary="0000000000008fc5cc057e8810b1"

--0000000000008fc5cc057e8810b1
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

Yes, I am.

I came across this message on the thread -  "The network settings for the
peer has a checkbox 'Exclude Private IPs';
You need it enabled so that your phone and Chromecast can talk to
each other on the private network rather than going through the VPN tunnel.
"

Let me try this and i will give a feedback ASAP


On Thu, Jan 3, 2019 at 2:43 AM Martin Eskdale Moen <martinmoen@gmail.com>
wrote:

> Are you routing all your traffic through the VPN?
>
> On Wed, Jan 2, 2019 at 6:47 PM Subin Abid <subinabid@gmail.com> wrote:
>
>> Hello,
>>
>> Android device (using Home app) cannot connect to chromecast while the
>> device is connected to VPN. Is anyone else facing this problem?
>>
>> --
>> Subin Abid
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

-- 
Subin Abid
Mob : +91 - 94808 42431

--0000000000008fc5cc057e8810b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Hi Martin,=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
Yes, I am. </div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif">I came across this message on the thread -=
=C2=A0 &quot;The network settings for the peer has a checkbox &#39;Exclude =
Private IPs&#39;;=C2=A0</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif">You need it enabled so that your phone and =
Chromecast can talk to=C2=A0</div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">each other on the private network rath=
er than going through the VPN tunnel. &quot;</div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Let me =
try this and i will give a feedback ASAP=C2=A0=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jan 3, 2019=
 at 2:43 AM Martin Eskdale Moen &lt;<a href=3D"mailto:martinmoen@gmail.com"=
>martinmoen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">Are you routing all your traffic thro=
ugh the VPN?<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On We=
d, Jan 2, 2019 at 6:47 PM Subin Abid &lt;<a href=3D"mailto:subinabid@gmail.=
com" target=3D"_blank">subinabid@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif">Hello,</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif">Android device (using Home app) cannot connect to chromecast=
 while the device is connected to VPN. Is anyone else facing this problem?<=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail-m_-5177944161126=
197582gmail-m_5468736971009718748gmail_signature"><div dir=3D"ltr">Subin Ab=
id=C2=A0<div><br></div></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Subin Abid=C2=A0<div>Mob=C2=A0:=
 +91 - 94808 42431=C2=A0</div></div></div>

--0000000000008fc5cc057e8810b1--

--===============7612773255745480611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7612773255745480611==--
