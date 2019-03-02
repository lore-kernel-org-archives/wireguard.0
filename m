Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F501C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:30:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD46208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSGhTUiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD46208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6598c6cc;
	Fri, 8 Mar 2019 15:18:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40e8c8e9
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 03:59:17 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 641fc632
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 03:59:16 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id j36so30321831qta.7
 for <wireguard@lists.zx2c4.com>; Fri, 01 Mar 2019 20:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kuy/qITyM2W+CweWI+FRSqEvLhwQuEU46Vd6tbFubXE=;
 b=dSGhTUizUmbnX/Trvz4Kjms+VaFSp6J9nOjiQ+Eif4fbT1o0bnSrX+wJi/iyAKaIG6
 sxZ33snSe2pFNKCqpRMnlp8wInhoD3RnZWu3xIMzSoOMZkePgdE26yzFjICeE6rcBCcf
 6CBXy2JGHkmv+oCbWGEXajaQomaRCcp0YMFcn6Rkw5ZacyTPYOyCZP3upxgD+IkbYjRw
 Z1TsrkDzKsOtm5dPKVe+8NEJNmsYtigzGtGeAx9Ss17/x8Y0tg4VsLZuG09uEUZVqRS3
 cQgqSmuE10++ZByeVD+W/GR9fYIO+8vNrL2GZG+Ra09l5udODoUJoD5A1Cif1o8G2gNr
 7BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kuy/qITyM2W+CweWI+FRSqEvLhwQuEU46Vd6tbFubXE=;
 b=tFS32nBI8ErYhZPvZRQT6sLKjwNaWo0TkRi2tTvXw3VQtBGWFV704ebg+W9ylG8TOd
 GJMdeQtvoHrrmOnFiFSpyHvmuTPVi12+h3MemtrHYLAN4qEAr65JV+xvEHMqYwkikdE+
 ZSUg7qUfBTl/RLwISXP/2VBrilFr5IvfpqHNAhK9+AN4+3pFFuM7gGBnFahB13TKqwsJ
 faqbuqTaTcyWfSfxxAnWjKnxBmNWT+904pY8kbw19uf7BNu8mIaSIjx5qtCxJfyJgVhj
 K/3fogvXEqYbbLSsB/98gVeHkDvHplCweQ7YplwfOvlLdhC6SXvxZQqfrnadEHddtI9L
 xJEQ==
X-Gm-Message-State: APjAAAUsyEzLyD7KcsmBHa+nFxyJA05921ZXaY7Myf93iCBVVnQlraLW
 Ho0tbSXYCXb6y8ccuCVsFDhqIbfttxwJqNLfOqM=
X-Google-Smtp-Source: APXvYqyxHAim2MpsrgDnNbaJb7FLCEOCejptbXvEKry1u0y3lJr5Puf3QX0R+qiitwHZsZq31lEIUzW6a+TqU+fHtI0=
X-Received: by 2002:ac8:1c0e:: with SMTP id a14mr6572858qtk.259.1551499750500; 
 Fri, 01 Mar 2019 20:09:10 -0800 (PST)
MIME-Version: 1.0
References: <CAJwvAosHFogtuPL09C9ek4bz6A7vW76mzKymL11iWs+9F7Ep_Q@mail.gmail.com>
 <CAKXLc7cerFqi1dACAfL3gRx53E9u0n709rd=Wu-0uCbFtJOiRA@mail.gmail.com>
In-Reply-To: <CAKXLc7cerFqi1dACAfL3gRx53E9u0n709rd=Wu-0uCbFtJOiRA@mail.gmail.com>
From: Scott Lipcon <slipcon@gmail.com>
Date: Fri, 1 Mar 2019 23:08:23 -0500
Message-ID: <CAJwvAotKEmjTOd0U9vMX0taZYTc4YKygnKX5sw79ySgdXc0ebg@mail.gmail.com>
Subject: Re: performance query
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:18:46 +0100
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
Content-Type: multipart/mixed; boundary="===============9025082848546393954=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9025082848546393954==
Content-Type: multipart/alternative; boundary="0000000000007f6ee3058314afc2"

