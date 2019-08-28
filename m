Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F480C3A5A7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:06:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2D4D22CF5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2D4D22CF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 983a2b4f;
	Wed, 28 Aug 2019 06:06:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d79bb295
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:06:27 +0000 (UTC)
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.29.8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3023940b
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:06:26 +0000 (UTC)
Received: from [92.76.198.6] (helo=[192.168.177.20])
 by smtprelay04.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <hendrik@friedels.name>)
 id 1i2r68-0000Ih-OY; Wed, 28 Aug 2019 08:06:24 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: =?utf-8?q?Ivan=20Lab=c3=a1th?= <labawi-wg@matrix-dream.net>
Subject: Re[2]: Keep-alive does not keep the connection alive
Date: Wed, 28 Aug 2019 06:06:23 +0000
Message-Id: <em99be8572-a929-4655-9c39-aa87955107e8@ryzen>
In-Reply-To: <20190826180244.GB5022@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
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
Content-Type: multipart/mixed; boundary="===============7906691946176649242=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7906691946176649242==
Content-Type: multipart/alternative;
 boundary="------=_MB1D78D5C9-C7FA-494A-B79A-3A9B1015338D"

--------=_MB1D78D5C9-C7FA-494A-B79A-3A9B1015338D
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

yes, the Sever has a dynamic IP.

 >On the client, is the server peer ip correct?
Which entry are you refering to?
I assume
Endpoint =3D Dyn.IP:51820

Yes, but otherwise, the connection would not even be established, right?

For reference, here the complete client config:
[Interface]
Address =3D 10.192.122.3/32
PrivateKey =3D xx=3D

[Peer]
PublicKey =3D yy=3D
Endpoint =3D Dyn.IP:51820
AllowedIPs =3D 0.0.0.0/0
PersistentKeepalive =3D 25

Regards,
Hendrik



------ Originalnachricht ------
Von: "Ivan Lab=C3=A1th" <labawi-wg@matrix-dream.net>
An: "Hendrik Friedel" <hendrik@friedels.name>
Cc: "Vasili Pupkin" <diggest@gmail.com>; wireguard@lists.zx2c4.com
Gesendet: 26.08.2019 20:02:44
Betreff: Re: Keep-alive does not keep the connection alive

>Hello,
>
>I notice you are using dynamic ips for server.
>On the client, is the server peer ip correct?
>
>Regards,
>Ivan
>
>On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:
>>  Hello,
>>
>>  thanks for your reply.
>>  It is linux (Kernel 5.x) in both cases.
>>
>>  Regards,
>>  Hendrik
>>
>>  ------ Originalnachricht ------
>>  Von: "Vasili Pupkin" <diggest@gmail.com>
>>  An: "Hendrik Friedel" <hendrik@friedels.name>
>>  Cc: wireguard@lists.zx2c4.com
>>  Gesendet: 25.08.2019 17:59:59
>>  Betreff: Re: Keep-alive does not keep the connection alive
>>
>>  >What OS is running on client side? I have this issue on Win7 client,
>>  >can explain it further, it has nothing to do with keepalives though,
>>  >it is a bug in tun adapter implementation
>>  >
>>  >On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel <hendrik@friedels.name=
> wrote:
>>  >>  I have a setup in which the Server IP is known, whereas the Client=
 IP is changing. Thus, I rely on the Client to connect to the Server. I want =
the Client to keep the connection alive all the time though, so that the S=
erver can also initiate a connection to the Server when needed. Both, clien=
t and server are behind a NAT/Router.
>>  >>  I would think, that the "PersistentKeepalive =3D 25" on the Client=
 would ckeep the connection open. The connection works fine while used. But=
 after a while, I cannot connect from the Server to the client anymore.
>>  >>  I would assume that a ping from the Client to the IP of the endpoin=
t would help to re-alive the connection - but it does not.
>>  >>
>>  >>  Only after a wg-quick down and up all is fine again.
>>  >>
>>  >>  Below some more information.
>>  >>
>>  >>  Can you help me to find, what I am doing wrong?
>>
>>  _______________________________________________
>>  WireGuard mailing list
>>  WireGuard@lists.zx2c4.com
>>  https://lists.zx2c4.com/mailman/listinfo/wireguard
--------=_MB1D78D5C9-C7FA-494A-B79A-3A9B1015338D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style>#x4378ac1a8d5e4bd79733224344e79ff8{
	font-family:'Segoe UI';
	font-size:12pt;
	color:#000;
	margin-left:0px;
	margin-right:8px;
	background-color:#FFF;
}
#x4378ac1a8d5e4bd79733224344e79ff8{
	font-family:'Segoe UI';
	font-size:12pt;
}#xe2c1111c7c8047e6b2382a2787faad5a{
	font-family:'Segoe UI';
	font-size:12pt;
	color:#000;
	margin-left:0px;
	margin-right:8px;
	background-color:#FFF;
}
#xe2c1111c7c8047e6b2382a2787faad5a{
	font-family:'Segoe UI';
	font-size:12pt;
}</style>

