Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aec40f35
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 17:13:32 +0000 (UTC)
Received: from mail-qt0-x22e.google.com (mail-qt0-x22e.google.com
 [IPv6:2607:f8b0:400d:c0d::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 967c6ae5
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 17:13:32 +0000 (UTC)
Received: by mail-qt0-x22e.google.com with SMTP id j7-v6so13167420qtp.2
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 10:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <006501d43f6b$eb516e60$c1f44b20$@mailbox.org>
In-Reply-To: <006501d43f6b$eb516e60$c1f44b20$@mailbox.org>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Thu, 6 Sep 2018 13:13:35 -0400
Message-ID: <CAM3m09TsnpW1VuZxEHDoCc2x-cbrS05unYCyCvNq=bP9LSNv2Q@mail.gmail.com>
Subject: Re: Routing only to latest peer in the config list seems to work
To: danny.korpan@mailbox.org
Content-Type: multipart/alternative; boundary="0000000000008b946605753703af"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000008b946605753703af
Content-Type: text/plain; charset="UTF-8"

You're using the same AllowedIPs for multiple peers.

On Thu, Sep 6, 2018 at 12:15 PM <danny.korpan@mailbox.org> wrote:

> Hi,
>
> I have the problem with my wireguard server, that only the latest user
> "peer" from the server config can route/ping to the internal wireguard
> server IP or the clients in the network behind the wireguard server upon
> successful connection. All peers can connect to the server, but only the
> latest in the list last can ping other servers.
> I can't locate the error in the configs... does anybody have an idea?
>
> My wireguard server and client version is using 0.0.20180809-wg1~xenial
> with
> Ubuntu 18.04.1
>
> wg0.conf
> [Interface]
> Address = 192.168.50.1/24
> PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
> POSTROUTING -o eth0 -j MASQUERADE
> PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
> POSTROUTING -o eth0 -j MASQUERADE
> ListenPort = 51820
> PrivateKey = XXX
>
> [Peer]
> #User 1
> PublicKey = XXX
> PresharedKey = XXX
> AllowedIPs = 192.168.50.0/24
>
> [Peer]
> #User 2
> PublicKey = XXX
> PresharedKey = XXX
> #AllowedIPs = 192.168.50.0/24
>
> [Peer]
> #User 3
> PublicKey = XXX
> PresharedKey = XXX
> AllowedIPs = 192.168.50.0/24
>
> [Peer]
> #User 4
> PublicKey = XXX
> PresharedKey = XXX
> AllowedIPs = 192.168.50.0/24
>
>
>
> client.config
> [Interface]
> PrivateKey = XXX
> DNS = 192.168.178.1
> Address = 192.168.50.2/24
>
> [Peer]
> PublicKey = XXX
> PresharedKey = XXX
> AllowedIPs = 192.168.50.0/24, 190.168.178.0/24
> Endpoint = my.remote.server:51820
> PersistentKeepalive = 25
>
> My sysctl.conf includes
> net.ipv4.conf.all.proxy_arp = 1
> net.ipv4.ip_forward = 1
>
> Does anybody have an idea?
>
>
> Kind Regards,
> Danny
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000008b946605753703af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;re using the same AllowedIPs for multiple peers.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Sep 6, 2018 at =
12:15 PM &lt;<a href=3D"mailto:danny.korpan@mailbox.org">danny.korpan@mailb=
ox.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I have the problem with my wireguard server, that only the latest user<br>
&quot;peer&quot; from the server config can route/ping to the internal wire=
guard<br>
server IP or the clients in the network behind the wireguard server upon<br=
>
successful connection. All peers can connect to the server, but only the<br=
>
latest in the list last can ping other servers.<br>
I can&#39;t locate the error in the configs... does anybody have an idea?<b=
r>
<br>
My wireguard server and client version is using 0.0.20180809-wg1~xenial wit=
h<br>
Ubuntu 18.04.1<br>
<br>
wg0.conf<br>
[Interface]<br>
Address =3D <a href=3D"http://192.168.50.1/24" rel=3D"noreferrer" target=3D=
"_blank">192.168.50.1/24</a><br>
PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A<br>
POSTROUTING -o eth0 -j MASQUERADE<br>
PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D<br>
POSTROUTING -o eth0 -j MASQUERADE<br>
ListenPort =3D 51820<br>
PrivateKey =3D XXX<br>
<br>
[Peer]<br>
#User 1<br>
PublicKey =3D XXX<br>
PresharedKey =3D XXX<br>
AllowedIPs =3D <a href=3D"http://192.168.50.0/24" rel=3D"noreferrer" target=
=3D"_blank">192.168.50.0/24</a><br>
<br>
[Peer]<br>
#User 2<br>
PublicKey =3D XXX<br>
PresharedKey =3D XXX<br>
#AllowedIPs =3D <a href=3D"http://192.168.50.0/24" rel=3D"noreferrer" targe=
t=3D"_blank">192.168.50.0/24</a><br>
<br>
[Peer]<br>
#User 3<br>
PublicKey =3D XXX<br>
PresharedKey =3D XXX<br>
AllowedIPs =3D <a href=3D"http://192.168.50.0/24" rel=3D"noreferrer" target=
=3D"_blank">192.168.50.0/24</a><br>
<br>
[Peer]<br>
#User 4<br>
PublicKey =3D XXX<br>
PresharedKey =3D XXX<br>
AllowedIPs =3D <a href=3D"http://192.168.50.0/24" rel=3D"noreferrer" target=
=3D"_blank">192.168.50.0/24</a><br>
<br>
<br>
<br>
client.config<br>
[Interface]<br>
PrivateKey =3D XXX<br>
DNS =3D 192.168.178.1<br>
Address =3D <a href=3D"http://192.168.50.2/24" rel=3D"noreferrer" target=3D=
"_blank">192.168.50.2/24</a><br>
<br>
[Peer]<br>
PublicKey =3D XXX<br>
PresharedKey =3D XXX<br>
AllowedIPs =3D <a href=3D"http://192.168.50.0/24" rel=3D"noreferrer" target=
=3D"_blank">192.168.50.0/24</a>, <a href=3D"http://190.168.178.0/24" rel=3D=
"noreferrer" target=3D"_blank">190.168.178.0/24</a><br>
Endpoint =3D my.remote.server:51820<br>
PersistentKeepalive =3D 25<br>
<br>
My sysctl.conf includes<br>
net.ipv4.conf.all.proxy_arp =3D 1<br>
net.ipv4.ip_forward =3D 1<br>
<br>
Does anybody have an idea?<br>
<br>
<br>
Kind Regards,<br>
Danny<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000008b946605753703af--
