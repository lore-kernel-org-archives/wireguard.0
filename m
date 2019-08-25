Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEEEC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:18:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0ED62082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0ED62082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a731aa8d;
	Sun, 25 Aug 2019 19:18:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71d82049
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:18:25 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5347d39
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:18:25 +0000 (UTC)
Received: from [192.168.127.216] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, TLS: TLS1.2,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by telperion.info with ESMTPSA
 id 0000000000046AB6.000000005D62DFA0.00003B8C; Sun, 25 Aug 2019 12:21:04 -0700
Mime-Version: 1.0 (1.0)
Subject: Re: [Feature Request] Add ability to exclude subnets from AllowedIPs
From: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <5301677D-D6E6-4DBB-ADA0-89AFC2D277AE@icloud.com>
Date: Sun, 25 Aug 2019 12:17:41 -0700
Message-Id: <47ECFF71-29D8-472B-98D3-C7BF72ADA7F7@pallas.us>
References: <5301677D-D6E6-4DBB-ADA0-89AFC2D277AE@icloud.com>
To: Aryn Starr <whereislelouch@icloud.com>
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
Content-Type: multipart/mixed; boundary="===============7882725213005794181=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============7882725213005794181==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-760005A2-4FAD-424F-BABD-445DBFF65E15
Content-Transfer-Encoding: 7bit


--Apple-Mail-760005A2-4FAD-424F-BABD-445DBFF65E15
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Why wouldn't this happen as an iptables rule?

If some AllowedIPs trick is working for you and you're using Python and the k=
ernel version of Wireguard, check out [1], which will allow you to programma=
tically set up the interface.

FWIW, I'm not sure adding complication to AllowedIPs is the right approach, b=
ut adding it to a tool seems reasonable. Maybe it also makes sense to allow a=
n IPset, but I'm haven't thought it through. My gut says routing prior to Wi=
reguard is probably what you're looking for.

[1] https://github.com/ArgosyLabs/wgnlpy

~Derrick =E2=80=A2 iPhone

> On Aug 22, 2019, at 12:10 PM, Aryn Starr <whereislelouch@icloud.com> wrote=
:
>=20
> I live in Iran, and here the internet censorship is fierce. I need to rout=
e almost all of my traffic through the VPN, but some domestic sites are not a=
ccessible from the US. Also, since ISPs apply different censoring rules, som=
etimes my own servers are not reachable via the VPN (because the server=E2=80=
=99s ISP blocks the VPN, while my local ISP does not.)
> The best current solution I=E2=80=99ve seen is
> ```
> $ python3
>=20
>>>> import ipaddress
>>>> n1 =3D ipaddress.ip_network('106.203.202.0/23')
>>>> n2 =3D ipaddress.ip_network('106.203.203.13/32')
>>>> l =3D list(n1.address_exclude(n2))
>>>> print(l)
>=20
> ```
> Which is terrible.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-760005A2-4FAD-424F-BABD-445DBFF65E15
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Why wouldn't this happen as an iptable=
s rule?</div><div><br></div>If some AllowedIPs trick is working for you and y=
ou're using Python and the kernel version of Wireguard, check out [1], which=
 will allow you to programmatically set up the interface.<div><br></div><div=
>FWIW, I'm not sure adding complication to AllowedIPs is the right approach,=
 but adding it to a tool seems reasonable. Maybe it also makes sense to allo=
w an IPset, but I'm haven't thought it through. My gut says routing prior to=
 Wireguard is probably what you're looking for.<div><br></div><div>[1]&nbsp;=
<a href=3D"https://github.com/ArgosyLabs/wgnlpy">https://github.com/ArgosyLa=
bs/wgnlpy</a><br><br><div id=3D"AppleMailSignature" dir=3D"ltr">~Derrick&nbs=
p;=E2=80=A2 iPhone</div><div dir=3D"ltr"><br>On Aug 22, 2019, at 12:10 PM, A=
ryn Starr &lt;<a href=3D"mailto:whereislelouch@icloud.com">whereislelouch@ic=
loud.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div dir=3D"l=
tr"><span>I live in Iran, and here the internet censorship is fierce. I need=
 to route almost all of my traffic through the VPN, but some domestic sites a=
re not accessible from the US. Also, since ISPs apply different censoring ru=
les, sometimes my own servers are not reachable via the VPN (because the ser=
ver=E2=80=99s ISP blocks the VPN, while my local ISP does not.)</span><br><s=
pan>The best current solution I=E2=80=99ve seen is</span><br><span>```</span=
><br><span>$ python3</span><br><span></span><br><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>import ipaddress</sp=
an><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>n1 =3D ipaddress.ip_ne=
twork('106.203.202.0/23')</span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>n2 =3D ipaddress.ip_network('106.203.203.13/32')</span><br></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>l =3D list(n1.address_exclude(n2))</spa=
n><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>print(l)</span><br></bl=
ockquote></blockquote></blockquote><span></span><br><span>```</span><br><spa=
n>Which is terrible.</span><br><span>_______________________________________=
________</span><br><span>WireGuard mailing list</span><br><span><a href=3D"m=
ailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a></span><br><sp=
an><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https://li=
sts.zx2c4.com/mailman/listinfo/wireguard</a></span><br></div></blockquote></=
div></div></body></html>=

--Apple-Mail-760005A2-4FAD-424F-BABD-445DBFF65E15--

--===============7882725213005794181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7882725213005794181==--
