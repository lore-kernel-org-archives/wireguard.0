Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 324cc5fb
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 18:09:49 +0000 (UTC)
Received: from mx03a-out01ag.rit.edu (mx03a-out01ag.rit.edu [129.21.3.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e392e18
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 18:09:49 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pg0-f70.google.com with SMTP id v77so76248677pgb.15
 for <wireguard@lists.zx2c4.com>; Sun, 06 Aug 2017 11:31:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r6wpShD12r+RYGC84EZVYRXAFgaoMAWjGAz0uktKWuGw@mail.gmail.com>
References: <CAA8CD9t8YCR__Ee2F3Sb5H=78O9PTi5j+K1iXHsU7PS4pTKAwA@mail.gmail.com>
 <CAA8CD9sAT8PW8B1HSqR9utNvjmFB6Tn4U0bESBGO7QWVSVqX3w@mail.gmail.com>
 <CAA8CD9tHsB5tPkeUsuVA1V3SM7bQdFKjWV6c+NM6hh_o1N5HHg@mail.gmail.com>
 <CAHmME9r6wpShD12r+RYGC84EZVYRXAFgaoMAWjGAz0uktKWuGw@mail.gmail.com>
Date: Sun, 6 Aug 2017 14:31:22 -0400
Message-ID: <CAA8CD9tQ8cQekHK1dF-SPcxRHswWgAuJ6zsxqwvmPK4cbz8oVQ@mail.gmail.com>
Subject: Re: RTNETLINK answers: Operation not supported
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c4622f13060055619ef3c"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c4622f13060055619ef3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reply.
That problem is resolve.
I am in new difficultly now.

Scenario.
We have three system say laptop L1, laptop L2 and raspberry pi (say pi).
L1 and L2 are connected with wireless interface(wlan0). L1 and pi connected
from ethernet interface via ethernet cable.

Now,
L1 wlan  ip: 192.168.0.9
L1 eth0 ip: 10.42.0.1
L2 wlan ip: 192.168.0.11
pi eth0 ip: 10.42.0.2
L1 wg0 ip: 10.0.0.6
L2 wg0 ip: 10.0.0.2
pi wg0 ip: 10.0.0.3

Now problem is L1 and pi executing ping command but L1 and L2 don't.

<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Connectivity:*
L1(eth0 : 10.42.0.1, wg0 : 10.0.0.6, wlan0 : 192.168.0.9)         =E2=87=94
 L2(wlan0 : 192.168.0.11,wg0 : 10.0.0.2 )

=E2=87=95

pi (eth0:10.42.0.2,wg0:10.0.0.3)
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Config file of L1:*
[Interface]
PrivateKey =3D 6Ew/TWF8+ofWSnk1Mxmb+8D8Kx9ZIP2SjcxBKkmXnGo=3D
ListenPort =3D 12345
Address =3D 10.0.0.6/24

[Peer]
PublicKey =3D r+F7hbLjN3J4qc75V734DW2H28BVh8ydkCkK1Lf8blY=3D
Endpoint =3D 192.168.0.11:12345
AllowedIPs =3D 10.0.0.0/24

[Peer]
PublicKey =3D hkZUDze5qDILltpjoaYe+vG1qcYqTtKg8E3nawix92k=3D
Endpoint =3D 10.42.0.2:12345
AllowedIPs =3D 10.0.0.0/24
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Config file of L2:*
[Interface]
PrivateKey =3D SICBGQ/vbASs5Xoo0AK1cMy9CbLpfxlCAD2Ap+TACEo=3D
ListenPort =3D 12345
Address =3D 10.0.0.2/24

[Peer]
PublicKey =3D duJE8ANouuvgL5IZM7oMWCdluvMlCvjZCDe8BJIVg34=3D
Endpoint =3D 192.168.0.9:12345
AllowedIPs =3D 10.0.0.0/24
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Config file of pi:*
[Interface]
PrivateKey =3D kNFqEj9bB8CUx7mfGdc4UR1uYtj647X5HKdx7XPbGFA=3D
ListenPort =3D 12345
Address =3D 10.0.0.3/24

[Peer]
PublicKey =3D duJE8ANouuvgL5IZM7oMWCdluvMlCvjZCDe8BJIVg34=3D
Endpoint =3D 10.42.0.1:12345
AllowedIPs =3D 10.0.0.0/24
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Terminal of L1:*
sahilgupta221@sahilgupta221-Inspiron-3543:/etc/wireguard$ sudo wg-quick up
wg0
Warning: `/etc/wireguard/wg0.conf' is world accessible
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip address add 10.0.0.6/24 dev wg0
[#] ip link set mtu 1420 dev wg0
[#] ip link set wg0 up
sahilgupta221@sahilgupta221-Inspiron-3543:/etc/wireguard$ ping 10.0.0.2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
^C
--- 10.0.0.2 ping statistics ---
294 packets transmitted, 0 received, 100% packet loss, time 293003ms

sahilgupta221@sahilgupta221-Inspiron-3543:/etc/wireguard$ ping 10.0.0.3
PING 10.0.0.3 (10.0.0.3) 56(84) bytes of data.
64 bytes from 10.0.0.3: icmp_seq=3D1 ttl=3D64 time=3D13.1 ms
64 bytes from 10.0.0.3: icmp_seq=3D2 ttl=3D64 time=3D0.922 ms
64 bytes from 10.0.0.3: icmp_seq=3D3 ttl=3D64 time=3D0.934 ms
64 bytes from 10.0.0.3: icmp_seq=3D4 ttl=3D64 time=3D0.718 ms
64 bytes from 10.0.0.3: icmp_seq=3D5 ttl=3D64 time=3D0.949 ms
64 bytes from 10.0.0.3: icmp_seq=3D6 ttl=3D64 time=3D0.902 ms
64 bytes from 10.0.0.3: icmp_seq=3D7 ttl=3D64 time=3D0.829 ms
64 bytes from 10.0.0.3: icmp_seq=3D8 ttl=3D64 time=3D0.907 ms
^C
--- 10.0.0.3 ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7004ms
rtt min/avg/max/mdev =3D 0.718/2.410/13.120/4.048 ms
sahilgupta221@sahilgupta221-Inspiron-3543:/etc/wireguard$
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Terminal of L2*:
sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ sudo wg-quick up
wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip address add 10.0.0.2/24 dev wg0
[#] ip link set mtu 1420 dev wg0
[#] ip link set wg0 up
sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ ping 10.0.0.6
PING 10.0.0.6 (10.0.0.6) 56(84) bytes of data.
^C
--- 10.0.0.6 ping statistics ---
246 packets transmitted, 0 received, 100% packet loss, time 250882ms

sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ ping 10.0.0.2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
64 bytes from 10.0.0.2: icmp_seq=3D1 ttl=3D64 time=3D0.129 ms
64 bytes from 10.0.0.2: icmp_seq=3D2 ttl=3D64 time=3D0.074 ms
64 bytes from 10.0.0.2: icmp_seq=3D3 ttl=3D64 time=3D0.080 ms
64 bytes from 10.0.0.2: icmp_seq=3D4 ttl=3D64 time=3D0.077 ms
64 bytes from 10.0.0.2: icmp_seq=3D5 ttl=3D64 time=3D0.073 ms
64 bytes from 10.0.0.2: icmp_seq=3D6 ttl=3D64 time=3D0.072 ms
64 bytes from 10.0.0.2: icmp_seq=3D7 ttl=3D64 time=3D0.070 ms
64 bytes from 10.0.0.2: icmp_seq=3D8 ttl=3D64 time=3D0.075 ms
64 bytes from 10.0.0.2: icmp_seq=3D9 ttl=3D64 time=3D0.076 ms
^C
--- 10.0.0.2 ping statistics ---
9 packets transmitted, 9 received, 0% packet loss, time 8200ms
rtt min/avg/max/mdev =3D 0.070/0.080/0.129/0.020 ms
sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ ping 10.0.0.3
PING 10.0.0.3 (10.0.0.3) 56(84) bytes of data.
^C
--- 10.0.0.3 ping statistics ---
2 packets transmitted, 0 received, 100% packet loss, time 1007ms

sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ sudo chmod 777 *
[sudo] password for sahilgupta221:
sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
*Terminal of pi:*
pi@raspberrypi:~ $ sudo wg-quick up wg0
Warning: `/etc/wireguard/wg0.conf' is world accessible
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip address add 10.0.0.3/24 dev wg0
[#] ip link set mtu 1420 dev wg0
[#] ip link set wg0 up
pi@raspberrypi:~ $ ping 10.0.0.6
PING 10.0.0.6 (10.0.0.6) 56(84) bytes of data.
64 bytes from 10.0.0.6: icmp_seq=3D1 ttl=3D64 time=3D5015 ms
64 bytes from 10.0.0.6: icmp_seq=3D2 ttl=3D64 time=3D4009 ms
64 bytes from 10.0.0.6: icmp_seq=3D3 ttl=3D64 time=3D2969 ms
64 bytes from 10.0.0.6: icmp_seq=3D4 ttl=3D64 time=3D1929 ms
64 bytes from 10.0.0.6: icmp_seq=3D5 ttl=3D64 time=3D890 ms
64 bytes from 10.0.0.6: icmp_seq=3D6 ttl=3D64 time=3D0.829 ms
64 bytes from 10.0.0.6: icmp_seq=3D7 ttl=3D64 time=3D4.16 ms
64 bytes from 10.0.0.6: icmp_seq=3D8 ttl=3D64 time=3D0.883 ms
64 bytes from 10.0.0.6: icmp_seq=3D9 ttl=3D64 time=3D0.849 ms
64 bytes from 10.0.0.6: icmp_seq=3D10 ttl=3D64 time=3D4.08 ms
^C
--- 10.0.0.6 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9245ms
rtt min/avg/max/mdev =3D 0.829/1482.655/5015.674/1805.291 ms, pipe 5
pi@raspberrypi:~ $ ^C
pi@raspberrypi:~ $ ifconfig
eth0      Link encap:Ethernet  HWaddr b8:27:eb:ab:0e:3b
          inet addr:10.42.0.2  Bcast:10.42.0.255  Mask:255.255.255.0
          inet6 addr: fe80::ba27:ebff:feab:e3b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:638 errors:0 dropped:0 overruns:0 frame:0
          TX packets:316 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:73672 (71.9 KiB)  TX bytes:38774 (37.8 KiB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

wg0       Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.0.0.3  P-t-P:10.0.0.3  Mask:255.255.255.0
          UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
          RX packets:307 errors:0 dropped:0 overruns:0 frame:0
          TX packets:50 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:25812 (25.2 KiB)  TX bytes:3988 (3.8 KiB)

pi@raspberrypi:~ $ nano w
pi@raspberrypi:~ $ ^C
pi@raspberrypi:~ $ cd /etc/wireguard/
pi@raspberrypi:/etc/wireguard $ nano wg0.conf
pi@raspberrypi:/etc/wireguard $ ping 10.0.0.2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
^C
--- 10.0.0.2 ping statistics ---
23 packets transmitted, 0 received, 100% packet loss, time 22891ms
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>

*Summarry*:
Q1: How can I connectivity between L1 and L2?
Q2: Do I need to maintain two different wireguard interfaces for each LAN
connection?
Q3: If answer to Q2 is yes then how L2 can ping to pi?
Q4: Why pi can't ping to L2?
Terminal response will verifies the problem.

<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>

*PS: Apologies for disturbing on weekends. Didn't realize weekend part. *


*These are summer holidays here. Each day is same to me.Some of people
like, you, Eric,Christian Hesse etc. are super experts on certain
matters.My selfishness is that I want the quick response to accelerate
work.*


*So approached in this manner.*



*Not sure of duplicate part. I think I only send two messages.One solution
to problem and other requesting the tutorial.Next time I will maintain
single thread for particular problem.Please reply whenever feel free.*
=F0=9F=98=8A

Sorry and Thanks again
Sahil Gupta

--f403045c4622f13060055619ef3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Thanks for reply.<br>That probl=
em is resolve.<br>I am in new difficultly now.=C2=A0<br><br>Scenario.<br>We=
 have three system say laptop L1, laptop L2 and raspberry pi (say pi).<br>L=
1 and L2 are connected with wireless interface(wlan0). L1 and pi connected =
from ethernet interface via ethernet cable.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Now,</div><div class=3D"gmail_extra">=
L1 wlan =C2=A0ip: 192.168.0.9=C2=A0</div><div class=3D"gmail_extra">L1 eth0=
 ip: 10.42.0.1</div><div class=3D"gmail_extra">L2 wlan ip: 192.168.0.11</di=
v><div class=3D"gmail_extra">pi eth0 ip: 10.42.0.2<br>L1 wg0 ip: 10.0.0.6</=
div><div class=3D"gmail_extra">L2 wg0 ip: 10.0.0.2</div><div class=3D"gmail=
_extra">pi wg0 ip: 10.0.0.3<br><br>Now problem is L1 and pi executing ping =
command but L1 and L2 don&#39;t.</div><div class=3D"gmail_extra"><br>&lt;=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;</div><div class=3D"=
gmail_extra"><font size=3D"4"><b>Connectivity:</b></font><br>L1(eth0 : 10.4=
2.0.1, wg0 : 10.0.0.6, wlan0 : 192.168.0.9) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=
=87=94 =C2=A0 =C2=A0 =C2=A0L2(wlan0 : 192.168.0.11,wg0 : 10.0.0.2 )</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=E2=87=95<br>=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">pi (e=
th0:10.42.0.2,wg0:10.0.0.3)<br>&lt;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&gt;<br><font size=3D"4"><b>Config file of L1:</b></font><br=
><div class=3D"gmail_extra">[Interface]</div><div class=3D"gmail_extra">Pri=
vateKey =3D 6Ew/TWF8+ofWSnk1Mxmb+8D8Kx9ZIP2SjcxBKkmXnGo=3D</div><div class=
=3D"gmail_extra">ListenPort =3D 12345</div><div class=3D"gmail_extra">Addre=
ss =3D <a href=3D"http://10.0.0.6/24">10.0.0.6/24</a></div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">[Peer]</div><div class=3D"g=
mail_extra">PublicKey =3D r+F7hbLjN3J4qc75V734DW2H28BVh8ydkCkK1Lf8blY=3D</d=
iv><div class=3D"gmail_extra">Endpoint =3D <a href=3D"http://192.168.0.11:1=
2345">192.168.0.11:12345</a></div><div class=3D"gmail_extra">AllowedIPs =3D=
 <a href=3D"http://10.0.0.0/24">10.0.0.0/24</a></div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">[Peer]</div><div class=3D"gmail_e=
xtra">PublicKey =3D hkZUDze5qDILltpjoaYe+vG1qcYqTtKg8E3nawix92k=3D</div><di=
v class=3D"gmail_extra">Endpoint =3D <a href=3D"http://10.42.0.2:12345">10.=
42.0.2:12345</a></div><div class=3D"gmail_extra">AllowedIPs =3D <a href=3D"=
http://10.0.0.0/24">10.0.0.0/24</a></div>&lt;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D&gt;<br><b><font size=3D"4">Config file of L2:</fon=
t></b></div><div class=3D"gmail_extra"><span style=3D"color:rgb(38,50,56);f=
ont-size:13px">[Interface]</span><br style=3D"color:rgb(38,50,56);font-size=
:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">PrivateKey =3D SI=
CBGQ/vbASs5Xoo0AK1cMy9CbLpfxlCAD2Ap+TACEo=3D</span><br style=3D"color:rgb(3=
8,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:13px"=
>ListenPort =3D 12345</span><br style=3D"color:rgb(38,50,56);font-size:13px=
"><span style=3D"color:rgb(38,50,56);font-size:13px">Address =3D <a href=3D=
"http://10.0.0.2/24">10.0.0.2/24</a></span><br style=3D"color:rgb(38,50,56)=
;font-size:13px"><br style=3D"color:rgb(38,50,56);font-size:13px"><span sty=
le=3D"color:rgb(38,50,56);font-size:13px">[Peer]</span><br style=3D"color:r=
gb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:1=
3px">PublicKey =3D duJE8ANouuvgL5IZM7oMWCdluvMlCvjZCDe8BJIVg34=3D</span><br=
 style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,5=
0,56);font-size:13px">Endpoint =3D <a href=3D"http://192.168.0.9:12345">192=
.168.0.9:12345</a></span><br style=3D"color:rgb(38,50,56);font-size:13px"><=
span style=3D"color:rgb(38,50,56);font-size:13px">AllowedIPs =3D <a href=3D=
"http://10.0.0.0/24">10.0.0.0/24</a></span><br>&lt;=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;</div><div class=3D"gmail_extra"><b><font=
 size=3D"4">Config file of pi:</font></b><br></div><div class=3D"gmail_extr=
a"><div class=3D"gmail_extra">[Interface]</div><div class=3D"gmail_extra">P=
rivateKey =3D kNFqEj9bB8CUx7mfGdc4UR1uYtj647X5HKdx7XPbGFA=3D</div><div clas=
s=3D"gmail_extra">ListenPort =3D 12345</div><div class=3D"gmail_extra">Addr=
ess =3D <a href=3D"http://10.0.0.3/24">10.0.0.3/24</a></div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">[Peer]</div><div class=3D"=
gmail_extra">PublicKey =3D duJE8ANouuvgL5IZM7oMWCdluvMlCvjZCDe8BJIVg34=3D</=
div><div class=3D"gmail_extra">Endpoint =3D <a href=3D"http://10.42.0.1:123=
45">10.42.0.1:12345</a></div><div class=3D"gmail_extra">AllowedIPs =3D <a h=
ref=3D"http://10.0.0.0/24">10.0.0.0/24</a></div></div><div class=3D"gmail_e=
xtra">&lt;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;</div=
><div class=3D"gmail_extra"><b><font size=3D"4">Terminal of L1:</font></b><=
/div><div class=3D"gmail_extra"><div class=3D"gmail_extra">sahilgupta221@sa=
hilgupta221-Inspiron-3543:/etc/wireguard$ sudo wg-quick up wg0</div><div cl=
ass=3D"gmail_extra">Warning: `/etc/wireguard/wg0.conf&#39; is world accessi=
ble</div><div class=3D"gmail_extra">[#] ip link add wg0 type wireguard</div=
><div class=3D"gmail_extra">[#] wg setconf wg0 /dev/fd/63</div><div class=
=3D"gmail_extra">[#] ip address add <a href=3D"http://10.0.0.6/24">10.0.0.6=
/24</a> dev wg0</div><div class=3D"gmail_extra">[#] ip link set mtu 1420 de=
v wg0</div><div class=3D"gmail_extra">[#] ip link set wg0 up</div><div clas=
s=3D"gmail_extra">sahilgupta221@sahilgupta221-Inspiron-3543:/etc/wireguard$=
 ping 10.0.0.2</div><div class=3D"gmail_extra">PING 10.0.0.2 (10.0.0.2) 56(=
84) bytes of data.</div><div class=3D"gmail_extra">^C</div><div class=3D"gm=
ail_extra">--- 10.0.0.2 ping statistics ---</div><div class=3D"gmail_extra"=
>294 packets transmitted, 0 received, 100% packet loss, time 293003ms</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">sahilgupta2=
21@sahilgupta221-Inspiron-3543:/etc/wireguard$ ping 10.0.0.3</div><div clas=
s=3D"gmail_extra">PING 10.0.0.3 (10.0.0.3) 56(84) bytes of data.</div><div =
class=3D"gmail_extra">64 bytes from <a href=3D"http://10.0.0.3">10.0.0.3</a=
>: icmp_seq=3D1 ttl=3D64 time=3D13.1 ms</div><div class=3D"gmail_extra">64 =
bytes from <a href=3D"http://10.0.0.3">10.0.0.3</a>: icmp_seq=3D2 ttl=3D64 =
time=3D0.922 ms</div><div class=3D"gmail_extra">64 bytes from <a href=3D"ht=
tp://10.0.0.3">10.0.0.3</a>: icmp_seq=3D3 ttl=3D64 time=3D0.934 ms</div><di=
v class=3D"gmail_extra">64 bytes from <a href=3D"http://10.0.0.3">10.0.0.3<=
/a>: icmp_seq=3D4 ttl=3D64 time=3D0.718 ms</div><div class=3D"gmail_extra">=
64 bytes from <a href=3D"http://10.0.0.3">10.0.0.3</a>: icmp_seq=3D5 ttl=3D=
64 time=3D0.949 ms</div><div class=3D"gmail_extra">64 bytes from <a href=3D=
"http://10.0.0.3">10.0.0.3</a>: icmp_seq=3D6 ttl=3D64 time=3D0.902 ms</div>=
<div class=3D"gmail_extra">64 bytes from <a href=3D"http://10.0.0.3">10.0.0=
.3</a>: icmp_seq=3D7 ttl=3D64 time=3D0.829 ms</div><div class=3D"gmail_extr=
a">64 bytes from <a href=3D"http://10.0.0.3">10.0.0.3</a>: icmp_seq=3D8 ttl=
=3D64 time=3D0.907 ms</div><div class=3D"gmail_extra">^C</div><div class=3D=
"gmail_extra">--- 10.0.0.3 ping statistics ---</div><div class=3D"gmail_ext=
ra">8 packets transmitted, 8 received, 0% packet loss, time 7004ms</div><di=
v class=3D"gmail_extra">rtt min/avg/max/mdev =3D 0.718/2.410/13.120/4.048 m=
s</div><div class=3D"gmail_extra">sahilgupta221@sahilgupta221-Inspiron-3543=
:/etc/wireguard$=C2=A0</div></div><div class=3D"gmail_extra">&lt;=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;</div><div class=3D"gmail_=
extra"><div class=3D"gmail_extra"><b><font size=3D"4">Terminal of L2</font>=
</b>:</div><div class=3D"gmail_extra"><span style=3D"color:rgb(38,50,56);fo=
nt-size:13px">sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ sud=
o wg-quick up wg0</span><br style=3D"color:rgb(38,50,56);font-size:13px"><s=
pan style=3D"color:rgb(38,50,56);font-size:13px">[#] ip link add wg0 type w=
ireguard</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=
=3D"color:rgb(38,50,56);font-size:13px">[#] wg setconf wg0 /dev/fd/63</span=
><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(=
38,50,56);font-size:13px">[#] ip address add <a href=3D"http://10.0.0.2/24"=
>10.0.0.2/24</a> dev wg0</span><br style=3D"color:rgb(38,50,56);font-size:1=
3px"><span style=3D"color:rgb(38,50,56);font-size:13px">[#] ip link set mtu=
 1420 dev wg0</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span =
style=3D"color:rgb(38,50,56);font-size:13px">[#] ip link set wg0 up</span><=
br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38=
,50,56);font-size:13px">sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wire=
guard$ ping 10.0.0.6</span><br style=3D"color:rgb(38,50,56);font-size:13px"=
><span style=3D"color:rgb(38,50,56);font-size:13px">PING 10.0.0.6 (10.0.0.6=
) 56(84) bytes of data.</span><br style=3D"color:rgb(38,50,56);font-size:13=
px"><span style=3D"color:rgb(38,50,56);font-size:13px">^C</span><br style=
=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);=
font-size:13px">--- 10.0.0.6 ping statistics ---</span><br style=3D"color:r=
gb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:1=
3px">246 packets transmitted, 0 received, 100% packet loss, time 250882ms</=
span><br style=3D"color:rgb(38,50,56);font-size:13px"><br style=3D"color:rg=
b(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:13=
px">sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ ping 10.0.0.2=
</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"colo=
r:rgb(38,50,56);font-size:13px">PING 10.0.0.2 (10.0.0.2) 56(84) bytes of da=
ta.</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"c=
olor:rgb(38,50,56);font-size:13px">64 bytes from <a href=3D"http://10.0.0.2=
">10.0.0.2</a>: icmp_seq=3D1 ttl=3D64 time=3D0.129 ms</span><br style=3D"co=
lor:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-s=
ize:13px">64 bytes from <a href=3D"http://10.0.0.2">10.0.0.2</a>: icmp_seq=
=3D2 ttl=3D64 time=3D0.074 ms</span><br style=3D"color:rgb(38,50,56);font-s=
ize:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">64 bytes from =
<a href=3D"http://10.0.0.2">10.0.0.2</a>: icmp_seq=3D3 ttl=3D64 time=3D0.08=
0 ms</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"=
color:rgb(38,50,56);font-size:13px">64 bytes from <a href=3D"http://10.0.0.=
2">10.0.0.2</a>: icmp_seq=3D4 ttl=3D64 time=3D0.077 ms</span><br style=3D"c=
olor:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-=
size:13px">64 bytes from <a href=3D"http://10.0.0.2">10.0.0.2</a>: icmp_seq=
=3D5 ttl=3D64 time=3D0.073 ms</span><br style=3D"color:rgb(38,50,56);font-s=
ize:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">64 bytes from =
<a href=3D"http://10.0.0.2">10.0.0.2</a>: icmp_seq=3D6 ttl=3D64 time=3D0.07=
2 ms</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"=
color:rgb(38,50,56);font-size:13px">64 bytes from <a href=3D"http://10.0.0.=
2">10.0.0.2</a>: icmp_seq=3D7 ttl=3D64 time=3D0.070 ms</span><br style=3D"c=
olor:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-=
size:13px">64 bytes from <a href=3D"http://10.0.0.2">10.0.0.2</a>: icmp_seq=
=3D8 ttl=3D64 time=3D0.075 ms</span><br style=3D"color:rgb(38,50,56);font-s=
ize:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">64 bytes from =
<a href=3D"http://10.0.0.2">10.0.0.2</a>: icmp_seq=3D9 ttl=3D64 time=3D0.07=
6 ms</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"=
color:rgb(38,50,56);font-size:13px">^C</span><br style=3D"color:rgb(38,50,5=
6);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">--- 1=
0.0.0.2 ping statistics ---</span><br style=3D"color:rgb(38,50,56);font-siz=
e:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">9 packets transm=
itted, 9 received, 0% packet loss, time 8200ms</span><br style=3D"color:rgb=
(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:13p=
x">rtt min/avg/max/mdev =3D 0.070/0.080/0.129/0.020 ms</span><br style=3D"c=
olor:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-=
size:13px">sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$ ping 1=
0.0.0.3</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span style=
=3D"color:rgb(38,50,56);font-size:13px">PING 10.0.0.3 (10.0.0.3) 56(84) byt=
es of data.</span><br style=3D"color:rgb(38,50,56);font-size:13px"><span st=
yle=3D"color:rgb(38,50,56);font-size:13px">^C</span><br style=3D"color:rgb(=
38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);font-size:13px=
">--- 10.0.0.3 ping statistics ---</span><br style=3D"color:rgb(38,50,56);f=
ont-size:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">2 packets=
 transmitted, 0 received, 100% packet loss, time 1007ms</span><br style=3D"=
color:rgb(38,50,56);font-size:13px"><br style=3D"color:rgb(38,50,56);font-s=
ize:13px"><span style=3D"color:rgb(38,50,56);font-size:13px">sahilgupta221@=
sahilgupta221-900X3B-900X4B:/etc/wireguard$ sudo chmod 777 *</span><br styl=
e=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56)=
;font-size:13px">[sudo] password for sahilgupta221:=C2=A0</span><br style=
=3D"color:rgb(38,50,56);font-size:13px"><span style=3D"color:rgb(38,50,56);=
font-size:13px">sahilgupta221@sahilgupta221-900X3B-900X4B:/etc/wireguard$=
=C2=A0</span><br></div><div class=3D"gmail_extra">&lt;=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;</div></div><div class=3D"gmail_extra"=
><div class=3D"gmail_extra"><b><font size=3D"4">Terminal of pi:</font></b><=
/div><div class=3D"gmail_extra"><div class=3D"gmail_extra">pi@raspberrypi:~=
 $ sudo wg-quick up wg0</div><div class=3D"gmail_extra">Warning: `/etc/wire=
guard/wg0.conf&#39; is world accessible</div><div class=3D"gmail_extra">[#]=
 ip link add wg0 type wireguard</div><div class=3D"gmail_extra">[#] wg setc=
onf wg0 /dev/fd/63</div><div class=3D"gmail_extra">[#] ip address add <a hr=
ef=3D"http://10.0.0.3/24">10.0.0.3/24</a> dev wg0</div><div class=3D"gmail_=
extra">[#] ip link set mtu 1420 dev wg0</div><div class=3D"gmail_extra">[#]=
 ip link set wg0 up</div><div class=3D"gmail_extra">pi@raspberrypi:~ $ ping=
 10.0.0.6</div><div class=3D"gmail_extra">PING 10.0.0.6 (10.0.0.6) 56(84) b=
ytes of data.</div><div class=3D"gmail_extra">64 bytes from <a href=3D"http=
://10.0.0.6">10.0.0.6</a>: icmp_seq=3D1 ttl=3D64 time=3D5015 ms</div><div c=
lass=3D"gmail_extra">64 bytes from <a href=3D"http://10.0.0.6">10.0.0.6</a>=
: icmp_seq=3D2 ttl=3D64 time=3D4009 ms</div><div class=3D"gmail_extra">64 b=
ytes from <a href=3D"http://10.0.0.6">10.0.0.6</a>: icmp_seq=3D3 ttl=3D64 t=
ime=3D2969 ms</div><div class=3D"gmail_extra">64 bytes from <a href=3D"http=
://10.0.0.6">10.0.0.6</a>: icmp_seq=3D4 ttl=3D64 time=3D1929 ms</div><div c=
lass=3D"gmail_extra">64 bytes from <a href=3D"http://10.0.0.6">10.0.0.6</a>=
: icmp_seq=3D5 ttl=3D64 time=3D890 ms</div><div class=3D"gmail_extra">64 by=
tes from <a href=3D"http://10.0.0.6">10.0.0.6</a>: icmp_seq=3D6 ttl=3D64 ti=
me=3D0.829 ms</div><div class=3D"gmail_extra">64 bytes from <a href=3D"http=
://10.0.0.6">10.0.0.6</a>: icmp_seq=3D7 ttl=3D64 time=3D4.16 ms</div><div c=
lass=3D"gmail_extra">64 bytes from <a href=3D"http://10.0.0.6">10.0.0.6</a>=
: icmp_seq=3D8 ttl=3D64 time=3D0.883 ms</div><div class=3D"gmail_extra">64 =
bytes from <a href=3D"http://10.0.0.6">10.0.0.6</a>: icmp_seq=3D9 ttl=3D64 =
time=3D0.849 ms</div><div class=3D"gmail_extra">64 bytes from <a href=3D"ht=
tp://10.0.0.6">10.0.0.6</a>: icmp_seq=3D10 ttl=3D64 time=3D4.08 ms</div><di=
v class=3D"gmail_extra">^C</div><div class=3D"gmail_extra">--- 10.0.0.6 pin=
g statistics ---</div><div class=3D"gmail_extra">10 packets transmitted, 10=
 received, 0% packet loss, time 9245ms</div><div class=3D"gmail_extra">rtt =
min/avg/max/mdev =3D 0.829/1482.655/5015.674/1805.291 ms, pipe 5</div><div =
class=3D"gmail_extra">pi@raspberrypi:~ $ ^C</div><div class=3D"gmail_extra"=
>pi@raspberrypi:~ $ ifconfig</div><div class=3D"gmail_extra">eth0 =C2=A0 =
=C2=A0 =C2=A0Link encap:Ethernet =C2=A0HWaddr b8:27:eb:ab:0e:3b =C2=A0</div=
><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:10=
.42.0.2 =C2=A0Bcast:10.42.0.255 =C2=A0Mask:255.255.255.0</div><div class=3D=
"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fe80::ba27:ebf=
f:feab:e3b/64 Scope:Link</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metri=
c:1</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX p=
ackets:638 errors:0 dropped:0 overruns:0 frame:0</div><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:316 errors:0 dropped:0 =
overruns:0 carrier:0</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 collisions:0 txqueuelen:1000=C2=A0</div><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:73672 (71.9 KiB) =C2=A0TX=
 bytes:38774 (37.8 KiB)</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">lo =C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Local Loopback =
=C2=A0</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
net addr:127.0.0.1 =C2=A0Mask:255.0.0.0</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host</div><div cl=
ass=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING =
=C2=A0MTU:65536 =C2=A0Metric:1</div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns:0 frame:0=
</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX pack=
ets:0 errors:0 dropped:0 overruns:0 carrier:0</div><div class=3D"gmail_extr=
a">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1=C2=A0</div>=
<div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0=
.0 B) =C2=A0TX bytes:0 (0.0 B)</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">wg0 =C2=A0 =C2=A0 =C2=A0 Link encap:UNSPEC =C2=A0H=
Waddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00 =C2=A0</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:10.0.0.3 =C2=
=A0P-t-P:10.0.0.3 =C2=A0Mask:255.255.255.0</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP POINTOPOINT RUNNING NOARP =C2=A0MTU:1=
420 =C2=A0Metric:1</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 RX packets:307 errors:0 dropped:0 overruns:0 frame:0</div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:50 error=
s:0 dropped:0 overruns:0 carrier:0</div><div class=3D"gmail_extra">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1=C2=A0</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:25812 (25.2 Ki=
B) =C2=A0TX bytes:3988 (3.8 KiB)</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">pi@raspberrypi:~ $ nano w</div><div class=3D"gma=
il_extra">pi@raspberrypi:~ $ ^C</div><div class=3D"gmail_extra">pi@raspberr=
ypi:~ $ cd /etc/wireguard/</div><div class=3D"gmail_extra">pi@raspberrypi:/=
etc/wireguard $ nano wg0.conf=C2=A0</div><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_extra">pi@raspberrypi:/etc/wireguard $ ping 10.0.0.2</div><div=
 class=3D"gmail_extra">PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.</div>=
<div class=3D"gmail_extra">^C</div><div class=3D"gmail_extra">--- 10.0.0.2 =
ping statistics ---</div><div class=3D"gmail_extra">23 packets transmitted,=
 0 received, 100% packet loss, time 22891ms</div></div></div><div class=3D"=
gmail_extra">&lt;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt=
;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><b><=
font size=3D"4">Summarry</font></b>:</div><div class=3D"gmail_extra">Q1: Ho=
w can I connectivity between L1 and L2?</div><div class=3D"gmail_extra">Q2:=
 Do I need to maintain two different wireguard interfaces for each LAN conn=
ection?<br>Q3: If answer to Q2 is yes then how L2 can ping to pi?<br>Q4: Wh=
y pi can&#39;t ping to L2?<br>Terminal response will verifies the problem.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">&lt;=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra"><b><font size=3D"4">PS: A=
pologies for disturbing on weekends. Didn&#39;t realize weekend part.=C2=A0=
</font></b></div><div class=3D"gmail_extra"><b><font size=3D"4">These are s=
ummer holidays here. Each day is same to me.<br>Some of people like, you, E=
ric,Christian Hesse etc. are super experts on certain matters.<br>My selfis=
hness is that I want the quick response to accelerate work.</font></b></div=
><div class=3D"gmail_extra"><b><font size=3D"4">So approached in this manne=
r.<br><br></font></b></div><div class=3D"gmail_extra"><b><font size=3D"4">N=
ot sure of duplicate part. I think I only send two messages.<br>One solutio=
n to problem and other requesting the tutorial.<br>Next time I will maintai=
n single thread for particular problem.<br>Please reply whenever feel free.=
</font></b><br>=F0=9F=98=8A<br><br>Sorry and Thanks again<br>Sahil Gupta</d=
iv><div class=3D"gmail_extra"><br></div></div></div>

--f403045c4622f13060055619ef3c--
