Return-Path: denis@dkisselev.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99015259
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jul 2018 18:43:44 +0000 (UTC)
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-oln040092006011.outbound.protection.outlook.com [40.92.6.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d880fe9a
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jul 2018 18:43:44 +0000 (UTC)
From: Denis Kisselev <denis@dkisselev.net>
To: Stefan Agner <stefan@agner.ch>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: RE: Tether Wireguard VPN over WiFi
Date: Sat, 7 Jul 2018 18:50:42 +0000
Message-ID: <CY4PR14MB1141438D363410AF25B74480A2460@CY4PR14MB1141.namprd14.prod.outlook.com>
References: <193ced725ddd7b812d3351213872c910@agner.ch>
In-Reply-To: <193ced725ddd7b812d3351213872c910@agner.ch>
Content-Type: multipart/alternative;
 boundary="_000_CY4PR14MB1141438D363410AF25B74480A2460CY4PR14MB1141namp_"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY4PR14MB1141438D363410AF25B74480A2460CY4PR14MB1141namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

When I last looked into this, it wasn=92t possible to due to limitations in=
 Android.



Basically, the tethering and VPN systems each assume that they=92re the onl=
y ones that need to manage network routes so they stomp over each other=92s=
 routing tables (VPN breaks routing for tethering, tethering breaks routing=
 for VPN).



Someone on a forum claimed that (if you=92re rooted) you can manually setup=
 the iptables rules to make both work, but that=92s not really a reliable s=
olution.





________________________________
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Stefan Agn=
er <stefan@agner.ch>
Sent: Saturday, July 7, 2018 7:09:23 AM
To: WireGuard mailing list
Subject: Tether Wireguard VPN over WiFi

Hi,

Is tethering the VPN tunnel over WiFi/USB possible?

It seems not to have come up here previously so I thought I bring it up.
When using the Android WiFi Hotspot functionality on a (unrooted) Nexus
6P it seems to only tether 4G... Is there a way to tether the Wireguard
tunnel?

--
Stefan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.z=
x2c4.com%2Fmailman%2Flistinfo%2Fwireguard&data=3D02%7C01%7C%7C17e9001bce084=
e5bd31c08d5e41342bb%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C6366656937=
28883474&sdata=3Dvep3fp3QsvzcVujqq%2BUS%2Fw%2BPUWvqXEqrsEPqr%2B4hbJA%3D&res=
erved=3D0

--_000_CY4PR14MB1141438D363410AF25B74480A2460CY4PR14MB1141namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3Dutf-8">
<meta name=3D"x_Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:x_link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:x_visited, span.x_MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
.x_MsoChpDefault
	{}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">When I last looked into this, it wasn=92t possible=
 to due to limitations in Android.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Basically, the tethering and VPN systems each assu=
me that they=92re the only ones that need to manage network routes so they =
stomp over each other=92s routing tables (VPN breaks routing for tethering,=
 tethering breaks routing for VPN).</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Someone on a forum claimed that (if you=92re roote=
d) you can manually setup the iptables rules to make both work, but that=92=
s not really a reliable solution.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> WireGuard &lt;wireg=
uard-bounces@lists.zx2c4.com&gt; on behalf of Stefan Agner &lt;stefan@agner=
.ch&gt;<br>
<b>Sent:</b> Saturday, July 7, 2018 7:09:23 AM<br>
<b>To:</b> WireGuard mailing list<br>
<b>Subject:</b> Tether Wireguard VPN over WiFi</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hi,<br>
<br>
Is tethering the VPN tunnel over WiFi/USB possible?<br>
<br>
It seems not to have come up here previously so I thought I bring it up.<br=
>
When using the Android WiFi Hotspot functionality on a (unrooted) Nexus<br>
6P it seems to only tether 4G... Is there a way to tether the Wireguard<br>
tunnel?<br>
<br>
--<br>
Stefan<br>
_______________________________________________<br>
WireGuard mailing list<br>
WireGuard@lists.zx2c4.com<br>
<a href=3D"https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwireguard&amp;data=3D02%7C01%7C%=
7C17e9001bce084e5bd31c08d5e41342bb%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7=
C0%7C636665693728883474&amp;sdata=3Dvep3fp3QsvzcVujqq%2BUS%2Fw%2BPUWvqXEqrs=
EPqr%2B4hbJA%3D&amp;reserved=3D0">https://nam03.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwireguard=
&amp;data=3D02%7C01%7C%7C17e9001bce084e5bd31c08d5e41342bb%7C84df9e7fe9f640a=
fb435aaaaaaaaaaaa%7C1%7C0%7C636665693728883474&amp;sdata=3Dvep3fp3QsvzcVujq=
q%2BUS%2Fw%2BPUWvqXEqrsEPqr%2B4hbJA%3D&amp;reserved=3D0</a><br>
</div>
</span></font>
</body>
</html>

--_000_CY4PR14MB1141438D363410AF25B74480A2460CY4PR14MB1141namp_--
