Return-Path: svar@tutanota.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b7e7eba
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Feb 2018 15:47:53 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8a84687
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Feb 2018 15:47:53 +0000 (UTC)
Received: from w1.tutanota.de (unknown [192.168.1.162])
 by w1.tutanota.de (Postfix) with ESMTP id 00716FBA846
 for <wireguard@lists.zx2c4.com>; Mon, 26 Feb 2018 15:56:14 +0000 (UTC)
From: <svar@tutanota.com>
To: <wireguard@lists.zx2c4.com>
Message-ID: <L6Hp1RB--3-0@tutanota.com>
Subject: few wg peers over the same port in the main office? Cryptokey routing
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_2396_2138303936.1519660574982"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Date: Mon, 26 Feb 2018 15:47:56 -0000

------=_Part_2396_2138303936.1519660574982
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

First of all a BIG thanks to developers for great job!

There is a main office with WG running on Lede reboot (17.01.4) with ports =
51820 and 51821. Until I've two peers, one pointing to port 51820 and 2nd t=
o 51821 everything worked fine.
Now I want to add another one peer to have 3 remote peers in total. The que=
stions is:
should I open the new port for each remote peer to connect? It's how wg wor=
ks? How to run few tunnels/peers on the same port 51820 for example? Does C=
ryptokey routing can work in this way over one port only instead opening th=
ird one 51822?

As If I try to use the same port for two peers, the 2nd peer for the same p=
ort will not create interface. See evidence bellow.
Once ifconfig brings T1 interface up (listening on 51820 port), the TU inte=
rface can't be raised up as it listens on the same port 51820.=20

# Lede reboot (17.01.4)
root@OpenWrt:~# wg
interface: T1
=C2=A0 public key: <deleted1>
=C2=A0 listening port: 51820

peer: <deleted2>
=C2=A0 endpoint: x.x.13.235:56649
=C2=A0 allowed ips: p.p.5.0/24
=C2=A0 latest handshake: 45 seconds ago
=C2=A0 transfer: 150.31 KiB received, 286.11 KiB sent

interface: RA
=C2=A0 public key: <deleted3>
=C2=A0 private key: (hidden)
=C2=A0 listening port: 51821

peer: <deleted4>
=C2=A0 endpoint: x.x.125.213:51820
=C2=A0 allowed ips: p.p.30.0/24, 10.1.1.16/30
=C2=A0 latest handshake: 54 seconds ago
=C2=A0 transfer: 285.81 KiB received, 14.89 KiB sent

interface: TU
=C2=A0 public key: <deleted5>
=C2=A0 private key: (hidden)
=C2=A0 listening port: 51820=C2=A0 # If I use THE SAME as for T1 interface,=
 it won't start. How to solve this?
peer: <deleted6>
=C2=A0 endpoint: x.x.147.136:51820
=C2=A0 allowed ips: p.p.57.0/24, 10.2.1.32/30

With p - rfc1918 private address space address is marked (local addresses)


Mon Feb 26 15:28:57 2018 daemon.notice netifd: Interface 'T' is now up
Mon Feb 26 15:28:57 2018 daemon.notice netifd: Network device 'T' link is u=
p
Mon Feb 26 15:28:57 2018 daemon.notice netifd: Interface 'RA' is now up
Mon Feb 26 15:28:57 2018 daemon.notice netifd: Network device 'RA' link is =
up
Mon Feb 26 15:28:57 2018 daemon.notice netifd: Interface 'TU' is now down
Mon Feb 26 15:28:58 2018 daemon.notice netifd: Interface 'TU' is setting up=
 now
Mon Feb 26 15:28:58 2018 daemon.notice netifd: Interface 'wan' is now up
Mon Feb 26 15:28:59 2018 kern.err kernel: [1972650.446719] wireguard: TU: C=
ould not create IPv4 socket
Mon Feb 26 15:28:59 2018 daemon.notice netifd: Interface 'TU' is now up

root@OpenWrt:~# ifconfig
RA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Link encap:UNSPEC=C2=A0 HWaddr=
 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet addr:10.1.1.16=
=C2=A0 P-t-P:10.1.1.16=C2=A0 Mask:255.255.255.252
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UP POINTOPOINT RUNNI=
NG NOARP=C2=A0 MTU:1420=C2=A0 Metric:1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RX packets:3 errors:=
0 dropped:0 overruns:0 frame:0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TX packets:3 errors:=
0 dropped:0 overruns:0 carrier:0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 collisions:0 txqueue=
len:1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RX bytes:444 (444.0 =
B)=C2=A0 TX bytes:612 (612.0 B)

T1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Link encap:UNSPEC=C2=A0 HWaddr=
 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UP POINTOPOINT RUNNI=
NG NOARP=C2=A0 MTU:1420=C2=A0 Metric:1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RX packets:312 error=
s:0 dropped:0 overruns:0 frame:0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TX packets:312 error=
s:0 dropped:0 overruns:0 carrier:0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 collisions:0 txqueue=
len:1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RX bytes:26400 (25.7=
 KiB)=C2=A0 TX bytes:40164 (39.2 KiB)

Where is TU interface? Or it can't be raised because it listens on the same=
 port 51820 as T1 tunnel?

