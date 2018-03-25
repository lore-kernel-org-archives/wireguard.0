Return-Path: adriankoooo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 336ab93b
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 09:08:21 +0000 (UTC)
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
 [209.85.214.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 887cdb5a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 09:08:21 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id m134-v6so2556482itb.3
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 02:20:06 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Sun, 25 Mar 2018 11:19:44 +0200
Message-ID: <CA+Hw3eZtBT6mrALQBLznKxQ8bEnB2YTKr7UjJ=Q+G=iAV9Z+HQ@mail.gmail.com>
Subject: can't ping remote side IP range from WG instance
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000ab7922056839291c"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000ab7922056839291c
Content-Type: text/plain; charset="UTF-8"

A side (192.168.2.0/24):

LEDE router 192.168.2.1 (static route to access remote side 192.168.1.0/24
pointing to 192.168.2.100)

Pi Zero with Wireguard (192.168.2.100, WG: 192.168.5.2)

Config:

auto wg0
iface wg0 inet static
  pre-up ip link add dev wg0 type wireguard
  post-up wg setconf wg0 /etc/wireguard/wireguard.conf
  post-up ip link set dev wg0 up
  post-up ip route add 192.168.1.0/24 via 192.168.5.1 dev wg0
  post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  address 192.168.5.2
  netmask 255.255.255.0


B side (192.168.1.0/24):

Unifi router 192.168.1.1 (static route to access remote side 192.168.2.0/24
pointing to 192.168.1.54)

Ubuntu server with Wireguard (192.168.1.54, WG: 192.168.5.1)

Config:

iface wg0 inet static
  pre-up /sbin/ip link add dev wg0 type wireguard
  post-up /usr/bin/wg setconf wg0 /etc/wireguard/wg0.conf
  post-up /sbin/ip route add 192.168.2.0/24 via 192.168.5.2 dev wg0
  post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  post-down /sbin/ip link del wg0
  address 192.168.5.1
  netmask 255.255.255.0

---

Everything is working great, except that on the "Pi Zero with Wireguard" I
can't access/ping remote devices in the 192.168.1.0/24 range, only the
remote server 192.168.1.54. From any other machine in the same "A side" I
am able to access devices in the 192.168.1.0/24 range, just from the Pi
Zero itself not.

What I am missing here?


pi@raspberrypizero:~ $ ping 192.168.1.54
PING 192.168.1.54 (192.168.1.54) 56(84) bytes of data.
64 bytes from 192.168.1.54: icmp_seq=1 ttl=64 time=48.6 ms
64 bytes from 192.168.1.54: icmp_seq=2 ttl=64 time=134 ms^C
--- 192.168.1.54 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 48.671/91.554/134.437/42.883 ms
pi@raspberrypizero:~ $ ping 192.168.1.100
PING 192.168.1.100 (192.168.1.100) 56(84) bytes of data.
^C
--- 192.168.1.100 ping statistics ---
6 packets transmitted, 0 received, 100% packet loss, time 5188ms

pi@raspberrypizero:~ $ traceroute 192.168.1.100
traceroute to 192.168.1.100 (192.168.1.100), 30 hops max, 60 byte packets
 1  192.168.5.1 (192.168.5.1)  42.279 ms  43.834 ms  44.678 ms
 2  * * *
 3  * * *
 4  * * *


---

B side is working great, I am able to ping everything, even from the Ubuntu
server.


Regards,
Adrian

--000000000000ab7922056839291c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A side (<a href=3D"http://192.168.2.0/24">192.168.2.0=
/24</a>):</div><div><br></div><div>LEDE router 192.168.2.1 (static route to=
 access remote side <a href=3D"http://192.168.1.0/24">192.168.1.0/24</a> po=
inting to 192.168.2.100)</div><div><br></div><div>Pi Zero with Wireguard (1=
92.168.2.100, WG: 192.168.5.2)</div><div><br></div><div>Config:</div><div><=
br></div><div>auto wg0</div><div>iface wg0 inet static</div><div>=C2=A0 pre=
-up ip link add dev wg0 type wireguard</div><div>=C2=A0 post-up wg setconf =
wg0 /etc/wireguard/wireguard.conf</div><div>=C2=A0 post-up ip link set dev =
wg0 up</div><div>=C2=A0 post-up ip route add <a href=3D"http://192.168.1.0/=
24">192.168.1.0/24</a> via 192.168.5.1 dev wg0</div><div>=C2=A0 post-up ipt=
ables -t nat -A POSTROUTING -o eth0 -j MASQUERADE</div><div>=C2=A0 address =
192.168.5.2</div><div>=C2=A0 netmask 255.255.255.0</div><div><br></div><div=
><br></div><div>B side (<a href=3D"http://192.168.1.0/24">192.168.1.0/24</a=
>):</div><div><br></div><div>Unifi router 192.168.1.1 (static route to acce=
ss remote side <a href=3D"http://192.168.2.0/24">192.168.2.0/24</a> pointin=
g to 192.168.1.54)</div><div><br></div><div>Ubuntu server with Wireguard (1=
92.168.1.54, WG: 192.168.5.1)</div><div><br></div><div>Config:</div><div><b=
r></div><div>iface wg0 inet static</div><div>=C2=A0 pre-up /sbin/ip link ad=
d dev wg0 type wireguard</div><div>=C2=A0 post-up /usr/bin/wg setconf wg0 /=
etc/wireguard/wg0.conf</div><div>=C2=A0 post-up /sbin/ip route add <a href=
=3D"http://192.168.2.0/24">192.168.2.0/24</a> via 192.168.5.2 dev wg0</div>=
<div>=C2=A0 post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE</d=
iv><div>=C2=A0 post-down /sbin/ip link del wg0</div><div>=C2=A0 address 192=
.168.5.1</div><div>=C2=A0 netmask 255.255.255.0</div><div><br></div><div>--=
-</div><div><br></div><div>Everything is working great, except that on the =
&quot;Pi Zero with Wireguard&quot; I can&#39;t access/ping remote devices i=
n the <a href=3D"http://192.168.1.0/24">192.168.1.0/24</a> range, only the =
remote server 192.168.1.54. From any other machine in the same &quot;A side=
&quot; I am able to access devices in the <a href=3D"http://192.168.1.0/24"=
>192.168.1.0/24</a> range, just from the Pi Zero itself not.</div><div><br>=
</div><div>What I am missing here?</div><div><br></div><div><br></div><div>=
pi@raspberrypizero:~ $ ping 192.168.1.54</div><div>PING 192.168.1.54 (192.1=
68.1.54) 56(84) bytes of data.</div><div>64 bytes from <a href=3D"http://19=
2.168.1.54">192.168.1.54</a>: icmp_seq=3D1 ttl=3D64 time=3D48.6 ms</div><di=
v>64 bytes from <a href=3D"http://192.168.1.54">192.168.1.54</a>: icmp_seq=
=3D2 ttl=3D64 time=3D134 ms^C</div><div>--- 192.168.1.54 ping statistics --=
-</div><div>2 packets transmitted, 2 received, 0% packet loss, time 1002ms<=
/div><div>rtt min/avg/max/mdev =3D 48.671/91.554/134.437/42.883 ms</div><di=
v>pi@raspberrypizero:~ $ ping 192.168.1.100</div><div>PING 192.168.1.100 (1=
92.168.1.100) 56(84) bytes of data.</div><div>^C</div><div>--- 192.168.1.10=
0 ping statistics ---</div><div>6 packets transmitted, 0 received, 100% pac=
ket loss, time 5188ms</div><div><br></div><div>pi@raspberrypizero:~ $ trace=
route 192.168.1.100</div><div>traceroute to 192.168.1.100 (192.168.1.100), =
30 hops max, 60 byte packets</div><div>=C2=A01 =C2=A0192.168.5.1 (192.168.5=
.1) =C2=A042.279 ms =C2=A043.834 ms =C2=A044.678 ms</div><div>=C2=A02 =C2=
=A0* * *</div><div>=C2=A03 =C2=A0* * *</div><div>=C2=A04 =C2=A0* * *</div><=
div><br></div><div><br></div><div>---</div><div><br></div><div>B side is wo=
rking great, I am able to ping everything, even from the Ubuntu server.</di=
v><div><br></div><div><br></div><div>Regards,</div><div>Adrian</div></div>

--000000000000ab7922056839291c--
