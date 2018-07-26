Return-Path: denis@dkisselev.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f928f8e8
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:06:08 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-oln040092004091.outbound.protection.outlook.com [40.92.4.91])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 631739b4
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:06:08 +0000 (UTC)
From: Denis Kisselev <denis@dkisselev.net>
To: John Huttley <john@mib-infotech.co.nz>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: Android Update wants Camera Permissions
Date: Thu, 26 Jul 2018 23:15:31 +0000
Message-ID: <CY4PR14MB1141B39996AC40980AB9CC01A22B0@CY4PR14MB1141.namprd14.prod.outlook.com>
References: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
 <CAHmME9r8zh_X5JDSHy+wkAyeX3Kt-FuWzpcxFSgkBdo8o13Rnw@mail.gmail.com>,
 <e4f3f09a-1281-7f79-9d80-a878f0dd8cbe@mib-infotech.co.nz>
In-Reply-To: <e4f3f09a-1281-7f79-9d80-a878f0dd8cbe@mib-infotech.co.nz>
Content-Type: multipart/alternative;
 boundary="_000_CY4PR14MB1141B39996AC40980AB9CC01A22B0CY4PR14MB1141namp_"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY4PR14MB1141B39996AC40980AB9CC01A22B0CY4PR14MB1141namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It looks like they recently added scanning QR codes as a way to import tunn=
el definitions: https://git.zx2c4.com/wireguard-android/commit/?id=3D2087a1=
0f5533e4b61811a3cb4e5019dcf2560d81

That permission should probably only be requested as-needed but I suspect t=
hat wg is targeting an older Android API that doesn't expose that capabilit=
y.


________________________________
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of John Huttl=
ey <john@mib-infotech.co.nz>
Sent: Thursday, July 26, 2018 4:02 PM
To: wireguard@lists.zx2c4.com
Subject: Android Update wants Camera Permissions

I just updated. It wanted Camera Access.

Odd..

--John

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.z=
x2c4.com%2Fmailman%2Flistinfo%2Fwireguard&amp;data=3D02%7C01%7C%7C7d8b0abc0=
6af486ba71508d5f34be34d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C636682=
429617130077&amp;sdata=3DCXPVASw1Rh8R%2BK8W1fkg3Ub6X0Uk0FnColak%2F%2B5eCe4%=
3D&amp;reserved=3D0

--_000_CY4PR14MB1141B39996AC40980AB9CC01A22B0CY4PR14MB1141namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
It looks like they recently added scanning QR codes as a way to import tunn=
el definitions:&nbsp;<a href=3D"https://git.zx2c4.com/wireguard-android/com=
mit/?id=3D2087a10f5533e4b61811a3cb4e5019dcf2560d81" id=3D"LPlnk940125">http=
s://git.zx2c4.com/wireguard-android/commit/?id=3D2087a10f5533e4b61811a3cb4e=
5019dcf2560d81</a></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
That permission should probably only be requested as-needed but I suspect t=
hat wg&nbsp;is targeting an older Android API that doesn't expose that capa=
bility.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> WireGuard &lt;wiregua=
rd-bounces@lists.zx2c4.com&gt; on behalf of John Huttley &lt;john@mib-infot=
ech.co.nz&gt;<br>
<b>Sent:</b> Thursday, July 26, 2018 4:02 PM<br>
<b>To:</b> wireguard@lists.zx2c4.com<br>
<b>Subject:</b> Android Update wants Camera Permissions</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I just updated. It wanted Camera Access.<br>
<br>
Odd..<br>
<br>
--John<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
WireGuard@lists.zx2c4.com<br>
<a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwireguard&amp;amp;data=3D02%7C01=
%7C%7C7d8b0abc06af486ba71508d5f34be34d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7=
C1%7C0%7C636682429617130077&amp;amp;sdata=3DCXPVASw1Rh8R%2BK8W1fkg3Ub6X0Uk0=
FnColak%2F%2B5eCe4%3D&amp;amp;reserved=3D0">https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2=
Fwireguard&amp;amp;data=3D02%7C01%7C%7C7d8b0abc06af486ba71508d5f34be34d%7C8=
4df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C636682429617130077&amp;amp;sdata=
=3DCXPVASw1Rh8R%2BK8W1fkg3Ub6X0Uk0FnColak%2F%2B5eCe4%3D&amp;amp;reserved=3D=
0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_CY4PR14MB1141B39996AC40980AB9CC01A22B0CY4PR14MB1141namp_--
