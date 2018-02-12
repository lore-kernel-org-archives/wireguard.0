Return-Path: henningreich@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d396140
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 09:01:18 +0000 (UTC)
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
 [209.85.223.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aea5a4bd
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 09:01:18 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f89so16509722ioj.4
 for <wireguard@lists.zx2c4.com>; Mon, 12 Feb 2018 01:07:53 -0800 (PST)
MIME-Version: 1.0
Sender: henningreich@gmail.com
In-Reply-To: <1518420236.1268661.1267596392.738A262C@webmail.messagingengine.com>
References: <1518420236.1268661.1267596392.738A262C@webmail.messagingengine.com>
From: Henning Reich <henning.reich@gmail.com>
Date: Mon, 12 Feb 2018 10:07:11 +0100
Message-ID: <CAOAVeL1snF8a3rwjA0eWgL3h6p+qY9dkz+KWhfpSvL0QkmM_7g@mail.gmail.com>
Subject: Re: Starcraft over Wireguard ... :sideeye:
To: Eric Light <eric@ericlight.com>
Content-Type: multipart/alternative; boundary="001a113fe1887bafe705650036c1"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113fe1887bafe705650036c1
Content-Type: text/plain; charset="UTF-8"

Hi,
I don't understand what you really want. You say someting about other
computers. Who are these other people/copmuters and there they are? Inside
your (or your childs) network or unknown public internet users?
Did you try to set up a game through battle.net or a "local" game? In
addition, your configuration looks like you mixed up with your subnets. On
your childs side, you configure your interface as part of an /24 subnet,
but on your side, its just a /32 "range".
It may work anyway, bit I think its still confusing.

So I think, a good start would be to clean up your wg-config. I like to use
a seperate "subnet" for vpn traffic. So there is no ProxyArp needed,
because the VPN-Server works as a Gateway for his own subnet. Disadvantag
is that you can't use (without some more work) broadcast features. Mostly
use for some autodetections and so on.
Maybe this will help a bit.

On his computer:  (LAN IP 192.168.1.x)

[Interface]
PrivateKey = {blah}=
ListenPort = 12457
Address = 192.168.123.3/24 <http://192.168.88.3/24>

[Peer]
PublicKey = {blah2}=
Endpoint = {my home}:12457
AllowedIPs = 192.168.123.0/24 <http://192.168.88.3/24>, 192.168.88.0/24


On my computer:  (LAN IP 192.168.88.x)

[Interface]
PrivateKey = {blah3}=
ListenPort = 12457
Address = 192.168.123.2/ <http://192.168.88.2/32>24

[Peer]
PublicKey = {blah4}=
AllowedIPs = 192.168.123.0/24 <http://192.168.88.3/24>, 192.168.1.0/24

With this configuration, you should create (and play) games using the
dedicated vpn IPs (192.168.123.2 or 3 ) or maybe (not tested) your orignal
local IPs (192.168.88.xxx or 192.168.1.xxx).


An complete other soloution could be using a layer2 vpn. I like
SoftEtherVPN.
You could install it, bind the vpn to a tap-device (within the SoftEther
configuration) and than bind the tap-device (with linux tools like brctl,
systemd-networkd config) to your physical interface.
If anybody connect to this vpn, it's just like an additional wire to your
network. So all works, inlcuding DHCP in the same subnet and so on.
The strange double-bridge is not needed, if your SC-Host and VPN-Host are
NOT the same device. Because if you bridge the VPN directly to the physical
interface (without the help of an additional tap-device) the VPN Client
can't reach the vpn-server itself.

Or maybe without any VPN? Just Portforwarding and a (dynamic) DNS entry?
You could get free ones here: https://freedns.afraid.org/




2018-02-12 8:23 GMT+01:00 Eric Light <eric@ericlight.com>:

> Hi, awesome WG mailinglist!
>
> My 18 year-old has recently moved out of home, and we're starting to yearn
> for one of our traditional Starcraft matches.  I thought I should be able
> to do this easily with Wireguard.
>
> The idea, generally, is that one of us would start up a game, and
> Wireguard - with a side serving of ProxyARP and IP forwarding - would help
> make all the other computers see that game.  (or, at very worst, allow me
> to run a game that could be seen by his computer AND the other computers
> here).
>
> -=-=-=-=-=-=-=-=-=-=-=-=-
>
> On his computer:  (LAN IP 192.168.1.x)
>
> [Interface]
> PrivateKey = {blah}=
> ListenPort = 12457
> Address = 192.168.88.3/24
>
> [Peer]
> PublicKey = {blah2}=
> Endpoint = {my home}:12457
> AllowedIPs = 0.0.0.0/0
>
>
> On my computer:  (LAN IP 192.168.88.x)
>
> [Interface]
> PrivateKey = {blah3}=
> ListenPort = 12457
> Address = 192.168.88.2/32
>
> [Peer]
> PublicKey = {blah4}=
> AllowedIPs = 192.168.88.3/32
>
>
> -=-=-=-=-=-=-=-=-=-=-=-=-
>
> But it turns out not to be so easy.  Starcraft sets up games over UDP 5353
> and UDP 6112, and originally I thought it was a problem with forwarding UDP
> packets.  However, I can see packets coming over the tunnel from his
> computer, but the packets are being forwarded to an address I don't know:
>
> root@me:~# tcpdump -i home port 5353 or port 6112
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on home, link-type RAW (Raw IP), capture size 262144 bytes
> 20:02:35.744726 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP, length 10
> 20:02:35.759142 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP, length 10
> 20:02:35.759157 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP, length 10
> 20:02:36.045323 IP 37.244.23.109.3478 > 192.168.88.3.6112: UDP, length 19
> 20:02:36.099993 IP 37.244.23.109.3478 > 192.168.88.3.6112: UDP, length 19
> 20:02:36.100005 IP 37.244.23.109.3478 > 192.168.88.3.6112: UDP, length 19
> 20:03:05.964077 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP, length 10
> 20:03:05.964118 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP, length 10
> 20:03:05.987761 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP, length 10
>
>
> Any ideas where I can start looking?  I get similar behaviour whether I
> host the game on my computer or on his.
>
> Thanks in advance for any help you guys can offer!
>
> E
>
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--001a113fe1887bafe705650036c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I don&#39;t understand what you really want.=C2=A0=
You say someting about other computers. Who are these other people/copmuter=
s and there they are? Inside your (or your childs) network or unknown publi=
c internet users?</div><div>Did you try to set up a game through <a href=3D=
"http://battle.net">battle.net</a> or a &quot;local&quot; game? In addition=
, your configuration looks like you mixed up with your subnets. On your chi=
lds side, you configure your interface as part of an /24 subnet, but on you=
r side, its just a /32 &quot;range&quot;.=C2=A0</div><div>It may work anywa=
y, bit I think its still confusing.=C2=A0<br></div><div><br></div><div>So I=
 think, a good start would be to clean up your wg-config. I like to use a s=
eperate &quot;subnet&quot; for vpn traffic. So there is no ProxyArp needed,=
 because the VPN-Server works as a Gateway for his own subnet. Disadvantag =
is that you can&#39;t use (without some more work) broadcast features. Most=
ly use for some autodetections and so on.=C2=A0</div><div>Maybe this will h=
elp a bit.</div><div><br></div><div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial">On his computer:=C2=A0 (LAN IP 192.168.=
1.x)</div><blockquote type=3D"cite" style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><div><span class=3D"gmail-m_6646800087308898=
011font" style=3D"font-family:menlo,consolas,monospace,sans-serif">[Interfa=
ce]<br></span></div><div><span class=3D"gmail-m_6646800087308898011font" st=
yle=3D"font-family:menlo,consolas,monospace,sans-serif">PrivateKey =3D {bla=
h}=3D<br></span></div><div><span class=3D"gmail-m_6646800087308898011font" =
style=3D"font-family:menlo,consolas,monospace,sans-serif">ListenPort =3D 12=
457<br></span></div><div><span class=3D"gmail-m_6646800087308898011font" st=
yle=3D"font-family:menlo,consolas,monospace,sans-serif">Address =3D<span>=
=C2=A0</span><a href=3D"http://192.168.88.3/24" target=3D"_blank" style=3D"=
color:rgb(17,85,204)">192.168.123.3/24</a><br></span></div><div><span class=
=3D"gmail-m_6646800087308898011font" style=3D"font-family:menlo,consolas,mo=
nospace,sans-serif"><br></span></div><div><span class=3D"gmail-m_6646800087=
308898011font" style=3D"font-family:menlo,consolas,monospace,sans-serif">[P=
eer]<br></span></div><div><span class=3D"gmail-m_6646800087308898011font" s=
tyle=3D"font-family:menlo,consolas,monospace,sans-serif">PublicKey =3D {bla=
h2}=3D<br></span></div><div><span class=3D"gmail-m_6646800087308898011font"=
 style=3D"font-family:menlo,consolas,monospace,sans-serif">Endpoint =3D {my=
 home}:12457<br></span></div><div><span class=3D"gmail-m_664680008730889801=
