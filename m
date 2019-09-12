Return-Path: <SRS0=tD3D=XI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D363C4CEC5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 12:07:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43B92084F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 12:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=glexia.com header.i=@glexia.com header.b="eeuwm26A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A43B92084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=glexia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d0e3e62;
	Fri, 13 Sep 2019 12:07:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31f8735c
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Sep 2019 20:36:03 +0000 (UTC)
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 346bfe68
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Sep 2019 20:36:03 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id i17so8470849ual.7
 for <wireguard@lists.zx2c4.com>; Thu, 12 Sep 2019 13:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glexia.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/s26LhMpVFicq3/CdY83IBcdzrVN93l3mDzggQaOtg=;
 b=eeuwm26A7lorgJAG6+gfegFs+s0jwSjI/1kSe5nLxXWRIULedGXrBZOat88Pst466M
 rNqSBGmIqRSau70WNHboV8ucGRbfKFoTgFPDf0D1tcb4VVc8ZQS45HrZKojsbOFGrAfr
 K/UOCJT+GCs/MNizymfxaFYg0Pt/XZNWkGpyN7ELn3qb5uCtUAsDFMHDsjsnBOYoQ0iJ
 xlQxpiY2qscWXN+xBdP1RmPL0xqbmrkNkQ9SaJM57XMcNkV8J//lDThQMzE3yqxudzmN
 NbzYo7/MbXOabbF7Rz3An8HUQD/d6ebsBxm/TWBXopQJa8XMFhKPRpCEdXw6DW4x1/H+
 ppkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/s26LhMpVFicq3/CdY83IBcdzrVN93l3mDzggQaOtg=;
 b=GukpjpaJ2UFLO0ruamzoOG1kxWl6pGt0AnWD9K8z6DadmrTCdEsCuH9KplI3wfNlZ0
 fys1t9iH5kdoCz9CLv8iGbtUaMnnwAF9bDAoBtTV1OiOb3bKJmpR89yxtjrISlaZaa5+
 a+0N3pBtmOwoAF+stqiT2a6eCHUZUbViAMs9sEtJ0yckCRCUEsdK7vWBsbnPdQiiH4al
 e1rGYOauHC1tLXasEoRBts9dkUwizaq6GdlOTw9/rZ4LUr0ifkTgVyTo6v7d8Nlxylwg
 MSgCg1PhGrW8ayGx8nSI87xGBYHERkH9jv6v+RRojsQRuTXRPlXMrqEQITBqlLMKpwiU
 GrLg==
X-Gm-Message-State: APjAAAWyQXcneUUh1+RSc4ckpcEYd7AIJTg2HlYcLRMeXFyCBEMjA8xF
 39vxyKfWhqdeuL56+UzMYSwvsFpLgwroz7ASDZld2w==
X-Google-Smtp-Source: APXvYqzrckwaBUZJGC3/QMh185rQAX174b/1CykBe4NrIxnS0kYTcfqvhYUWQL+BraF+wUQUTRBz6ja0xIgc0lqZ4hQ=
X-Received: by 2002:ab0:7216:: with SMTP id u22mr15481420uao.91.1568320562031; 
 Thu, 12 Sep 2019 13:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Hw3ebSHKAa_WaOsXYezP_n3o2rQfbLvaRoGYH8SpF92=7fBg@mail.gmail.com>
In-Reply-To: <CA+Hw3ebSHKAa_WaOsXYezP_n3o2rQfbLvaRoGYH8SpF92=7fBg@mail.gmail.com>
From: "Michael B. Williams" <Michael.Williams@glexia.com>
Date: Thu, 12 Sep 2019 16:35:23 -0400
Message-ID: <CAGj=18EL2QEDBufGaux6=wA8HceF8+V0giPdZRZjs8NxfhObqA@mail.gmail.com>
Subject: Re: Routing between multiple wg interfaces
To: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
X-Mailman-Approved-At: Fri, 13 Sep 2019 14:07:12 +0200
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
Content-Type: multipart/mixed; boundary="===============8284919643260534822=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8284919643260534822==
Content-Type: multipart/alternative; boundary="000000000000fe829a0592611535"

