Return-Path: cbluth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ae4a2a5
 for <wireguard@lists.zx2c4.com>; Tue, 7 Aug 2018 12:52:11 +0000 (UTC)
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d85611a
 for <wireguard@lists.zx2c4.com>; Tue, 7 Aug 2018 12:52:10 +0000 (UTC)
Received: by mail-ua0-x229.google.com with SMTP id u11-v6so15933119uan.13
 for <wireguard@lists.zx2c4.com>; Tue, 07 Aug 2018 06:03:09 -0700 (PDT)
MIME-Version: 1.0
From: Cobin Bluth <cbluth@gmail.com>
Date: Tue, 7 Aug 2018 15:02:57 +0200
Message-ID: <CAGvEgFF=XqAzNBu5VESeBqzAGe8FyW+Y=Q7=p6Tp7k-=G8DzAQ@mail.gmail.com>
Subject: Accessing Network on each Wireguard Peer
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000fb84a40572d80310"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000fb84a40572d80310
Content-Type: text/plain; charset="UTF-8"

Hi Wireguard Fans,

Here is my wireguard setup, please see the following:
https://gist.github.com/cbluth/d5bd1c5746c976fef73fb5ab4e67b355

I have three physical nodes; Host1, Host2, Host3, all of which have a
public interface.
I would like to protect/encrypt the communications between all the hosts.
I have a working setup of IPSec+vxlan, and I would like to migrate to
wireguard.

Each host runs kvm/libvirtd and hosts a number of virtual machine guests,
each with its own network.
Everything in my wireguard setup seems to be working well, and it seems
quite fast.
With this wireguard configuration, VM guests on Host1, located inside
192.168.1.0/24, can ping guests located on Host2 (192.168.2.0/24) and Host3
(192.168.3.0/24), and vice versa.

The only thing that I cant get to work properly, is that I need to be able
to reach any guest from Host1, because Host1 is my bastion entrypoint into
the network; for example, Host1 itself cannot ping to guests on Host2, but
guests on Host1 *CAN* ping guests on Host2. I can ping any virbr0 interface
from any physical host, but I cannot ping the guests behind each virbr0 in
the libvirt network.

I assume it is an issue with routing, but I am not sure, and I am hoping
that someone can assist me.
But one thing that I have noticed is that the gateway to each peer's guest
network is different between my vxlan configuration and what wireguard
provides.

Here are the working routes when my network is using ipsec+vxlan:

*root@host1 ~ # route -n*
*Kernel IP routing table*
*Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface*
*0.0.0.0         x.x.x.x         0.0.0.0         UG    0      0        0
enp0s31f6*
*x.x.x.x         0.0.0.0         255.255.255.255 UH    0      0        0
enp0s31f6*
*172.16.1.0      0.0.0.0         255.255.255.0   U     0      0        0
vxlan0*
*192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0
virbr0*
*192.168.2.0     172.16.1.2      255.255.255.0   UG    0      0        0
vxlan0*
*192.168.3.0     172.16.1.3      255.255.255.0   UG    0      0        0
vxlan0*
*192.168.4.0     172.16.1.4      255.255.255.0   UG    0      0        0
vxlan0*
*192.168.5.0     172.16.1.5      255.255.255.0   UG    0      0        0
vxlan0*
*192.168.6.0     172.16.0.6      255.255.255.0   UG    0      0        0
vxlan0*
*root@host1 ~ # *


Here are the routes after bringing up wireguard:

*root@host1 ~ # route -n*
*Kernel IP routing table*
*Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface*
*0.0.0.0         x.x.x.x         0.0.0.0         UG    0      0        0
enp0s31f6*
*x.x.x.x         0.0.0.0         255.255.255.255 UH    0      0        0
enp0s31f6*
*172.16.1.0      0.0.0.0         255.255.255.0   U     0      0        0
wg0*
*192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0
virbr0*
*192.168.2.0     0.0.0.0         255.255.255.0   U     0      0        0
wg0*
*192.168.3.0     0.0.0.0         255.255.255.0   U     0      0        0
wg0*
*192.168.4.0     0.0.0.0         255.255.255.0   U     0      0        0
wg0*
*192.168.5.0     0.0.0.0         255.255.255.0   U     0      0        0
wg0*
*192.168.6.0     0.0.0.0         255.255.255.0   U     0      0        0
wg0*
*root@host1 ~ #*


Here is a tracepath with wireguard installed/running.

*root@host1 ~ # tracepath 192.168.2.1*
* 1?: [LOCALHOST]                      pmtu 1420*
* 1:  192.168.2.1                                           1.282ms reached*
* 1:  192.168.2.1                                           1.069ms reached*
*     Resume: pmtu 1420 hops 1 back 1 *
*root@host1 ~ # tracepath 192.168.2.143*
* 1?: [LOCALHOST]                      pmtu 1420*
* 1:  172.16.1.2                                            0.754ms *
* 1:  172.16.1.2                                            0.679ms *
* 2:  no reply*
* 3:  no reply*
*^C*
*root@host1 ~ #*

