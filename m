Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E18C10F04
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 03:34:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E8721738
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 03:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46E8721738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea48f0a4;
	Sun, 17 Feb 2019 03:25:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89f5b573
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 02:55:38 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac799d97
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 02:55:38 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id n8so22984013otl.6
 for <wireguard@lists.zx2c4.com>; Sat, 16 Feb 2019 19:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wKECTBiY5xMG4Vd20Wtq4UwygBkTxDWWgFoIUNm0JTA=;
 b=cQMMBwDsg98V8lgbJ7Zj+15osV8vkPddN9cLjBJDQkjh65485gtMkCSgoUgmUT8/YQ
 cuI5SzrMDU3c8r+5xG8nehG8r0QQLpTzeKbP9Czbhe9J0c2mzq56HTeCWgVsBpGTqjAH
 z4EDJuzxPKDyLU0SudXDpBUsh2lrtQkTwK6K8hynbXgQGimSjQSpBh/0QeoeLulDrAw7
 OAtHweex7nBGfbEkOfzf5R9iQ3q2YdvjsFvMc09YeBZqYpQqvSRu43oSfFzL8QALKupu
 vbkRiwBmwOJ2tyLj41lc/Ta+/5xbc4XZl1n+giMKlinJwZ61aEVT6pB9JlVVFMNuPgLZ
 JUQA==
X-Gm-Message-State: AHQUAuZZMWTfcrJxwgZlfLHeIXyGndp1SKUtj1Crryza6FtMYcRd45ip
 BeaWV8S/sKX+EI8QVQ8XnRplfSsxyIva5NJFgJHl1NlW
X-Google-Smtp-Source: AHgI3IbowzgMeMpallgFMtpdDn3EhjdenRzW4NP2aYs+cyysluhM5tlO1nPVtmZFVjwValq38dgep0nFAgX+QSZjejw=
X-Received: by 2002:a9d:37e1:: with SMTP id x88mr10605347otb.85.1550372631326; 
 Sat, 16 Feb 2019 19:03:51 -0800 (PST)
MIME-Version: 1.0
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
In-Reply-To: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
From: David Kerr <david@kerr.net>
Date: Sat, 16 Feb 2019 22:03:40 -0500
Message-ID: <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: Eryk Wieliczko <eryk@wieliczko.ninja>
X-Mailman-Approved-At: Sun, 17 Feb 2019 04:25:33 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5705907540615776376=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5705907540615776376==
Content-Type: multipart/alternative; boundary="000000000000f5ca2a05820e41c7"

--000000000000f5ca2a05820e41c7
Content-Type: text/plain; charset="UTF-8"

Erik, see here for a proposed fix.  No response from the WireGuard team
yet.

https://lists.zx2c4.com/pipermail/wireguard/2019-January/003842.html

Recently I had a power outage and both my gateway and cable modem went
offline. On power recovery both devices start up, but the gateway completes
startup before the cable modem completes its protocol negotiations, so
initially the external network (eth0) is not functional.  That comes online
say one minute later and all is well.

Except that all is not well.  Wireguard failed to start up because I have
Endpoint=<a URL> instead of a IP address.  And because external interface
is not live yet, DNS lookup fails and Wireguard does not gracefully handle
it.  This is really important because Wireguard may be my only way into my
local network.

As work-around I replaced the URL with the IP address... but that is not a
long term solution if the endpoint is not a static IP address.

Wireguard needs to handle the situation where external network may not have
stabilized at the time it starts up.  The above link proposed a fix.

David

On Sat, Feb 16, 2019 at 8:35 PM Eryk Wieliczko <eryk@wieliczko.ninja> wrote:

> Hello everyone!
>
> If you use a DNS address as an endpoint and there is no internet
> connection, WireGuard will hang for two minutes and then exit with error.
>
> IMO the expected behavior should be the same as in OpenVPN:
> WireGuard starts immediately and patiently tries to resolve the DNS until
> it succeeds.
>
> Thus, WireGuard should resolve the DNS just before connecting to the
> server. And just keep trying and trying without any timeouts.
>
> I'd like to install WireGuard on technician's computers and there is no
> guarantee that they will start phone tethering within 2 minutes of starting
> their machine. OpenVPN would pass this scenario.
>
> What do you think?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
-- 
David Kerr Sent from Gmail Mobile

--000000000000f5ca2a05820e41c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Erik, see here for a proposed fix.=C2=A0 No response=
 from the WireGuard team yet.=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div dir=3D"auto"><a href=3D"https://lists.zx2c4.com/pipermail/=
wireguard/2019-January/003842.html">https://lists.zx2c4.com/pipermail/wireg=
uard/2019-January/003842.html</a></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_default" style=3D"font-size:17px;font-family:=
verdana,sans-serif" dir=3D"auto">Recently I had a power outage and both my =
gateway and cable modem went offline. On power recovery both devices start =
up, but the gateway completes startup before the cable modem completes its =
protocol negotiations, so initially the external network (eth0) is not func=
tional.=C2=A0 That comes online say one minute later and all is well.</div>=
<div class=3D"gmail_default" style=3D"font-size:17px;font-family:verdana,sa=
ns-serif" dir=3D"auto"><br></div><div class=3D"gmail_default" style=3D"font=
-size:17px;font-family:verdana,sans-serif" dir=3D"auto">Except that all is =
not well.=C2=A0 Wireguard failed to start up because I have Endpoint=3D&lt;=
a URL&gt; instead of a IP address.=C2=A0 And because external interface is =
not live yet, DNS lookup fails and Wireguard does not gracefully handle it.=
=C2=A0 This is really important because Wireguard may be my only way into m=
y local network.</div><div class=3D"gmail_default" style=3D"font-size:17px;=
font-family:verdana,sans-serif" dir=3D"auto"><br></div><div class=3D"gmail_=
default" style=3D"font-size:17px;font-family:verdana,sans-serif" dir=3D"aut=
o">As work-around I replaced the URL with the IP address... but that is not=
 a long term solution if the endpoint is not a static=C2=A0IP address.</div=
><div class=3D"gmail_default" style=3D"font-size:17px;font-family:verdana,s=
ans-serif" dir=3D"auto"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:17px;font-family:verdana,sans-serif" dir=3D"auto">Wireguard needs to=
 handle the situation where external network may not have stabilized at the=
 time it starts up.=C2=A0 The above link proposed a fix.=C2=A0</div><div cl=
ass=3D"gmail_default" style=3D"font-size:17px;font-family:verdana,sans-seri=
f" dir=3D"auto"><br></div><div class=3D"gmail_default" style=3D"font-size:1=
7px;font-family:verdana,sans-serif" dir=3D"auto">David</div></div></div></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, Feb 16, 2019 at 8:35 PM Eryk Wieliczko &lt;eryk@wieliczko.ninja&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Hello everyone!</div=
><div><br></div><div>If you use a DNS address as an endpoint and there is n=
o internet connection, WireGuard will hang for two minutes and then exit wi=
th error.<br></div><div><br></div><div>IMO the expected behavior should be =
the same as in OpenVPN:<br></div><div>WireGuard starts immediately and pati=
ently tries to resolve the DNS until it succeeds.<br></div><div><br></div><=
div>Thus, WireGuard should resolve the DNS just before connecting to the se=
rver. And just keep trying and trying without any timeouts.<br></div><div><=
br></div><div>I&#39;d like to install WireGuard on technician&#39;s compute=
rs and there is no guarantee that they will start phone tethering within 2 =
minutes of starting their machine. OpenVPN would pass this scenario.<br></d=
iv><div><br></div><div>What do you think?<br></div>________________________=
_______________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">David Kerr
Sent from Gmail Mobile</div>

--000000000000f5ca2a05820e41c7--

--===============5705907540615776376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5705907540615776376==--
