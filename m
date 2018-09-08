Return-Path: danny.korpan@mailbox.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ad1de9f
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 17:28:20 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edb3a8b9
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 17:28:20 +0000 (UTC)
From: <danny.korpan@mailbox.org>
To: "'Steven Honson'" <steven@honson.id.au>
References: <006501d43f6b$eb516e60$c1f44b20$@mailbox.org>
 <CAM3m09TsnpW1VuZxEHDoCc2x-cbrS05unYCyCvNq=bP9LSNv2Q@mail.gmail.com>
 <018301d4474f$1565ab40$403101c0$@mailbox.org>
 <5BAF300B-A97A-4F41-A6FB-282FB4C2BC00@honson.id.au>
In-Reply-To: <5BAF300B-A97A-4F41-A6FB-282FB4C2BC00@honson.id.au>
Subject: AW: Routing only to latest peer in the config list seems to work
Date: Sat, 8 Sep 2018 19:28:45 +0200
Message-ID: <003501d44799$66a0f560$33e2e020$@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0036_01D447AA.2A29C560"
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

------=_NextPart_000_0036_01D447AA.2A29C560
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

your solution solved my problem: Chaning subnet to 32 instead of 24.

=20

Thank you and kind regards,

Danny

=20

Von: Steven Honson <steven@honson.id.au>=20
Gesendet: Samstag, 8. September 2018 12:22
An: danny.korpan@mailbox.org
Cc: wireguard@lists.zx2c4.com
Betreff: Re: Routing only to latest peer in the config list seems to =
work

=20

Hi Danny,

=20

Have you also changed the mask for each of the peers on your central =
node to /32? If not you=E2=80=99ll need to do this, as leaving them as =
/24 still effectively makes them all the same route. Ie 192.168.50.1/24 =
and 192.168.50.2/24 are both the same still. The =E2=80=9CAllowedIPs" on =
the central node to be 192.168.50.1/32, 192.168.50.2/32 etc in your =
example.

=20

You can leave the =E2=80=9CAddress=E2=80=9D IPs with a /24 mask.

=20

Are you able to share an updated copy of your configs?

=20

Cheers,

Steven





On 8 Sep 2018, at 6:36 pm, danny.korpan@mailbox.org =
<mailto:danny.korpan@mailbox.org>  wrote:

=20

Hi,

=20

I=E2=80=99ve changed the AllowedIPs so that everyone has it=E2=80=99s =
own dedicated IP. Still the same problem. No routing.

=20

Kind Regards,

Danny

=20

Von: Ryan Whelan <rcwhelan@gmail.com <mailto:rcwhelan@gmail.com> >=20
Gesendet: Donnerstag, 6. September 2018 19:14
An: danny.korpan@mailbox.org <mailto:danny.korpan@mailbox.org>=20
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com =
<mailto:wireguard@lists.zx2c4.com> >
Betreff: Re: Routing only to latest peer in the config list seems to =
work

=20

You're using the same AllowedIPs for multiple peers.

=20

On Thu, Sep 6, 2018 at 12:15 PM < <mailto:danny.korpan@mailbox.org> =
danny.korpan@mailbox.org> wrote:

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
Address =3D  <http://192.168.50.1/24> 192.168.50.1/24
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
AllowedIPs =3D  <http://192.168.50.0/24> 192.168.50.0/24

[Peer]
#User 2
PublicKey =3D XXX
PresharedKey =3D XXX
#AllowedIPs =3D  <http://192.168.50.0/24> 192.168.50.0/24

[Peer]
#User 3
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D  <http://192.168.50.0/24> 192.168.50.0/24

[Peer]
#User 4
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D  <http://192.168.50.0/24> 192.168.50.0/24



client.config
[Interface]
PrivateKey =3D XXX
DNS =3D 192.168.178.1
Address =3D  <http://192.168.50.2/24> 192.168.50.2/24

[Peer]
PublicKey =3D XXX
PresharedKey =3D XXX
AllowedIPs =3D  <http://192.168.50.0/24> 192.168.50.0/24,  =
<http://190.168.178.0/24> 190.168.178.0/24
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
 <mailto:WireGuard@lists.zx2c4.com> WireGuard@lists.zx2c4.com
 <https://lists.zx2c4.com/mailman/listinfo/wireguard> =
https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>=20
https://lists.zx2c4.com/mailman/listinfo/wireguard

=20


