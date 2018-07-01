Return-Path: b.candler@pobox.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3042d845
 for <wireguard@lists.zx2c4.com>; Sun, 1 Jul 2018 10:38:00 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af4ab6d4
 for <wireguard@lists.zx2c4.com>; Sun, 1 Jul 2018 10:38:00 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id DC696FD8F5
 for <wireguard@lists.zx2c4.com>; Sun,  1 Jul 2018 06:44:09 -0400 (EDT)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id D32AFFD8F4
 for <wireguard@lists.zx2c4.com>; Sun,  1 Jul 2018 06:44:09 -0400 (EDT)
Received: from MacBook-Pro-2.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id D6A05FD8F3
 for <wireguard@lists.zx2c4.com>; Sun,  1 Jul 2018 06:44:08 -0400 (EDT)
To: wireguard@lists.zx2c4.com
From: Brian Candler <b.candler@pobox.com>
Subject: Automatically add host route when peer address is within AllowedIPs?
Message-ID: <1ea11592-82e2-1e90-acc1-52fd183d675f@pobox.com>
Date: Sun, 1 Jul 2018 11:44:07 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------62FA87B6D7A3F40E22EF76CB"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------62FA87B6D7A3F40E22EF76CB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I have a problem where I want to tunnel packets to a remote subnet, but=20
that remote subnet also includes the external IP of the wireguard=20
server.=C2=A0 When that happens, the client goes into a loop which soaks =
up=20
100% of CPU.

Here's the test setup:


 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 10.12.255/24=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.12.2=
54/24
--+--------+----------------- Router ------+----------------
 =C2=A0 | .11=C2=A0 =C2=A0 | .12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 .1=C2=A0=C2=A0=C2=A0=C2=A0 .1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | .115
Target=C2=A0 =C2=A0=C2=A0 WG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WG
 =C2=A0Host =C2=A0=C2=A0 server=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 client


* Wireguard "Server": Ubuntu 16.04, wireguard 0.0.20180620-wg1~xenial=20
from PPA

* Wireguard "Client": macOS 10.12.6, wireguard-tools 0.0.20180625=20
installed from Homebrew

* Tunnel subnet is 10.12.0/24; the router has a static route to=20
10.12.0/24 via 10.12.255.12

* I want to reach hosts 10.12.255.x via the tunnel, such as target host=20
10.12.255.11

---- Server config ----

[Interface]
PrivateKey =3D <snip>
ListenPort =3D XXXXX
Address =3D 10.12.0.1/24

[Peer]
PublicKey =3D GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D
AllowedIPs =3D 10.12.0.0/24

---- Client config ----

[Interface]
PrivateKey =3D <snip>
ListenPort =3D YYYYY
Address =3D 10.12.0.2/24

[Peer]
PublicKey =3D 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D
EndPoint =3D 10.12.255.12:XXXXX
#AllowedIPs =3D 10.12.0.0/24=C2=A0=C2=A0 # (1)ok
#AllowedIPs =3D 0.0.0.0/0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # (2) ok
#AllowedIPs =3D 10.12.0.0/16=C2=A0=C2=A0 # (3) fail
AllowedIPs =3D 10.12.0.0/24, 10.12.255.0/24=C2=A0 # (4) fail
PersistentKeepalive =3D 22

It works with (1) AllowedIPs =3D 10.12.0.0/24: the client can ping the=20
server 10.12.0.1.=C2=A0 And it works with (2) AllowedIPs =3D 0.0.0.0/0: I=
 can=20