1font" style=3D"font-family:menlo,consolas,monospace,sans-serif">AllowedIPs=
 =3D=C2=A0<a href=3D"http://192.168.88.3/24" target=3D"_blank" style=3D"fon=
t-size:small">192.168.123.0/24</a>, <a href=3D"http://192.168.88.0/24">192.=
168.88.0/24</a><span><br></span></span></div></blockquote><div style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><br></div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial">On my c=
omputer:=C2=A0 (LAN IP 192.168.88.x)<br></div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><br></div><blockquote type=3D=
"cite" style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><div><span class=3D"gmail-m_6646800087308898011font" style=3D"font-family=
:menlo,consolas,monospace,sans-serif">[Interface]</span><span class=3D"gmai=
l-m_6646800087308898011font" style=3D"font-family:menlo,consolas,monospace,=
sans-serif"><br></span></div><div><span class=3D"gmail-m_664680008730889801=
1font" style=3D"font-family:menlo,consolas,monospace,sans-serif">PrivateKey=
 =3D {blah3}=3D</span><span class=3D"gmail-m_6646800087308898011font" style=
=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span></div><div>=
<span class=3D"gmail-m_6646800087308898011font" style=3D"font-family:menlo,=
consolas,monospace,sans-serif">ListenPort =3D 12457</span><span class=3D"gm=
ail-m_6646800087308898011font" style=3D"font-family:menlo,consolas,monospac=
e,sans-serif"><br></span></div><div><span class=3D"gmail-m_6646800087308898=
011font" style=3D"font-family:menlo,consolas,monospace,sans-serif">Address =
=3D<span>=C2=A0</span><a href=3D"http://192.168.88.2/32" target=3D"_blank" =
style=3D"color:rgb(17,85,204)">192.168.123.2/</a>24</span><span class=3D"gm=
ail-m_6646800087308898011font" style=3D"font-family:menlo,consolas,monospac=
e,sans-serif"><br></span></div><div><span class=3D"gmail-m_6646800087308898=
011font" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></sp=
an></div><div><span class=3D"gmail-m_6646800087308898011font" style=3D"font=
-family:menlo,consolas,monospace,sans-serif">[Peer]</span><span class=3D"gm=
ail-m_6646800087308898011font" style=3D"font-family:menlo,consolas,monospac=
e,sans-serif"><br></span></div><div><span class=3D"gmail-m_6646800087308898=
011font" style=3D"font-family:menlo,consolas,monospace,sans-serif">PublicKe=
y =3D {blah4}=3D<br></span><span style=3D"font-family:menlo,consolas,monosp=
ace,sans-serif;font-size:small">AllowedIPs =3D=C2=A0</span><a href=3D"http:=
//192.168.88.3/24" target=3D"_blank" style=3D"font-family:menlo,consolas,mo=
nospace,sans-serif;font-size:small">192.168.123.0/24</a>, <a href=3D"http:/=
/192.168.1.0/24">192.168.1.0/24</a></div><div><br></div></blockquote>With t=
his configuration, you should create (and play) games using the dedicated v=
pn IPs (192.168.123.2 or 3 ) or maybe (not tested) your orignal local IPs (=
192.168.88.xxx or 192.168.1.xxx).=C2=A0</div><div><br></div><div><br></div>=
<div>An complete other soloution could be using a layer2 vpn. I like SoftEt=
herVPN.=C2=A0</div><div>You could install it, bind the vpn to a tap-device =
(within the SoftEther configuration) and than bind the tap-device (with lin=
ux tools like brctl, systemd-networkd config) to your physical interface.</=
div><div>If anybody connect to this vpn, it&#39;s just like an additional w=
ire to your network. So all works, inlcuding DHCP in the same subnet and so=
 on.</div><div>The strange double-bridge is not needed, if your SC-Host and=
 VPN-Host are NOT the same device. Because if you bridge the VPN directly t=
