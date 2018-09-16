Return-Path: rspazzol@redhat.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b87e6fc
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 23:07:28 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 007c43ea
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 23:07:28 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id q127-v6so11568075ljq.11
 for <wireguard@lists.zx2c4.com>; Sun, 16 Sep 2018 16:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACOeLqLN5vc7O9_VwGhipycVE5Yi+phDKKwf2U4VPzZM00KeMw@mail.gmail.com>
References: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
 <20180916165458.GA31165@matrix-dream.net>
 <CACOeLqLN5vc7O9_VwGhipycVE5Yi+phDKKwf2U4VPzZM00KeMw@mail.gmail.com>
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Sun, 16 Sep 2018 19:08:58 -0400
Message-ID: <CACOeLq+GseaDTZaOKD3qA_pPoT0_xRFAgqip2+KEkxTeG1Mw=Q@mail.gmail.com>
Subject: Re: what to do when the peers use different IPs to transmit and
 receive
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Content-Type: multipart/alternative; boundary="000000000000489f670576052451"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000489f670576052451
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ivan,

I tried the SNAT idea, and still have issue.
here is an example configuration of one of the nodes:

[Interface]
ListenPort =3D 5555
PrivateKey =3D ---

[Peer]
PublicKey =3D H09cwQeUUly2AIdTAhyr5zvzFK9bED0NYiKgJultYwE=3D
AllowedIPs =3D 10.128.2.0/23
Endpoint =3D 192.168.99.12:31112
PersistentKeepalive =3D 25

[Peer]
PublicKey =3D 5nC5cyDg9WZ/2R3CPEbM+fSXzsn5Yx1mX48iizdfdHU=3D
AllowedIPs =3D 10.128.0.0/23
Endpoint =3D 192.168.99.14:32188
PersistentKeepalive =3D 25

[Peer]
PublicKey =3D MzFg1tMaLUFC3kD9maiZZAHWywfCDyPlYF1zu6Dj30E=3D
AllowedIPs =3D 10.130.0.0/23
Endpoint =3D 192.168.99.13:31992
PersistentKeepalive =3D 25

[Peer]
PublicKey =3D s7/lxyvFQCxE+KBoUJ/9vpPgLZ6pTdYUCsJ/snp3mUk=3D
AllowedIPs =3D 10.129.0.0/23
Endpoint =3D 192.168.99.15:30305
PersistentKeepalive =3D 25

[Peer]
PublicKey =3D SuO927DbGm2h2I8hcf24LvYWglKp+4wGAuiyisin/yY=3D
AllowedIPs =3D 10.131.0.0/23
Endpoint =3D 192.168.99.7:31714
PersistentKeepalive =3D 25

[Peer]
PublicKey =3D a+tK21LKdsBkQNqmqdRpvS9HLpz2W8rwDijTPkXEc0Q=3D
AllowedIPs =3D 10.129.2.0/23
Endpoint =3D 192.168.99.6:31165
PersistentKeepalive =3D 25

the private IP to VIP map for the peers of this node is:

10.128.2.10-192.168.99.12 10.128.1.94-192.168.99.14
10.130.0.136-192.168.99.13 10.129.1.158-192.168.99.15
10.131.0.199-192.168.99.7 10.129.2.217-192.168.99.6

I create the following iptables rules:

sh-4.2# iptables -t nat -n -L Chain PREROUTING (policy ACCEPT) target prot
opt source destination Chain INPUT (policy ACCEPT) target prot opt source
destination SNAT udp -- 10.128.2.10 0.0.0.0/0 udp dpt:5555 to:
192.168.99.12:5555 SNAT udp -- 10.128.1.94 0.0.0.0/0 udp dpt:5555 to:
192.168.99.14:5555 SNAT udp -- 10.130.0.136 0.0.0.0/0 udp dpt:5555 to:
192.168.99.13:5555 SNAT udp -- 10.129.1.158 0.0.0.0/0 udp dpt:5555 to:
192.168.99.15:5555 SNAT udp -- 10.131.0.199 0.0.0.0/0 udp dpt:5555 to:
192.168.99.7:5555 SNAT udp -- 10.129.2.217 0.0.0.0/0 udp dpt:5555 to:
192.168.99.6:5555 Chain OUTPUT (policy ACCEPT) target prot opt source
destination Chain POSTROUTING (policy ACCEPT) target prot opt source
destination


