Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA9C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:25:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E251A2070B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E251A2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08cfc23c;
	Wed, 28 Aug 2019 06:25:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c9d9f01
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:25:18 +0000 (UTC)
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.29.7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a37bd864
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:25:18 +0000 (UTC)
Received: from [92.76.198.6] (helo=[192.168.177.20])
 by smtprelay03.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <hendrik@friedels.name>)
 id 1i2rOO-0005dr-J4; Wed, 28 Aug 2019 08:25:16 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "Laszlo KERTESZ" <laszlo.kertesz@gmail.com>, =?utf-8?q?Ivan=20Lab=c3=a1th?=
 <labawi-wg@matrix-dream.net>
Subject: Re[2]: Keep-alive does not keep the connection alive
Date: Wed, 28 Aug 2019 06:25:15 +0000
Message-Id: <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
In-Reply-To: <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
User-Agent: eM_Client/7.2.34062.0
Mime-Version: 1.0
X-Df-Sender: aGVuZHJpa0BmcmllZGVscy5uYW1l
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Hendrik Friedel <hendrik@friedels.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7236360665920135188=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7236360665920135188==
Content-Type: multipart/alternative;
 boundary="------=_MB59AF7700-3117-47DC-9A23-BC75759B56D7"

--------=_MB59AF7700-3117-47DC-9A23-BC75759B56D7
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

that seems not to be the intended behaviour:
If I understand correctly, the current behaviour is:

At tunnel start the IP is resolved
This IP is used for ever, namingly for re-connects.


The probably intended behaviour would be:

At tunnel start and at any re-connect the IP is resolved.


Do you agree that this behaviour should be changed?
Apart from that: Can you suggest an automatable workaround?

Regards,
Hendrik

------ Originalnachricht ------
Von: "Laszlo KERTESZ" <laszlo.kertesz@gmail.com>
An: "Ivan Lab=C3=A1th" <labawi-wg@matrix-dream.net>
Cc: "Hendrik Friedel" <hendrik@friedels.name>; wireguard@lists.zx2c4.com
Gesendet: 28.08.2019 08:17:32
Betreff: Re: Keep-alive does not keep the connection alive

>I too use a server with dynamic ip. And the clients (Android, Linux)=20
>tend to lose connectivity permanently if the server's ip changes. With=20
>or without keepalive.
>
>The dynamic ip's dns entries are updated almost instantly when the ip=20
>changes so this is not dns related. Wireguard does not try to re=20
>establish connection, it keeps using the server ip acquired at the=20
>tunnel's start. Only way around this is restarting the interface.
>
>On Mon, Aug 26, 2019, 21:08 Ivan Lab=C3=A1th <labawi-wg@matrix-dream.net>=
=20
>wrote:
>>Hello,
>>
>>I notice you are using dynamic ips for server.
>>On the client, is the server peer ip correct?
>>
>>Regards,
>>Ivan
>>
>>On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:
>> > Hello,
>> >
>> > thanks for your reply.
>> > It is linux (Kernel 5.x) in both cases.
>> >
>> > Regards,
>> > Hendrik
>> >
>> > ------ Originalnachricht ------
>> > Von: "Vasili Pupkin" <diggest@gmail.com>
>> > An: "Hendrik Friedel" <hendrik@friedels.name>
>> > Cc: wireguard@lists.zx2c4.com
>> > Gesendet: 25.08.2019 17:59:59
>> > Betreff: Re: Keep-alive does not keep the connection alive
>> >
>> > >What OS is running on client side? I have this issue on Win7=20
>>client,
>> > >can explain it further, it has nothing to do with keepalives=20
>>though,
>> > >it is a bug in tun adapter implementation
>> > >
>> > >On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel=20
>><hendrik@friedels.name> wrote:
>> > >>  I have a setup in which the Server IP is known, whereas the=20
>>Client IP is changing. Thus, I rely on the Client to connect to the=20
>>Server. I want the Client to keep the connection alive all the time=20
>>though, so that the Server can also initiate a connection to the=20
>>Server when needed. Both, client and server are behind a NAT/Router.
>> > >>  I would think, that the "PersistentKeepalive =3D 25" on the Client=
=20
>>would ckeep the connection open. The connection works fine while used.=20
>>But after a while, I cannot connect from the Server to the client=20
>>anymore.
>> > >>  I would assume that a ping from the Client to the IP of the=20
>>endpoint would help to re-alive the connection - but it does not.
>> > >>
>> > >>  Only after a wg-quick down and up all is fine again.
>> > >>
>> > >>  Below some more information.
>> > >>
>> > >>  Can you help me to find, what I am doing wrong?
>> >
>> > _______________________________________________
>> > WireGuard mailing list
>> > WireGuard@lists.zx2c4.com
>> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>>_______________________________________________
>>WireGuard mailing list
>>WireGuard@lists.zx2c4.com
>>https://lists.zx2c4.com/mailman/listinfo/wireguard
--------=_MB59AF7700-3117-47DC-9A23-BC75759B56D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style id=3D"css_styles" type=3D"text/css">blockquote.cite { ma=
rgin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px; b=
order-left: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: right;'] {  list=
-style-position: inside;}
body { font-family: Segoe UI; font-size: 12pt;   }</style></head><body><div=
>Hello,</div><div><br /></div><div>that seems not to be the intended behavi=
our:</div><div>If I understand correctly, the current behaviour is:</div><d=
iv><br /></div><div>At tunnel start the IP is resolved</div><div>This IP is =
used for ever, namingly for re-connects.</div><div><br /></div><div><br />=
</div><div>The probably intended behaviour would be:</div><div><br /></div>=
<div>At tunnel start and at any re-connect the IP is resolved.</div><div><b=
r /></div><div><br /></div><div>Do you agree that this behaviour should be=
 changed?=C2=A0</div><div>Apart from that: Can you suggest an automatable wo=