<style id=3D"css_styles" type=3D"text/css">blockquote.cite { margin-left: 5=
px; margin-right: 0px; padding-left: 10px; padding-right:0px; border-left:=
 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: right;'] {  list=
-style-position: inside;}
body { font-family: Segoe UI; font-size: 12pt;   }</style></head><body clas=
s=3D"plain"><div>Hello,</div><div><br /></div><div>yes, the Sever has a dyn=
amic IP.</div><div><br /></div><div>&gt;On the client, is the server peer i=
p correct?</div><div>Which entry are you refering to?</div><div><div id=3D"=
xe2c1111c7c8047e6b2382a2787faad5a"><div style=3D"zoom: 0.9;"><div>I assume=
=C2=A0</div><div>Endpoint =3D Dyn.IP:51820=C2=A0</div><div><br /></div><div=
>Yes, but otherwise, the connection would not even be established, right?</=
div><div><br /></div><div>For reference, here the complete client config:</=
div><div><div id=3D"x4378ac1a8d5e4bd79733224344e79ff8"><div><div>[Interface=
]</div><div>Address =3D 10.192.122.3/32</div><div>PrivateKey =3D xx=3D</div=
><div><br /></div><div>[Peer]</div><div>PublicKey =3D yy=3D</div><div>Endpo=
int =3D Dyn.IP:51820</div><div>AllowedIPs =3D 0.0.0.0/0</div><div>Persisten=
tKeepalive =3D 25</div></div></div></div><div><br /></div><div>Regards,</di=
v><div>Hendrik</div><div><br /></div></div></div></div><div><br /></div>
<div><br /></div>
<div>------ Originalnachricht ------</div>
<div>Von: "Ivan Lab=C3=A1th" &lt;labawi-wg@matrix-dream.net&gt;</div>
<div>An: "Hendrik Friedel" &lt;hendrik@friedels.name&gt;</div>
<div>Cc: "Vasili Pupkin" &lt;diggest@gmail.com&gt;; wireguard@lists.zx2c4.c=
om</div>
<div>Gesendet: 26.08.2019 20:02:44</div>
<div>Betreff: Re: Keep-alive does not keep the connection alive</div><div><=
br /></div>
<div id=3D"x5ecd9e8c2fd143e"><blockquote type=3D"cite" class=3D"cite2">

<div class=3D"plain_line">Hello,</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">I notice you are using dynamic ips for server.</d=
iv>
<div class=3D"plain_line">On the client, is the server peer ip correct?</di=
v>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Regards,</div>
<div class=3D"plain_line">Ivan</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik =
Friedel wrote:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line"> Hello,</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> thanks for your reply.</div>
<div class=3D"plain_line"> It is linux (Kernel 5.x) in both cases.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> Regards,</div>
<div class=3D"plain_line"> Hendrik</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> ------ Originalnachricht ------</div>
<div class=3D"plain_line"> Von: "Vasili Pupkin" &lt;diggest@gmail.com&gt;</=
div>
<div class=3D"plain_line"> An: "Hendrik Friedel" &lt;hendrik@friedels.name&=
gt;</div>
<div class=3D"plain_line"> Cc: wireguard@lists.zx2c4.com</div>
<div class=3D"plain_line"> Gesendet: 25.08.2019 17:59:59</div>
<div class=3D"plain_line"> Betreff: Re: Keep-alive does not keep the connec=
tion alive</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> &gt;What OS is running on client side? I have th=
is issue on Win7 client,</div>
<div class=3D"plain_line"> &gt;can explain it further, it has nothing to do =
with keepalives though,</div>
<div class=3D"plain_line"> &gt;it is a bug in tun adapter implementation</d=
iv>
<div class=3D"plain_line"> &gt;</div>
<div class=3D"plain_line"> &gt;On Sun, Aug 25, 2019 at 6:38 PM Hendrik Frie=
del &lt;hendrik@friedels.name&gt; wrote:</div>
<div class=3D"plain_line"> &gt;&gt;  I have a setup in which the Server IP=
 is known, whereas the Client IP is changing. Thus, I rely on the Client to=
 connect to the Server. I want the Client to keep the connection alive all t=
he time though, so that the Server can also initiate a connection to the Se=
rver when needed. Both, client and server are behind a NAT/Router.</div>
<div class=3D"plain_line"> &gt;&gt;  I would think, that the "PersistentKee=
palive =3D 25" on the Client would ckeep the connection open. The connectio=
n works fine while used. But after a while, I cannot connect from the Serve=
r to the client anymore.</div>
<div class=3D"plain_line"> &gt;&gt;  I would assume that a ping from the Cl=
ient to the IP of the endpoint would help to re-alive the connection - but=
 it does not.</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;  Only after a wg-quick down and up all=
 is fine again.</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;  Below some more information.</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;  Can you help me to find, what I am doi=
ng wrong?</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> _______________________________________________<=
/div>
<div class=3D"plain_line"> WireGuard mailing list</div>
<div class=3D"plain_line"> WireGuard@lists.zx2c4.com</div>
<div class=3D"plain_line"> https://lists.zx2c4.com/mailman/listinfo/wiregua=
rd</div>
</blockquote>
</blockquote></div>
</body></html>
--------=_MB1D78D5C9-C7FA-494A-B79A-3A9B1015338D--


--===============7906691946176649242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7906691946176649242==--