after the handshake the configuration changes to:

sh-4.2# wg
interface: sdn-tunnel
  public key: gCFgNjOpObU71Vmjub/R9KIn3MHgzXnKtrh9Tf+W628=3D
  private key: (hidden)
  listening port: 5555

peer: s7/lxyvFQCxE+KBoUJ/9vpPgLZ6pTdYUCsJ/snp3mUk=3D
  endpoint: 10.134.0.1:1033
  allowed ips: 10.129.0.0/23
  latest handshake: 31 seconds ago
  transfer: 180 B received, 452 B sent
  persistent keepalive: every 25 seconds

peer: MzFg1tMaLUFC3kD9maiZZAHWywfCDyPlYF1zu6Dj30E=3D
  endpoint: 10.134.0.1:1032
  allowed ips: 10.130.0.0/23
  latest handshake: 37 seconds ago
  transfer: 212 B received, 272 B sent
  persistent keepalive: every 25 seconds

peer: 5nC5cyDg9WZ/2R3CPEbM+fSXzsn5Yx1mX48iizdfdHU=3D
  endpoint: 10.134.0.1:1031
  allowed ips: 10.128.0.0/23
  latest handshake: 39 seconds ago
  transfer: 180 B received, 304 B sent
  persistent keepalive: every 25 seconds

peer: a+tK21LKdsBkQNqmqdRpvS9HLpz2W8rwDijTPkXEc0Q=3D
  endpoint: 192.168.99.6:31165
  allowed ips: 10.129.2.0/23
  latest handshake: 41 seconds ago
  transfer: 156 B received, 180 B sent
  persistent keepalive: every 25 seconds

peer: H09cwQeUUly2AIdTAhyr5zvzFK9bED0NYiKgJultYwE=3D
  endpoint: 192.168.99.12:31112
  allowed ips: 10.128.2.0/23
  latest handshake: 41 seconds ago
  transfer: 156 B received, 180 B sent
  persistent keepalive: every 25 seconds

peer: SuO927DbGm2h2I8hcf24LvYWglKp+4wGAuiyisin/yY=3D
  endpoint: 192.168.99.7:31714
  allowed ips: 10.131.0.0/23
  latest handshake: 41 seconds ago
  transfer: 156 B received, 180 B sent
  persistent keepalive: every 25 seconds

as you can see some of the endpoint's addresses have changed.
the first three are not correct anymore.
After the introduction of the iptables rules they change to an IP that
makes no sense to me 10.134.0.1

finally here are a few seconds of tcpdump in case it helps:

