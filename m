Return-Path: <SRS0=ZjPO=TV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B45C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2019 13:57:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0937421479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2019 13:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=revathskumar-com.20150623.gappssmtp.com header.i=@revathskumar-com.20150623.gappssmtp.com header.b="iqU8Kkk8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0937421479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=revathskumar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d3b6509;
	Tue, 21 May 2019 13:57:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8ded61d
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 10:45:39 +0000 (UTC)
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db5afad3
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 10:45:39 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id r7so15883650otn.6
 for <wireguard@lists.zx2c4.com>; Tue, 21 May 2019 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=revathskumar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=07HO8VI9HDY2SY43ijrE+3RSzp7IlWYZKqyGSIbzSxY=;
 b=iqU8Kkk8E93OR8qqpMYQxe1sihxI8PWxoBQW96gGxN7b7XGNq3U7NQEVX6DPV5Sa5L
 oC4LNiycQliKD7Wz2hLj5eVUCDSv1kGiicyYyv6thlY7p6wxAYA57jHOSk2q4bhz1+Nd
 qPL5VxWB+OTUlMyhUuwux+3wP0jQ5OM8icyR7aRZdthXx/1u27eJnR2MOs9JHF1jCrVX
 SMEUizN+wT+88I14EPE4d9QjUqqijcaTojBrGBoWhjvMDJXWi0xe1KuvWTfUAc2LRF2u
 ov8r6HP9F1IuwIbwL7IRNXE8mcb4J998Iq+Uh5BVlTBszK9emMhN+NLG8hXpH7bz9qGP
 XMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=07HO8VI9HDY2SY43ijrE+3RSzp7IlWYZKqyGSIbzSxY=;
 b=b1d7gsifaGBqmUqA4FthsZTl6su5eFrZAJ2wLZ1XaF+VIfYAlff+L/UBvH3jfgeUTj
 dqyJlwRhgFSgMdKrsXl98K1MPnOlQfeI6ZwQNHUJcvokocgNw+tiBSVIicTkwq1zkgmQ
 AGH+oRIgKuExYR52vDlo6p0wJDSB8WJQkdNzWWGn5R11Ki2h/JpoDisEbjnt9/1SUvNx
 A6uRdTmcn2buF2hN3mUhD7tju2Oi5bbaXe4HgbcCnwWp2F/Bb7AZ4X2wbxBojvVad8m7
 t0cXiQ2Ai4yCjYXSn9mtHj5WGaAuBCI28UTxa4QJ7/Yjrm52XudULhwkutRJ7Wslc3OO
 2+6Q==
X-Gm-Message-State: APjAAAVEijyzOiqhNqtAM5/wG+I9vn+UvEJmnA4AbWeNmSA4+1UVE+Xu
 lp0boQBD9UrQ7M3lptVANWF9xAJGSUdkuArWIXKIpg==
X-Google-Smtp-Source: APXvYqyf6plHNyy4pE4KcgtVmFTtTVdzwWok8sYBzxmVHWsFSyEmL1gJ5rfDciz9VRFufNWj4iR0WRSrd4rn8rC8Ztc=
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr23456686otc.128.1558435538014; 
 Tue, 21 May 2019 03:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
 <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
 <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
In-Reply-To: <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
From: Revath S Kumar <gmail@revathskumar.com>
Date: Tue, 21 May 2019 10:45:26 +0000
Message-ID: <CAO=kRD+TqOv3FZpjrwgWHeP+TYzJvPWG3ahofjdsfJJo_aQxbw@mail.gmail.com>
Subject: Re: Wireguard andoird and Fire TV
To: Samuel Holland <samuel@sholland.org>
X-Mailman-Approved-At: Tue, 21 May 2019 15:56:58 +0200
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
Content-Type: multipart/mixed; boundary="===============3486217821842952127=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3486217821842952127==
Content-Type: multipart/alternative; boundary="000000000000a62b0d0589638c7c"

--000000000000a62b0d0589638c7c
Content-Type: text/plain; charset="UTF-8"

Hello Team,

I have send a patch to fix this issue.
Let me know if any more changes needed for the patch.


with regards,
Revath S Kumar

On Fri, May 17, 2019 at 4:34 PM Revath S Kumar <gmail@revathskumar.com>
wrote:

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
>

--000000000000a62b0d0589638c7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Team,</div><div><br></div><div=
>I have send a patch to fix this issue.</div><div>Let me know if any more c=
hanges needed for the patch.</div><br></div><div dir=3D"ltr"><br></div><div=
 dir=3D"ltr">with regards,<br>Revath S Kumar</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 17, 2019 at 4:34 PM=
 Revath S Kumar &lt;<a href=3D"mailto:gmail@revathskumar.com" target=3D"_bl=
ank">gmail@revathskumar.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div>Hello Samuel,</div><div><br></div><div>Thanks for =
the reply. That tip helped me.<br></div><div>I am not a Andorid developer, =
but tried to look into the code to fix this=C2=A0problem with help of some =
friends.</div><div>Seems like the issue is due to `<code>android:descendant=
Focusability=3D&quot;blocksDescendants&quot;</code>` in tunnel_list_item.xm=
l [1].</div><div><br></div><div>Is there any reason why the value is `block=
sDecendants`? <br></div><div>When I remove that line it seems to work fine =
(gif link)[2].</div><div><br></div><div>I can send a patch if this is the o=
nly change needed.<br></div><div><br></div><div>[1]: <a href=3D"https://git=
.zx2c4.com/wireguard-android/tree/app/src/main/res/layout/tunnel_list_item.=
xml#n32" target=3D"_blank">https://git.zx2c4.com/wireguard-android/tree/app=
/src/main/res/layout/tunnel_list_item.xml#n32</a><br></div><div>[2]: <a hre=
f=3D"https://imgur.com/a/f3nbA7R" target=3D"_blank">https://imgur.com/a/f3n=
bA7R</a><br></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail-m_-44=
859477097692993gmail-m_-2228030468801683514gmail-m_6591703269822358572gmail=
_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">wi=
th regards,<br>Revath S Kumar,<br><div><span>JavaScripter / </span>Rubyist<=
br></div></div></div></div></div></div></div></div></div></div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, May 12, 2019 at 5:37 PM Samuel Holland &lt;<a href=3D"mailto:samuel@sholl=
and.org" target=3D"_blank">samuel@sholland.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/19 4:27 AM, Revath S K=
umar wrote:<br>
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
768.html" rel=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/pipe=
rmail/wireguard/2019-January/003768.html</a><br>
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
</blockquote></div>
</div>

--000000000000a62b0d0589638c7c--

--===============3486217821842952127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3486217821842952127==--