To reiterate, the wireguard setup is working well, except pinging remote
guests located on each peer.
Is there something I am doing wrong? Is wireguard a good solution to my
network scenario?

Thanks,

-Cobin

--000000000000fb84a40572d80310
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"color:rgb(33,33,33);font-size:13px">Hi Wireg=
uard Fans,</div><div style=3D"color:rgb(33,33,33);font-size:13px"><br></div=
><span style=3D"color:rgb(33,33,33);font-size:13px">Here is my wireguard se=
tup, please see the following:</span><br style=3D"color:rgb(33,33,33);font-=
size:13px"><a href=3D"https://gist.github.com/cbluth/d5bd1c5746c976fef73fb5=
ab4e67b355" target=3D"_blank" style=3D"font-size:13px">https://gist.github.=
com/cbluth/d5bd1c5746c976fef73fb5ab4e67b355</a><br style=3D"color:rgb(33,33=
,33);font-size:13px"><br style=3D"color:rgb(33,33,33);font-size:13px"><span=
 style=3D"color:rgb(33,33,33);font-size:13px">I have three physical nodes; =
Host1, Host2, Host3, all of which have a public interface.</span><br style=
=3D"color:rgb(33,33,33);font-size:13px"><span style=3D"color:rgb(33,33,33);=
font-size:13px">I would like to protect/encrypt the communications between =
all the hosts.</span><br style=3D"color:rgb(33,33,33);font-size:13px"><span=
 style=3D"color:rgb(33,33,33);font-size:13px">I have a working setup of IPS=
