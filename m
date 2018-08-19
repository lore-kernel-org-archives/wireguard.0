Return-Path: waishon009@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9030e161
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Aug 2018 17:00:46 +0000 (UTC)
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0729490
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Aug 2018 17:00:46 +0000 (UTC)
Received: by mail-it0-x234.google.com with SMTP id h20-v6so17655475itf.2
 for <wireguard@lists.zx2c4.com>; Sun, 19 Aug 2018 10:13:18 -0700 (PDT)
MIME-Version: 1.0
From: Waishon <waishon009@gmail.com>
Date: Sun, 19 Aug 2018 19:13:05 +0200
Message-ID: <CANO0tfbRYq-N3=+hfr0s6Piz9RZLpfUwRb+6pqDj7GoqVCkFTw@mail.gmail.com>
Subject: wg-quick IPv6 same route on different interfaces
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000a061e60573cce809"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000a061e60573cce809
Content-Type: text/plain; charset="UTF-8"

Hey there,

I'm setting up an WireGuard tunnel between my VPS and my home network. This
tunnel should be IPv6 only.
I assigned the IPv6 subnet fd00:1:a/64 to my home network and my wireguard
client got the static IP fd00:1:a::1.
On the VPS I assigned the IP fd00::1 to the wg0 interface.

Here're the configs:
*Client:*

> [Interface]
> PrivateKey = XXXX
> Address = fd00:1:a::1/64
> [Peer]
> PublicKey = XXXX
> AllowedIPs = fd00:0:0::/64
> EndPoint = vpn.domain.tld:51820
> PersistentKeepalive = 25


Server:

> [Interface]
> PrivateKey = ...
> ListenPort = 51820
> Address = fd00:0:0::1
>
> [Peer]
> PublicKey = XXXX
> AllowedIPs = fd00:1:a::/64


After running "wg-quick up wg0" I'm able to ping the Server and the Server
is able to ping the client.
However I'd like to reach all my clients in my home network. To do this I
added a static route that forwards all traffic addressed to fd00::/64 to my
wireguard client machine (fd00:1:a::1) and enabled IP-Forwarding on the
client. When I now do a ping6 from my VPS to another client in my network I
only get an unreachable error.

Some further debugging shows that wireguard adds another route for my homes
fd00:1:a::/64 network. Without wireguard I only have the "fd00:1:a::/64 dev
wlan0" route.

*IP -6 route show:*
fd00::/64 dev wg0 metric 1024  pref medium
fd00:1:a::/64 dev wlan0 proto kernel metric 256  expires 6993sec pref medium
fd00:1:a::/64 dev wg0 proto kernel metric 256  pref medium

Because it prioritizes the route where the packet comes from the packet is
routed back to WireGuard which obviously don't know what to do with,
because it's not configured as AllowedIPs.

After manually removing the duplicate route entry everything works as
expected and I'm able to ping all my clients in my network from the VPS.

A friend of my has setup WireGuard to use IPv4 only. IP route doesn't show
anly duplicate routes there.

I were able to reproduce this error on two wireguard client machines.

Do I miss something in the configuration or is this a bug?

Kind regards
Soeren

--000000000000a061e60573cce809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey there,<div><br></div><div>I&#39;m setting up an WireGu=
ard tunnel between my VPS and my home network. This tunnel should be IPv6 o=
nly.</div><div>I assigned the IPv6 subnet fd00:1:a/64 to my home network=C2=
=A0and my wireguard client got the static IP fd00:1:a::1.</div><div>On the =
VPS I assigned the IP fd00::1 to the wg0 interface.=C2=A0</div><div><br></d=
iv><div>Here&#39;re the configs:<br><b>Client:</b></div><div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">[Interface]<br>PrivateKey =3D XXXX<br>A=
ddress =3D fd00:1:a::1/64<br>[Peer]<br>PublicKey =3D XXXX<br>AllowedIPs =3D=
 fd00:0:0::/64<br>EndPoint =3D vpn.domain.tld:51820<br>PersistentKeepalive =
=3D 25</blockquote><div style=3D"font-weight:bold"><br></div></div><div sty=
le=3D"font-weight:bold">Server:</div><div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">[Interface]<br>PrivateKey =3D ...<br>ListenPort =3D 51820<=
br>Address =3D fd00:0:0::1<br><br>[Peer]<br>PublicKey =3D XXXX<br>AllowedIP=
s =3D fd00:1:a::/64</blockquote><div><br></div><div>After running &quot;wg-=
quick up wg0&quot; I&#39;m able to ping the Server and the Server is able t=
o ping the client.=C2=A0</div></div><div>However I&#39;d like to reach all =
my clients in my home network. To do this I added a static route that forwa=
rds all traffic addressed to fd00::/64 to my wireguard client machine (fd00=
:1:a::1) and enabled IP-Forwarding on the client. When I now do a ping6 fro=
m my VPS to another client in my network I only get an unreachable error.=
=C2=A0</div><div><br></div><div>Some further debugging shows that wireguard=
 adds another route for my homes fd00:1:a::/64 network. Without wireguard I=
 only have the &quot;fd00:1:a::/64 dev wlan0&quot; route.</div><div><br></d=
iv><div><b>IP -6 route show:</b></div><div><div>fd00::/64 dev wg0 metric 10=
24=C2=A0 pref medium</div><div>fd00:1:a::/64 dev wlan0 proto kernel metric =
256=C2=A0 expires 6993sec pref medium</div><div>fd00:1:a::/64 dev wg0 proto=
 kernel metric 256=C2=A0 pref medium</div><div style=3D"font-weight:bold"><=
br></div></div><div style=3D"">Because it=C2=A0prioritizes=C2=A0the route w=
here the packet comes from the packet is routed back to WireGuard which obv=
iously don&#39;t know what to do with, because it&#39;s not configured as A=
llowedIPs.</div><div style=3D""><br></div><div style=3D"">After manually re=
moving the duplicate route entry everything works as expected and I&#39;m a=
ble to ping all my clients in my network from the VPS.</div><div style=3D""=
><br></div><div style=3D"">A friend of my has setup WireGuard to use IPv4 o=
nly. IP route doesn&#39;t show anly duplicate routes there.<br><br>I were a=
ble to reproduce this error on two wireguard client machines.</div><div sty=
le=3D""><br></div><div style=3D"">Do I miss something in the configuration =
or is this a bug?<br><br>Kind regards</div><div style=3D"">Soeren</div></di=
v>

--000000000000a061e60573cce809--