sh-4.2# tcpdump -i eth0 -nn -v tcpdump: listening on eth0, link-type EN10MB
(Ethernet), capture size 262144 bytes 23:07:01.045331 IP (tos 0x0, ttl 64,
id 27711, offset 0, flags [none], proto UDP (17), length 60)
10.134.0.72.5555 > 192.168.99.6.31165: UDP, length 32 23:07:01.045363 IP
(tos 0x0, ttl 64, id 53835, offset 0, flags [none], proto UDP (17), length
60) 10.134.0.72.5555 > 192.168.99.7.31714: UDP, length 32 23:07:01.045411
IP (tos 0x0, ttl 64, id 27009, offset 0, flags [none], proto UDP (17),
length 60) 10.134.0.72.5555 > 192.168.99.12.31112: UDP, length 32
23:07:02.758694 IP (tos 0x0, ttl 61, id 19309, offset 0, flags [none],
proto UDP (17), length 60) 10.134.0.1.1031 > 10.134.0.72.5555: UDP, length
32 23:07:04.053339 IP (tos 0x0, ttl 64, id 36786, offset 0, flags [none],
proto UDP (17), length 60) 10.134.0.72.5555 > 10.134.0.1.1032: UDP, length
32 23:07:07.765375 ARP, Ethernet (len 6), IPv4 (len 4), Request who-has
10.134.0.72 tell 10.134.0.1, length 28 23:07:07.765394 ARP, Ethernet (len
6), IPv4 (len 4), Reply 10.134.0.72 is-at 0a:58:0a:86:00:48, length 28
23:07:10.938921 IP (tos 0x0, ttl 61, id 33093, offset 0, flags [none],
proto UDP (17), length 60) 10.134.0.1.1033 > 10.134.0.72.5555: UDP, length
32 23:07:26.069271 IP (tos 0x0, ttl 64, id 37778, offset 0, flags [none],
proto UDP (17), length 60) 10.134.0.72.5555 > 192.168.99.6.31165: UDP,
length 32 23:07:26.069271 IP (tos 0x0, ttl 64, id 59175, offset 0, flags
[none], proto UDP (17), length 60) 10.134.0.72.5555 > 192.168.99.7.31714:
UDP, length 32 23:07:26.069303 IP (tos 0x0, ttl 64, id 49067, offset 0,
flags [none], proto UDP (17), length 60) 10.134.0.72.5555 >
192.168.99.12.31112: UDP, length 32 23:07:27.797284 IP (tos 0x0, ttl 64, id
57007, offset 0, flags [none], proto UDP (17), length 60) 10.134.0.72.5555
> 10.134.0.1.1031: UDP, length 32 23:07:29.079935 IP (tos 0x0, ttl 61, id
18743, offset 0, flags [none], proto UDP (17), length 60) 10.134.0.1.1032 >
10.134.0.72.5555: UDP, length 32

Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717



On Sun, Sep 16, 2018 at 2:56 PM, Raffaele Spazzoli <rspazzol@redhat.com>
wrote:

> I'll try to make an example
> cluster 1 node 1 has private IP1 and VIP1
> cluster 2 node 2 has private IP2 and VIP2
>
> each node uses it's private ip for outbound connections.
> each node can receive inbound connection on its VIP.
>
> so the wireguard config file for node1 is going to look like:
>
> [peer]
> endpoint: VIP2:port
>
> and for node 2:
> [peer]
> endpoint: VIP1: port
>
> the problem is that after the handshake, wireguard updates the config to
> the following (for example for node2):
> [peer]
> endpoint: IP1:port
>
> but IP2 cannot route to IP1...
>
> I think a well configured SNAT rule may work, although is not elegant
> because it forces the cluster to exchange information about their private
> IPs.
> This should not be needed and in the cloud private IPs are ephemeral....
>
> anyway thanks for the advice, I am going to try to use it  in my
> prototype.
>
> I still think there is need for a better technical approach for a long
> term solution.
>
>
> Thanks,
> Raffaele
>
> Raffaele Spazzoli
> Senior Architect - OpenShift <https://www.openshift.com>, Containers
> and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
> Tel: +1 216-258-7717
>
>
>
> On Sun, Sep 16, 2018 at 12:54 PM, Ivan Lab=C3=A1th <labawi-wg@matrix-drea=
m.net>
> wrote:
>
>> Hi,
>>
>> On Sun, Sep 16, 2018 at 08:21:02AM -0400, Raffaele Spazzoli wrote:
>> > ... then the IP that a  node uses for its outbound
>> > connection is not the same that its peer need to use for its inbound
>> > connections.
>>
>> Who uses what for whose connection? You lost me here.
>> Looks like a broken network to me. Does TCP even work?
>>
>> Anyway, SNAT/DNAT should be able to fix things up, if you want to go
>> that route.
>>
>> Regards,
>> Ivan
>>
>
>

