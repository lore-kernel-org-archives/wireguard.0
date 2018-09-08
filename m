Return-Path: danny.korpan@mailbox.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44fadfae
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 08:36:24 +0000 (UTC)
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5941225f
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 08:36:23 +0000 (UTC)
From: <danny.korpan@mailbox.org>
To: "'Ryan Whelan'" <rcwhelan@gmail.com>
References: <006501d43f6b$eb516e60$c1f44b20$@mailbox.org>
 <CAM3m09TsnpW1VuZxEHDoCc2x-cbrS05unYCyCvNq=bP9LSNv2Q@mail.gmail.com>
In-Reply-To: <CAM3m09TsnpW1VuZxEHDoCc2x-cbrS05unYCyCvNq=bP9LSNv2Q@mail.gmail.com>
Subject: AW: Routing only to latest peer in the config list seems to work
Date: Sat, 8 Sep 2018 10:36:47 +0200
Message-ID: <018301d4474f$1565ab40$403101c0$@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0184_01D4475F.D8EE7B40"
Cc: wireguard@lists.zx2c4.com
Reply-To: danny.korpan@mailbox.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multipart message in MIME format.

------=_NextPart_000_0184_01D4475F.D8EE7B40
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

I=E2=80=99ve changed the AllowedIPs so that everyone has it=E2=80=99s =
own dedicated IP. Still the same problem. No routing.

=20

Kind Regards,

Danny

=20

Von: Ryan Whelan <rcwhelan@gmail.com>=20
Gesendet: Donnerstag, 6. September 2018 19:14
An: danny.korpan@mailbox.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Betreff: Re: Routing only to latest peer in the config list seems to =
work

=20

You're using the same AllowedIPs for multiple peers.

=20

On Thu, Sep 6, 2018 at 12:15 PM <danny.korpan@mailbox.org =
<mailto:danny.korpan@mailbox.org> > wrote:

Hi,

I have the problem with my wireguard server, that only the latest user
"peer" from the server config can route/ping to the internal wireguard
server IP or the clients in the network behind the wireguard server upon
successful connection. All peers can connect to the server, but only the
latest in the list last can ping other servers.
I can't locate the error in the configs... does anybody have an idea?

My wireguard server and client version is using 0.0.20180809-wg1~xenial =
with
Ubuntu 18.04.1

wg0.conf
[Interface]
Address =3D 192.168.50.1/24 <http://192.168.50.1/24>=20
PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
POSTROUTING -o eth0 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
POSTROUTING -o eth0 -j MASQUERADE
ListenPort =3D 51820
PrivateKey =3D XXX

[Peer]
#User 1
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>=20

[Peer]
#User 2
PublicKey =3D XXX
PresharedKey =3D XXX
#AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>=20

[Peer]
#User 3
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>=20

[Peer]
#User 4
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>=20



client.config
[Interface]
PrivateKey =3D XXX
DNS =3D 192.168.178.1
Address =3D 192.168.50.2/24 <http://192.168.50.2/24>=20

[Peer]
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24> , =
190.168.178.0/24 <http://190.168.178.0/24>=20
Endpoint =3D my.remote.server:51820
PersistentKeepalive =3D 25

My sysctl.conf includes
net.ipv4.conf.all.proxy_arp =3D 1
net.ipv4.ip_forward =3D 1

Does anybody have an idea?


Kind Regards,
Danny

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>=20
https://lists.zx2c4.com/mailman/listinfo/wireguard


------=_NextPart_000_0184_01D4475F.D8EE7B40
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.E-MailFormatvorlage18
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DDE link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'>Hi,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'>I=E2=80=99ve changed the AllowedIPs so that everyone has =
it=E2=80=99s own dedicated IP. Still the same problem. No =
routing.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'>Kind Regards,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'>Danny<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b>Von:</b> Ryan =
Whelan &lt;rcwhelan@gmail.com&gt; <br><b>Gesendet:</b> Donnerstag, 6. =
September 2018 19:14<br><b>An:</b> =
danny.korpan@mailbox.org<br><b>Cc:</b> WireGuard mailing list =
&lt;wireguard@lists.zx2c4.com&gt;<br><b>Betreff:</b> Re: Routing only to =
latest peer in the config list seems to =
work<o:p></o:p></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>You're =
using the same AllowedIPs for multiple peers.<o:p></o:p></p></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal>On =
Thu, Sep 6, 2018 at 12:15 PM &lt;<a =
href=3D"mailto:danny.korpan@mailbox.org">danny.korpan@mailbox.org</a>&gt;=
 wrote:<o:p></o:p></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><p =
class=3DMsoNormal>Hi,<br><br>I have the problem with my wireguard =
server, that only the latest user<br>&quot;peer&quot; from the server =
config can route/ping to the internal wireguard<br>server IP or the =
clients in the network behind the wireguard server upon<br>successful =
connection. All peers can connect to the server, but only the<br>latest =
in the list last can ping other servers.<br>I can't locate the error in =
the configs... does anybody have an idea?<br><br>My wireguard server and =
client version is using 0.0.20180809-wg1~xenial with<br>Ubuntu =
18.04.1<br><br>wg0.conf<br>[Interface]<br>Address =3D <a =
href=3D"http://192.168.50.1/24" =
target=3D"_blank">192.168.50.1/24</a><br>PostUp =3D iptables -A FORWARD =
-i wg0 -j ACCEPT; iptables -t nat -A<br>POSTROUTING -o eth0 -j =
MASQUERADE<br>PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; =
iptables -t nat -D<br>POSTROUTING -o eth0 -j MASQUERADE<br>ListenPort =
=3D 51820<br>PrivateKey =3D XXX<br><br>[Peer]<br>#User 1<br>PublicKey =
=3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D <a =
href=3D"http://192.168.50.0/24" =
target=3D"_blank">192.168.50.0/24</a><br><br>[Peer]<br>#User =
2<br>PublicKey =3D XXX<br>PresharedKey =3D XXX<br>#AllowedIPs =3D <a =
href=3D"http://192.168.50.0/24" =
target=3D"_blank">192.168.50.0/24</a><br><br>[Peer]<br>#User =
3<br>PublicKey =3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D <a =
href=3D"http://192.168.50.0/24" =
target=3D"_blank">192.168.50.0/24</a><br><br>[Peer]<br>#User =
4<br>PublicKey =3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D <a =
href=3D"http://192.168.50.0/24" =
target=3D"_blank">192.168.50.0/24</a><br><br><br><br>client.config<br>[In=
terface]<br>PrivateKey =3D XXX<br>DNS =3D 192.168.178.1<br>Address =3D =
<a href=3D"http://192.168.50.2/24" =
target=3D"_blank">192.168.50.2/24</a><br><br>[Peer]<br>PublicKey =3D =
XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D <a =
href=3D"http://192.168.50.0/24" target=3D"_blank">192.168.50.0/24</a>, =
<a href=3D"http://190.168.178.0/24" =
target=3D"_blank">190.168.178.0/24</a><br>Endpoint =3D =
my.remote.server:51820<br>PersistentKeepalive =3D 25<br><br>My =
sysctl.conf includes<br>net.ipv4.conf.all.proxy_arp =3D =
1<br>net.ipv4.ip_forward =3D 1<br><br>Does anybody have an =
idea?<br><br><br>Kind =
Regards,<br>Danny<br><br>_______________________________________________<=
br>WireGuard mailing list<br><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" =
target=3D"_blank">WireGuard@lists.zx2c4.com</a><br><a =
href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" =
target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><=
o:p></o:p></p></blockquote></div></div></div></body></html>
------=_NextPart_000_0184_01D4475F.D8EE7B40--