--0000000000007f6ee3058314afc2
Content-Type: text/plain; charset="UTF-8"

Thanks for the suggestions - I'll need to do some more experimentation when
I get back in the office, but I think you're on to something, perhaps with
the router at Location B in my examples.    I did a straight UDP speed test
with iperf3, and that worked fine - over 500Mbit/sec - there shouldn't be
anything funny with MTU going on, nor any IPv6... however I did two
additional tests:

At my main location, I've got another "low end" box on the same local
network as the "server" - this one is an intel Atom CPU - with that I was
able to get about 585Mbit/sec (compared to the 930-940 without wireguard).


I've got a 3rd location available - actually a low end VM on AWS - this one
gets around 300Mbit unencrypted, and actually tested above that via
wireguard - I assume thats just normal fluctuation, but seems to point the
finger to something specific at location B, my office.    I'll continue to
investigate and update if I figure anything out... it'll probably be at
least a week before I get anywhere though, due to work travel.

Thanks again,
Scott


On Fri, Mar 1, 2019 at 5:18 AM Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> On Fri, Mar 1, 2019 at 11:11 AM Scott Lipcon <slipcon@gmail.com> wrote:
> >
> > I've been experimenting a bit with Wireguard on several ubuntu systems,
> and am not seeing the performance I'd expect based on the numbers at
> https://www.wireguard.com/performance/
> >
> > I'm wondering if there is a configuration setting i'm missing or any
> better way to debug this.
> >
> > Testing between two locations - both have nominally 1Gbit internet
> connections from the same provider.
> >
> > At location A:
> > 1) Ubuntu 18.04 "server" - i7-4790K CPU @ 4.00GHz
> > 2) Ubuntu 16.04 client - i5-3470 CPU @ 3.20GHz
> >
> > At location B:
> > 3) Ubuntu 18.04 client - Celeron N2808  @ 1.58GHz
> > 4) Ubuntu 18.04 client - Virtual Machine - Xeon(R) Gold 6126 CPU @
> 2.60GHz
> >
> >
> > Using iperf3 for all tests, with 8 threads, but that doesn't seem to
> matter significantly.
> >
> > Between 1 & 2, via gigabit LAN - 940 Mbit/sec.
> > Between 1 & 2, via WireGuard - 585 Mbit/sec
> > - I might have expected a bit higher, but this is certainly acceptable.
> >
> > Between 3 and 1, direct iperf3 - 580 Mbit/sec
> > Between 3 and 1, WireGuard - 73 Mbit/sec
> >
> > At this point I was guessing WireGuard was CPU limited on this little
> Celeron, so I set up the Xeon VM (#4):
> >
> > Between 4 and 1, direct iperf3 - ~600 Mbit/sec
> > Between 4 and 1, WireGuard - 80 Mbit/sec
> >
> > In other words, the much faster VM is only a tiny bit faster that the
> celeron.
> >
> > Any suggestions?
>
> A lot can go wrong speed-wise "on the Internet"...
>
> What sits in between those hosts that you have control of (routers,
> switches, firewalls...)?
> IPv6 involved at all?
> ISP having throttling policy for "UDP we don't understand"?
> Play with the MTU, you might be hitting some fragmentation issues that
> a weak router is not handling fast enough.
> Play with Wireshark (new 3.0 even has support for wireguard
> protocol!), capture some traffic, look for any transmission errors.
>
> Cheers,
> Kalin.
>

--0000000000007f6ee3058314afc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Thanks for the suggestions - I&#39;ll need to do some m=
ore experimentation when I get back in the office, but I think you&#39;re o=
n to something, perhaps with the router at Location B in my examples.=C2=A0=
 =C2=A0 I did a straight UDP speed test with iperf3, and that worked fine -=
 over 500Mbit/sec - there shouldn&#39;t be anything funny with MTU going on=
, nor any IPv6... however I did two additional tests:</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
At my main location, I&#39;ve got another &quot;low end&quot; box on the sa=
me local network as the &quot;server&quot; - this one is an intel Atom CPU =
- with that I was able to get about 585Mbit/sec (compared to the 930-940 wi=
thout wireguard).=C2=A0 =C2=A0=C2=A0</div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif">I&#39;ve got a 3r=
d location available - actually a low end VM on AWS - this one gets around =
300Mbit unencrypted, and actually tested above that via wireguard - I assum=
e thats just normal fluctuation, but seems to point the finger to something=
 specific at location B, my office.=C2=A0 =C2=A0 I&#39;ll continue to inves=
tigate and update if I figure anything out... it&#39;ll probably be at leas=
t a week before I get anywhere though, due to work travel.</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif">Thanks again,</div><div class=3D"gmail_default" style=3D"font-family:=
arial,helvetica,sans-serif">Scott</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 1, 2019 =
at 5:18 AM Kalin KOZHUHAROV &lt;<a href=3D"mailto:me.kalin@gmail.com">me.ka=
lin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Mar 1, 2019 at 11:11 AM Scott Lipcon &lt;<a href=3D"ma=
ilto:slipcon@gmail.com" target=3D"_blank">slipcon@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; I&#39;ve been experimenting a bit with Wireguard on several ubuntu sys=
tems, and am not seeing the performance I&#39;d expect based on the numbers=
 at <a href=3D"https://www.wireguard.com/performance/" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.wireguard.com/performance/</a><br>
&gt;<br>
&gt; I&#39;m wondering if there is a configuration setting i&#39;m missing =
or any better way to debug this.<br>
&gt;<br>
&gt; Testing between two locations - both have nominally 1Gbit internet con=
nections from the same provider.<br>
&gt;<br>
&gt; At location A:<br>
&gt; 1) Ubuntu 18.04 &quot;server&quot; - i7-4790K CPU @ 4.00GHz<br>
&gt; 2) Ubuntu 16.04 client - i5-3470 CPU @ 3.20GHz<br>
&gt;<br>
&gt; At location B:<br>
&gt; 3) Ubuntu 18.04 client - Celeron N2808=C2=A0 @ 1.58GHz<br>
&gt; 4) Ubuntu 18.04 client - Virtual Machine - Xeon(R) Gold 6126 CPU @ 2.6=
0GHz<br>
&gt;<br>
&gt;<br>
&gt; Using iperf3 for all tests, with 8 threads, but that doesn&#39;t seem =
to matter significantly.<br>
&gt;<br>
&gt; Between 1 &amp; 2, via gigabit LAN - 940 Mbit/sec.<br>
&gt; Between 1 &amp; 2, via WireGuard - 585 Mbit/sec<br>
&gt; - I might have expected a bit higher, but this is certainly acceptable=
.<br>
&gt;<br>
&gt; Between 3 and 1, direct iperf3 - 580 Mbit/sec<br>
&gt; Between 3 and 1, WireGuard - 73 Mbit/sec<br>
&gt;<br>
&gt; At this point I was guessing WireGuard was CPU limited on this little =
Celeron, so I set up the Xeon VM (#4):<br>
&gt;<br>
&gt; Between 4 and 1, direct iperf3 - ~600 Mbit/sec<br>
&gt; Between 4 and 1, WireGuard - 80 Mbit/sec<br>
&gt;<br>
&gt; In other words, the much faster VM is only a tiny bit faster that the =
celeron.<br>
&gt;<br>
&gt; Any suggestions?<br>
<br>
A lot can go wrong speed-wise &quot;on the Internet&quot;...<br>
<br>
What sits in between those hosts that you have control of (routers,<br>
switches, firewalls...)?<br>
IPv6 involved at all?<br>
ISP having throttling policy for &quot;UDP we don&#39;t understand&quot;?<b=
r>
Play with the MTU, you might be hitting some fragmentation issues that<br>
a weak router is not handling fast enough.<br>
Play with Wireshark (new 3.0 even has support for wireguard<br>
protocol!), capture some traffic, look for any transmission errors.<br>
<br>
Cheers,<br>
Kalin.<br>
</blockquote></div>

--0000000000007f6ee3058314afc2--

--===============9025082848546393954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9025082848546393954==--