--000000000000489f670576052451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Ivan,<div><br></div><div>I tried the SNAT idea, =
and still have issue.=C2=A0</div><div>here is an example configuration of o=
ne of the nodes:</div><div><br></div><div><div>[Interface]</div><div>Listen=
Port =3D 5555=C2=A0</div><div>PrivateKey =3D ---</div><div>=C2=A0</div><div=
>[Peer]</div><div>PublicKey =3D H09cwQeUUly2AIdTAhyr5zvzFK9bED0NYiKgJultYwE=
=3D</div><div>AllowedIPs =3D <a href=3D"http://10.128.2.0/23">10.128.2.0/23=
</a></div><div>Endpoint =3D <a href=3D"http://192.168.99.12:31112">192.168.=
99.12:31112</a></div><div>PersistentKeepalive =3D 25</div><div><br></div><d=
iv>[Peer]</div><div>PublicKey =3D 5nC5cyDg9WZ/2R3CPEbM+fSXzsn5Yx1mX48iizdfd=
HU=3D</div><div>AllowedIPs =3D <a href=3D"http://10.128.0.0/23">10.128.0.0/=
23</a></div><div>Endpoint =3D <a href=3D"http://192.168.99.14:32188">192.16=
8.99.14:32188</a></div><div>PersistentKeepalive =3D 25</div><div><br></div>=
<div>[Peer]</div><div>PublicKey =3D MzFg1tMaLUFC3kD9maiZZAHWywfCDyPlYF1zu6D=
j30E=3D</div><div>AllowedIPs =3D <a href=3D"http://10.130.0.0/23">10.130.0.=
0/23</a></div><div>Endpoint =3D <a href=3D"http://192.168.99.13:31992">192.=
168.99.13:31992</a></div><div>PersistentKeepalive =3D 25</div><div><br></di=
v><div>[Peer]</div><div>PublicKey =3D s7/lxyvFQCxE+KBoUJ/9vpPgLZ6pTdYUCsJ/s=
np3mUk=3D</div><div>AllowedIPs =3D <a href=3D"http://10.129.0.0/23">10.129.=
0.0/23</a></div><div>Endpoint =3D <a href=3D"http://192.168.99.15:30305">19=
2.168.99.15:30305</a></div><div>PersistentKeepalive =3D 25</div><div><br></=
div><div>[Peer]</div><div>PublicKey =3D SuO927DbGm2h2I8hcf24LvYWglKp+4wGAui=
yisin/yY=3D</div><div>AllowedIPs =3D <a href=3D"http://10.131.0.0/23">10.13=
1.0.0/23</a></div><div>Endpoint =3D <a href=3D"http://192.168.99.7:31714">1=
92.168.99.7:31714</a></div><div>PersistentKeepalive =3D 25</div><div><br></=
div><div>[Peer]</div><div>PublicKey =3D a+tK21LKdsBkQNqmqdRpvS9HLpz2W8rwDij=
TPkXEc0Q=3D</div><div>AllowedIPs =3D <a href=3D"http://10.129.2.0/23">10.12=
9.2.0/23</a></div><div>Endpoint =3D <a href=3D"http://192.168.99.6:31165">1=
92.168.99.6:31165</a></div><div>PersistentKeepalive =3D 25</div></div><div>=
<br></div><div><font face=3D"arial, helvetica, sans-serif">the private IP t=
o VIP map for the peers of this node is:=C2=A0</font></div><div><br></div><=
div><span style=3D"color:rgb(54,54,54);font-family:Menlo,Monaco,Consolas,mo=
nospace;font-size:12px;white-space:pre;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">10.128.2.10-192.168.99.12  =20
10.128.1.94-192.168.99.14  =20
10.130.0.136-192.168.99.13  =20
10.129.1.158-192.168.99.15  =20
10.131.0.199-192.168.99.7  =20
10.129.2.217-192.168.99.6 </span><br></div><div><span style=3D"color:rgb(54=
,54,54);font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-sp=
ace:pre;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline"><br></span></div><div=
><span style=3D"color:rgb(54,54,54);font-size:12px;white-space:pre;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline"><font face=3D"arial, helvetica, sans-=
serif">I create the following iptables rules:</font></span></div><div><span=
 style=3D"color:rgb(54,54,54);font-size:12px;white-space:pre;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline"><font face=3D"arial, helvetica, sans-serif"=
><br></font></span></div><div><span style=3D"background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><font color=3D"#363636" face=3D"Menlo, Monaco, Consolas, mo=
nospace"><span style=3D"font-size:12px;white-space:pre">sh-4.2# iptables -t=
 nat -n -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
