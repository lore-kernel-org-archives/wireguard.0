Return-Path: fmfranzeck@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c3f2406
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Apr 2017 21:39:44 +0000 (UTC)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaf48c02
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Apr 2017 21:39:44 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id m123so30837293wma.0
 for <wireguard@lists.zx2c4.com>; Thu, 27 Apr 2017 14:48:41 -0700 (PDT)
Return-Path: <fmfranzeck@gmail.com>
Received: from ?IPv6:2a02:168:8605:2:4dc7:5a9c:4923:394b?
 ([2a02:168:8605:2:4dc7:5a9c:4923:394b])
 by smtp.gmail.com with ESMTPSA id a56sm2180986edd.48.2017.04.27.14.48.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 27 Apr 2017 14:48:38 -0700 (PDT)
From: "Florian Franzeck" <fmfranzeck@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: System crash consistently after transferring around 280 Mbyte over
 Wireguard
Date: Thu, 27 Apr 2017 21:48:36 +0000
Message-Id: <em2d98f94f-86e9-49a2-88de-5960b0aa5e13@fmf-laptop>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MBF8FFAAAE-205E-4127-A9A6-09AF42AF0F99"
Reply-To: Florian Franzeck <fmfranzeck@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--------=_MBF8FFAAAE-205E-4127-A9A6-09AF42AF0F99
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I compiled version 20170421 for my turris omnia running a modified=20
OpenWRT OS. I was really happy to see, how well wireguard performed=20
between my 2 routers compared to OpenVPN. But i consistently could=20
reproduce a relevant error: after transferring about 280Mbyte over the=20
wireguard VPN over a samba share, both my routers crash and restart. As=20
far as i can tell, there is no memory leak (1 router has 1Gbyte of RAM,=20
the other 2 Gbyte and they don't fill up during the process).  Im not=20
sure what information i could post, as no logs are written or how to=20
debug this, but i'm  more than happy to help out. I opened the=20
respective Ports on the firewall.
Configuration is pretty basic:
Router 1:
Interface]
ListenPort =3D 443
PrivateKey =3D xxx
[Peer]
PublicKey =3D  xxx
Endpoint =3D xxx:443
AllowedIPs =3D 0.0.0.0/0,::/0

Router 2:
[Interface]
ListenPort =3D 443
PrivateKey =3D xx

[Peer]PublicKey =3D  xxx
Endpoint =3D xxx:443
AllowedIPs =3D 0.0.0.0/0,::/0

I start the tunnel by these two scripts:

#!/bin/sh
ip link add dev tun1 type wireguard
ip addr add 10.1.3.1/32 peer 10.2.3.1 dev tun1
wg setconf tun1 /etc/wireguard/staticfmf/conf
ip link set tun1 up
route add -net 10.2.0.0 netmask 255.255.0.0 gw 10.1.3.1


#!/bin/sh
ip link add dev tun0 type wireguard
ip addr add 10.2.3.1/32 peer 10.1.3.1 dev tun0
wg setconf tun0 /etc/wireguard/staticheim/conf
ip link set tun0 up
route add -net 10.0.0.0 netmask 255.240.0.0 gw 10.2.3.1

Anyone able to help?
--------=_MBF8FFAAAE-205E-4127-A9A6-09AF42AF0F99
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<?xml version=3D"1.0" encoding=3D"utf-16"?><html><head>

<style><!--body
{font-family: 'Segoe UI'; font-size: 12pt;}
--></style>
</head>
<body>Hi,<div><br /></div><div>I compiled version 20170421 for my turris=
 omnia running a modified OpenWRT OS. I was really happy to see, how well=
 wireguard performed between my 2 routers compared to OpenVPN. But i consis=
tently could reproduce a relevant error: after transferring about 280Mbyte=
 over the wireguard VPN over a samba share, both my routers crash and resta=
rt. As far as i can tell, there is no memory leak (1 router has 1Gbyte of=
 RAM, the other 2 Gbyte and they don't fill up during the process). =C2=A0=
Im not sure what information i could post, as no logs are written or how=
 to debug this, but i'm =C2=A0more than happy to help out. I opened the =
respective Ports on the firewall.</div><div>Configuration is pretty basic:<=
/div><div>Router 1:</div><div><span style=3D"font-size: 12pt;">Interface]</=
span></div><div>ListenPort =3D 443<br />PrivateKey =3D xxx<br />[Peer]<br=
 />PublicKey =3D =C2=A0xxx<br />Endpoint =3D xxx:443<br />AllowedIPs =3D=
 0.0.0.0/0,::/0</div><div><br /></div><div>Router 2:</div><div>[Interface]<=
br />ListenPort =3D 443<br />PrivateKey =3D xx<br /><br />[Peer]PublicKey=
 =3D =C2=A0xxx<br />Endpoint =3D xxx:443<br />AllowedIPs =3D 0.0.0.0/0,::/0=
</div><div><br /></div><div>I start the tunnel by these two scripts:</div><=
div><br /></div><div>#!/bin/sh<br />ip link add dev tun1 type wireguard<br=
 />ip addr add 10.1.3.1/32 peer 10.2.3.1 dev tun1<br />wg setconf tun1 /etc=
/wireguard/staticfmf/conf<br />ip link set tun1 up<br />route add -net 10.2=
.0.0 netmask 255.255.0.0 gw 10.1.3.1<br /></div><div><br /></div><div><br=
 /></div><div>#!/bin/sh<br />ip link add dev tun0 type wireguard<br />ip=
 addr add 10.2.3.1/32 peer 10.1.3.1 dev tun0<br />wg setconf tun0 /etc/wire=
guard/staticheim/conf<br />ip link set tun0 up<br />route add -net 10.0.0.0=
 netmask 255.240.0.0 gw 10.2.3.1</div><div><br /></div><div>Anyone able =
to help?</div></body></html>
--------=_MBF8FFAAAE-205E-4127-A9A6-09AF42AF0F99--
