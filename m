Return-Path: <SRS0=tjFT=2S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD00C2D0C8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Dec 2019 21:36:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80DC207E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Dec 2019 21:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IYU0KQSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80DC207E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e23a9faf;
	Sat, 28 Dec 2019 21:36:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ab61064
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 21:36:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d7e5098
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 21:36:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a5b4291
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=gyjlNpXGdf1NR/5I22jSVbvVD9Y=; b=IYU0KQ
 SlYPOQiO0nWBeu+Ue5cmINj3rzBBZeSdF5TxxpqVrHPo2CI2+If82X5zZiZpp8iH
 IVsM8R5ucfSIq8w2KhogltnsLBWu75QGttctHOrz7w/RQXf7B9nPDvfT9PoCMsOF
 byS8BtnSZkQ7inr7jFMmwFmE8ipPsTSCNkROsajMgRy1Hzk8imayU3ScgepJILTC
 sRryGZ+6Rot6I+VzOVRkPkTJeTK/kdgrQr4M96LSG4j3BFzhuE8cGcEvebbUZR4D
 kZL3kMuoVPbGHlzgcyvxSRdHEu1K15pW1HOyBuKhesHM6UaNnWpoeKM9rK4CMS2k
 nvmp6T5y2dSv0XLw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a3276d5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Dec 2019 20:38:28 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id r27so41084832otc.8
 for <wireguard@lists.zx2c4.com>; Sat, 28 Dec 2019 13:36:22 -0800 (PST)
X-Gm-Message-State: APjAAAVct8cZMxtfHswd2aLOM8xdg0twup65mLEV0mDbDV68dOuzgycl
 BAN6WJiSMzpiUUdte+GfiYPS5YRhhtcNCpcEwhs=
X-Google-Smtp-Source: APXvYqyFCB77G7Y6DWr3kBQusnsysQcW1WGbiuC4vQh7srwqJVilAmbIxeYiSOfH8GJm1Y3qHf7+MJwSbEnEqWSQxik=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr65981087otq.120.1577568981545; 
 Sat, 28 Dec 2019 13:36:21 -0800 (PST)
MIME-Version: 1.0
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
In-Reply-To: <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 28 Dec 2019 22:36:10 +0100
X-Gmail-Original-Message-ID: <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
Message-ID: <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
Subject: Re: remove peer endpoint
To: Devin Smith <devinrsmith@protonmail.com>
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
Content-Type: multipart/mixed; boundary="===============5090262789823161992=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5090262789823161992==
Content-Type: multipart/alternative; boundary="000000000000c0f8f1059aca667a"

--000000000000c0f8f1059aca667a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm interested to learn, why would you want such a thing? The endpoint
field is only ever a "hint" anyway, due to the roaming.

On Sat, Dec 28, 2019, 13:12 Devin Smith <devinrsmith@protonmail.com> wrote:

> If I'm not mistaken, `wg set <interface> peer <base64> remove` removes th=
e
> whole peer - I'm looking to remove just the peer's endpoint attribute
> [endpoint <ip>:<port>].
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Friday, December 27, 2019 10:51 AM, Lonnie Abelbeck <
> lists@lonnie.abelbeck.com> wrote:
>
> > > On Dec 27, 2019, at 9:51 AM, Devin Smith devinrsmith@protonmail.com
> wrote:
> > > Is it possible to remove the endpoint of a peer via the `wg set`
> command? All of the other peer attributes (preshared-key,
> persistent-keepalive, allowed-ips) are removable in this fashion (and
> documented in the man page). I've tried `wg set <interface> peer
> <base64-public-key> endpoint 0` ...
> >
> > Yes, this works:
> >
> > -------------------
> >
> > wg set <interface> peer <base64-public-key> remove
> > --
> >
> > If you forget, "wg set --help" will remind you.
> >
> > Lonnie
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000c0f8f1059aca667a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;m interested to learn, why would you want such a th=
ing? The endpoint field is only ever a &quot;hint&quot; anyway, due to the =
roaming.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sat, Dec 28, 2019, 13:12 Devin Smith &lt;<a href=3D"mailto:devin=
rsmith@protonmail.com">devinrsmith@protonmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">If I&#39;m not mistaken, `wg set &lt;interfac=
e&gt; peer &lt;base64&gt; remove` removes the whole peer - I&#39;m looking =
to remove just the peer&#39;s endpoint attribute [endpoint &lt;ip&gt;:&lt;p=
ort&gt;].<br>
<br>
=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90<br>
On Friday, December 27, 2019 10:51 AM, Lonnie Abelbeck &lt;<a href=3D"mailt=
o:lists@lonnie.abelbeck.com" target=3D"_blank" rel=3D"noreferrer">lists@lon=
nie.abelbeck.com</a>&gt; wrote:<br>
<br>
&gt; &gt; On Dec 27, 2019, at 9:51 AM, Devin Smith <a href=3D"mailto:devinr=
smith@protonmail.com" target=3D"_blank" rel=3D"noreferrer">devinrsmith@prot=
onmail.com</a> wrote:<br>
&gt; &gt; Is it possible to remove the endpoint of a peer via the `wg set` =
command? All of the other peer attributes (preshared-key, persistent-keepal=
ive, allowed-ips) are removable in this fashion (and documented in the man =
page). I&#39;ve tried `wg set &lt;interface&gt; peer &lt;base64-public-key&=
gt; endpoint 0` ...<br>
&gt;<br>
&gt; Yes, this works:<br>
&gt;<br>
&gt; -------------------<br>
&gt;<br>
&gt; wg set &lt;interface&gt; peer &lt;base64-public-key&gt; remove<br>
&gt; --<br>
&gt;<br>
&gt; If you forget, &quot;wg set --help&quot; will remind you.<br>
&gt;<br>
&gt; Lonnie<br>
<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000c0f8f1059aca667a--

--===============5090262789823161992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5090262789823161992==--