ping the target subnet (but also all my Internet traffic is routed down=20
the tunnel, which I don't want).

However with configuration (3) or (4), shortly after I do "wg-quick up=20
wg0", CPU load on the macOS client jumps to 100%, as shown by Activity=20
Monitor or top -u, and the fans spin up.


bash-3.2# wg-quick up wg0
[#] wireguard-go utun
WARNING WARNING WARNING WARNING WARNING WARNING WARNING
W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 G
W=C2=A0=C2=A0 This is alpha software. It will very likely not=C2=A0=C2=A0=
 G
W=C2=A0=C2=A0 do what it is supposed to do, and things may go=C2=A0=C2=A0=
 G
W=C2=A0=C2=A0 horribly wrong. You have been warned. Proceed=C2=A0=C2=A0=C2=
=A0=C2=A0 G
W=C2=A0=C2=A0 at your own risk.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 G
W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 G
WARNING WARNING WARNING WARNING WARNING WARNING WARNING
INFO: (utun1) 2018/07/01 10:56:26 Starting wireguard-go version 0.0.20180=
613
[+] Interface for wg0 is utun1
[#] wg setconf utun1 /dev/fd/63
[#] ifconfig utun1 inet 10.12.0.2/24 10.12.0.2 alias
[#] ifconfig utun1 up
[#] route -q -n add -inet 10.12.255.0/24 -interface utun1
[#] route -q -n add -inet 10.12.0.0/24 -interface utun1
[+] Backgrounding route monitor

Within about 20 seconds, CPU usage jumps up to max. "wg" shows huge=20
amounts of traffic sent.=C2=A0 The following are captured at approximatel=
y 1=20
second intervals:

bash-3.2# wg
interface: utun1
 =C2=A0 public key: GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D
 =C2=A0 private key: (hidden)
 =C2=A0 listening port: YYYYY

peer: 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D
 =C2=A0 endpoint: 10.12.255.12:XXXXX
 =C2=A0 allowed ips: 10.12.0.0/24, 10.12.255.0/24
 =C2=A0 latest handshake: 39 seconds ago
 =C2=A0 transfer: 0 B received, *629.43 MiB sent*
 =C2=A0 persistent keepalive: every 22 seconds
bash-3.2# wg
interface: utun1
 =C2=A0 public key: GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D
 =C2=A0 private key: (hidden)
 =C2=A0 listening port: YYYYY

peer: 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D
 =C2=A0 endpoint: 10.12.255.12:XXXXX
 =C2=A0 allowed ips: 10.12.0.0/24, 10.12.255.0/24
 =C2=A0 latest handshake: 41 seconds ago
 =C2=A0 transfer: 0 B received, *694.98 MiB sent*
 =C2=A0 persistent keepalive: every 22 seconds
bash-3.2# wg
interface: utun1
 =C2=A0 public key: GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D
 =C2=A0 private key: (hidden)
 =C2=A0 listening port: YYYYY

peer: 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D
 =C2=A0 endpoint: 10.12.255.12:XXXXX
 =C2=A0 allowed ips: 10.12.0.0/24, 10.12.255.0/24
 =C2=A0 latest handshake: 43 seconds ago
 =C2=A0 transfer: 0 B received, *765.37 MiB sent*
 =C2=A0 persistent keepalive: every 22 seconds

But tcpdump shows only an initial exchange of packets:

$ sudo tcpdump -i en0 -nn udp port YYYYY or udp port XXXXX
Password:
tcpdump: verbose output suppressed, use -v or -vv for full protocol decod=
e
listening on en0, link-type EN10MB (Ethernet), capture size 262144 bytes
11:06:07.340249 IP 10.12.254.115.YYYYY > 10.12.255.12.XXXXX: UDP, length =
148
11:06:07.343687 IP 10.12.255.12.XXXXX > 10.12.254.115.YYYYY: UDP, length =
92
11:06:07.344060 IP 10.12.254.115.YYYYY > 10.12.255.12.XXXXX: UDP, length =
32


I suspect the problem is to do with the server external IP of=20
10.12.255.12 being within the AllowedIPs =3D 10.12.255.0/24 range. While=20
the tunnel is up, here is the routing table on the client:

bash-3.2# netstat -rn
Routing tables

Internet:
Destination=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags Refs=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Use=C2=A0=C2=A0 Netif Expire
default=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UGSc 15=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun=
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 USc 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun=
1
10.12.0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.12.0.2=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1
10.12.254/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 6=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.254.1/32=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64:d1:54:xx:xx:xx=C2=
=A0 UHLWIir 19=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 67=C2=A0=C2=A0=C2=A0=C2=
=A0 en0=C2=A0=C2=A0 1197
10.12.254.100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =C2=A0=C2=A0 =
UHLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1127
10.12.254.101=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b8:e9:37:xx:x:xx =C2=A0 UHLWI=
 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en=
0=C2=A0=C2=A0 1125
10.12.254.103=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:x =C2=A0=C2=A0=C2=
=A0 UHLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=
=C2=A0 en0=C2=A0=C2=A0 1109
10.12.254.104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =C2=A0=C2=A0 =
UHLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1088
10.12.254.115/32=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.254.117=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44:d2:44:xx:xx:xx=C2=A0 UHLWI=
 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en=
0=C2=A0=C2=A0 1177
10.12.255/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun1=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USc 1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1
127=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0=C2=A0 lo0
127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 127.0.0.1=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 122329=C2=A0=
=C2=A0=C2=A0=C2=A0 lo0
169.254=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=
=C2=A0 en0
192.168.56=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#11=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 vboxnet
224.0.0/4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UmC=
S 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 e=
n0
224.0.0.251=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:0:5e:0:0:fb=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 UHmLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
239.255.255.250=C2=A0=C2=A0=C2=A0 1:0:5e:7f:ff:fa=C2=A0=C2=A0=C2=A0 UHmLW=
I 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12=C2=A0=C2=A0=C2=A0=C2=A0 en0
255.255.255.255/32 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0=C2=A0=C2=A0=C2=A0=C2=A0 en0

That seems to be it: if it were to send encrypted packets to=20
10.12.255.12 during this time, then they would be sent back down utun1=20
to be re-encrypted again.

However, it does work fine with AllowedIPs =3D 0.0.0.0/0.=C2=A0 Here is t=
he=20
routing table when I do that:

bash-3.2# netstat -rn
Routing tables

Internet:
Destination=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags Refs=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Use=C2=A0=C2=A0 Netif Expire
0/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 USc 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1=C2=A0=C2=A0 utun1
default=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UGSc 11=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.12.0.2=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1
10.12.254/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 7=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.254.1/32=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64:d1:54:xx:xx:xx=C2=
=A0 UHLWIir 7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 180=C2=A0=C2=A0=C2=A0=C2=A0 e=
n0=C2=A0=C2=A0 1197
10.12.254.100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =C2=A0=C2=A0 =
UHLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 963
10.12.254.101=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b8:e9:37:xx:x:xx =C2=A0 UHLWI=
 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en=
0=C2=A0=C2=A0=C2=A0 961
10.12.254.103=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:x =C2=A0=C2=A0=C2=
=A0 UHLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=
=C2=A0 en0=C2=A0=C2=A0=C2=A0 945
10.12.254.104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =C2=A0=C2=A0 =
UHLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 924
10.12.254.107=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9c:4:eb:xx:xx:xx =C2=A0 UHLWI=
 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en=
0=C2=A0=C2=A0=C2=A0 708
10.12.254.115/32=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
10.12.254.117=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44:d2:44:xx:xx:xx=C2=A0 UHLWI=
 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 en=
0=C2=A0=C2=A0 1163
10.12.254.255=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff:ff:ff:ff:ff:ff=C2=A0 UHLWb=
I 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=A0=C2=A0 e=
n0
*10.12.255.12=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.12.254.1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UGHS 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 93=C2=A0=C2=A0=C2=A0=C2=A0 en0**
*127=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 lo0
127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 127.0.0.1=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 122329=C2=A0=
=C2=A0=C2=A0=C2=A0 lo0
128.0/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 USc 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 u=
tun1
169.254=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=
=C2=A0 en0
192.168.56=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#11=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS 2=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 vboxnet
192.168.56.255=C2=A0=C2=A0=C2=A0=C2=A0 ff:ff:ff:ff:ff:ff=C2=A0 UHLWbI 0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 vboxnet
224.0.0/4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UmC=
S 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 e=
n0
224.0.0.251=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:0:5e:0:0:fb=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 UHmLWI 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0=C2=A0=C2=A0=C2=A0=C2=A0 en0
239.255.255.250=C2=A0=C2=A0=C2=A0 1:0:5e:7f:ff:fa=C2=A0=C2=A0=C2=A0 UHmLW=
I 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 76=C2=A0=C2=A0=C2=A0=C2=A0 en0
255.255.255.255/32 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 UCS 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0=C2=A0=C2=A0=C2=A0=C2=A0 en0

I see that a specific host route has been added for 10.12.255.12.

INFO: (utun1) 2018/07/01 11:30:01 Starting wireguard-go version 0.0.20180=
613
[+] Interface for wg0 is utun1
[#] wg setconf utun1 /dev/fd/63
[#] ifconfig utun1 inet 10.12.0.2/24 10.12.0.2 alias
[#] ifconfig utun1 up
[#] route -q -n add -inet 0.0.0.0/1 -interface utun1
[#] route -q -n add -inet 128.0.0.0/1 -interface utun1
*[#] route -q -n add -inet 10.12.255.12 -gateway 10.12.254.1**
*[+] Backgrounding route monitor

And I find this is documented - the wg-quick manpage says:

/"If one of those routes is the default route (0.0.0.0/0 or ::/0), then=20
it uses ip-rule(8) to handle overriding of the default gateway."/

So I think the answer is straightforward: I would like this rule to be=20
added when the target IP is within any AllowedIPs subnet, not just for=20
0.0.0.0/0.=C2=A0 Would you agree?

If I add this route manually, everything seems to work fine.

Thanks,

Brian Candler.


--------------62FA87B6D7A3F40E22EF76CB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>I have a problem where I want to tunnel packets to a remote
      subnet, but that remote subnet also includes the external IP of
      the wireguard server.=C2=A0 When that happens, the client goes into=
 a
      loop which soaks up 100% of CPU.<br>
    </p>
    <p>Here's the test setup:<br>
    </p>
    <p><br>
    </p>
    <p><tt>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 10.12.255/24=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 10.12.254/24<br>
        --+--------+----------------- Router ------+----------------</tt>=
<tt><br>
      </tt><tt>=C2=A0 | .11=C2=A0 =C2=A0 | .12</tt><tt>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 .1=C2=A0=C2=A0=C2=A0=C2=A0 .1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
        .115<br>
        Target=C2=A0 =C2=A0=C2=A0 WG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WG<br>
      </tt><tt>=C2=A0Host =C2=A0=C2=A0 server=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 client</tt><br>
    </p>
    <p><br>
    </p>
    <p>* Wireguard "Server": Ubuntu 16.04, wireguard
      0.0.20180620-wg1~xenial from PPA</p>
    <p>* Wireguard "Client": macOS 10.12.6, wireguard-tools 0.0.20180625
      installed from Homebrew</p>
    <p>* Tunnel subnet is 10.12.0/24; the router has a static route to
      10.12.0/24 via 10.12.255.12<br>
    </p>
    <p>* I want to reach hosts 10.12.255.x via the tunnel, such as
      target host 10.12.255.11<br>
      <br>
      <tt>---- Server config ----</tt><tt><br>
      </tt></p>
    <p><tt>[Interface]</tt><tt><br>
      </tt><tt>PrivateKey =3D &lt;snip&gt;</tt><tt><br>
      </tt><tt>ListenPort =3D XXXXX</tt><tt><br>
      </tt><tt>Address =3D 10.12.0.1/24</tt><tt><br>
      </tt><tt><br>
      </tt><tt>[Peer]</tt><tt><br>
      </tt><tt>PublicKey =3D GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D=
</tt><tt><br>
      </tt><tt>AllowedIPs =3D 10.12.0.0/24</tt></p>
    <p><tt>---- Client config ----</tt></p>
    <p><tt>[Interface]</tt><tt><br>
      </tt><tt>PrivateKey =3D &lt;snip&gt;</tt><tt><br>
      </tt><tt>ListenPort =3D YYYYY</tt><tt><br>
      </tt><tt>Address =3D 10.12.0.2/24</tt><tt><br>
      </tt><tt><br>
      </tt><tt>[Peer]</tt><tt><br>
      </tt><tt>PublicKey =3D 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D=
</tt><tt><br>
      </tt><tt>EndPoint =3D 10.12.255.12:XXXXX</tt><tt><br>
      </tt><tt>#AllowedIPs =3D 10.12.0.0/24=C2=A0=C2=A0 # (1)</tt><tt> ok=
<br>
      </tt><tt>#AllowedIPs =3D 0.0.0.0/0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
(2) ok</tt><tt><br>
      </tt><tt>#AllowedIPs =3D 10.12.0.0/16=C2=A0=C2=A0 # (3) fail</tt><t=
t><br>
      </tt><tt>
        AllowedIPs =3D 10.12.0.0/24, 10.12.255.0/24=C2=A0 # (4) fail</tt>=
<tt><br>
      </tt><tt>PersistentKeepalive =3D 22</tt></p>
    <p>It works with (1) AllowedIPs =3D 10.12.0.0/24: the client can ping
      the server 10.12.0.1.=C2=A0 And it works with (2) AllowedIPs =3D
      0.0.0.0/0: I can ping the target subnet (but also all my Internet
      traffic is routed down the tunnel, which I don't want).<br>
    </p>
    <p>However with configuration (3) or (4), shortly after I do
      "wg-quick up wg0", CPU load on the macOS client jumps to 100%, as
      shown by Activity Monitor or top -u, and the fans spin up.</p>
    <p><br>
    </p>
    <tt>bash-3.2# wg-quick up wg0</tt><tt><br>
    </tt><tt>[#] wireguard-go utun</tt><tt><br>
    </tt><tt>WARNING WARNING WARNING WARNING WARNING WARNING WARNING</tt>=
<tt><br>
    </tt><tt>W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 G</tt><tt><br>
    </tt><tt>W=C2=A0=C2=A0 This is alpha software. It will very likely no=
t=C2=A0=C2=A0 G</tt><tt><br>
    </tt><tt>W=C2=A0=C2=A0 do what it is supposed to do, and things may g=
o=C2=A0=C2=A0 G</tt><tt><br>
    </tt><tt>W=C2=A0=C2=A0 horribly wrong. You have been warned. Proceed=C2=
=A0=C2=A0=C2=A0=C2=A0 G</tt><tt><br>
    </tt><tt>W=C2=A0=C2=A0 at your own risk.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 G</tt><tt><br>
    </tt><tt>W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 G</tt><tt><br>
    </tt><tt>WARNING WARNING WARNING WARNING WARNING WARNING WARNING</tt>=
<tt><br>
    </tt><tt>INFO: (utun1) 2018/07/01 10:56:26 Starting wireguard-go
      version 0.0.20180613</tt><tt><br>
    </tt><tt>[+] Interface for wg0 is utun1</tt><tt><br>
    </tt><tt>[#] wg setconf utun1 /dev/fd/63</tt><tt><br>
    </tt><tt>[#] ifconfig utun1 inet 10.12.0.2/24 10.12.0.2 alias</tt><tt=
><br>
    </tt><tt>[#] ifconfig utun1 up</tt><tt><br>
    </tt><tt>[#] route -q -n add -inet 10.12.255.0/24 -interface utun1</t=
t><tt><br>
    </tt><tt>[#] route -q -n add -inet 10.12.0.0/24 -interface utun1</tt>=
<tt><br>
    </tt><tt>[+] Backgrounding route monitor</tt><tt><br>
    </tt><br>
    Within about 20 seconds, CPU usage jumps up to max. "wg" shows huge
    amounts of traffic sent.=C2=A0 The following are captured at
    approximately 1 second intervals:<br>
    <br>
    <tt>bash-3.2# wg<br>
      interface: utun1<br>
      =C2=A0 public key: GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D<b=
r>
      =C2=A0 private key: (hidden)<br>
      =C2=A0 listening port: YYYYY<br>
      <br>
      peer: 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D<br>
      =C2=A0 endpoint: 10.12.255.12:XXXXX<br>
      =C2=A0 allowed ips: 10.12.0.0/24, 10.12.255.0/24<br>
      =C2=A0 latest handshake: 39 seconds ago<br>
      =C2=A0 transfer: 0 B received, <b>629.43 MiB sent</b><br>
      =C2=A0 persistent keepalive: every 22 seconds<br>
      bash-3.2# wg<br>
      interface: utun1<br>
      =C2=A0 public key: GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D<b=
r>
      =C2=A0 private key: (hidden)<br>
      =C2=A0 listening port: YYYYY<br>
      <br>
      peer: 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D<br>
      =C2=A0 endpoint: 10.12.255.12:XXXXX<br>
      =C2=A0 allowed ips: 10.12.0.0/24, 10.12.255.0/24<br>
      =C2=A0 latest handshake: 41 seconds ago<br>
      =C2=A0 transfer: 0 B received, <b>694.98 MiB sent</b><br>
      =C2=A0 persistent keepalive: every 22 seconds<br>
      bash-3.2# wg<br>
      interface: utun1<br>
      =C2=A0 public key: GtMlTPv3tL++jG1eI2h7gJuuozgDp5F6iF+JUu0I/Fo=3D<b=
r>
      =C2=A0 private key: (hidden)<br>
      =C2=A0 listening port: YYYYY<br>
      <br>
      peer: 1kEwJOwzfMARwZG9H+A1QMfL3F76HZoxDhn1ciRdPnY=3D<br>
      =C2=A0 endpoint: 10.12.255.12:XXXXX<br>
      =C2=A0 allowed ips: 10.12.0.0/24, 10.12.255.0/24<br>
      =C2=A0 latest handshake: 43 seconds ago<br>
      =C2=A0 transfer: 0 B received, <b>765.37 MiB sent</b><br>
      =C2=A0 persistent keepalive: every 22 seconds</tt><tt></tt><br>
    <br>
    But tcpdump shows only an initial exchange of packets:<br>
    <br>
    <tt>$ sudo tcpdump -i en0 -nn udp port YYYYY or udp port XXXXX</tt><t=
t><br>
    </tt><tt>Password:</tt><tt><br>
    </tt><tt>tcpdump: verbose output suppressed, use -v or -vv for full
      protocol decode</tt><tt><br>
    </tt><tt>listening on en0, link-type EN10MB (Ethernet), capture size
      262144 bytes</tt><tt><br>
    </tt><tt>11:06:07.340249 IP 10.12.254.115.YYYYY &gt;
      10.12.255.12.XXXXX: UDP, length 148</tt><tt><br>
    </tt><tt>11:06:07.343687 IP 10.12.255.12.XXXXX &gt;
      10.12.254.115.YYYYY: UDP, length 92</tt><tt><br>
    </tt><tt>11:06:07.344060 IP 10.12.254.115.YYYYY &gt;
      10.12.255.12.XXXXX: UDP, length 32</tt><tt><br>
    </tt><tt><br>
    </tt><br>
    I suspect the problem is to do with the server external IP of
    10.12.255.12 being within the AllowedIPs =3D 10.12.255.0/24 range.=C2=
=A0
    While the tunnel is up, here is the routing table on the client:<br>
    <br>
    <tt>bash-3.2# netstat -rn</tt><tt><br>
    </tt><tt>Routing tables</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Internet:</tt><tt><br>
    </tt><tt>Destination=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Gatewa=
y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      Refs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use=C2=A0=C2=A0 Netif Expire</tt=
><tt><br>
    </tt><tt>default=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UGSc=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=
=A0 en0</tt><tt><br>
    </tt><tt>10.12/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 USc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1</tt=
><tt><br>
    </tt><tt>10.12.0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 10.12.0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1</tt=
><tt><br>
    </tt><tt>10.12.254/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>10.12.254.1/32=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64:d1:=
54:xx:xx:xx=C2=A0 UHLWIir=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      19=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 67=C2=A0=C2=A0=C2=A0=C2=A0 e=
n0=C2=A0=C2=A0 1197</tt><tt><br>
    </tt><tt>10.12.254.100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =
=C2=A0=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1127</tt><tt><br>
    </tt><tt>10.12.254.101=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b8:e9:37:xx:x:xx=
 =C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1125</tt><tt><br>
    </tt><tt>10.12.254.103=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:x =C2=
=A0=C2=A0=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1109</tt><tt><br>
    </tt><tt>10.12.254.104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =
=C2=A0=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1088</tt><tt><br>
    </tt><tt>10.12.254.115/32=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>10.12.254.117=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44:d2:44:xx:xx:x=
x=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1177</tt><tt><br>
    </tt><tt>10.12.255/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
USc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1</tt=
><tt><br>
    </tt><tt>127=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 lo0</tt><tt><br>
    </tt><tt>127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1=C2=A0=C2=A0
      122329=C2=A0=C2=A0=C2=A0=C2=A0 lo0</tt><tt><br>
    </tt><tt>169.254=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>192.168.56=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l=
ink#11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 vboxnet</tt><tt><br>
    </tt><tt>224.0.0/4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UmCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
      2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>224.0.0.251=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:0:5e=
:0:0:fb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UHmLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>239.255.255.250=C2=A0=C2=A0=C2=A0 1:0:5e:7f:ff:fa=C2=A0=C2=A0=
=C2=A0 UHmLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12=C2=A0=C2=A0=C2=A0=C2=A0 en=
0</tt><tt><br>
    </tt><tt>255.255.255.255/32 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><br>
    <br>
    That seems to be it: if it were to send encrypted packets to
    10.12.255.12 during this time, then they would be sent back down
    utun1 to be re-encrypted again.<br>
    <br>
    However, it does work fine with AllowedIPs =3D 0.0.0.0/0.=C2=A0 Here =
is the
    routing table when I do that:<br>
    <br>
    <tt>bash-3.2# netstat -rn</tt><tt><br>
    </tt><tt>Routing tables</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Internet:</tt><tt><br>
    </tt><tt>Destination=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Gatewa=
y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      Refs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use=C2=A0=C2=A0 Netif Expire</tt=
><tt><br>
    </tt><tt>0/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0 utun1</tt=
><tt><br>
    </tt><tt>default=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UGSc=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=
=A0 en0</tt><tt><br>
    </tt><tt>10.12.0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 10.12.0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1</tt=
><tt><br>
    </tt><tt>10.12.254/24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>10.12.254.1/32=C2=A0=C2=A0=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>10.12.254.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64:d1:=
54:xx:xx:xx=C2=A0 UHLWIir=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 180=C2=A0=C2=A0=C2=A0=C2=A0 en0=C2=A0=
=C2=A0 1197</tt><tt><br>
    </tt><tt>10.12.254.100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =
=C2=A0=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 963</tt><tt><br>
    </tt><tt>10.12.254.101=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b8:e9:37:xx:x:xx=
 =C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 961</tt><tt><br>
    </tt><tt>10.12.254.103=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:x =C2=
=A0=C2=A0=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 945</tt><tt><br>
    </tt><tt>10.12.254.104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:e:58:xx:xx:xx =
=C2=A0=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 924</tt><tt><br>
    </tt><tt>10.12.254.107=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9c:4:eb:xx:xx:xx=
 =C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0=C2=A0 708</tt><tt><br>
    </tt><tt>10.12.254.115/32=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>10.12.254.117=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44:d2:44:xx:xx:x=
x=C2=A0 UHLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0=C2=A0=C2=A0 1163</tt><tt><br>
    </tt><tt>10.12.254.255=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff:ff:ff:ff:ff:f=
f=C2=A0 UHLWbI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><b><tt>10.12.255.12=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.12.25=
4.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UGHS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 93=C2=A0=C2=A0=C2=A0=C2=A0 =
en0</tt></b><b><tt><br>
      </tt></b><tt>127=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 lo0</tt><tt><br>
    </tt><tt>127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 127.0.0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1=C2=A0=C2=A0
      122329=C2=A0=C2=A0=C2=A0=C2=A0 lo0</tt><tt><br>
    </tt><tt>128.0/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 USc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
      1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 utun1</tt=
><tt><br>
    </tt><tt>169.254=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>192.168.56=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l=
ink#11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 vboxnet</tt><tt><br>
    </tt><tt>192.168.56.255=C2=A0=C2=A0=C2=A0=C2=A0 ff:ff:ff:ff:ff:ff=C2=A0=
 UHLWbI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 vboxnet</tt><tt><br>
    </tt><tt>224.0.0/4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UmCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
      2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>224.0.0.251=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:0:5e=
:0:0:fb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UHmLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><tt><br>
    </tt><tt>239.255.255.250=C2=A0=C2=A0=C2=A0 1:0:5e:7f:ff:fa=C2=A0=C2=A0=
=C2=A0 UHmLWI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 76=C2=A0=C2=A0=C2=A0=C2=A0 en=
0</tt><tt><br>
    </tt><tt>255.255.255.255/32 link#4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
 en0</tt><br>
    <br>
    I see that a specific host route has been added for 10.12.255.12.<br>
    <br>
    <tt>INFO: (utun1) 2018/07/01 11:30:01 Starting wireguard-go version
      0.0.20180613</tt><tt><br>
    </tt><tt>[+] Interface for wg0 is utun1</tt><tt><br>
    </tt><tt>[#] wg setconf utun1 /dev/fd/63</tt><tt><br>
    </tt><tt>[#] ifconfig utun1 inet 10.12.0.2/24 10.12.0.2 alias</tt><tt=
><br>
    </tt><tt>[#] ifconfig utun1 up</tt><tt><br>
    </tt><tt>[#] route -q -n add -inet 0.0.0.0/1 -interface utun1</tt><tt=
><br>
    </tt><tt>[#] route -q -n add -inet 128.0.0.0/1 -interface utun1</tt><=
tt><br>
    </tt><tt><b>[#] route -q -n add -inet 10.12.255.12 -gateway
        10.12.254.1</b></tt><tt><b><br>
      </b></tt><tt>[+] Backgrounding route monitor</tt><br>
    <br>
    And I find this is documented - the wg-quick manpage says:<br>
    <br>
    <i>"If one of those routes is the default route (0.0.0.0/0 or ::/0),
      then it uses ip-rule(8) to handle overriding of the default
      gateway."</i><br>
    <br>
    So I think the answer is straightforward: I would like this rule to
    be added when the target IP is within any AllowedIPs subnet, not
    just for 0.0.0.0/0.=C2=A0 Would you agree?<br>
    <br>
    If I add this route manually, everything seems to work fine.<br>
    <br>
    Thanks,<br>
    <br>
    Brian Candler.<br>
    <br>
  </body>
</html>

--------------62FA87B6D7A3F40E22EF76CB--