SNAT       udp  --  10.128.2.10          <a href=3D"http://0.0.0.0/0">0.0.0=
.0/0</a>            udp dpt:5555 to:<a href=3D"http://192.168.99.12:5555">1=
92.168.99.12:5555</a>
SNAT       udp  --  10.128.1.94          <a href=3D"http://0.0.0.0/0">0.0.0=
.0/0</a>            udp dpt:5555 to:<a href=3D"http://192.168.99.14:5555">1=
92.168.99.14:5555</a>
SNAT       udp  --  10.130.0.136         <a href=3D"http://0.0.0.0/0">0.0.0=
.0/0</a>            udp dpt:5555 to:<a href=3D"http://192.168.99.13:5555">1=
92.168.99.13:5555</a>
SNAT       udp  --  10.129.1.158         <a href=3D"http://0.0.0.0/0">0.0.0=
.0/0</a>            udp dpt:5555 to:<a href=3D"http://192.168.99.15:5555">1=
92.168.99.15:5555</a>
SNAT       udp  --  10.131.0.199         <a href=3D"http://0.0.0.0/0">0.0.0=
.0/0</a>            udp dpt:5555 to:<a href=3D"http://192.168.99.7:5555">19=
2.168.99.7:5555</a>
SNAT       udp  --  10.129.2.217         <a href=3D"http://0.0.0.0/0">0.0.0=
.0/0</a>            udp dpt:5555 to:<a href=3D"http://192.168.99.6:5555">19=
2.168.99.6:5555</a>

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination</span></font><br></spa=
n></div><div><span style=3D"background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline"><=
font color=3D"#363636" face=3D"Menlo, Monaco, Consolas, monospace"><span st=
yle=3D"font-size:12px;white-space:pre"><br></span></font></span></div><div>=
<span style=3D"background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline"><font color=3D=
"#363636" face=3D"Menlo, Monaco, Consolas, monospace"><span style=3D"font-s=
ize:12px;white-space:pre"><br></span></font></span></div><div><span style=
=3D"background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline"><font color=3D"#363636" f=
ace=3D"arial, helvetica, sans-serif"><span style=3D"font-size:12px;white-sp=
ace:pre">after the handshake the configuration changes to:</span></font></s=
pan></div><div><span style=3D"background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
><font color=3D"#363636"><div style=3D"font-family:Menlo,Monaco,Consolas,mo=
nospace;font-size:12px;white-space:pre"><br></div><div style=3D"font-family=
:Menlo,Monaco,Consolas,monospace"><span style=3D"font-size:12px;white-space=
:pre">sh-4.2# wg</span><br></div><div style=3D"font-family:Menlo,Monaco,Con=
solas,monospace;font-size:12px;white-space:pre">interface: sdn-tunnel</div>=
<div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;wh=
ite-space:pre">=C2=A0 public key: gCFgNjOpObU71Vmjub/R9KIn3MHgzXnKtrh9Tf+W6=
28=3D</div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-s=
ize:12px;white-space:pre">=C2=A0 private key: (hidden)</div><div style=3D"f=
ont-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=
=C2=A0 listening port: 5555</div><div style=3D"font-family:Menlo,Monaco,Con=
solas,monospace;font-size:12px;white-space:pre"><br></div><div style=3D"fon=
t-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">pe=
er: s7/lxyvFQCxE+KBoUJ/9vpPgLZ6pTdYUCsJ/snp3mUk=3D</div><div style=3D"font-=
family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=
=A0 endpoint: <a href=3D"http://10.134.0.1:1033">10.134.0.1:1033</a></div><=
div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;whi=
te-space:pre">=C2=A0 allowed ips: <a href=3D"http://10.129.0.0/23">10.129.0=
.0/23</a></div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;fo=
nt-size:12px;white-space:pre">=C2=A0 latest handshake: 31 seconds ago</div>=
<div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;wh=
ite-space:pre">=C2=A0 transfer: 180 B received, 452 B sent</div><div style=
=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:=
pre">=C2=A0 persistent keepalive: every 25 seconds</div><div style=3D"font-=
family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre"><br>=
</div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:1=
2px;white-space:pre">peer: MzFg1tMaLUFC3kD9maiZZAHWywfCDyPlYF1zu6Dj30E=3D</=
div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12p=
x;white-space:pre">=C2=A0 endpoint: <a href=3D"http://10.134.0.1:1032">10.1=
34.0.1:1032</a></div><div style=3D"font-family:Menlo,Monaco,Consolas,monosp=
ace;font-size:12px;white-space:pre">=C2=A0 allowed ips: <a href=3D"http://1=
0.130.0.0/23">10.130.0.0/23</a></div><div style=3D"font-family:Menlo,Monaco=
,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 latest handshake=
: 37 seconds ago</div><div style=3D"font-family:Menlo,Monaco,Consolas,monos=
pace;font-size:12px;white-space:pre">=C2=A0 transfer: 212 B received, 272 B=
 sent</div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-s=
