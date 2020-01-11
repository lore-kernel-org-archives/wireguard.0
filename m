Return-Path: <SRS0=sfXu=3A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B77C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 Jan 2020 05:07:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EE62077C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 Jan 2020 05:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=laro.se header.i=@laro.se header.b="o9b29jTb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EE62077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=laro.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a5c3ee9;
	Sat, 11 Jan 2020 05:07:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3159ca6
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Jan 2020 05:07:47 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72d3e984
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Jan 2020 05:07:47 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id k6so4022933qki.5
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jan 2020 21:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laro.se; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=O5GZyTXfag8rMXtIT8owg/bzVOsZfLBk7yBIMwQGMrQ=;
 b=o9b29jTbV6SvSgH/lMVqQClE6RllleZho5D2KQjJ/tpOFtfotRuW2rgTP2q8Sq/O3v
 UFeboz0Ynu/gXHZsmFyoYa1QavkQlU9728KyhFrZcAJZYuO1gwjmg1TH4cDEECIBbJ+7
 /BlBXsX2dlvVFij3H8kUvl4ft9Qujb4cgMKHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=O5GZyTXfag8rMXtIT8owg/bzVOsZfLBk7yBIMwQGMrQ=;
 b=uXbuW6Z97bHSF27IpaWjlL5/TED5Jt8kzCKH+gWHFYsHnkH062M8hW5oYSUj209ecB
 Bl4YAoBOZLxpNuoRE+TYmqhymHvK4RV4nvBdipv5micctQh8igPAhkg6leGysDdCBnkd
 eQE5nd63FbHHr8zMzV81/Hej01X8welmJJsl65Jaa/0UlU3xcFoJSeDi6PEhK0UiUaVs
 l+P104LUfQHumASq76GNcUIgO/IiiZQte8nuKidrwXlo1VDr3oa2yRBcEHKoK8iJf7zS
 tOxbWMH72MiASRfnPVR6EsmtDNR4nixBlBzBks48y//+bH5maRpSoWdElJ1TBmTuE8Aa
 EKlg==
X-Gm-Message-State: APjAAAViFSKDHWk8aJyucy2z7rKWjcsuM6NJ3Qc6Duibi1e75uedqJse
 iXAdfZAOiJkuORpl1lyrOj5NSsBjH85D6MoBwhp/WY7W6M4=
X-Google-Smtp-Source: APXvYqwXLyMFKPSWIPL3ju0I84FhdkgHQtUDDR95mqunpKpRaAGmFAVfKplQGXQGHT7O/pmthl5BLclLCIcB3MNoNzA=
X-Received: by 2002:a05:620a:15e8:: with SMTP id
 p8mr1881338qkm.469.1578719266137; 
 Fri, 10 Jan 2020 21:07:46 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytL4bbuvHnPt1scJ1QAWSFw_zx3RGQQAdbC0d8D+rjiJ4A@mail.gmail.com>
 <CA+CGqoLds_96+utWZV1jr9-On=oqNC4r9BLs5s0YT+_s2QVikQ@mail.gmail.com>
In-Reply-To: <CA+CGqoLds_96+utWZV1jr9-On=oqNC4r9BLs5s0YT+_s2QVikQ@mail.gmail.com>
From: "simon@laro.se" <simon@laro.se>
Date: Sat, 11 Jan 2020 18:07:10 +1300
Message-ID: <CAOtBoV8chDpMReY3SWai+pU+9GfD8MSd1SzeXuSmiwivNW4U-w@mail.gmail.com>
Subject: Re: Android: Cannot toggle the quick setting tile on a locked screen
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============5666095165040946937=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5666095165040946937==
Content-Type: multipart/alternative; boundary="0000000000000efbd6059bd6392b"

--0000000000000efbd6059bd6392b
Content-Type: text/plain; charset="UTF-8"

This was purposefully added in the December update for the Android
application, a user should not be able to bring tunnels up and down without
being an "authenticated". This could be added as a toggle within the app,
but it has not been done or requested as far as I am awre.

You should still be able to use the `wg-quick down` from within a Tasker
shell command.

https://git.zx2c4.com/wireguard-android/commit/?id=c370d754bc5074b6e357afdcb4baf09301d0bb8d

On Thu, 9 Jan 2020 at 21:56, Kai Haberzettl <khaberz@gmail.com> wrote:

> What Device and ROM are you using? Samsung OneUI has a specific setting as
> to whether network settings should be available on the lock screen or not.
> I don't see this in AOSP. Look for something like this in your settings, it
> might help.
>
> On Thu, Jan 9, 2020 at 7:10 AM Arpit Gupta <g.arpit@gmail.com> wrote:
>
>> Hi
>>
>> I can't say for sure when this behavior changed where I cannot toggle
>> quick setting option for WireGuard when the phone is locked.
>>
>> I know this was working in December so not sure if the December update
>> for Android changed something or if this was an explicit change in the
>> Android app.
>>
>> Wanted to see if any one else is seeing similar behavior and if there is
>> anything that can be done about it?
>>
>> I was using Tasker to automate toggling the quick setting when ever I was
>> not connected to a specific WiFi network. That automation no longer works
>> because I need to unlock the phone before that setting can be toggled.
>>
>>
>> --
>> Arpit
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000000efbd6059bd6392b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was purposefully added in the December update for the=
 Android application, a user should not be able to bring tunnels up and dow=
n without being an &quot;authenticated&quot;. This could be added as a togg=
le within the app, but it has not been done or requested as far as I am awr=
e.<div><br><div>You should still be able to use the `wg-quick down` from wi=
thin a Tasker shell command.<div><br></div><div><a href=3D"https://git.zx2c=
4.com/wireguard-android/commit/?id=3Dc370d754bc5074b6e357afdcb4baf09301d0bb=
8d">https://git.zx2c4.com/wireguard-android/commit/?id=3Dc370d754bc5074b6e3=
57afdcb4baf09301d0bb8d</a><br></div></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Jan 2020 at 21:56=
, Kai Haberzettl &lt;<a href=3D"mailto:khaberz@gmail.com">khaberz@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">What Device and ROM are you using? Samsung OneUI has a spe=
cific setting as to whether=C2=A0network settings should be available on th=
e lock screen or not. I don&#39;t see this in AOSP. Look for something like=
 this in your settings, it might help.=C2=A0</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 7:10 AM =
Arpit Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com" target=3D"_blank">g.ar=
pit@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"auto">Hi<div dir=3D"auto"><br></div><div dir=3D"au=
to">I can&#39;t say for sure when this behavior changed where I cannot togg=
le quick setting option for WireGuard when the phone is locked.=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I know this was working in De=
cember so not sure if the December update for Android changed something or =
if this was an explicit change in the Android app.=C2=A0</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Wanted to see if any one else is seeing si=
milar behavior and if there is anything that can be done=C2=A0about it?</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I was using Tasker to autom=
ate toggling the quick setting when ever I was not connected to a specific =
WiFi network. That automation no longer works because I need to unlock the =
phone before that setting can be toggled.</div><div dir=3D"auto"><br><div d=
ir=3D"auto"><br>--<br>Arpit</div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000000efbd6059bd6392b--

--===============5666095165040946937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5666095165040946937==--
