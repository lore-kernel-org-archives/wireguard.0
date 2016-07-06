Return-Path: frederic.gloannec@thegreenbow.com
Received: from key.keymeetingpoint.net (key.keymeetingpoint.net
 [198.57.135.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f907ee0
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 12:51:23 +0000 (UTC)
Received: from lfbn-1-366-221.w86-242.abo.wanadoo.fr ([86.242.60.221]:49012
 helo=FG) by key.keymeetingpoint.net with esmtp (Exim 4.87)
 (envelope-from <frederic.gloannec@thegreenbow.com>)
 id 1bKmIZ-0001Rm-JF
 for wireguard@lists.zx2c4.com; Wed, 06 Jul 2016 14:51:27 +0200
From: =?iso-8859-1?Q?Fr=E9d=E9ric_Gloannec?=
 <frederic.gloannec@thegreenbow.com>
To: <wireguard@lists.zx2c4.com>
Date: Wed, 6 Jul 2016 14:51:28 +0200
Message-ID: <005d01d1d785$1d6733e0$58359ba0$@gloannec@thegreenbow.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_005E_01D1D795.E0F003E0"
Subject: [WireGuard] Which protocol to get network configuration from
	gateway to clients.
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_005E_01D1D795.E0F003E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Jason,

 

I understand that Wireguard protocol is similar to what Phase 2 in IkeV1 or
Child SA in IkeV2 provide.

 

What would be the protocol we could use prior to create the WireGuard tunnel
in order to get Virtual IP address, Remote Network Address, DNS, DNS
Suffix... from the Gateway ?

This would be similar to what we get with ModeConfig in IkeV1 and
Configuration Payload in IkeV2. Also OpenVPN protocol contains this facility
through the PUSH_REPLY message.

 

Thanks,

 

F.Gloannec.


------=_NextPart_000_005E_01D1D795.E0F003E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1"><meta name=3DGenerator content=3D"Microsoft Word =
12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFR link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US>Hi Jason,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I understand that Wireguard protocol is similar to what =
Phase 2 in IkeV1 or Child SA in IkeV2 provide.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>What would be the protocol we could =
use prior to create the WireGuard tunnel in order to get Virtual IP =
address, Remote Network Address, DNS, DNS Suffix... from the Gateway =
?<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>This =
would be similar to what we get with ModeConfig in IkeV1 and =
Configuration Payload in IkeV2. Also OpenVPN protocol contains this =
facility through the PUSH_REPLY message.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>F.Gloannec.<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_005E_01D1D795.E0F003E0--