ize:12px;white-space:pre">=C2=A0 persistent keepalive: every 25 seconds</di=
v><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;=
white-space:pre"><br></div><div style=3D"font-family:Menlo,Monaco,Consolas,=
monospace;font-size:12px;white-space:pre">peer: 5nC5cyDg9WZ/2R3CPEbM+fSXzsn=
5Yx1mX48iizdfdHU=3D</div><div style=3D"font-family:Menlo,Monaco,Consolas,mo=
nospace;font-size:12px;white-space:pre">=C2=A0 endpoint: <a href=3D"http://=
10.134.0.1:1031">10.134.0.1:1031</a></div><div style=3D"font-family:Menlo,M=
onaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 allowed ips=
: <a href=3D"http://10.128.0.0/23">10.128.0.0/23</a></div><div style=3D"fon=
t-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=
=C2=A0 latest handshake: 39 seconds ago</div><div style=3D"font-family:Menl=
o,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 transfer=
: 180 B received, 304 B sent</div><div style=3D"font-family:Menlo,Monaco,Co=
nsolas,monospace;font-size:12px;white-space:pre">=C2=A0 persistent keepaliv=
e: every 25 seconds</div><div style=3D"font-family:Menlo,Monaco,Consolas,mo=
nospace;font-size:12px;white-space:pre"><br></div><div style=3D"font-family=
:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">peer: a+tK=
21LKdsBkQNqmqdRpvS9HLpz2W8rwDijTPkXEc0Q=3D</div><div style=3D"font-family:M=
enlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 endpo=
int: <a href=3D"http://192.168.99.6:31165">192.168.99.6:31165</a></div><div=
 style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-=
space:pre">=C2=A0 allowed ips: <a href=3D"http://10.129.2.0/23">10.129.2.0/=
23</a></div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-=
size:12px;white-space:pre">=C2=A0 latest handshake: 41 seconds ago</div><di=
v style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white=
-space:pre">=C2=A0 transfer: 156 B received, 180 B sent</div><div style=3D"=
font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre"=
>=C2=A0 persistent keepalive: every 25 seconds</div><div style=3D"font-fami=
ly:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre"><br></di=
v><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;=
white-space:pre">peer: H09cwQeUUly2AIdTAhyr5zvzFK9bED0NYiKgJultYwE=3D</div>=
<div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;wh=
ite-space:pre">=C2=A0 endpoint: <a href=3D"http://192.168.99.12:31112">192.=
168.99.12:31112</a></div><div style=3D"font-family:Menlo,Monaco,Consolas,mo=
nospace;font-size:12px;white-space:pre">=C2=A0 allowed ips: <a href=3D"http=
://10.128.2.0/23">10.128.2.0/23</a></div><div style=3D"font-family:Menlo,Mo=
naco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 latest hands=
hake: 41 seconds ago</div><div style=3D"font-family:Menlo,Monaco,Consolas,m=
onospace;font-size:12px;white-space:pre">=C2=A0 transfer: 156 B received, 1=
80 B sent</div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;fo=
nt-size:12px;white-space:pre">=C2=A0 persistent keepalive: every 25 seconds=
</div><div style=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:1=
2px;white-space:pre"><br></div><div style=3D"font-family:Menlo,Monaco,Conso=
las,monospace;font-size:12px;white-space:pre">peer: SuO927DbGm2h2I8hcf24LvY=
WglKp+4wGAuiyisin/yY=3D</div><div style=3D"font-family:Menlo,Monaco,Consola=
s,monospace;font-size:12px;white-space:pre">=C2=A0 endpoint: <a href=3D"htt=
p://192.168.99.7:31714">192.168.99.7:31714</a></div><div style=3D"font-fami=
ly:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 a=
llowed ips: <a href=3D"http://10.131.0.0/23">10.131.0.0/23</a></div><div st=
yle=3D"font-family:Menlo,Monaco,Consolas,monospace;font-size:12px;white-spa=
ce:pre">=C2=A0 latest handshake: 41 seconds ago</div><div style=3D"font-fam=
ily:Menlo,Monaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 =
transfer: 156 B received, 180 B sent</div><div style=3D"font-family:Menlo,M=
onaco,Consolas,monospace;font-size:12px;white-space:pre">=C2=A0 persistent =
keepalive: every 25 seconds</div><div style=3D"font-family:Menlo,Monaco,Con=
solas,monospace;font-size:12px;white-space:pre"><br></div><div style=3D"fon=
t-size:12px;white-space:pre"><font face=3D"arial, helvetica, sans-serif">as=
 you can see some of the endpoint&#39;s addresses have changed. </font></di=
