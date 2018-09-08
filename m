Return-Path: steven@honson.id.au
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be92f662
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 10:21:35 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 998afe14
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 10:21:34 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id g23-v6so7650695plq.9
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 03:22:02 -0700 (PDT)
Return-Path: <steven@honson.id.au>
From: Steven Honson <steven@honson.id.au>
Message-Id: <5BAF300B-A97A-4F41-A6FB-282FB4C2BC00@honson.id.au>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F581FCEF-DB9C-4290-B9BB-774BD4CD367F"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Routing only to latest peer in the config list seems to work
Date: Sat, 8 Sep 2018 20:21:55 +1000
In-Reply-To: <018301d4474f$1565ab40$403101c0$@mailbox.org>
To: danny.korpan@mailbox.org
References: <006501d43f6b$eb516e60$c1f44b20$@mailbox.org>
 <CAM3m09TsnpW1VuZxEHDoCc2x-cbrS05unYCyCvNq=bP9LSNv2Q@mail.gmail.com>
 <018301d4474f$1565ab40$403101c0$@mailbox.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_F581FCEF-DB9C-4290-B9BB-774BD4CD367F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Danny,

Have you also changed the mask for each of the peers on your central =
node to /32? If not you=E2=80=99ll need to do this, as leaving them as =
/24 still effectively makes them all the same route. Ie 192.168.50.1/24 =
and 192.168.50.2/24 are both the same still. The =E2=80=9CAllowedIPs" on =
the central node to be 192.168.50.1/32, 192.168.50.2/32 etc in your =
example.

You can leave the =E2=80=9CAddress=E2=80=9D IPs with a /24 mask.

Are you able to share an updated copy of your configs?

Cheers,
Steven

