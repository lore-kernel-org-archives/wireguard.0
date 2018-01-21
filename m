Return-Path: bogdan.bivolaru@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06c6bcb9
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jan 2018 11:45:39 +0000 (UTC)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
 [209.85.216.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4dd4890
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jan 2018 11:45:38 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id z11so14311338qtm.3
 for <wireguard@lists.zx2c4.com>; Sun, 21 Jan 2018 03:49:29 -0800 (PST)
MIME-Version: 1.0
From: Bogdan Bivolaru <bogdan.bivolaru@gmail.com>
Date: Sun, 21 Jan 2018 13:49:07 +0200
Message-ID: <CAEz1aPotZTHHa6HmEMC_ajMWF+RnQ1aZSGyRCoMcdgZzR2WjGQ@mail.gmail.com>
Subject: Trouble understanding the role of persistent keep-alive
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a114032ece9cbbc056347e7f4"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114032ece9cbbc056347e7f4
Content-Type: text/plain; charset="UTF-8"

Hello,

Thank you for your dedication to improving security.

I am writing to you because I do not understand the behavior of Wireguard
in my home lab.

In SUMMARY: Without KEEPALIVE on, after an 1-2 hours my WG endpoints tend
to lose the ability to answer each other ping signals. Usually this is
restored by sending pings on both ends. Sometimes though (see my config)
the list of ALLOWED-IPs is lost altogether and I have to re-add the peer
manually. AFAIK this is not a firewall issue on either Ubuntu nor OpenWrt
side. What am I missing?


In DETAILS, with more context:
I have 2 devices:
 * laptop (172.21.15.118, Linux Mint 18.2 based on Ubuntu Xenial 16.04)
with WG version 0.0.20180118-wg1~xenial (from PPA);
 * router (172.21.15.224 => WAN port, OpenWrt 15.05 platform mvebu) with WG
version 0.0.20171017-1.

No special firewall rules for Wireguard are setup either on either router
or on laptop.

*Laptop* Wireguard config:
# wg
interface: wg0
  public key: XvuUjjO/iw5gNKFe5496u0sK75isEcguB1U8Srk5RCo=
  private key: (hidden)
  listening port: 51820

peer: I4PoxPUWykmlgCJqD7mjKKWIcF2zJif+mfQtdlG+xxg=
  endpoint: 172.21.15.224:51820
  allowed ips: 172.31.1.0/24, 172.21.0.0/16, 172.21.43.0/24
  latest handshake: 2 minutes, 17 seconds ago
  transfer: 51.72 KiB received, 85.04 KiB sent
  persistent keepalive: every 50 seconds

peer: UQzm7fFBBTnJY9BJRk7y1lJtzryFAR/1vDZGyL9Nv2I=
  endpoint: 172.21.15.224:45154
  allowed ips: (none)


*Router* Wireguard config:
interface: wg0
  public key: I4PoxPUWykmlgCJqD7mjKKWIcF2zJif+mfQtdlG+xxg=
  private key: (hidden)
  listening port: 51820

peer: XvuUjjO/iw5gNKFe5496u0sK75isEcguB1U8Srk5RCo=
  endpoint: 172.21.15.118:51820
  allowed ips: 172.31.1.0/24, 172.21.0.0/16, 172.21.43.0/24
  latest handshake: 2 minutes, 20 seconds ago
  transfer: 12.74 KiB received, 33.67 KiB sent
  persistent keepalive: every 50 seconds

peer: +Qs4tOrg2YqwCgmA10ZBGdvOgekkVry0ymYQcX09kns=
  endpoint: 172.21.15.118:51820
  allowed ips: (none)
  latest handshake: 31 minutes ago
  transfer: 36.13 KiB received, 86.55 KiB sent
  persistent keepalive: every 50 seconds


Now, with persistent-keepalive the connection appears to be holding and
latency seems constant at 0.5 ms. Without keepalive I have observed some
behavior I do not understand:

LAPTOP ~ # ping -I wg0 172.31.1.1
PING 172.31.1.1 (172.31.1.1) from 172.31.1.12 wg0: 56(84) bytes of data.
64 bytes from 172.31.1.1: icmp_seq=1 ttl=64 time=28348 ms
64 bytes from 172.31.1.1: icmp_seq=2 ttl=64 time=27347 ms

64 bytes from 172.31.1.1: icmp_seq=10 ttl=64 time=19203 ms
64 bytes from 172.31.1.1: icmp_seq=11 ttl=64 time=18179 ms

64 bytes from 172.31.1.1: icmp_seq=20 ttl=64 time=9023 ms
64 bytes from 172.31.1.1: icmp_seq=21 ttl=64 time=8003 ms

64 bytes from 172.31.1.1: icmp_seq=27 ttl=64 time=1913 ms
64 bytes from 172.31.1.1: icmp_seq=28 ttl=64 time=899 ms
64 bytes from 172.31.1.1: icmp_seq=29 ttl=64 time=0.439 ms

ROUTER ~ # ping -I wg0 172.31.1.12
PING 172.31.1.12 (172.31.1.12): 56 data bytes
64 bytes from 172.31.1.12: seq=0 ttl=64 time=8.298 ms
64 bytes from 172.31.1.12: seq=1 ttl=64 time=0.530 ms
64 bytes from 172.31.1.12: seq=2 ttl=64 time=0.483 ms

64 bytes from 172.31.1.12: seq=23 ttl=64 time=0.639 ms


So until I send ping signals from both ends, neither end of the wg link
does not "see" the other.
The laptop waited 28 seconds for a response which is roughly just after I
have given ping command from the router to the laptop. This is not just
some latency problem: unless I send ping from both during the timeout
period, pinging from either side results in 100% package loss.

Also after a few hours of inactivity on WG, both ends lose the configured
allowed-ips and can be reconnected after a manual resetup.

So I guess the question is: is the keepalive required to maintain the
connection and it would degrade if not set? OR is it only for avoiding
firewall filtering? Also, should this be a firewall issue how can I narrow
it down to which firewall is to blame?



And thank you in advance for your attention and support,
Bogdan BIV


"The best way to predict the future is to invent it.", 1971, Alan Kay:
http://www.smalltalk.org/alankay.html

--001a114032ece9cbbc056347e7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br></div><div><br></div><div>Thank you fo=
r your dedication to improving security.</div><br></div><div>I am writing t=
o you because I do not understand the behavior of Wireguard in my home lab.=
<br></div><div><br></div><div>In SUMMARY: Without KEEPALIVE on, after an 1-=
2 hours my WG endpoints tend to lose the ability to answer each other ping =
signals. Usually this is restored by sending pings on both ends. Sometimes =
though (see my config) the list of ALLOWED-IPs is lost altogether and I hav=
e to re-add the peer manually. AFAIK this is not a firewall issue on either=
 Ubuntu nor OpenWrt side. What am I missing?</div><div><br></div><div><br><=
/div><div>In DETAILS, with more context:<br></div>I have 2 devices: <br>=C2=
=A0* laptop (172.21.15.118, Linux Mint 18.2 based on Ubuntu Xenial 16.04) w=
ith WG version 0.0.20180118-wg1~xenial (from PPA);<br>=C2=A0* router (172.2=
1.15.224 =3D&gt; WAN port, OpenWrt 15.05 platform mvebu) with WG version 0.=
0.20171017-1.<br><div><div><br></div><div>No special firewall rules for Wir=
eguard are setup either on either router or on laptop.<br></div><div><br></=
div><div>*Laptop* Wireguard config:</div><div># wg<br>interface: wg0<br>=C2=
=A0 public key: XvuUjjO/iw5gNKFe5496u0sK75isEcguB1U8Srk5RCo=3D<br>=C2=A0 pr=
ivate key: (hidden)<br>=C2=A0 listening port: 51820<br><br>peer: I4PoxPUWyk=
mlgCJqD7mjKKWIcF2zJif+mfQtdlG+xxg=3D<br>=C2=A0 endpoint: <a href=3D"http://=
172.21.15.224:51820">172.21.15.224:51820</a><br>=C2=A0 allowed ips: <a href=
=3D"http://172.31.1.0/24">172.31.1.0/24</a>, <a href=3D"http://172.21.0.0/1=
6">172.21.0.0/16</a>, <a href=3D"http://172.21.43.0/24">172.21.43.0/24</a><=
br>=C2=A0 latest handshake: 2 minutes, 17 seconds ago<br>=C2=A0 transfer: 5=
1.72 KiB received, 85.04 KiB sent<br>=C2=A0 persistent keepalive: every 50 =
seconds<br><br>peer: UQzm7fFBBTnJY9BJRk7y1lJtzryFAR/1vDZGyL9Nv2I=3D<br>=C2=
=A0 endpoint: <a href=3D"http://172.21.15.224:45154">172.21.15.224:45154</a=
><br>=C2=A0 allowed ips: (none)</div><div><br></div><div><br></div><div>*Ro=
uter* Wireguard config:</div><div>interface: wg0<br>=C2=A0 public key: I4Po=
xPUWykmlgCJqD7mjKKWIcF2zJif+mfQtdlG+xxg=3D<br>=C2=A0 private key: (hidden)<=
br>=C2=A0 listening port: 51820<br><br>peer: XvuUjjO/iw5gNKFe5496u0sK75isEc=
guB1U8Srk5RCo=3D<br>=C2=A0 endpoint: <a href=3D"http://172.21.15.118:51820"=
>172.21.15.118:51820</a><br>=C2=A0 allowed ips: <a href=3D"http://172.31.1.=
0/24">172.31.1.0/24</a>, <a href=3D"http://172.21.0.0/16">172.21.0.0/16</a>=
, <a href=3D"http://172.21.43.0/24">172.21.43.0/24</a><br>=C2=A0 latest han=
dshake: 2 minutes, 20 seconds ago<br>=C2=A0 transfer: 12.74 KiB received, 3=
3.67 KiB sent<br>=C2=A0 persistent keepalive: every 50 seconds<br><br>peer:=
 +Qs4tOrg2YqwCgmA10ZBGdvOgekkVry0ymYQcX09kns=3D<br>=C2=A0 endpoint: <a href=
=3D"http://172.21.15.118:51820">172.21.15.118:51820</a><br>=C2=A0 allowed i=
ps: (none)<br>=C2=A0 latest handshake: 31 minutes ago<br>=C2=A0 transfer: 3=
6.13 KiB received, 86.55 KiB sent<br>=C2=A0 persistent keepalive: every 50 =
seconds</div><div><br></div><div><br></div><div>Now, with persistent-keepal=
ive the connection appears to be holding and latency seems constant at 0.5 =
ms. Without keepalive I have observed some behavior I do not understand:</d=
iv><div><br></div><div>LAPTOP ~ # ping -I wg0 172.31.1.1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>PING 172.31.1.1 =
(172.31.1.1) from 172.31.1.12 wg0: 56(84) bytes of data.<br>64 bytes from <=
a href=3D"http://172.31.1.1">172.31.1.1</a>: icmp_seq=3D1 ttl=3D64 time=3D2=
8348 ms<br>64 bytes from <a href=3D"http://172.31.1.1">172.31.1.1</a>: icmp=
_seq=3D2 ttl=3D64 time=3D27347 ms<br><br>64 bytes from <a href=3D"http://17=
2.31.1.1">172.31.1.1</a>: icmp_seq=3D10 ttl=3D64 time=3D19203 ms<br>64 byte=
s from <a href=3D"http://172.31.1.1">172.31.1.1</a>: icmp_seq=3D11 ttl=3D64=
 time=3D18179 ms<br><br>64 bytes from <a href=3D"http://172.31.1.1">172.31.=
1.1</a>: icmp_seq=3D20 ttl=3D64 time=3D9023 ms<br>64 bytes from <a href=3D"=
http://172.31.1.1">172.31.1.1</a>: icmp_seq=3D21 ttl=3D64 time=3D8003 ms<br=
></div><div><br></div><div>64 bytes from <a href=3D"http://172.31.1.1">172.=
31.1.1</a>: icmp_seq=3D27 ttl=3D64 time=3D1913 ms<br>64 bytes from <a href=
=3D"http://172.31.1.1">172.31.1.1</a>: icmp_seq=3D28 ttl=3D64 time=3D899 ms=
<br>64 bytes from <a href=3D"http://172.31.1.1">172.31.1.1</a>: icmp_seq=3D=
29 ttl=3D64 time=3D0.439 ms<br><br></div><div>ROUTER ~ # ping -I wg0 172.31=
.1.12<br>PING 172.31.1.12 (172.31.1.12): 56 data bytes<br>64 bytes from <a =
href=3D"http://172.31.1.12">172.31.1.12</a>: seq=3D0 ttl=3D64 time=3D8.298 =
ms<br>64 bytes from <a href=3D"http://172.31.1.12">172.31.1.12</a>: seq=3D1=
 ttl=3D64 time=3D0.530 ms<br>64 bytes from <a href=3D"http://172.31.1.12">1=
72.31.1.12</a>: seq=3D2 ttl=3D64 time=3D0.483 ms<br><br>64 bytes from <a hr=
ef=3D"http://172.31.1.12">172.31.1.12</a>: seq=3D23 ttl=3D64 time=3D0.639 m=
s</div><div><br></div><div><br></div><div>So until I send ping signals from=
 both ends, neither end of the wg link does not &quot;see&quot; the other.<=
/div><div>The laptop waited 28 seconds for a response which is roughly just=
 after I have given ping command from the router to the laptop. This is not=
 just some latency problem: unless I send ping from both during the timeout=
 period, pinging from either side results in 100% package loss.</div><div><=
br></div><div>Also after a few hours of inactivity on WG, both ends lose th=
e configured allowed-ips and can be reconnected after a manual resetup.</di=
v><div><br></div><div>So I guess the question is: is the keepalive required=
 to maintain the connection and it would degrade if not set? OR is it only =
for avoiding firewall filtering? Also, should this be a firewall issue how =
can I narrow it down to which firewall is to blame?<br></div><div><br></div=
></div><div><br></div><div><br></div><div>And thank you in advance for your=
 attention and support,</div><div>Bogdan BIV</div><div><br></div><div><br c=
lear=3D"all"></div><div><div><div><div><div class=3D"gmail_signature">&quot=
;The best way to predict the future is to invent it.&quot;, 1971, Alan Kay:=
 <a href=3D"http://www.smalltalk.org/alankay.html" target=3D"_blank">http:/=
/www.smalltalk.org/alankay.html</a></div></div>
</div></div></div></div>

--001a114032ece9cbbc056347e7f4--