o the physical interface (without the help of an additional tap-device) the=
 VPN Client can&#39;t reach the vpn-server itself.</div><div><br></div><div=
>Or maybe without any VPN? Just Portforwarding and a (dynamic) DNS entry? Y=
ou could get free ones here:=C2=A0<a href=3D"https://freedns.afraid.org/">h=
ttps://freedns.afraid.org/</a></div><div><br></div><div><br></div><div><br>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-=
02-12 8:23 GMT+01:00 Eric Light <span dir=3D"ltr">&lt;<a href=3D"mailto:eri=
c@ericlight.com" target=3D"_blank">eric@ericlight.com</a>&gt;</span>:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><u></u>





<div><div>Hi, awesome WG mailinglist!<br></div>
<div><br></div>
<div>My 18 year-old has recently moved out of home, and we&#39;re starting =
to yearn for one of our traditional Starcraft matches.=C2=A0 I thought I sh=
ould be able to do this easily with Wireguard.<br></div>
<div><br></div>
<div><div>The idea, generally, is that one of us would start up a game, and=
 Wireguard - with a side serving of ProxyARP and IP forwarding - would help=
 make all the other computers see that game.=C2=A0 (or, at very worst, allo=
w me to run a game that could be seen by his computer AND the other compute=
rs here).<br></div>
<div><br></div>
</div>
<div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div>
<div><br></div>
<div>On his computer:=C2=A0 (LAN IP 192.168.1.x)<br></div>
<div><br></div>
<blockquote type=3D"cite"><div><span class=3D"m_6646800087308898011font" st=
yle=3D"font-family:menlo,consolas,monospace,sans-serif">[Interface]<br></sp=
an></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">PrivateKey =3D {blah}=3D<br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">ListenPort =3D 12457<br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">Address =3D <a href=3D"http://192.168.88.3/24=
" target=3D"_blank">192.168.88.3/24</a><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">[Peer]<br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">PublicKey =3D {blah2}=3D<br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">Endpoint =3D {my home}:12457<br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">AllowedIPs =3D <a href=3D"http://0.0.0.0/0" t=
arget=3D"_blank">0.0.0.0/0</a><br></span></div>
<div><br></div>
</blockquote><div><br></div>
<div>On my computer:=C2=A0 (LAN IP 192.168.88.x)<br></div>
<div><br></div>
<blockquote type=3D"cite"><div><span class=3D"m_6646800087308898011font" st=
yle=3D"font-family:menlo,consolas,monospace,sans-serif">[Interface]</span><=
span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,consola=
s,monospace,sans-serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">PrivateKey =3D {blah3}=3D</span><span class=
=3D"m_6646800087308898011font" style=3D"font-family:menlo,consolas,monospac=
e,sans-serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">ListenPort =3D 12457</span><span class=3D"m_6=
646800087308898011font" style=3D"font-family:menlo,consolas,monospace,sans-=
serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">Address =3D <a href=3D"http://192.168.88.2/32=
" target=3D"_blank">192.168.88.2/32</a></span><span class=3D"m_664680008730=
8898011font" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br>=
</span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">[Peer]</span><span class=3D"m_664680008730889=
8011font" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></s=
pan></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">PublicKey =3D {blah4}=3D</span><span class=3D=
"m_6646800087308898011font" style=3D"font-family:menlo,consolas,monospace,s=
ans-serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">AllowedIPs =3D <a href=3D"http://192.168.88.3=
/32" target=3D"_blank">192.168.88.3/32</a></span><br></div>
</blockquote><div><br></div>
<div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div>
<div><br></div>
<div>But it turns out not to be so easy.=C2=A0 Starcraft sets up games over=
 UDP 5353 and UDP 6112, and originally I thought it was a problem with forw=
