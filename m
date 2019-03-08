Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F339C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:48:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD2B6218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisbox.org header.i=@chrisbox.org header.b="CTJZU5Dx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD2B6218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chrisbox.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a74681e6;
	Wed, 20 Mar 2019 22:47:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 512336d4
 for <wireguard@lists.zx2c4.com>; Fri, 8 Mar 2019 16:35:00 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cf9b03b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Mar 2019 16:35:00 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 125so14327416pgc.12
 for <wireguard@lists.zx2c4.com>; Fri, 08 Mar 2019 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrisbox.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nASk9BsFAGhVgWX1u4VMvULO0oj4Lc1Yh9rrl8Js+NY=;
 b=CTJZU5DxyaQKL3hHXUpwlQMbRIaocTwNlmUIRqlQXQyIM6STR0iH6odxc3106qfsF7
 O8HglQpHXndI8TqnQfLKLV577UrKr2kszcZZbPrE3fbHEDYs/L5/31boL9jP3wMHSHSL
 9poYecezH1QOyyKmUw3qL4mYANOIhvODB/YqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nASk9BsFAGhVgWX1u4VMvULO0oj4Lc1Yh9rrl8Js+NY=;
 b=FcHfWR6316XOK/FMnD6JbN8NfmkMCzDUW8+GMe8o0FZNC0q0ppdvjpsPmddlHfPd6Z
 8HnyAXJJP+EM0PTsH2B0VbCEABOjKh8xd2cua9RwTvXokPugJ09DFApLwVyuh8x5+Qrk
 ZEaIXBbafqhrRLUIHhndsoBe7Aiu0QlZ+SrhhC4OOEslaO3hcYOtzhLGONspPtA3yNb8
 bdpMiaq7IrMy8tiawz7g7TOqyNuFN77ZN/yg9fEPsZXBqhbGcxpmFLRjm0IFG2vNAPpZ
 JuNzACfh0yHMDQlxtfDq+B5O8nqffaPq2dznY/AkPBU8sYlKcca7irH/1XjJH3K5vZW+
 Ozag==
X-Gm-Message-State: APjAAAWggJFF+w0r9kmHuzDhFnZO+DUr/nI+pMfTPvzaD0MMG2Ds4f0A
 J87Xi9YzMvDe1GGTShuQotiXtzibkJGHf6adq4yl7f/O
X-Google-Smtp-Source: APXvYqzpTASS+kBfYFN0tnzD7M2vPumY2h+oZIBsLOF6OCiXzfysGIimYxwmqgfrTppLaAB6SN1aYJ/uI/H4rJYyDrQ=
X-Received: by 2002:a17:902:7d89:: with SMTP id
 a9mr19447364plm.33.1552063544192; 
 Fri, 08 Mar 2019 08:45:44 -0800 (PST)
MIME-Version: 1.0
References: <CAJwvAosHFogtuPL09C9ek4bz6A7vW76mzKymL11iWs+9F7Ep_Q@mail.gmail.com>
 <CAKXLc7cerFqi1dACAfL3gRx53E9u0n709rd=Wu-0uCbFtJOiRA@mail.gmail.com>
 <CAJwvAotKEmjTOd0U9vMX0taZYTc4YKygnKX5sw79ySgdXc0ebg@mail.gmail.com>
In-Reply-To: <CAJwvAotKEmjTOd0U9vMX0taZYTc4YKygnKX5sw79ySgdXc0ebg@mail.gmail.com>
From: Christopher Bachner <hello@chrisbox.org>
Date: Fri, 8 Mar 2019 17:45:31 +0100
Message-ID: <CAKJniYTMuV5TG_iWMQXXhGsdwQGX-f=QnMboqgUqXM-7CJcMQQ@mail.gmail.com>
Subject: Re: performance query
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:47:06 +0100
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
Content-Type: multipart/mixed; boundary="===============2750425869826482274=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2750425869826482274==
Content-Type: multipart/alternative; boundary="000000000000388bbd058397f4f4"

--000000000000388bbd058397f4f4
Content-Type: text/plain; charset="UTF-8"

Hi Scott,

From experience, I can tell you I was able to get my Gbit saturated over
Wireguard to a server in a datacenter.

You need to have good routing, obviously.

Greetings,

Christopher Bachner

On Fri, Mar 8, 2019 at 4:41 PM Scott Lipcon <slipcon@gmail.com> wrote:

> Thanks for the suggestions - I'll need to do some more experimentation
> when I get back in the office, but I think you're on to something, perhaps
> with the router at Location B in my examples.    I did a straight UDP speed
> test with iperf3, and that worked fine - over 500Mbit/sec - there shouldn't
> be anything funny with MTU going on, nor any IPv6... however I did two
> additional tests:
>
> At my main location, I've got another "low end" box on the same local
> network as the "server" - this one is an intel Atom CPU - with that I was
> able to get about 585Mbit/sec (compared to the 930-940 without wireguard).
>
>
> I've got a 3rd location available - actually a low end VM on AWS - this
> one gets around 300Mbit unencrypted, and actually tested above that via
> wireguard - I assume thats just normal fluctuation, but seems to point the
> finger to something specific at location B, my office.    I'll continue to
> investigate and update if I figure anything out... it'll probably be at
> least a week before I get anywhere though, due to work travel.
>
> Thanks again,
> Scott
>
>
> On Fri, Mar 1, 2019 at 5:18 AM Kalin KOZHUHAROV <me.kalin@gmail.com>
> wrote:
>
>> On Fri, Mar 1, 2019 at 11:11 AM Scott Lipcon <slipcon@gmail.com> wrote:
>> >
>> > I've been experimenting a bit with Wireguard on several ubuntu systems,
>> and am not seeing the performance I'd expect based on the numbers at
>> https://www.wireguard.com/performance/
>> >
>> > I'm wondering if there is a configuration setting i'm missing or any
>> better way to debug this.
>> >
>> > Testing between two locations - both have nominally 1Gbit internet
>> connections from the same provider.
>> >
>> > At location A:
>> > 1) Ubuntu 18.04 "server" - i7-4790K CPU @ 4.00GHz
>> > 2) Ubuntu 16.04 client - i5-3470 CPU @ 3.20GHz
>> >
>> > At location B:
>> > 3) Ubuntu 18.04 client - Celeron N2808  @ 1.58GHz
>> > 4) Ubuntu 18.04 client - Virtual Machine - Xeon(R) Gold 6126 CPU @
>> 2.60GHz
>> >
>> >
>> > Using iperf3 for all tests, with 8 threads, but that doesn't seem to
>> matter significantly.
>> >
>> > Between 1 & 2, via gigabit LAN - 940 Mbit/sec.
>> > Between 1 & 2, via WireGuard - 585 Mbit/sec
>> > - I might have expected a bit higher, but this is certainly acceptable.
>> >
>> > Between 3 and 1, direct iperf3 - 580 Mbit/sec
>> > Between 3 and 1, WireGuard - 73 Mbit/sec
>> >
>> > At this point I was guessing WireGuard was CPU limited on this little
>> Celeron, so I set up the Xeon VM (#4):
>> >
>> > Between 4 and 1, direct iperf3 - ~600 Mbit/sec
>> > Between 4 and 1, WireGuard - 80 Mbit/sec
>> >
>> > In other words, the much faster VM is only a tiny bit faster that the
>> celeron.
>> >
>> > Any suggestions?
>>
>> A lot can go wrong speed-wise "on the Internet"...
>>
>> What sits in between those hosts that you have control of (routers,
>> switches, firewalls...)?
>> IPv6 involved at all?
>> ISP having throttling policy for "UDP we don't understand"?
>> Play with the MTU, you might be hitting some fragmentation issues that
>> a weak router is not handling fast enough.
>> Play with Wireshark (new 3.0 even has support for wireguard
>> protocol!), capture some traffic, look for any transmission errors.
>>
>> Cheers,
>> Kalin.
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000388bbd058397f4f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Scott,<div><br></div><div>From experience, I can tell y=
ou I was able to get my Gbit saturated over Wireguard to a server in a data=
center.</div><div><br></div><div>You need to have good routing, obviously.<=
/div><div><br></div><div>Greetings,</div><div><br></div><div>Christopher Ba=
chner</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Mar 8, 2019 at 4:41 PM Scott Lipcon &lt;<a href=3D"mailt=
o:slipcon@gmail.com">slipcon@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif">Thanks for the su=
ggestions - I&#39;ll need to do some more experimentation when I get back i=
n the office, but I think you&#39;re on to something, perhaps with the rout=
er at Location B in my examples.=C2=A0 =C2=A0 I did a straight UDP speed te=
st with iperf3, and that worked fine - over 500Mbit/sec - there shouldn&#39=
;t be anything funny with MTU going on, nor any IPv6... however I did two a=
dditional tests:</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif">At my main location, I&#39;ve got ano=
ther &quot;low end&quot; box on the same local network as the &quot;server&=
quot; - this one is an intel Atom CPU - with that I was able to get about 5=
85Mbit/sec (compared to the 930-940 without wireguard).=C2=A0 =C2=A0=C2=A0<=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">I&#39;ve got a 3rd location available - actually a low=
 end VM on AWS - this one gets around 300Mbit unencrypted, and actually tes=
ted above that via wireguard - I assume thats just normal fluctuation, but =
seems to point the finger to something specific at location B, my office.=
=C2=A0 =C2=A0 I&#39;ll continue to investigate and update if I figure anyth=
ing out... it&#39;ll probably be at least a week before I get anywhere thou=
gh, due to work travel.</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">Thanks again,</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Scott</=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Mar 1, 2019 at 5:18 AM Kalin KOZHUHAROV &lt;<a hre=
f=3D"mailto:me.kalin@gmail.com" target=3D"_blank">me.kalin@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri,=
 Mar 1, 2019 at 11:11 AM Scott Lipcon &lt;<a href=3D"mailto:slipcon@gmail.c=
om" target=3D"_blank">slipcon@gmail.com</a>&gt; wrote:<br>
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
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000388bbd058397f4f4--

--===============2750425869826482274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2750425869826482274==--