Thanks You!








------=_Part_2396_2138303936.1519660574982
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
First of all a BIG thanks to developers for great job!<br /><br />There is =
a main office with WG running on Lede reboot (17.01.4) with ports 51820 and=
 51821. Until I've two peers, one pointing to port 51820 and 2nd to 51821 e=
verything worked fine.<br />Now I want to add another one peer to have 3 re=
mote peers in total. The questions is:<br />should I open the new port for =
each remote peer to connect? It's how wg works? How to run few tunnels/peer=
s on the same port 51820 for example? Does Cryptokey routing can work in th=
is way over one port only instead opening third one 51822?<br /><br />As If=
 I try to use the same port for two peers, the 2nd peer for the same port w=
ill not create interface. See evidence bellow.<br />Once ifconfig brings T1=
 interface up (listening on 51820 port), the TU interface can't be raised u=
p as it listens on the same port 51820. <br /><br /># Lede reboot (17.01.4)=
<br />root@OpenWrt:~# wg<br />interface: T1<br />&nbsp; public key: &lt;del=
eted1&gt;<br />&nbsp; listening port: 51820<br /><br />peer: &lt;deleted2&g=
t;<br />&nbsp; endpoint: x.x.13.235:56649<br />&nbsp; allowed ips: p.p.5.0/=
24<br />&nbsp; latest handshake: 45 seconds ago<br />&nbsp; transfer: 150.3=
1 KiB received, 286.11 KiB sent<br /><br />interface: RA<br />&nbsp; public=
 key: &lt;deleted3&gt;<br />&nbsp; private key: (hidden)<br />&nbsp; listen=
ing port: 51821<br /><br />peer: &lt;deleted4&gt;<br />&nbsp; endpoint: x.x=
.125.213:51820<br />&nbsp; allowed ips: p.p.30.0/24, 10.1.1.16/30<br />&nbs=
p; latest handshake: 54 seconds ago<br />&nbsp; transfer: 285.81 KiB receiv=
ed, 14.89 KiB sent<br /><br />interface: TU<br />&nbsp; public key: &lt;del=
eted5&gt;<br />&nbsp; private key: (hidden)<br />&nbsp; listening port: 518=
20&nbsp; # If I use THE SAME as for T1 interface, it won't start. How to so=
lve this?<br />peer: &lt;deleted6&gt;<br />&nbsp; endpoint: x.x.147.136:518=
20<br />&nbsp; allowed ips: p.p.57.0/24, 10.2.1.32/30<br /><br />With p - r=
fc1918 private address space address is marked (local addresses)<br /><br /=
><br />Mon Feb 26 15:28:57 2018 daemon.notice netifd: Interface 'T' is now =
up<br />Mon Feb 26 15:28:57 2018 daemon.notice netifd: Network device 'T' l=
ink is up<br />Mon Feb 26 15:28:57 2018 daemon.notice netifd: Interface 'RA=
' is now up<br />Mon Feb 26 15:28:57 2018 daemon.notice netifd: Network dev=
ice 'RA' link is up<br />Mon Feb 26 15:28:57 2018 daemon.notice netifd: Int=
erface 'TU' is now down<br />Mon Feb 26 15:28:58 2018 daemon.notice netifd:=
 Interface 'TU' is setting up now<br />Mon Feb 26 15:28:58 2018 daemon.noti=
ce netifd: Interface 'wan' is now up<br />Mon Feb 26 15:28:59 2018 kern.err=
 kernel: [1972650.446719] wireguard: TU: Could not create IPv4 socket<br />=
Mon Feb 26 15:28:59 2018 daemon.notice netifd: Interface 'TU' is now up<br =
/><br />root@OpenWrt:~# ifconfig<br />RA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Link encap:UNSPEC&nbsp; HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-=
00-00-00-00<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ine=
t addr:10.1.1.16&nbsp; P-t-P:10.1.1.16&nbsp; Mask:255.255.255.252<br />&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UP POINTOPOINT RUNNING N=
OARP&nbsp; MTU:1420&nbsp; Metric:1<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; RX packets:3 errors:0 dropped:0 overruns:0 frame:0<br /=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX packets:3 errors=
:0 dropped:0 overruns:0 carrier:0<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; collisions:0 txqueuelen:1<br />&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX bytes:444 (444.0 B)&nbsp; TX bytes:612 (61=
2.0 B)<br /><br />T1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link encap:U=
NSPEC&nbsp; HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00<br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UP POINTOPOINT RUNNING =
NOARP&nbsp; MTU:1420&nbsp; Metric:1<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; RX packets:312 errors:0 dropped:0 overruns:0 frame:0<b=
r />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX packets:312 e=
rrors:0 dropped:0 overruns:0 carrier:0<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; collisions:0 txqueuelen:1<br />&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX bytes:26400 (25.7 KiB)&nbsp; TX bytes=
:40164 (39.2 KiB)<br /><br />Where is TU interface? Or it can't be raised b=
ecause it listens on the same port 51820 as T1 tunnel?<br /><br />Thanks Yo=
u!<br /><br /><br /><br /><br /><br /><br /><br />  </body>
</html>

------=_Part_2396_2138303936.1519660574982--