rkaround?</div><div><br /></div><div>Regards,</div><div>Hendrik</div>
<div><br /></div>
<div>------ Originalnachricht ------</div>
<div>Von: "Laszlo KERTESZ" &lt;<a href=3D"mailto:laszlo.kertesz@gmail.com">=
laszlo.kertesz@gmail.com</a>&gt;</div>
<div>An: "Ivan Lab=C3=A1th" &lt;<a href=3D"mailto:labawi-wg@matrix-dream.ne=
t">labawi-wg@matrix-dream.net</a>&gt;</div>
<div>Cc: "Hendrik Friedel" &lt;<a href=3D"mailto:hendrik@friedels.name">hen=
drik@friedels.name</a>&gt;; <a href=3D"mailto:wireguard@lists.zx2c4.com">wi=
reguard@lists.zx2c4.com</a></div>
<div>Gesendet: 28.08.2019 08:17:32</div>
<div>Betreff: Re: Keep-alive does not keep the connection alive</div><div><=
br /></div>
<div id=3D"x67c9270ef9284da"><blockquote cite=3D"CANcuY=3DoE9L_sm1b_JJV4_fv=
+ABLx9ZbTeXXzijkiLw-b=3DCxkMQ@mail.gmail.com" type=3D"cite" class=3D"cite2"=
>
<div dir=3D"auto">I too use a server with dynamic ip. And the clients (Andr=
oid, Linux) tend to lose connectivity permanently if the server's ip change=
s. With or without keepalive.<div dir=3D"auto"><br /></div><div dir=3D"auto=
">The dynamic ip's dns entries are updated almost instantly when the ip cha=
nges so this is not dns related. Wireguard does not try to re establish con=
nection, it keeps using the server ip acquired at the tunnel's start. Only=
 way around this is restarting the interface.=C2=A0</div></div><br /><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 26, 2=
019, 21:08 Ivan Lab=C3=A1th &lt;<a href=3D"mailto:labawi-wg@matrix-dream.ne=
t">labawi-wg@matrix-dream.net</a>&gt; wrote:<br /></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello,<br />
<br />
I notice you are using dynamic ips for server.<br />
On the client, is the server peer ip correct?<br />
<br />
Regards,<br />
Ivan<br />
<br />
On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:<br />
&gt; Hello,<br />
&gt; <br />
&gt; thanks for your reply.<br />
&gt; It is linux (Kernel 5.x) in both cases.<br />
&gt; <br />
&gt; Regards,<br />
&gt; Hendrik<br />
&gt; <br />
&gt; ------ Originalnachricht ------<br />
&gt; Von: "Vasili Pupkin" &lt;<a href=3D"mailto:diggest@gmail.com" rel=3D"n=
oreferrer">diggest@gmail.com</a>&gt;<br />
&gt; An: "Hendrik Friedel" &lt;<a href=3D"mailto:hendrik@friedels.name" rel=
=3D"noreferrer">hendrik@friedels.name</a>&gt;<br />
&gt; Cc: <a href=3D"mailto:wireguard@lists.zx2c4.com" rel=3D"noreferrer">wi=
reguard@lists.zx2c4.com</a><br />
&gt; Gesendet: 25.08.2019 17:59:59<br />
&gt; Betreff: Re: Keep-alive does not keep the connection alive<br />
&gt; <br />
&gt; &gt;What OS is running on client side? I have this issue on Win7 clien=
t,<br />
&gt; &gt;can explain it further, it has nothing to do with keepalives thoug=
h,<br />
&gt; &gt;it is a bug in tun adapter implementation<br />
&gt; &gt;<br />
&gt; &gt;On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel &lt;<a href=3D"mai=
lto:hendrik@friedels.name" rel=3D"noreferrer">hendrik@friedels.name</a>&gt; =
wrote:<br />
&gt; &gt;&gt;=C2=A0 I have a setup in which the Server IP is known, whereas =
the Client IP is changing. Thus, I rely on the Client to connect to the Se=
rver. I want the Client to keep the connection alive all the time though, s=
o that the Server can also initiate a connection to the Server when needed. =
Both, client and server are behind a NAT/Router.<br />
&gt; &gt;&gt;=C2=A0 I would think, that the "PersistentKeepalive =3D 25" on =
the Client would ckeep the connection open. The connection works fine whil=
e used. But after a while, I cannot connect from the Server to the client a=
nymore.<br />
&gt; &gt;&gt;=C2=A0 I would assume that a ping from the Client to the IP of =
the endpoint would help to re-alive the connection - but it does not.<br /=
>
&gt; &gt;&gt;<br />
&gt; &gt;&gt;=C2=A0 Only after a wg-quick down and up all is fine again.<br =
/>
&gt; &gt;&gt;<br />
&gt; &gt;&gt;=C2=A0 Below some more information.<br />
&gt; &gt;&gt;<br />
&gt; &gt;&gt;=C2=A0 Can you help me to find, what I am doing wrong?<br />
&gt; <br />
&gt; _______________________________________________<br />
&gt; WireGuard mailing list<br />
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer">WireGu=
ard@lists.zx2c4.com</a><br />
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer">https://lists.zx2c4.com/mailman/listinfo/wireguard</=
a><br />
_______________________________________________<br />
WireGuard mailing list<br />
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer">WireGuard@l=
ists.zx2c4.com</a><br />
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br =
/>
</blockquote></div>
</blockquote></div>
</body></html>
--------=_MB59AF7700-3117-47DC-9A23-BC75759B56D7--


--===============7236360665920135188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7236360665920135188==--

