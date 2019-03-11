Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD9CC10F05
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:24:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B748C2184E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRZ9pKnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B748C2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65615647;
	Wed, 20 Mar 2019 22:22:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97215df1
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2019 16:12:56 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 502a15ac
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2019 16:12:56 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d2so5701594qti.11
 for <wireguard@lists.zx2c4.com>; Mon, 11 Mar 2019 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJ/FtBhGTryFO8mgqDIxrXoHmLP+rxHE/V4g98EJClM=;
 b=YRZ9pKnmYPptzZm6+/jlgYQqqGpWma2yPGgUUeOGqtwKbfv2NleoRxIOqw/UHndYjV
 uDcp8OStEky0GMA0QwTNZjK/9qD6En7CW0Rg45NAidskJYiN/gjxLqjhBWuNxWpbcRwO
 mf4WUW2NRxdouVrUXEtq4RxzeVJEhX2bujauSObIP3EynIiCN0U8o7QlX1qLtAAtdq5P
 DShRRKxtA8OrnRTiru9Vp3TtbXolT44pB8MeByoGPMo7d32oQIJTbMYTdQcBI2T86Ddt
 Rpm9tNjkP+j0GBpzAAStJF1ezn1O+FRfKq8tCePjhH013NTLJAmick/mUQINrU5TQEKM
 ZwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJ/FtBhGTryFO8mgqDIxrXoHmLP+rxHE/V4g98EJClM=;
 b=gAV1yBPMeRq+h5rXNFt8f3saGOWkKt0fL8FjCCqmSA+UgNbmvoxReS1ZG6xjDednBX
 n024qv+F0yHVddiyyS8xvvQVcpnsv1hEAQj+wn6+feEmL55MXcOzu8fa2OK3v7LaxAqE
 HM7xa9reumo9iaXrHFSdr2XV8KlNZdtcEQ0w0nl0vsJjEDeqLc95HkNVywV1GpkhfNIN
 ZvaCRO0lOA34WIug0m0RgKkVzT/J2k6yHhItKH+k3Ue8QD3540eek95WGCvoBHNfwSGF
 Z6LkXC8M24o23ZTWxHnMpkEM9D5gi0GAygBRjp/gLqpS1c4oG71iLmS/gNb8qPvzD3AX
 bjrQ==
X-Gm-Message-State: APjAAAXGEA06wdgWaaTEiEcVPzrVpgGdSeZOyxdHHpPVlw999yc6bZHB
 AV7lyt60cFKznfOTfafHMMhlqGRof8UDh3z0KF8=
X-Google-Smtp-Source: APXvYqxxnzkGfe+m1IG+/vNhi+NsuNgrsEJisEMp5j8cgnS/Qq1HyvLLqNggWLMeqEWL2/WzOQTQAqNAHfzW5RdrQJk=
X-Received: by 2002:ac8:2415:: with SMTP id c21mr24365706qtc.93.1552321443408; 
 Mon, 11 Mar 2019 09:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwvAosHFogtuPL09C9ek4bz6A7vW76mzKymL11iWs+9F7Ep_Q@mail.gmail.com>
 <CAKXLc7cerFqi1dACAfL3gRx53E9u0n709rd=Wu-0uCbFtJOiRA@mail.gmail.com>
 <CAJwvAotKEmjTOd0U9vMX0taZYTc4YKygnKX5sw79ySgdXc0ebg@mail.gmail.com>
In-Reply-To: <CAJwvAotKEmjTOd0U9vMX0taZYTc4YKygnKX5sw79ySgdXc0ebg@mail.gmail.com>
From: Scott Lipcon <slipcon@gmail.com>
Date: Mon, 11 Mar 2019 12:23:52 -0400
Message-ID: <CAJwvAov9roSCgWf-op-dY+N7cwoeTvUx--NHDbz7dx=3goaZ9A@mail.gmail.com>
Subject: Re: performance query
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:22:29 +0100
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
Content-Type: multipart/mixed; boundary="===============4015659877603769329=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4015659877603769329==
Content-Type: multipart/alternative; boundary="000000000000362d920583d40054"

--000000000000362d920583d40054
Content-Type: text/plain; charset="UTF-8"

Just to provide a followup, in case anyone is interested - The office
router is a Sonicwall TZ 500.   Disabling DPI on the zone in question
caused the performance to dramatically increase.... 655Mbit for no VPN, and
about 600 via Wireguard.... thanks for the tip to look at the firewall.

Scott


On Fri, Mar 1, 2019 at 11:08 PM Scott Lipcon <slipcon@gmail.com> wrote:

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
>

--000000000000362d920583d40054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Just to provide a followup, in case anyone is intereste=
d - The office router is a Sonicwall TZ 500.=C2=A0 =C2=A0Disabling DPI on t=
he zone in question caused the performance to dramatically increase.... 655=
Mbit for no VPN, and about 600 via Wireguard.... thanks for the tip to look=
 at the firewall.</div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,helvetica,sans-serif">Scott</div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,helvetica,sans-serif"><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar =
1, 2019 at 11:08 PM Scott Lipcon &lt;<a href=3D"mailto:slipcon@gmail.com">s=
lipcon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font=
-family:arial,helvetica,sans-serif">Thanks for the suggestions - I&#39;ll n=
eed to do some more experimentation when I get back in the office, but I th=
ink you&#39;re on to something, perhaps with the router at Location B in my=
 examples.=C2=A0 =C2=A0 I did a straight UDP speed test with iperf3, and th=
at worked fine - over 500Mbit/sec - there shouldn&#39;t be anything funny w=
ith MTU going on, nor any IPv6... however I did two additional tests:</div>=
<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">At my main location, I&#39;ve got another &quot;low end&quo=
t; box on the same local network as the &quot;server&quot; - this one is an=
 intel Atom CPU - with that I was able to get about 585Mbit/sec (compared t=
o the 930-940 without wireguard).=C2=A0 =C2=A0=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">I=
&#39;ve got a 3rd location available - actually a low end VM on AWS - this =
one gets around 300Mbit unencrypted, and actually tested above that via wir=
eguard - I assume thats just normal fluctuation, but seems to point the fin=
ger to something specific at location B, my office.=C2=A0 =C2=A0 I&#39;ll c=
ontinue to investigate and update if I figure anything out... it&#39;ll pro=
bably be at least a week before I get anywhere though, due to work travel.<=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">Thanks again,</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif">Scott</div><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif"><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Mar 1, 2019 at 5:18 AM Kalin KOZHUHAROV &lt;<a href=3D"mailto:me.kalin@gma=
il.com" target=3D"_blank">me.kalin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Fri, Mar 1, 2019 at 11:11 AM=
 Scott Lipcon &lt;<a href=3D"mailto:slipcon@gmail.com" target=3D"_blank">sl=
ipcon@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div>

--000000000000362d920583d40054--

--===============4015659877603769329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4015659877603769329==--