------=_NextPart_000_0036_01D447AA.2A29C560
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
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
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
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
span.E-MailFormatvorlage20
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
uage:EN-US'>your solution solved my problem: Chaning subnet to 32 =
instead of 24.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'>Thank you and kind regards,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'>Danny<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;mso-fareast-lang=
uage:EN-US'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b>Von:</b> Steven =
Honson &lt;steven@honson.id.au&gt; <br><b>Gesendet:</b> Samstag, 8. =
September 2018 12:22<br><b>An:</b> =
danny.korpan@mailbox.org<br><b>Cc:</b> =
wireguard@lists.zx2c4.com<br><b>Betreff:</b> Re: Routing only to latest =
peer in the config list seems to work<o:p></o:p></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hi =
Danny,<o:p></o:p></p><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Have you also changed the mask for each of the peers =
on your central node to /32? If not you=E2=80=99ll need to do this, as =
leaving them as /24 still effectively makes them all the same route. Ie =
192.168.50.1/24 and 192.168.50.2/24 are both the same still. The =
=E2=80=9CAllowedIPs&quot; on the central node to be 192.168.50.1/32, =
192.168.50.2/32 etc in your example.<o:p></o:p></p><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>You can leave the =E2=80=9CAddress=E2=80=9D IPs with a =
/24 mask.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Are you able to share an updated copy of your =
configs?<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Cheers,<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Steven<o:p></o:p></p></div><div><p =
class=3DMsoNormal><br><br><o:p></o:p></p><blockquote =
style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><div><p =
class=3DMsoNormal>On 8 Sep 2018, at 6:36 pm, <a =
href=3D"mailto:danny.korpan@mailbox.org">danny.korpan@mailbox.org</a> =
wrote:<o:p></o:p></p></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Hi,</span><o:p>=
</o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;</span><o=
:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>I=E2=80=99ve =
changed the AllowedIPs so that everyone has it=E2=80=99s own dedicated =
IP. Still the same problem. No =
routing.</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;</span><o=
:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Kind =
Regards,</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Danny</span><o:=
p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;</span><o=
:p></o:p></p></div><div style=3D'border:none;border-left:solid blue =
1.5pt;padding:0cm 0cm 0cm 4.0pt'><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm'><div><p class=3DMsoNormal><b>Von:</b><span =
class=3Dapple-converted-space>&nbsp;</span>Ryan Whelan &lt;<a =
href=3D"mailto:rcwhelan@gmail.com">rcwhelan@gmail.com</a>&gt;<span =
class=3Dapple-converted-space>&nbsp;</span><br><b>Gesendet:</b><span =
class=3Dapple-converted-space>&nbsp;</span>Donnerstag, 6. September 2018 =
19:14<br><b>An:</b><span class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"mailto:danny.korpan@mailbox.org">danny.korpan@mailbox.org</a><br>=
<b>Cc:</b><span class=3Dapple-converted-space>&nbsp;</span>WireGuard =
mailing list &lt;<a =
href=3D"mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a>&g=
t;<br><b>Betreff:</b><span =
class=3Dapple-converted-space>&nbsp;</span>Re: Routing only to latest =
peer in the config list seems to =
work<o:p></o:p></p></div></div></div><div><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p></div><div><div><p =
class=3DMsoNormal>You're using the same AllowedIPs for multiple =
peers.<o:p></o:p></p></div></div><div><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p></div><div><div><div><p =
class=3DMsoNormal>On Thu, Sep 6, 2018 at 12:15 PM &lt;<a =
href=3D"mailto:danny.korpan@mailbox.org"><span =
style=3D'color:purple'>danny.korpan@mailbox.org</span></a>&gt; =
wrote:<o:p></o:p></p></div></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5=
.0pt'><div><p class=3DMsoNormal>Hi,<br><br>I have the problem with my =
wireguard server, that only the latest user<br>&quot;peer&quot; from the =
server config can route/ping to the internal wireguard<br>server IP or =
the clients in the network behind the wireguard server =
upon<br>successful connection. All peers can connect to the server, but =
only the<br>latest in the list last can ping other servers.<br>I can't =
locate the error in the configs... does anybody have an idea?<br><br>My =
wireguard server and client version is using 0.0.20180809-wg1~xenial =
with<br>Ubuntu 18.04.1<br><br>wg0.conf<br>[Interface]<br>Address =
=3D<span class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.1/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.1/24</span></a><br>PostUp =3D iptables =
-A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A<br>POSTROUTING -o eth0 =
-j MASQUERADE<br>PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; =
iptables -t nat -D<br>POSTROUTING -o eth0 -j MASQUERADE<br>ListenPort =
=3D 51820<br>PrivateKey =3D XXX<br><br>[Peer]<br>#User 1<br>PublicKey =
=3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.0/24</span></a><br><br>[Peer]<br>#User =
2<br>PublicKey =3D XXX<br>PresharedKey =3D XXX<br>#AllowedIPs =3D<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.0/24</span></a><br><br>[Peer]<br>#User =
3<br>PublicKey =3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.0/24</span></a><br><br>[Peer]<br>#User =
4<br>PublicKey =3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.0/24</span></a><br><br><br><br>client.c=
onfig<br>[Interface]<br>PrivateKey =3D XXX<br>DNS =3D =
192.168.178.1<br>Address =3D<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.2/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.2/24</span></a><br><br>[Peer]<br>Public=
Key =3D XXX<br>PresharedKey =3D XXX<br>AllowedIPs =3D<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank"><span =
style=3D'color:purple'>192.168.50.0/24</span></a>,<span =
class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"http://190.168.178.0/24" target=3D"_blank"><span =
style=3D'color:purple'>190.168.178.0/24</span></a><br>Endpoint =3D =
my.remote.server:51820<br>PersistentKeepalive =3D 25<br><br>My =
sysctl.conf includes<br>net.ipv4.conf.all.proxy_arp =3D =
1<br>net.ipv4.ip_forward =3D 1<br><br>Does anybody have an =
idea?<br><br><br>Kind =
Regards,<br>Danny<br><br>_______________________________________________<=
br>WireGuard mailing list<br><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank"><span =
style=3D'color:purple'>WireGuard@lists.zx2c4.com</span></a><br><a =
href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" =
target=3D"_blank"><span =
style=3D'color:purple'>https://lists.zx2c4.com/mailman/listinfo/wireguard=
</span></a><o:p></o:p></p></div></blockquote></div></div><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:"Helvetica",sans-serif'>____________=
___________________________________<br>WireGuard mailing list<br><a =
href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><b=
r><a =
href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists=
.zx2c4.com/mailman/listinfo/wireguard</a></span><o:p></o:p></p></div></bl=
ockquote></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div></div></body></html>
------=_NextPart_000_0036_01D447AA.2A29C560--
