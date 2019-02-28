Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC40AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 20:57:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E2820851
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 20:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E2820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7c88522;
	Thu, 28 Feb 2019 20:47:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e287707
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 20:47:33 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51960729
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 20:47:33 +0000 (UTC)
Received: from [192.168.127.216] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, TLS: TLS1.2,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by telperion.info with ESMTPSA; Thu, 28 Feb 2019 13:00:21 -0800
 id 000000000004A471.000000005C784BE5.00005AF7
Mime-Version: 1.0 (1.0)
Subject: Re: Help calculate MTU, ISP's 1448
From: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <CY4PR14MB1141A575E3180794D7155EB3A2750@CY4PR14MB1141.namprd14.prod.outlook.com>
Date: Thu, 28 Feb 2019 12:56:44 -0800
Message-Id: <A3395BE5-CB9C-41DD-8108-AF2307B79507@pallas.us>
References: <DM6PR12MB3401FF1DE04A62EAD84F2C74BB7B0@DM6PR12MB3401.namprd12.prod.outlook.com>
 <CY4PR14MB1141A575E3180794D7155EB3A2750@CY4PR14MB1141.namprd14.prod.outlook.com>
To: Denis Kisselev <denis@dkisselev.net>
Cc: "STR ." <strykar@hotmail.com>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1485263400952395073=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1485263400952395073==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-1367D831-BF9C-4948-8FBC-CFC524077E4B
Content-Transfer-Encoding: 7bit


--Apple-Mail-1367D831-BF9C-4948-8FBC-CFC524077E4B
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I've had to drop to 1280 from Linode to several cellular carriers or else IP=
v6 fails. Ymmv, but the primary problem I've seen is MTU discovery failing b=
ecause the v6 message is being eaten but not the v4 message. Have you enable=
d discovery in the kernel?

~Derrick =E2=80=A2 iPhone

> On Feb 28, 2019, at 11:56 AM, Denis Kisselev <denis@dkisselev.net> wrote:
>=20
> Check what IP's the google domains are resolving to.
>=20
> You might be getting IPv6 DNS responses back and your VPN/firewall configu=
ration is blocking them.
> I've run into the opposite issue where my ISP's IPv4 stack crashed and Goo=
gle/Facebook worked (over IPv6) but most other sites failed.
> From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of STR . <st=
rykar@hotmail.com>
> Sent: Tuesday, February 26, 2019 4:39 AM
> To: wireguard@lists.zx2c4.com
> Subject: Help calculate MTU, ISP's 1448
> =20
> Hi,
>=20
> I have Fiber to our apartment complex basement, from there Cat6 runs to
> each apartment. The ISP/apartment service provider suggests an MTU of
> 1448, which I set for the PPPoE interface on my OpenWRT router.
>=20
> I read=20
> https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html
> which comes to (assuming 1500 byte MTU) to 60 bytes (IPv6) to 80 bytes les=
s to account for Wireguard protocol overhead.
>=20
> Using this info, I tried an MTU of both (1448-80=3D1368) and (1448-
> 60=3D1388).
> As my ISP assigns only IPv4, I expected an MTU of 1388 to work, which I
> set on the Wireguard interface in OpenWRT.
>=20
> However, when set to 1388, almost everything works except any Google
> related sites like Maps, Gmail, YT etc.
> When set to 1368, everything works and it's the way I have it setup
> right now.
>=20
> What am I missing here?
> Why won't Google sites load via my WG VPN when the MTU is set to 1388?
>=20
> If it helps, I host the WG server on Google's cloud platform and was
> informed that GCP has an MTU of 1460 bytes.
>=20
> Thank you,
> S
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-1367D831-BF9C-4948-8FBC-CFC524077E4B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I've had to drop to 1280 from Linode to sev=
eral cellular carriers or else IPv6 fails. Ymmv, but the primary problem I'v=
e seen is MTU discovery failing because the v6 message is being eaten but no=
t the v4 message. Have you enabled discovery in the kernel?<br><br><div id=3D=
"AppleMailSignature" dir=3D"ltr">~Derrick&nbsp;=E2=80=A2 iPhone</div><div di=
r=3D"ltr"><br>On Feb 28, 2019, at 11:56 AM, Denis Kisselev &lt;<a href=3D"ma=
ilto:denis@dkisselev.net">denis@dkisselev.net</a>&gt; wrote:<br><br></div><b=
lockquote type=3D"cite"><div dir=3D"ltr">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">=




<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Check what IP's the google domains are resolving to.<br>
<br>
You might be getting IPv6 DNS responses back and your VPN/firewall configura=
tion is blocking them.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've run into the opposite issue where my ISP's IPv4 stack crashed and Googl=
e/Facebook worked (over IPv6) but most other sites failed.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" sty=
le=3D"font-size:11pt" color=3D"#000000"><b>From:</b> WireGuard &lt;<a href=3D=
"mailto:wireguard-bounces@lists.zx2c4.com">wireguard-bounces@lists.zx2c4.com=
</a>&gt; on behalf of STR . &lt;<a href=3D"mailto:strykar@hotmail.com">stryk=
ar@hotmail.com</a>&gt;<br>
<b>Sent:</b> Tuesday, February 26, 2019 4:39 AM<br>
<b>To:</b> <a href=3D"mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c=
4.com</a><br>
<b>Subject:</b> Help calculate MTU, ISP's 1448</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;"=
>
<div class=3D"PlainText">Hi,<br>
<br>
I have Fiber to our apartment complex basement, from there Cat6 runs to<br>
each apartment. The ISP/apartment service provider suggests an MTU of<br>
1448, which I set for the PPPoE interface on my OpenWRT router.<br>
<br>
I read <br>
<a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.=
html">https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html<=
/a><br>
which comes to (assuming 1500 byte MTU) to 60 bytes (IPv6) to 80 bytes less t=
o account for Wireguard protocol overhead.<br>
<br>
Using this info, I tried an MTU of both (1448-80=3D1368) and (1448-<br>
60=3D1388).<br>
As my ISP assigns only IPv4, I expected an MTU of 1388 to work, which I<br>
set on the Wireguard interface in OpenWRT.<br>
<br>
However, when set to 1388, almost everything works except any Google<br>
related sites like Maps, Gmail, YT etc.<br>
When set to 1368, everything works and it's the way I have it setup<br>
right now.<br>
<br>
What am I missing here?<br>
Why won't Google sites load via my WG VPN when the MTU is set to 1388?<br>
<br>
If it helps, I host the WG server on Google's cloud platform and was<br>
informed that GCP has an MTU of 1460 bytes.<br>
<br>
Thank you,<br>
S<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><b=
r>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists=
.zx2c4.com/mailman/listinfo/wireguard</a><br>
</div>
</span></font></div>


</div></blockquote><blockquote type=3D"cite"><div dir=3D"ltr"><span>________=
_______________________________________</span><br><span>WireGuard mailing li=
st</span><br><span><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@li=
sts.zx2c4.com</a></span><br><span><a href=3D"https://lists.zx2c4.com/mailman=
/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><=
/span><br></div></blockquote></body></html>=

--Apple-Mail-1367D831-BF9C-4948-8FBC-CFC524077E4B--

--===============1485263400952395073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1485263400952395073==--