--000000000000fe829a0592611535
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm a bit confused about your configuration files - could you better
organize them and present including the underlying host they are on? From
the question, it's unclear as to whether there are multiple WireGuard
servers or a single server. I see you reference pinging 192.168.1.0/24 but
I do not see any configurations showing that CIDR.

You may need a masquerade or SNAT for your WireGuard (wg0/wg1) interface.
Otherwise, the forwarded packets will be from an invalid range/host and
discarded depending on the exact configuration.

I.e. if your traffic is coming into the server from client -> wg1 but
leaving (forwarding) to wg0 then you'll need a masquerade on wg0  iptables
-t nat -A POSTROUTING -o wg0 -j MASQUERADE

------------------------------

*Michael B. Williams*
Glexia, Inc. - An IT Company
USA Direct: +1 978 477 6797
USA Toll Free: +1 800 675 0297 x101
AUS Direct: +61 3 8594 2265
AUS Toll Free: +61 1800 931 724 x101
Fax: +1.815-301-5570
Michael.Williams@glexia.com
https://www.glexia.com/
https://www.glexia.com.au/

*Legal Notice:*
The information in this electronic mail message is the sender's
confidential business and may be legally privileged. It is intended solely
for the addressee(s). Access to this internet electronic mail message by
anyone else is unauthorized. If you are not the intended recipient, any
disclosure, copying, distribution or any action taken or omitted to be
taken in reliance on it is prohibited and may be unlawful.



On Thu, Sep 12, 2019 at 3:33 PM Adri=C3=A1n Mih=C3=A1lko <adriankoooo@gmail=
.com>
wrote:

> I am trying to route between multiple WG interfaces.
>
> On my primary server:
>
> wg0.conf:
>
> [Interface]
> Address =3D 192.168.6.4/24
> ListenPort =3D 51820
> PrivateKey =3D
> PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i=
 -j
> ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o =
%i
> -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>
> [Peer]
> PublicKey =3D
> AllowedIPs =3D 192.168.6.1/32, 192.168.1.0/24
> Endpoint =3D xy.com:51820
>
> wg1.conf:
>
> [Interface]
> Address =3D 192.168.9.1/24
> ListenPort =3D 51821
> PrivateKey =3D
>
> PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i=
 -j
> ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o =
%i
> -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>
> [Peer]
> PublicKey =3D
> AllowedIPs =3D 192.168.9.3/32
>
> ---
>
> With wg0 I am connecting to an other server (xy.com:51820). On wg1 I am
> accepting client connections.
>
> On this server I can ping everything, so connection is working well.
>
> ping 192.168.6.1 - works
> ping 192.168.1.xxx - works
>
> ping 192.168.9.3 - works
>
> ---
>
> Now I am connecting my client to this server (client 192.168.9.3):
>
> [Interface]
> PrivateKey =3D
> Address =3D 192.168.9.3/24
> DNS =3D 192.168.9.1
>
> [Peer]
> PublicKey =3D
> AllowedIPs =3D 192.168.9.1/32, 192.168.1.0/24
> Endpoint =3D primaryserver:51821
>
>
> I can ping server 192.168.9.1 as expected, but I am unable to ping any of
> my devices in 192.168.1.0/24.
>
> Anyone knows what's the problem here?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000fe829a0592611535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;font-size:x-small">I&#39;m a bit confused about your configurati=
on files - could you better organize them and present including the underly=
ing host they are on? From the question, it&#39;s unclear as to whether the=
re are multiple WireGuard servers or a single server. I see you reference p=
inging <a href=3D"http://192.168.1.0/24">192.168.1.0/24</a> but I do not se=
e any configurations showing that CIDR.</div><div class=3D"gmail_default" s=
tyle=3D"font-family:verdana,sans-serif;font-size:x-small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:verdana,sans-serif;font-size:x-s=
mall">You may need a masquerade or SNAT for your WireGuard (wg0/wg1) interf=
ace. Otherwise, the forwarded packets will be from an invalid range/host an=
d discarded depending on the exact configuration.</div><div class=3D"gmail_=
default" style=3D"font-family:verdana,sans-serif;font-size:x-small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;fon=
t-size:x-small">I.e. if your traffic is coming into the server from client =
-&gt; wg1 but leaving (forwarding) to wg0 then you&#39;ll need a masquerade=
=C2=A0on wg0=C2=A0

iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

</div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"text-align:left=
"><font size=3D"1"><br></font></div><div align=3D"center" style=3D"text-ali=
gn:center"><span style=3D"font-family:Verdana,sans-serif"><font size=3D"1">=
<hr size=3D"1" width=3D"100%" noshade align=3D"center"></font></span></div>=
<p style=3D"margin-bottom:12pt"><b><span style=3D"font-family:Arial,sans-se=
rif;color:navy"><font size=3D"1">Michael B. Williams</font></span></b><span=
 style=3D"font-family:Verdana,sans-serif"><font size=3D"1">=C2=A0<br>Glexia=
, Inc. - An IT Company<br>USA Direct:=C2=A0<span title=3D"Call with Google =
Voice"><span title=3D"Call with Google Voice"><span title=3D"Call with Goog=
le Voice"><span title=3D"Call with Google Voice"><span id=3D"gc-number-2649=
" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 978 477 6797</sp=
an></span></span></span></span><br>USA Toll Free:=C2=A0<span title=3D"Call =
with Google Voice"><span title=3D"Call with Google Voice"><span title=3D"Ca=
ll with Google Voice"><span title=3D"Call with Google Voice"><span id=3D"gc=
-number-2650" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 800 =
675 0297</span></span></span></span></span> x101<br></font></span><span sty=
le=3D"font-family:Verdana,sans-serif;font-size:x-small">AUS Direct:=C2=A0</=
span><span title=3D"Call with Google Voice" style=3D"font-family:Verdana,sa=
ns-serif;font-size:x-small"><span title=3D"Call with Google Voice"><span ti=
tle=3D"Call with Google Voice"><span title=3D"Call with Google Voice">+61 3=
 8594 2265<br></span></span></span></span><span style=3D"font-family:Verdan=
a,sans-serif;font-size:x-small">AUS Toll Free:=C2=A0</span><span title=3D"C=
all with Google Voice" style=3D"font-family:Verdana,sans-serif;font-size:x-=
small"><span title=3D"Call with Google Voice"><span title=3D"Call with Goog=
le Voice"><span title=3D"Call with Google Voice">+61 1800 931 724</span></s=
pan></span></span><span style=3D"font-family:Verdana,sans-serif;font-size:x=
-small">=C2=A0x101<br></span><span style=3D"font-size:x-small;font-family:V=
erdana,sans-serif">Fax:=C2=A0</span><span title=3D"Call with Google Voice" =
style=3D"font-size:x-small;font-family:Verdana,sans-serif"><span title=3D"C=
all with Google Voice"><span title=3D"Call with Google Voice"><span title=
=3D"Call with Google Voice"><span><span id=3D"gc-number-2651" class=3D"gc-c=
s-link" title=3D"Call with Google Voice">+1.815-301-5570</span></span><br><=
/span></span></span></span><span style=3D"font-size:x-small;font-family:Ver=
dana,sans-serif"><a href=3D"mailto:Michael.Williams@glexia.com" title=3D"Mi=
chael.Williams@glexia.com" style=3D"color:rgb(17,85,204);font-size:x-small;=
font-family:Verdana,sans-serif" target=3D"_blank">Michael.Williams@glexia.c=
om</a><font color=3D"#000080"><br></font></span><a href=3D"https://www.glex=
ia.com/" title=3D"http://www.glexia.com/" style=3D"font-size:x-small;font-f=
amily:Verdana,sans-serif;color:rgb(17,85,204)" target=3D"_blank">https://ww=
w.glexia.com/</a><br><a href=3D"https://www.glexia.com.au/" title=3D"http:/=
/www.glexia.com/" style=3D"font-size:x-small;font-family:Verdana,sans-serif=
;color:rgb(17,85,204)" target=3D"_blank">https://www.glexia.com.au/</a><br>=
</p><p style=3D"margin-bottom:12pt"><span style=3D"font-family:Verdana,sans=
-serif"><font size=3D"1"><b><span style=3D"color:navy">Legal Notice:</span>=
</b><br>The information in this electronic mail message is the sender&#39;s=
 confidential business and may be legally privileged. It is intended solely=
 for the addressee(s). Access to this internet electronic mail message by a=
