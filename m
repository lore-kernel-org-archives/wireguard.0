Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57F3C00319
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:14:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C2D214AF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C2D214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eecf923;
	Thu, 21 Feb 2019 07:05:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cc448d6
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 14:49:55 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 859f6766
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 14:49:55 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 32so34511716ota.12
 for <wireguard@lists.zx2c4.com>; Tue, 19 Feb 2019 06:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=DtsiTmNM0vJJvWtb9FY/RdNsMq9bwr/XyNTCBfKZbJ4=;
 b=Pu2u7lA5l2wxw7faEkJUjwutwx5IRUUJAG87MDxrXaQs0waszRSyj96FM+W+PeHF7M
 Wd+nmY40h/AAKMvSP7Obc3qFWysYS/ro9qyfGhSU7zFbEfhMPB6yNUYbLWQPXNVRJOfs
 E4qgcmAdmLby0Z9aVkoOCLhBvyAjmda1I68G/Y9wypZHF7k3bJd7hlSWPm7u2L/D343B
 QhuBqExVtrSb4RsmvbKFKebTEEmU4nPwLjbHRRg5Z+PpJXhZIu0I9syQVuqKM+plATnP
 itlAojnY4IAyImkVzfGOCLCUi3ciOdgs8kXyhe6swuUi3CJEHnsEQ/AsMZTLo+wteEc9
 usXA==
X-Gm-Message-State: AHQUAubxS7zNtnOxewz67dP+g+Rv9osUT18FPUiBfHjizIGRL7vT6mH4
 hj/LlmrE/SH/5Fgisq7HKsPk4NH0grW5nN9IYtW2TYk2
X-Google-Smtp-Source: AHgI3IYqxkk4adRfnwoH7ZjnHSsV6qLGQqFL3oyybDr5K8961pBW77O2cja1PmOVKEcuH7N/Bgn3fu5DQWnPTfYSN9E=
X-Received: by 2002:a9d:5a14:: with SMTP id v20mr13567458oth.298.1550588306935; 
 Tue, 19 Feb 2019 06:58:26 -0800 (PST)
MIME-Version: 1.0
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
In-Reply-To: <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
From: David Kerr <david@kerr.net>
Date: Tue, 19 Feb 2019 09:58:16 -0500
Message-ID: <CAJJxGdGLeg+O2Z3CjfHxKjbJdudMzGRFHF2pnoA89UiOQLEGbQ@mail.gmail.com>
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 21 Feb 2019 08:05:11 +0100
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
Content-Type: multipart/mixed; boundary="===============4723350324883321433=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4723350324883321433==
Content-Type: multipart/alternative; boundary="0000000000003a63d7058240792e"

--0000000000003a63d7058240792e
Content-Type: text/plain; charset="UTF-8"

I agree.  Wireguard should never terminate because of DNS failure, and
should continue to parse config files for links that may be able to get
established in absence of DNS.  Wireguard also has a significant startup
delay when DNS fails, several seconds while DNS times out, which should be
avoided.

David

On Tue, Feb 19, 2019 at 12:04 AM zrm <zrm@trustiosity.com> wrote:

> On 2/16/19 23:08, Jeffrey Walton wrote:
> > On Sat, Feb 16, 2019 at 10:35 PM David Kerr <david@kerr.net> wrote:
> >>
> >> Erik, see here for a proposed fix.  No response from the WireGuard team
> yet.
> >>
> >> https://lists.zx2c4.com/pipermail/wireguard/2019-January/003842.html
> >>
> >> Recently I had a power outage and both my gateway and cable modem went
> offline. On power recovery both devices start up, but the gateway completes
> startup before the cable modem completes its protocol negotiations, so
> initially the external network (eth0) is not functional.  That comes online
> say one minute later and all is well.
> >>
> >> Except that all is not well.  Wireguard failed to start up because I
> have Endpoint=<a URL> instead of a IP address.  And because external
> interface is not live yet, DNS lookup fails and Wireguard does not
> gracefully handle it.  This is really important because Wireguard may be my
> only way into my local network.
> >>
> >> As work-around I replaced the URL with the IP address... but that is
> not a long term solution if the endpoint is not a static IP address.
> >>
> >> Wireguard needs to handle the situation where external network may not
> have stabilized at the time it starts up.  The above link proposed a fix.
> >
> > Forgive my ignorance... Should init just retry the service start?
> > Something like this (from Systemd):
> >
> >      [Unit]
> >      StartLimitInterval=360
> >      StartLimitBurst=5
> >
> > The statements above say to retry 5 times within 360 seconds.
> >
> > Jeff
>
> The issue is that the service shouldn't terminate over failure to
> resolve an individual endpoint.
>
> Suppose name resolution fails because of a DNS failure rather than a
> network failure. If there are other endpoints configured by address that
> are still reachable, should we give up entirely and not even connect the
> ones that we can? What if one of the endpoints configured by IP address
> is the DNS server?
>
> Pushing this onto init would imply something like separate unit files
> per endpoint, which may complicate things more than simplify them.
>
> It seems like the conflict is that on the one hand, we want to resolve
> the name at connection time rather than configuration time, but on the
> other hand we don't want a DNS resolver in the kernel. How hard would it
> be to call out to a trivial userspace DNS client? This shouldn't be very
> performance sensitive, the results could be cached for the TTL which is
> typically hours or at least minutes.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000003a63d7058240792e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">I agree.=C2=A0 Wireguard should never terminat=
e because of DNS failure, and should continue to parse config files for lin=
ks that may be able to get established in absence of DNS.=C2=A0 Wireguard a=
lso has a significant startup delay when DNS fails, several seconds while D=
NS times out, which should be avoided.</div><div class=3D"gmail_default" st=
yle=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif">David</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 19, 2019=
 at 12:04 AM zrm &lt;<a href=3D"mailto:zrm@trustiosity.com">zrm@trustiosity=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 2/16/19 23:08, Jeffrey Walton wrote:<br>
&gt; On Sat, Feb 16, 2019 at 10:35 PM David Kerr &lt;<a href=3D"mailto:davi=
d@kerr.net" target=3D"_blank">david@kerr.net</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Erik, see here for a proposed fix.=C2=A0 No response from the Wire=
Guard team yet.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2019-Januar=
y/003842.html" rel=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com=
/pipermail/wireguard/2019-January/003842.html</a><br>
&gt;&gt;<br>
&gt;&gt; Recently I had a power outage and both my gateway and cable modem =
went offline. On power recovery both devices start up, but the gateway comp=
letes startup before the cable modem completes its protocol negotiations, s=
o initially the external network (eth0) is not functional.=C2=A0 That comes=
 online say one minute later and all is well.<br>
&gt;&gt;<br>
&gt;&gt; Except that all is not well.=C2=A0 Wireguard failed to start up be=
cause I have Endpoint=3D&lt;a URL&gt; instead of a IP address.=C2=A0 And be=
cause external interface is not live yet, DNS lookup fails and Wireguard do=
es not gracefully handle it.=C2=A0 This is really important because Wiregua=
rd may be my only way into my local network.<br>
&gt;&gt;<br>
&gt;&gt; As work-around I replaced the URL with the IP address... but that =
is not a long term solution if the endpoint is not a static IP address.<br>
&gt;&gt;<br>
&gt;&gt; Wireguard needs to handle the situation where external network may=
 not have stabilized at the time it starts up.=C2=A0 The above link propose=
d a fix.<br>
&gt; <br>
&gt; Forgive my ignorance... Should init just retry the service start?<br>
&gt; Something like this (from Systemd):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Unit]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 StartLimitInterval=3D360<br>
&gt;=C2=A0 =C2=A0 =C2=A0 StartLimitBurst=3D5<br>
&gt; <br>
&gt; The statements above say to retry 5 times within 360 seconds.<br>
&gt; <br>
&gt; Jeff<br>
<br>
The issue is that the service shouldn&#39;t terminate over failure to <br>
resolve an individual endpoint.<br>
<br>
Suppose name resolution fails because of a DNS failure rather than a <br>
network failure. If there are other endpoints configured by address that <b=
r>
are still reachable, should we give up entirely and not even connect the <b=
r>
ones that we can? What if one of the endpoints configured by IP address <br=
>
is the DNS server?<br>
<br>
Pushing this onto init would imply something like separate unit files <br>
per endpoint, which may complicate things more than simplify them.<br>
<br>
It seems like the conflict is that on the one hand, we want to resolve <br>
the name at connection time rather than configuration time, but on the <br>
other hand we don&#39;t want a DNS resolver in the kernel. How hard would i=
t <br>
be to call out to a trivial userspace DNS client? This shouldn&#39;t be ver=
y <br>
performance sensitive, the results could be cached for the TTL which is <br=
>
typically hours or at least minutes.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--0000000000003a63d7058240792e--

--===============4723350324883321433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4723350324883321433==--