arding UDP packets.=C2=A0 However, I can see packets coming over the tunnel=
 from his computer, but the packets are being forwarded to an address I don=
&#39;t know:</div>
<div><br></div>
<blockquote type=3D"cite"><div><span class=3D"m_6646800087308898011font" st=
yle=3D"font-family:menlo,consolas,monospace,sans-serif">root@me:~# tcpdump =
-i home port 5353 or port 6112</span><span class=3D"m_6646800087308898011fo=
nt" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span></=
div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">tcpdump: verbose output suppressed, use -v or=
 -vv for full protocol decode</span><span class=3D"m_6646800087308898011fon=
t" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span></d=
iv>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">listening on home, link-type RAW (Raw IP), ca=
pture size 262144 bytes</span><span class=3D"m_6646800087308898011font" sty=
le=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span></div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:02:35.744726 IP 192.168.88.3.6112 &gt; 37.=
244.23.109.3478: UDP, length 10</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:02:35.759142 IP 192.168.88.3.6112 &gt; 37.=
244.23.109.3478: UDP, length 10</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:02:35.759157 IP 192.168.88.3.6112 &gt; 37.=
244.23.109.3478: UDP, length 10</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:02:36.045323 IP 37.244.23.109.3478 &gt; 19=
2.168.88.3.6112: UDP, length 19</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:02:36.099993 IP 37.244.23.109.3478 &gt; 19=
2.168.88.3.6112: UDP, length 19</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:02:36.100005 IP 37.244.23.109.3478 &gt; 19=
2.168.88.3.6112: UDP, length 19</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:03:05.964077 IP 192.168.88.3.6112 &gt; 37.=
244.23.109.3478: UDP, length 10</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:03:05.964118 IP 192.168.88.3.6112 &gt; 37.=
244.23.109.3478: UDP, length 10</span><span class=3D"m_6646800087308898011f=
ont" style=3D"font-family:menlo,consolas,monospace,sans-serif"><br></span><=
/div>
<div><span class=3D"m_6646800087308898011font" style=3D"font-family:menlo,c=
onsolas,monospace,sans-serif">20:03:05.987761 IP 192.168.88.3.6112 &gt; 37.=
244.23.109.3478: UDP, length 10</span><br></div>
</blockquote><div><br></div>
<div>Any ideas where I can start looking?=C2=A0 I get similar behaviour whe=
ther I host the game on my computer or on his.<br></div>
<div><br></div>
<div>Thanks in advance for any help you guys can offer!<br></div>
<div><br></div>
<div>E</div>
<div><br></div>
<div id=3D"m_6646800087308898011sig66226376"><div class=3D"m_66468000873088=
98011signature">------------------------------<wbr>--------------<br></div>
<div class=3D"m_6646800087308898011signature">Q: Why is this email five sen=
tences or less?<br></div>
<div class=3D"m_6646800087308898011signature">A: <a href=3D"http://five.sen=
tenc.es" target=3D"_blank">http://five.sentenc.es</a><br></div>
<div class=3D"m_6646800087308898011signature"><br></div>
</div>
<div><br></div>
</div>

<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div>

--001a113fe1887bafe705650036c1--