> On 8 Sep 2018, at 6:36 pm, danny.korpan@mailbox.org wrote:
>=20
> Hi,
> =20
> I=E2=80=99ve changed the AllowedIPs so that everyone has it=E2=80=99s =
own dedicated IP. Still the same problem. No routing.
> =20
> Kind Regards,
> Danny
> =20
> Von: Ryan Whelan <rcwhelan@gmail.com>=20
> Gesendet: Donnerstag, 6. September 2018 19:14
> An: danny.korpan@mailbox.org
> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Betreff: Re: Routing only to latest peer in the config list seems to =
work
> =20
> You're using the same AllowedIPs for multiple peers.
> =20
> On Thu, Sep 6, 2018 at 12:15 PM <danny.korpan@mailbox.org =
<mailto:danny.korpan@mailbox.org>> wrote:
> Hi,
>=20
> I have the problem with my wireguard server, that only the latest user
> "peer" from the server config can route/ping to the internal wireguard
> server IP or the clients in the network behind the wireguard server =
upon
> successful connection. All peers can connect to the server, but only =
the
> latest in the list last can ping other servers.
> I can't locate the error in the configs... does anybody have an idea?
>=20
> My wireguard server and client version is using =
0.0.20180809-wg1~xenial with
> Ubuntu 18.04.1
>=20
> wg0.conf
> [Interface]
> Address =3D 192.168.50.1/24 <http://192.168.50.1/24>
> PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
> POSTROUTING -o eth0 -j MASQUERADE
> PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
> POSTROUTING -o eth0 -j MASQUERADE
> ListenPort =3D 51820
> PrivateKey =3D XXX
>=20
> [Peer]
> #User 1
> PublicKey =3D XXX
> PresharedKey =3D XXX
> AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>
>=20
> [Peer]
> #User 2
> PublicKey =3D XXX
> PresharedKey =3D XXX
> #AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>
>=20
> [Peer]
> #User 3
> PublicKey =3D XXX
> PresharedKey =3D XXX
> AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>
>=20
> [Peer]
> #User 4
> PublicKey =3D XXX
> PresharedKey =3D XXX
> AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>
>=20
>=20
>=20
> client.config
> [Interface]
> PrivateKey =3D XXX
> DNS =3D 192.168.178.1
> Address =3D 192.168.50.2/24 <http://192.168.50.2/24>
>=20
> [Peer]
> PublicKey =3D XXX
> PresharedKey =3D XXX
> AllowedIPs =3D 192.168.50.0/24 <http://192.168.50.0/24>, =
190.168.178.0/24 <http://190.168.178.0/24>
> Endpoint =3D my.remote.server:51820
> PersistentKeepalive =3D 25
>=20
> My sysctl.conf includes
> net.ipv4.conf.all.proxy_arp =3D 1
> net.ipv4.ip_forward =3D 1
>=20
> Does anybody have an idea?
>=20
>=20
> Kind Regards,
> Danny
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
> https://lists.zx2c4.com/mailman/listinfo/wireguard =
<https://lists.zx2c4.com/mailman/listinfo/wireguard>______________________=
_________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--Apple-Mail=_F581FCEF-DB9C-4290-B9BB-774BD4CD367F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Danny,<div class=3D""><br class=3D""></div><div class=3D"">Have you also =
changed the mask for each of the peers on your central node to /32? If =
not you=E2=80=99ll need to do this, as leaving them as /24 still =
effectively makes them all the same route. Ie 192.168.50.1/24 and =
192.168.50.2/24 are both the same still. The =E2=80=9CAllowedIPs" on the =
central node to be 192.168.50.1/32, 192.168.50.2/32 etc in your =
example.<br class=3D""><div><br class=3D""></div><div>You can leave the =
=E2=80=9CAddress=E2=80=9D IPs with a /24 mask.</div><div><br =
class=3D""></div><div>Are you able to share an updated copy of your =
configs?</div><div><br =
class=3D""></div><div>Cheers,</div><div>Steven</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 8 Sep =
2018, at 6:36 pm, <a href=3D"mailto:danny.korpan@mailbox.org" =
class=3D"">danny.korpan@mailbox.org</a> wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"WordSection1" style=3D"page: WordSection1; caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 10pt; font-family: Arial, sans-serif;" =
class=3D"">Hi,<o:p class=3D""></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 10pt; font-family: Arial, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 10pt; =
font-family: Arial, sans-serif;" class=3D"">I=E2=80=99ve changed the =
AllowedIPs so that everyone has it=E2=80=99s own dedicated IP. Still the =
same problem. No routing.<o:p class=3D""></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 10pt; =
font-family: Arial, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 10pt; font-family: Arial, =
sans-serif;" class=3D"">Kind Regards,<o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 10pt; font-family: Arial, sans-serif;" =
class=3D"">Danny<o:p class=3D""></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 10pt; font-family: Arial, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"border-style: none none none solid; border-left-width: 1.5pt; =
border-left-color: blue; padding: 0cm 0cm 0cm 4pt;" class=3D""><div =
class=3D""><div style=3D"border-style: solid none none; =
border-top-width: 1pt; border-top-color: rgb(225, 225, 225); padding: =
3pt 0cm 0cm;" class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><b =
class=3D"">Von:</b><span class=3D"Apple-converted-space">&nbsp;</span>Ryan=
 Whelan &lt;<a href=3D"mailto:rcwhelan@gmail.com" =
class=3D"">rcwhelan@gmail.com</a>&gt;<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><b =
class=3D"">Gesendet:</b><span =
class=3D"Apple-converted-space">&nbsp;</span>Donnerstag, 6. September =
2018 19:14<br class=3D""><b class=3D"">An:</b><span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:danny.korpan@mailbox.org" =
class=3D"">danny.korpan@mailbox.org</a><br class=3D""><b =
class=3D"">Cc:</b><span =
class=3D"Apple-converted-space">&nbsp;</span>WireGuard mailing list =
&lt;wireguard@lists.zx2c4.com&gt;<br class=3D""><b =
class=3D"">Betreff:</b><span =
class=3D"Apple-converted-space">&nbsp;</span>Re: Routing only to latest =
peer in the config list seems to work<o:p =
class=3D""></o:p></div></div></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">You're using the same AllowedIPs for =
multiple peers.<o:p class=3D""></o:p></div></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div class=3D""><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">On Thu, Sep 6, 2018 at =
12:15 PM &lt;<a href=3D"mailto:danny.korpan@mailbox.org" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">danny.korpan@mailbox.org</a>&gt; wrote:<o:p =
class=3D""></o:p></div></div><blockquote style=3D"border-style: none =
none none solid; border-left-width: 1pt; border-left-color: rgb(204, =
204, 204); padding: 0cm 0cm 0cm 6pt; margin-left: 4.8pt; margin-right: =
0cm;" class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif;" class=3D"">Hi,<br class=3D""><br =
class=3D"">I have the problem with my wireguard server, that only the =
latest user<br class=3D"">"peer" from the server config can route/ping =
to the internal wireguard<br class=3D"">server IP or the clients in the =
network behind the wireguard server upon<br class=3D"">successful =
connection. All peers can connect to the server, but only the<br =
class=3D"">latest in the list last can ping other servers.<br class=3D"">I=
 can't locate the error in the configs... does anybody have an idea?<br =