nyone else is unauthorized. If you are not the intended recipient, any disc=
losure, copying, distribution or any action taken or omitted to be taken in=
 reliance on it is prohibited and may be unlawful.=C2=A0<br></font><br></sp=
an></p></div></div></div></div></div></div></div></div></div><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Se=
p 12, 2019 at 3:33 PM Adri=C3=A1n Mih=C3=A1lko &lt;<a href=3D"mailto:adrian=
koooo@gmail.com">adriankoooo@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v>I am trying to route between multiple WG interfaces.=C2=A0<br></div><div>=
<br></div><div>On my primary server:</div><div><br></div><div>wg0.conf:</di=
v><div><br></div><div>[Interface]</div><div>Address =3D <a href=3D"http://1=
92.168.6.4/24" target=3D"_blank">192.168.6.4/24</a></div><div>ListenPort =
=3D 51820</div><div>PrivateKey =3D=C2=A0</div><div>PostUp =3D iptables -A F=
ORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t na=
t -A POSTROUTING -o eth0 -j MASQUERADE</div><div>PostDown =3D iptables -D F=
ORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t na=
t -D POSTROUTING -o eth0 -j MASQUERADE</div><div><br></div><div>[Peer]</div=
><div>PublicKey =3D=C2=A0</div><div>AllowedIPs =3D <a href=3D"http://192.16=
8.6.1/32" target=3D"_blank">192.168.6.1/32</a>, <a href=3D"http://192.168.1=
.0/24" target=3D"_blank">192.168.1.0/24</a></div><div>Endpoint =3D <a href=
=3D"http://xy.com:51820" target=3D"_blank">xy.com:51820</a></div><div><br><=
/div><div>wg1.conf:</div><div><br></div><div>[Interface]</div><div>Address =
=3D <a href=3D"http://192.168.9.1/24" target=3D"_blank">192.168.9.1/24</a><=
/div><div>ListenPort =3D 51821</div><div>PrivateKey =3D=C2=A0</div><div><br=
></div><div>PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FOR=
WARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<=
/div><div>PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FOR=
WARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE<=
/div><div><br></div><div>[Peer]</div><div>PublicKey =3D=C2=A0</div><div>All=
owedIPs =3D <a href=3D"http://192.168.9.3/32" target=3D"_blank">192.168.9.3=
/32</a></div><div><br></div><div>---</div><div><br></div><div>With wg0 I am=
 connecting to an other server (<a href=3D"http://xy.com:51820" target=3D"_=
blank">xy.com:51820</a>). On wg1 I am accepting client connections.</div><d=
iv><br></div><div>On this server I can ping everything, so connection is wo=
rking well.=C2=A0</div><div><br></div><div>ping 192.168.6.1 - works</div><d=
iv>ping 192.168.1.xxx - works</div><div><br></div><div>ping 192.168.9.3 - w=
orks</div><div><br></div><div>---</div><div><br></div><div>Now I am connect=
ing my client to this server (client 192.168.9.3):</div><div><br></div><div=
>[Interface]</div><div>PrivateKey =3D=C2=A0</div><div>Address =3D <a href=
=3D"http://192.168.9.3/24" target=3D"_blank">192.168.9.3/24</a></div><div>D=
NS =3D 192.168.9.1</div><div><br></div><div>[Peer]</div><div>PublicKey =3D=
=C2=A0</div><div>AllowedIPs =3D <a href=3D"http://192.168.9.1/32" target=3D=
"_blank">192.168.9.1/32</a>, <a href=3D"http://192.168.1.0/24" target=3D"_b=
lank">192.168.1.0/24</a></div><div>Endpoint =3D primaryserver:51821</div><d=
iv><br></div><div><br></div><div>I can ping server 192.168.9.1 as expected,=
 but I am unable to ping any of my devices in <a href=3D"http://192.168.1.0=
/24" target=3D"_blank">192.168.1.0/24</a>.=C2=A0</div><div><br></div><div>A=
nyone knows what&#39;s the problem here?</div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000fe829a0592611535--

--===============8284919643260534822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8284919643260534822==--