ec+vxlan, and I would like to migrate to wireguard.</span><div style=3D"col=
or:rgb(33,33,33)"><br>Each host runs kvm/libvirtd and hosts a number of vir=
tual machine guests, each with its own network.<br>Everything in my wiregua=
rd setup seems to be working well, and it seems quite fast.<br>With this wi=
reguard configuration, VM guests on Host1, located inside=C2=A0<a href=3D"h=
ttp://192.168.1.0/24" target=3D"_blank" style=3D"font-size:13px">192.168.1.=
0/24</a>, can ping guests located on Host2 (<a href=3D"http://192.168.2.0/2=
4" target=3D"_blank" style=3D"font-size:13px">192.168.2.0/24</a>)=C2=A0and =
Host3 (<a href=3D"http://192.168.3.0/24" target=3D"_blank" style=3D"font-si=
ze:13px">192.168.3.0/24</a>), and vice versa.<br><br><div style=3D"font-siz=
e:13px">The only thing that I cant get to work properly, is that I need to =
be able to reach any guest from Host1, because Host1 is my bastion entrypoi=
nt into the network; for example, Host1 itself cannot ping to guests on Hos=
t2, but guests on Host1 *CAN* ping guests on Host2. I can ping any virbr0 i=
nterface from any physical host, but I cannot ping the guests behind each v=
irbr0 in the libvirt network.</div><div style=3D"font-size:13px"><br></div>=
<div style=3D"font-size:13px">I assume it is an issue with routing, but I a=
m not sure, and I am hoping that someone can assist me.<br>But one thing th=
at I have noticed is that the gateway to each peer&#39;s guest network is d=
ifferent between my vxlan configuration and what wireguard provides.<br><br=
>Here are the working routes when my network is using ipsec+vxlan:<br><br><=
div><font face=3D"monospace"><b>root@host1 ~ # route -n</b></font></div><di=
v><font face=3D"monospace"><b>Kernel IP routing table</b></font></div><div>=
<font face=3D"monospace"><b>Destination=C2=A0 =C2=A0 =C2=A0Gateway=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Genmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flags M=
etric Ref=C2=A0 =C2=A0 Use Iface</b></font></div><div><font face=3D"monospa=
ce"><b>0.0.0.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x.x.x.x=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 enp0s31f6</b></font></div>=
<div><font face=3D"monospace"><b>x.x.x.x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
.0.0.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0255.255.255.255 UH=C2=A0 =C2=A0 0=
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 enp0s31f6</b></font></d=
iv><div><font face=3D"monospace"><b>172.16.1.0=C2=A0 =C2=A0 =C2=A0 0.0.0.0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =
=C2=A00=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 vxlan0</b></font=
></div><div><font face=3D"monospace"><b>192.168.1.0=C2=A0 =C2=A0 =C2=A00.0.=
0.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=
=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 virbr0</b></=
font></div><div><font face=3D"monospace"><b>192.168.2.0=C2=A0 =C2=A0 =C2=A0=
172.16.1.2=C2=A0 =C2=A0 =C2=A0 255.255.255.0=C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 vxlan0</b></font></div>=
<div><font face=3D"monospace"><b>192.168.3.0=C2=A0 =C2=A0 =C2=A0172.16.1.3=
=C2=A0 =C2=A0 =C2=A0 255.255.255.0=C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 vxlan0</b></font></div><div><font=
 face=3D"monospace"><b>192.168.4.0=C2=A0 =C2=A0 =C2=A0172.16.1.4=C2=A0 =C2=
=A0 =C2=A0 255.255.255.0=C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 vxlan0</b></font></div><div><font face=3D"mo=
nospace"><b>192.168.5.0=C2=A0 =C2=A0 =C2=A0172.16.1.5=C2=A0 =C2=A0 =C2=A0 2=
55.255.255.0=C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0 vxlan0</b></font></div><div><font face=3D"monospace"><b=
>192.168.6.0=C2=A0 =C2=A0 =C2=A0172.16.0.6=C2=A0 =C2=A0 =C2=A0 255.255.255.=
0=C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0 vxlan0</b></font></div><div><font face=3D"monospace"><b>root@host1=
 ~ #=C2=A0</b></font></div></div><div style=3D"font-size:13px"><br><br>Here=
 are the routes after bringing up wireguard:<br><br><div><b><font face=3D"m=
onospace">root@host1 ~ # route -n</font></b></div><div><b><font face=3D"mon=
ospace">Kernel IP routing table</font></b></div><div><b><font face=3D"monos=
pace">Destination=C2=A0 =C2=A0 =C2=A0Gateway=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Genmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flags Metric Ref=C2=A0 =C2=A0 U=
se Iface</font></b></div><div><b><font face=3D"monospace">0.0.0.0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0x.x.x.x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.0.0.0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UG=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0 enp0s31f6</font></b></div><div><b><font face=3D"=
monospace">x.x.x.x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0255.255.255.255 UH=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 enp0s31f6</font></b></div><div><b><font face=
=3D"monospace">172.16.1.0=C2=A0 =C2=A0 =C2=A0 0.0.0.0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 wg0</font></b></div><div><b><font fac=
e=3D"monospace">192.168.1.0=C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 virbr0</font></b></div><div><b><font =
face=3D"monospace">192.168.2.0=C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 wg0</font></b></div><div><b><font=
 face=3D"monospace">192.168.3.0=C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 wg0</font></b></div><div><b><font=
 face=3D"monospace">192.168.4.0=C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 wg0</font></b></div><div><b><font=
 face=3D"monospace">192.168.5.0=C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 wg0</font></b></div><div><b><font=
 face=3D"monospace">192.168.6.0=C2=A0 =C2=A0 =C2=A00.0.0.0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0255.255.255.0=C2=A0 =C2=A0U=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 wg0</font></b></div><div><b><font=
 face=3D"monospace">root@host1 ~ #</font></b></div></div><div style=3D"font=
-size:13px"><br><br>Here is a tracepath with wireguard installed/running.<b=
r><br><div><b><font face=3D"monospace">root@host1 ~ # tracepath 192.168.2.1=
</font></b></div><div><b><font face=3D"monospace">=C2=A01?: [LOCALHOST]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
mtu 1420</font></b></div><div><b><font face=3D"monospace">=C2=A01:=C2=A0 19=
2.168.2.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01.282ms reached</font></b></div><div><b><font face=3D"monospac=
e">=C2=A01:=C2=A0 192.168.2.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.069ms reached</font></b></div><div><b><=
font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0Resume: pmtu 1420 hops 1 back 1=
=C2=A0</font></b></div><div><b><font face=3D"monospace">root@host1 ~ # trac=
epath 192.168.2.143</font></b></div><div><b><font face=3D"monospace">=C2=A0=
1?: [LOCALHOST]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pmtu 1420</font></b></div><div><b><font face=3D"monospace=
">=C2=A01:=C2=A0 172.16.1.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.754ms=C2=A0</font></b></div><div><b><font=
 face=3D"monospace">=C2=A01:=C2=A0 172.16.1.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.679ms=C2=A0</font></=
b></div><div><b><font face=3D"monospace">=C2=A02:=C2=A0 no reply</font></b>=
</div><div><b><font face=3D"monospace">=C2=A03:=C2=A0 no reply</font></b></=
div><div><b><font face=3D"monospace">^C</font></b></div><div><b><font face=
=3D"monospace">root@host1 ~ #</font></b></div><br>To reiterate, the wiregua=
rd setup is working well, except pinging remote guests located on each peer=
.<br>Is there something I am doing wrong? Is wireguard a good solution to m=
y network scenario?</div><div style=3D"font-size:13px"><br></div><div style=
=3D"font-size:13px">Thanks,</div><div style=3D"font-size:13px"><br></div><d=
iv style=3D"">-Cobin</div><div style=3D""><br></div><div style=3D""><br></d=
iv></div></div>

--000000000000fb84a40572d80310--
