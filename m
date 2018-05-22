Return-Path: denis@dkisselev.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3166c035
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 21:22:31 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010089.outbound.protection.outlook.com [40.92.10.89])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e9064bf
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 21:22:30 +0000 (UTC)
From: Denis Kisselev <denis@dkisselev.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: "The OpenWRT Commit" (native chacha20 mips32 support)
Date: Tue, 22 May 2018 21:23:30 +0000
Message-ID: <CY4PR14MB11417381F5FD378FE994F0A1A2940@CY4PR14MB1141.namprd14.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="_000_CY4PR14MB11417381F5FD378FE994F0A1A2940CY4PR14MB1141namp_"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY4PR14MB11417381F5FD378FE994F0A1A2940CY4PR14MB1141namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Has anyone had a chance to play around with the new snapshot (<https://git.=
zx2c4.com/WireGuard/commit/?id=3Dd67d89c7f9d83d22d750452236b0e16510ab1368>0=
.0.20180519<https://git.zx2c4.com/WireGuard/tag/?h=3D0.0.20180519>) on a mi=
ps device?


It looks like ChaCha20 is now natively supported but I'm curious about what=
 kind of performance people are now seeing on devices.


Anecdotally, it looks like people were getting 50-60mbps on ~650mhz devices=
 like the AR-300M when wireguard made its first splash about a year ago.

--_000_CY4PR14MB11417381F5FD378FE994F0A1A2940CY4PR14MB1141namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"color:rgb(0,0,0); fon=
t-family:Calibri,Helvetica,sans-serif,&quot;EmojiFont&quot;,&quot;Apple Col=
or Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Sym=
bol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:12pt">
<p style=3D"margin-top:0; margin-bottom:0">Has anyone had a chance to play =
around with the new snapshot (<a href=3D"https://git.zx2c4.com/WireGuard/co=
mmit/?id=3Dd67d89c7f9d83d22d750452236b0e16510ab1368" id=3D"LPlnk653764" cla=
ss=3D"OWAAutoLink" style=3D"background-color:transparent; color:rgb(0,0,0);=
 font-family:sans-serif; font-size:13.33px; font-style:normal; font-variant=
:normal; font-weight:400; letter-spacing:normal; orphans:2; text-align:left=
; text-decoration:none; text-indent:0px; text-transform:none; white-space:n=
owrap; word-spacing:0px" previewremoved=3D"true"></a><span class=3D"decorat=
ion" style=3D"background-color:transparent; border-bottom-color:rgb(51,51,5=
1); border-bottom-style:none; border-bottom-width:0px; border-left-color:rg=
b(51,51,51); border-left-style:none; border-left-width:0px; border-right-co=
lor:rgb(51,51,51); border-right-style:none; border-right-width:0px; border-=
top-color:rgb(51,51,51); border-top-style:none; border-top-width:0px; color=
:rgb(51,51,51); font-family:sans-serif; font-size:13.33px; font-style:norma=
l; font-variant:normal; font-weight:400; letter-spacing:normal; orphans:2; =
padding-bottom:0px; padding-left:0px; padding-right:0px; padding-top:0px; t=
ext-align:left; text-decoration:none; text-indent:0px; text-transform:none;=
 white-space:nowrap; word-spacing:0px"><a class=3D"tag-deco OWAAutoLink" hr=
ef=3D"https://git.zx2c4.com/WireGuard/tag/?h=3D0.0.20180519" id=3D"LPlnk189=
470" style=3D"background-color:rgb(255,255,136); border-bottom-color:rgb(11=
9,119,0); border-bottom-style:solid; border-bottom-width:1px; border-left-c=
olor:rgb(119,119,0); border-left-style:solid; border-left-width:1px; border=
-right-color:rgb(119,119,0); border-right-style:solid; border-right-width:1=
px; border-top-color:rgb(119,119,0); border-top-style:solid; border-top-wid=
th:1px; color:rgb(0,0,0); margin-bottom:0px; margin-left:6.66px; margin-rig=
ht:6.66px; margin-top:0px; padding-bottom:0px; padding-left:3.33px; padding=
-right:3.33px; padding-top:0px; text-decoration:none" previewremoved=3D"tru=
e">0.0.20180519</a></span>)
 on a mips device?</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<p style=3D"margin-top:0; margin-bottom:0">It looks like ChaCha20 is now na=
tively supported but I'm curious about what kind of performance people are =
now seeing on devices.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Anecdotally, it looks like peopl=
e were getting 50-60mbps on ~650mhz devices like the AR-300M when wireguard=
 made its first splash about a year ago.</p>
</div>
</body>
</html>

--_000_CY4PR14MB11417381F5FD378FE994F0A1A2940CY4PR14MB1141namp_--