v><div style=3D"font-size:12px;white-space:pre"><font face=3D"arial, helvet=
ica, sans-serif">the first three are not correct anymore.</font></div><div =
style=3D"font-size:12px;white-space:pre"><font face=3D"arial, helvetica, sa=
ns-serif">After the introduction of the iptables rules they change to an IP=
 that makes no sense to me <span style=3D"font-family:Menlo,Monaco,Consolas=
,monospace;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">10.134.0.1</span><=
/font></div><div style=3D"font-size:12px;white-space:pre"><font face=3D"ari=
al, helvetica, sans-serif"><span style=3D"font-family:Menlo,Monaco,Consolas=
,monospace;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline"><br></span></font>=
</div><div style=3D"font-size:12px;white-space:pre"><font face=3D"arial, he=
lvetica, sans-serif"><span style=3D"background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">finally here are a few seconds of tcpdump in case it helps:</span></=
font></div><div style=3D"font-size:12px;white-space:pre"><font face=3D"aria=
l, helvetica, sans-serif"><span style=3D"font-family:Menlo,Monaco,Consolas,=
monospace;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline"><br></span></font><=
/div><div><font><span style=3D"background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
"><font face=3D"Menlo, Monaco, Consolas, monospace"><span style=3D"font-siz=
e:12px;white-space:pre">sh-4.2# tcpdump -i eth0 -nn -v
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 26214=
4 bytes
23:07:01.045331 IP (tos 0x0, ttl 64, id 27711, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 192.168.99.6.31165: UDP, length 32
23:07:01.045363 IP (tos 0x0, ttl 64, id 53835, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 192.168.99.7.31714: UDP, length 32
23:07:01.045411 IP (tos 0x0, ttl 64, id 27009, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 192.168.99.12.31112: UDP, length 32
23:07:02.758694 IP (tos 0x0, ttl 61, id 19309, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.1.1031 &gt; 10.134.0.72.5555: UDP, length 32
23:07:04.053339 IP (tos 0x0, ttl 64, id 36786, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 10.134.0.1.1032: UDP, length 32
23:07:07.765375 ARP, Ethernet (len 6), IPv4 (len 4), Request who-has 10.134=
.0.72 tell 10.134.0.1, length 28
23:07:07.765394 ARP, Ethernet (len 6), IPv4 (len 4), Reply 10.134.0.72 is-a=
t 0a:58:0a:86:00:48, length 28
23:07:10.938921 IP (tos 0x0, ttl 61, id 33093, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.1.1033 &gt; 10.134.0.72.5555: UDP, length 32
23:07:26.069271 IP (tos 0x0, ttl 64, id 37778, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 192.168.99.6.31165: UDP, length 32
23:07:26.069271 IP (tos 0x0, ttl 64, id 59175, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 192.168.99.7.31714: UDP, length 32
23:07:26.069303 IP (tos 0x0, ttl 64, id 49067, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 192.168.99.12.31112: UDP, length 32
23:07:27.797284 IP (tos 0x0, ttl 64, id 57007, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.72.5555 &gt; 10.134.0.1.1031: UDP, length 32
23:07:29.079935 IP (tos 0x0, ttl 61, id 18743, offset 0, flags [none], prot=
o UDP (17), length 60)
    10.134.0.1.1032 &gt; 10.134.0.72.5555: UDP, length 32</span></font><br>=
</span></font></div></font></span></div></div></div></div></div></div></div=
><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><di=
v><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks,<div>Raffaele</div><div><br=
></div><div>Raffaele Spazzoli</div><div>Senior Architect - <a href=3D"https=
://www.openshift.com" target=3D"_blank">OpenShift</a>, <a href=3D"https://w=
ww.redhat.com/en/services/consulting/paas" target=3D"_blank">Containers and=
=C2=A0PaaS Practice</a></div><div>Tel: +1 216-258-7717</div><div><br></div>=
<div><br></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div>
<br><div class=3D"gmail_quote">On Sun, Sep 16, 2018 at 2:56 PM, Raffaele Sp=
azzoli <span dir=3D"ltr">&lt;<a href=3D"mailto:rspazzol@redhat.com" target=
=3D"_blank">rspazzol@redhat.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">I&#39;ll try to make an example<div>cluster =
1 node 1 has private IP1 and VIP1=C2=A0</div><div>cluster 2 node 2 has priv=
ate IP2 and VIP2</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">each node uses it&#39;s private ip for outbound connections.=C2=
=A0</div><div class=3D"gmail_extra">each node can receive inbound connectio=
n on its VIP.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">so the wireguard config file for node1 is going to look like:</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">[peer]</div=
><div class=3D"gmail_extra">endpoint: VIP2:port</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">and for node 2:</div><div class=
=3D"gmail_extra">[peer]=C2=A0</div><div class=3D"gmail_extra">endpoint: VIP=
1: port</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">the problem is that after the handshake, wireguard updates the config to =
the following (for example for node2):</div><div class=3D"gmail_extra">[pee=
r]</div><div class=3D"gmail_extra">endpoint: IP1:port</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">but IP2 cannot route to IP1=
...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I =
think a well configured SNAT rule may work, although is not elegant because=
 it forces the cluster to exchange information about their private IPs.</di=
v><div class=3D"gmail_extra">This should not be needed and in the cloud pri=
vate IPs are ephemeral....</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">anyway thanks for the advice, I am going to try to use=
 it=C2=A0 in my prototype.=C2=A0</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">I still think there is need for a better technic=
al approach for a long term solution.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra"><span class=3D""><br clear=3D"all"><div><di=
v class=3D"m_4340499724176942754gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr">Thanks,<div>Raffaele</div><div><br></div><div>Raffaele Spazzoli</d=
iv><div>Senior Architect - <a href=3D"https://www.openshift.com" target=3D"=
_blank">OpenShift</a>, <a href=3D"https://www.redhat.com/en/services/consul=
ting/paas" target=3D"_blank">Containers and=C2=A0PaaS Practice</a></div><di=
v>Tel: +1 216-258-7717</div><div><br></div><div><br></div></div></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Sun, Sep 16=
, 2018 at 12:54 PM, Ivan Lab=C3=A1th <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:labawi-wg@matrix-dream.net" target=3D"_blank">labawi-wg@matrix-dream.net<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On Sun, Sep 16, 2018 at 08:21:02AM -0400, Raffaele Spazzoli wrote:<br>
&gt; ... then the IP that a=C2=A0 node uses for its outbound<br>
<span>&gt; connection is not the same that its peer need to use for its inb=
ound<br>
&gt; connections.<br>
<br>
</span>Who uses what for whose connection? You lost me here.<br>
Looks like a broken network to me. Does TCP even work?<br>
<br>
Anyway, SNAT/DNAT should be able to fix things up, if you want to go<br>
that route.<br>
<br>
Regards,<br>
Ivan<br>
</blockquote></div><br></div></div></div></div>
</blockquote></div><br></div>

--000000000000489f670576052451--