class=3D""><br class=3D"">My wireguard server and client version is =
using 0.0.20180809-wg1~xenial with<br class=3D"">Ubuntu 18.04.1<br =
class=3D""><br class=3D"">wg0.conf<br class=3D"">[Interface]<br =
class=3D"">Address =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.1/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.1/24</a><br =
class=3D"">PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t =
nat -A<br class=3D"">POSTROUTING -o eth0 -j MASQUERADE<br =
class=3D"">PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables =
-t nat -D<br class=3D"">POSTROUTING -o eth0 -j MASQUERADE<br =
class=3D"">ListenPort =3D 51820<br class=3D"">PrivateKey =3D XXX<br =
class=3D""><br class=3D"">[Peer]<br class=3D"">#User 1<br =
class=3D"">PublicKey =3D XXX<br class=3D"">PresharedKey =3D XXX<br =
class=3D"">AllowedIPs =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.0/24</a><br =
class=3D""><br class=3D"">[Peer]<br class=3D"">#User 2<br =
class=3D"">PublicKey =3D XXX<br class=3D"">PresharedKey =3D XXX<br =
class=3D"">#AllowedIPs =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.0/24</a><br =
class=3D""><br class=3D"">[Peer]<br class=3D"">#User 3<br =
class=3D"">PublicKey =3D XXX<br class=3D"">PresharedKey =3D XXX<br =
class=3D"">AllowedIPs =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.0/24</a><br =
class=3D""><br class=3D"">[Peer]<br class=3D"">#User 4<br =
class=3D"">PublicKey =3D XXX<br class=3D"">PresharedKey =3D XXX<br =
class=3D"">AllowedIPs =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.0/24</a><br =
class=3D""><br class=3D""><br class=3D""><br class=3D"">client.config<br =
class=3D"">[Interface]<br class=3D"">PrivateKey =3D XXX<br class=3D"">DNS =
=3D 192.168.178.1<br class=3D"">Address =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.2/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.2/24</a><br =
class=3D""><br class=3D"">[Peer]<br class=3D"">PublicKey =3D XXX<br =
class=3D"">PresharedKey =3D XXX<br class=3D"">AllowedIPs =3D<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://192.168.50.0/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">192.168.50.0/24</a>,<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://190.168.178.0/24" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">190.168.178.0/24</a><br =
class=3D"">Endpoint =3D my.remote.server:51820<br =
class=3D"">PersistentKeepalive =3D 25<br class=3D""><br class=3D"">My =
sysctl.conf includes<br class=3D"">net.ipv4.conf.all.proxy_arp =3D 1<br =
class=3D"">net.ipv4.ip_forward =3D 1<br class=3D""><br class=3D"">Does =
anybody have an idea?<br class=3D""><br class=3D""><br class=3D"">Kind =
Regards,<br class=3D"">Danny<br class=3D""><br =
class=3D"">_______________________________________________<br =
class=3D"">WireGuard mailing list<br class=3D""><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" =
style=3D"color: purple; text-decoration: underline;" =
class=3D"">WireGuard@lists.zx2c4.com</a><br class=3D""><a =
href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" =
target=3D"_blank" style=3D"color: purple; text-decoration: underline;" =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><o:p =
class=3D""></o:p></div></blockquote></div></div></div><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">WireGuard mailing list</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D""><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a></span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D""><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></span></=
div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_F581FCEF-DB9C-4290-B9BB-774BD4CD367F--
