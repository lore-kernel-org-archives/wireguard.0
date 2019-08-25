Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D115C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:19:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0EB2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E0EB2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b6c0179;
	Sun, 25 Aug 2019 19:18:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6903e2
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:18:58 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 441335cc
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:18:57 +0000 (UTC)
Received: from [192.168.127.216] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, TLS: TLS1.2,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by telperion.info with ESMTPSA
 id 0000000000046AB6.000000005D62DFC0.00003B8D; Sun, 25 Aug 2019 12:21:04 -0700
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with excluding private IPs
From: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <CH2PR12MB42307DB3AAC719186C705171C8AC0@CH2PR12MB4230.namprd12.prod.outlook.com>
Date: Sun, 25 Aug 2019 12:18:56 -0700
Message-Id: <8FAE89A6-F1D3-4FD3-BB3B-60371AA7C564@pallas.us>
References: <CH2PR12MB42307DB3AAC719186C705171C8AC0@CH2PR12MB4230.namprd12.prod.outlook.com>
To: Oliver Benning <obenning@fieldeffect.com>
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
Content-Type: multipart/mixed; boundary="===============1727193025438578256=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1727193025438578256==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-D6426FB9-DAD2-4413-9AAC-E83CC1880E63
Content-Transfer-Encoding: 7bit


--Apple-Mail-D6426FB9-DAD2-4413-9AAC-E83CC1880E63
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Doesn't a routing rule solve this issue?

~Derrick =E2=80=A2 iPhone

> On Aug 14, 2019, at 6:36 PM, Oliver Benning <obenning@fieldeffect.com> wro=
te:
>=20
> My setup (may be unrelated):
>=20
> I have a public endpoint hosted on Digital Ocean, which I connect to simpl=
y through its external IP address as the endpoint. It was setup using Streis=
and.
>=20
> The endpoint itself acts as a DNS resolver within the tunnel for ad blocki=
ng purposes, so the WireGuard profile uses the endpoint's internal IP addres=
s in the DNS field. This setup has been documented online.
>=20
> The issue (on both Mac and iPhone clients):
> I would like to exclude private IPs from the tunnel to connect to internal=
 resources. Connection works fine with AllowedIPs=3D0.0.0.0/0, it does not w=
ork when using the "Exclude private IPs option".
>=20
> Log just shows:
> [NET] peer(5m6B=E2=80=A6jmno) - Sending handshake initiation
> [NET] peer(5m6B=E2=80=A6jmno) - Failed to send handshake initiation write u=
dp4 0.0.0.0:63865->[EXTERNAL-IP]:51820: sendto: network is unreachable
>=20
> I also have tried using a set of CDR blocks such that the droplet's extern=
al ip is excluded from the range and that did not work either. If I have a m=
isconception about the configuration or there is something I should try plea=
se let me know.
>=20
> Recommendation
> This may have a been recommended below but I would highly suggest a list o=
f IPs to subtract from the tunnel. My ideal scenario would be:
>=20
> AllowedIPs =3D 0.0.0.0/0
> ExceptedIPs =3D 192.168.1.0/24
>=20
> Cheers,
> Oliver
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-D6426FB9-DAD2-4413-9AAC-E83CC1880E63
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Doesn't a routing rule solve this issue?<br=
><br><div id=3D"AppleMailSignature" dir=3D"ltr">~Derrick&nbsp;=E2=80=A2 iPho=
ne</div><div dir=3D"ltr"><br>On Aug 14, 2019, at 6:36 PM, Oliver Benning &lt=
;<a href=3D"mailto:obenning@fieldeffect.com">obenning@fieldeffect.com</a>&gt=
; wrote:<br><br></div><blockquote type=3D"cite"><div dir=3D"ltr">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-12=
52">



<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<b>My setup (may be unrelated):</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
I have a public endpoint hosted on Digital Ocean, which I connect to simply t=
hrough its external IP address as the endpoint. It was setup using Streisand=
.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
The endpoint itself acts as a DNS resolver within the tunnel for ad blocking=
 purposes, so the WireGuard profile uses the endpoint's internal IP address i=
n the DNS field. This setup has been documented online.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<b>The issue (on both Mac and iPhone clients):</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
I would like to exclude private IPs from the tunnel to connect to internal r=
esources. Connection works fine with AllowedIPs=3D0.0.0.0/0, it does not wor=
k when using the "Exclude private IPs option".</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
Log just shows:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
[NET] peer(5m6B=E2=80=A6jmno) - Sending handshake initiation<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
[NET] peer(5m6B=E2=80=A6jmno) - Failed to send handshake initiation write ud=
p4 0.0.0.0:63865-&gt;[EXTERNAL-IP]:51820: sendto: network is unreachable<br>=

</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
I also have tried using a set of CDR blocks such that the droplet's external=
 ip is excluded from the range and that did not work either. If I have a mis=
conception about the configuration or there is something I should try please=
 let me know.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<b>Recommendation</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
This may have a been recommended below but I would highly suggest a list of I=
Ps to subtract from the tunnel. My ideal scenario would be:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt;">
<p style=3D"color: rgb(248, 66, 146); margin: 0px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; font-stretch: normal; font-size: 1=
5px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">
<b>AllowedIPs</b><span style=3D"color: #ffffff"> =3D </span><span style=3D"c=
olor: #4491fa">0.0.0.0</span><span style=3D"color: #64a780">/0</span></p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; font-stretch: normal; font-size: 15px; line-height: normal;=
 font-family: &quot;Helvetica Neue&quot;;">
<b style=3D"color: rgb(248, 66, 146);">ExceptedIPs</b><span style=3D"color: r=
gb(255, 255, 255);"> =3D
</span><span style=3D"color: rgb(68, 145, 250);">192.168.1.0</span><font col=
or=3D"#64a780"><span style=3D"caret-color: rgb(100, 167, 128);">/24</span></=
font></p>
<p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; font-stretch: normal; font-size: 15px; line-height: normal;=
 font-family: &quot;Helvetica Neue&quot;;">
<font color=3D"#64a780"><span style=3D"caret-color: rgb(100, 167, 128);"><br=
>
</span></font></p>
<div style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; font-stretch: normal; font-size: 15px; line-height: norma=
l; font-family: &quot;Helvetica Neue&quot;;">
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: C=
alibri, Arial, Helvetica, sans-serif; font-size: 16px; background-color: rgb=
(255, 255, 255); display: inline !important">Cheers,</span><br>
</div>
<div style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; font-stretch: normal; font-size: 15px; line-height: norma=
l; font-family: &quot;Helvetica Neue&quot;;">
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: C=
alibri, Arial, Helvetica, sans-serif; font-size: 16px; background-color: rgb=
(255, 255, 255); display: inline !important">Oliver</span></div>
<br>
</div>


</div></blockquote><blockquote type=3D"cite"><div dir=3D"ltr"><span>________=
_______________________________________</span><br><span>WireGuard mailing li=
st</span><br><span><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@li=
sts.zx2c4.com</a></span><br><span><a href=3D"https://lists.zx2c4.com/mailman=
/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><=
/span><br></div></blockquote></body></html>=

--Apple-Mail-D6426FB9-DAD2-4413-9AAC-E83CC1880E63--

--===============1727193025438578256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1727193025438578256==--
