Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 789825ab
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 21:00:30 +0000 (UTC)
Received: from mx03b-out01ag.rit.edu (mx03b-out01ag.rit.edu [129.21.3.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e632397
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 21:00:30 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pg0-f71.google.com with SMTP id k14so20990313pgr.5
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jul 2017 14:20:03 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Jul 2017 17:20:01 -0400
Message-ID: <CAA8CD9vTW5XJVDjhE=5t6e8midm6LivLYqLHBrT98riTYnP3kQ@mail.gmail.com>
Subject: Not able to ping the host as per demo of wireguard.
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c12f8449e31eb0554da6d92"
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c12f8449e31eb0554da6d92
Content-Type: text/plain; charset="UTF-8"

Hi all,
I am trying demo of Wireguard as shown in this link:
https://www.wireguard.com/talks/talk-demo-screencast.mp4

I am having two laptops connected to same wifi.
Operating system is ubuntu.
I have followed exact same steps as shown in demo but unable to ping the
send laptop.

It is not even recognizing the laptop.
Only difference from video is I don't have eth0 interface but wlp6so
wireless interface.

I am sending both ip addr and wg command results of both.
Please guide what is going wrong with ping command.


Laptop 1(Peer A):
"
root@sahilgupta221-900X3B-900X4B:/home/sahilgupta221# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group
default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp2s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast
state DOWN group default qlen 1000
    link/ether e8:03:9a:9a:3b:90 brd ff:ff:ff:ff:ff:ff
3: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
group default qlen 1000
    link/ether 88:53:2e:c7:78:f1 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.211/22 brd 192.168.3.255 scope global dynamic wlp1s0
       valid_lft 2130sec preferred_lft 2130sec
    inet6 fe80::82c0:7df3:3700:b941/64 scope link
       valid_lft forever preferred_lft forever
4: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state
UNKNOWN group default qlen 1
    link/none
    inet 10.0.0.1/24 scope global wg0
       valid_lft forever preferred_lft forever
root@sahilgupta221-900X3B-900X4B:/home/sahilgupta221# wg
interface: wg0
  public key: N5XYKCRQvs7mMd1QQiPuNcAmchvB4u1oc3N+RNjWeSs=
  private key: (hidden)
  listening port: 40668

peer: XtGALYDx+tE9dHBftR26vUkjZ6bHzRZscaaM++NSGk4=
  endpoint: 192.168.2.170:59257
  allowed ips: 10.0.0.2/32
  transfer: 0 B received, 3.04 KiB sent
root@sahilgupta221-900X3B-900X4B:/home/sahilgupta221#

"

Laptop 2(Peer B):
"
root@sahilgupta221-900X3B-900X4B:/home/sahilgupta221# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group
default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp2s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast
state DOWN group default qlen 1000
    link/ether e8:03:9a:9a:3b:90 brd ff:ff:ff:ff:ff:ff
3: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
group default qlen 1000
    link/ether 88:53:2e:c7:78:f1 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.211/22 brd 192.168.3.255 scope global dynamic wlp1s0
       valid_lft 2130sec preferred_lft 2130sec
    inet6 fe80::82c0:7df3:3700:b941/64 scope link
       valid_lft forever preferred_lft forever
4: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state
UNKNOWN group default qlen 1
    link/none
    inet 10.0.0.1/24 scope global wg0
       valid_lft forever preferred_lft forever
root@sahilgupta221-900X3B-900X4B:/home/sahilgupta221# wg
interface: wg0
  public key: N5XYKCRQvs7mMd1QQiPuNcAmchvB4u1oc3N+RNjWeSs=
  private key: (hidden)
  listening port: 40668

peer: XtGALYDx+tE9dHBftR26vUkjZ6bHzRZscaaM++NSGk4=
  endpoint: 192.168.2.170:59257
  allowed ips: 10.0.0.2/32
  transfer: 0 B received, 3.04 KiB sent
root@sahilgupta221-900X3B-900X4B:/home/sahilgupta221#
"

Waiting for reply.

Regards
Sahil Gupta

--94eb2c12f8449e31eb0554da6d92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br>I am trying demo of Wireguard as shown in this =
link:<br><a href=3D"https://www.wireguard.com/talks/talk-demo-screencast.mp=
4">https://www.wireguard.com/talks/talk-demo-screencast.mp4</a><br><div><br=
></div><div>I am having two laptops connected to same wifi.<br>Operating sy=
stem is ubuntu.<br>I have followed exact same steps as shown in demo but un=
able to ping the send laptop.<br><br>It is not even recognizing the laptop.=
<br>Only difference from video is I don&#39;t have eth0 interface but wlp6s=
o wireless interface.<br><br>I am sending both ip addr and wg command resul=
ts of both.<br>Please guide what is going wrong with ping command.<br><br><=
br>Laptop 1(Peer A):<br>&quot;</div><div><div style=3D"font-size:12.8px">ro=
ot@sahilgupta221-900X3B-<wbr>900X4B:/home/sahilgupta221# ip addr</div><div =
style=3D"font-size:12.8px">1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qd=
isc noqueue state UNKNOWN group default qlen 1</div><div style=3D"font-size=
:12.8px">=C2=A0 =C2=A0 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:0=
0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 inet=C2=A0<a href=3D"h=
ttp://127.0.0.1/8" target=3D"_blank">127.0.0.1/8</a>=C2=A0scope host lo</di=
v><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0valid_lft fore=
ver preferred_lft forever</div><div style=3D"font-size:12.8px">=C2=A0 =C2=
=A0 inet6 ::1/128 scope host=C2=A0</div><div style=3D"font-size:12.8px">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0valid_lft forever preferred_lft forever</div><div s=
tyle=3D"font-size:12.8px">2: enp2s0: &lt;NO-CARRIER,BROADCAST,<wbr>MULTICAS=
T,UP&gt; mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000</div>=
<div style=3D"font-size:12.8px">=C2=A0 =C2=A0 link/ether e8:03:9a:9a:3b:90 =
brd ff:ff:ff:ff:ff:ff</div><div style=3D"font-size:12.8px">3: wlp1s0: &lt;B=
ROADCAST,MULTICAST,UP,LOWER_<wbr>UP&gt; mtu 1500 qdisc mq state UP group de=
fault qlen 1000</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 link/eth=
er 88:53:2e:c7:78:f1 brd ff:ff:ff:ff:ff:ff</div><div style=3D"font-size:12.=
8px">=C2=A0 =C2=A0 inet=C2=A0<a href=3D"http://192.168.2.211/22" target=3D"=
_blank">192.168.2.211/22</a>=C2=A0brd 192.168.3.255 scope global dynamic wl=
p1s0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0valid_=
lft 2130sec preferred_lft 2130sec</div><div style=3D"font-size:12.8px">=C2=
=A0 =C2=A0 inet6 fe80::82c0:7df3:3700:b941/64 scope link=C2=A0</div><div st=
yle=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0valid_lft forever prefe=
rred_lft forever</div><div style=3D"font-size:12.8px">4: wg0: &lt;POINTOPOI=
NT,NOARP,UP,LOWER_<wbr>UP&gt; mtu 1420 qdisc noqueue state UNKNOWN group de=
fault qlen 1</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 link/none=
=C2=A0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 inet=C2=A0<a href=
=3D"http://10.0.0.1/24" target=3D"_blank">10.0.0.1/24</a>=C2=A0scope global=
 wg0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0valid_=
lft forever preferred_lft forever</div><div style=3D"font-size:12.8px">root=
@sahilgupta221-900X3B-<wbr>900X4B:/home/sahilgupta221# wg</div><div style=
=3D"font-size:12.8px">interface: wg0</div><div style=3D"font-size:12.8px">=
=C2=A0 public key: N5XYKCRQvs7mMd1QQiPuNcAmchvB4u<wbr>1oc3N+RNjWeSs=3D</div=
><div style=3D"font-size:12.8px">=C2=A0 private key: (hidden)</div><div sty=
le=3D"font-size:12.8px">=C2=A0 listening port: 40668</div><div style=3D"fon=
t-size:12.8px"><br></div><div style=3D"font-size:12.8px">peer: XtGALYDx+<wb=
r>tE9dHBftR26vUkjZ6bHzRZscaaM++<wbr>NSGk4=3D</div><div style=3D"font-size:1=
2.8px">=C2=A0 endpoint:=C2=A0<a href=3D"http://192.168.2.170:59257/" target=
=3D"_blank">192.168.2.170:59257</a></div><div style=3D"font-size:12.8px">=
=C2=A0 allowed ips:=C2=A0<a href=3D"http://10.0.0.2/32" target=3D"_blank">1=
0.0.0.2/32</a></div><div style=3D"font-size:12.8px">=C2=A0 transfer: 0 B re=
ceived, 3.04 KiB sent</div><div style=3D"font-size:12.8px">root@sahilgupta2=
21-900X3B-<wbr>900X4B:/home/sahilgupta221#=C2=A0</div></div><div><br></div>=
<div>&quot;<br><br>Laptop 2(Peer B):<br>&quot;</div><div><div style=3D"font=
-size:12.8px">root@sahilgupta221-900X3B-<wbr>900X4B:/home/sahilgupta221# ip=
 addr</div><div style=3D"font-size:12.8px">1: lo: &lt;LOOPBACK,UP,LOWER_UP&=
gt; mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1</div><div st=
yle=3D"font-size:12.8px">=C2=A0 =C2=A0 link/loopback 00:00:00:00:00:00 brd =
00:00:00:00:00:00</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 inet=
=C2=A0<a href=3D"http://127.0.0.1/8" target=3D"_blank">127.0.0.1/8</a>=C2=
=A0scope host lo</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0valid_lft forever preferred_lft forever</div><div style=3D"font-size:=
12.8px">=C2=A0 =C2=A0 inet6 ::1/128 scope host=C2=A0</div><div style=3D"fon=
t-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0valid_lft forever preferred_lft f=
orever</div><div style=3D"font-size:12.8px">2: enp2s0: &lt;NO-CARRIER,BROAD=
CAST,<wbr>MULTICAST,UP&gt; mtu 1500 qdisc pfifo_fast state DOWN group defau=
lt qlen 1000</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 link/ether =
e8:03:9a:9a:3b:90 brd ff:ff:ff:ff:ff:ff</div><div style=3D"font-size:12.8px=
">3: wlp1s0: &lt;BROADCAST,MULTICAST,UP,LOWER_<wbr>UP&gt; mtu 1500 qdisc mq=
 state UP group default qlen 1000</div><div style=3D"font-size:12.8px">=C2=
=A0 =C2=A0 link/ether 88:53:2e:c7:78:f1 brd ff:ff:ff:ff:ff:ff</div><div sty=
le=3D"font-size:12.8px">=C2=A0 =C2=A0 inet=C2=A0<a href=3D"http://192.168.2=
.211/22" target=3D"_blank">192.168.2.211/22</a>=C2=A0brd 192.168.3.255 scop=
e global dynamic wlp1s0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0valid_lft 2130sec preferred_lft 2130sec</div><div style=3D"fon=
t-size:12.8px">=C2=A0 =C2=A0 inet6 fe80::82c0:7df3:3700:b941/64 scope link=
=C2=A0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0vali=
d_lft forever preferred_lft forever</div><div style=3D"font-size:12.8px">4:=
 wg0: &lt;POINTOPOINT,NOARP,UP,LOWER_<wbr>UP&gt; mtu 1420 qdisc noqueue sta=
te UNKNOWN group default qlen 1</div><div style=3D"font-size:12.8px">=C2=A0=
 =C2=A0 link/none=C2=A0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =
inet=C2=A0<a href=3D"http://10.0.0.1/24" target=3D"_blank">10.0.0.1/24</a>=
=C2=A0scope global wg0</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0valid_lft forever preferred_lft forever</div><div style=3D"fon=
t-size:12.8px">root@sahilgupta221-900X3B-<wbr>900X4B:/home/sahilgupta221# w=
g</div><div style=3D"font-size:12.8px">interface: wg0</div><div style=3D"fo=
nt-size:12.8px">=C2=A0 public key: N5XYKCRQvs7mMd1QQiPuNcAmchvB4u<wbr>1oc3N=
+RNjWeSs=3D</div><div style=3D"font-size:12.8px">=C2=A0 private key: (hidde=
n)</div><div style=3D"font-size:12.8px">=C2=A0 listening port: 40668</div><=
div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">pe=
er: XtGALYDx+<wbr>tE9dHBftR26vUkjZ6bHzRZscaaM++<wbr>NSGk4=3D</div><div styl=
e=3D"font-size:12.8px">=C2=A0 endpoint:=C2=A0<a href=3D"http://192.168.2.17=
0:59257/" target=3D"_blank">192.168.2.170:59257</a></div><div style=3D"font=
-size:12.8px">=C2=A0 allowed ips:=C2=A0<a href=3D"http://10.0.0.2/32" targe=
t=3D"_blank">10.0.0.2/32</a></div><div style=3D"font-size:12.8px">=C2=A0 tr=
ansfer: 0 B received, 3.04 KiB sent</div><div style=3D"font-size:12.8px">ro=
ot@sahilgupta221-900X3B-<wbr>900X4B:/home/sahilgupta221#=C2=A0</div></div><=
div>&quot;<br>=C2=A0</div><div>Waiting for reply.<br><br>Regards</div><div>=
Sahil Gupta</div></div>

--94eb2c12f8449e31eb0554da6d92--
