Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4ac933a
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 14:54:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5881d89c
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 14:54:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdeaac3a
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 15:13:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 300c576e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 15:13:20 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id j126so3115925oia.10
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 08:21:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r0hXW8CT5wO10X-b-9HUBDzzvSAbnn69aFav+6ovxQGA@mail.gmail.com>
References: <CADdae-hw0VGaCDGmsVpVT5g56xM3vs+AeOS8MYLwFo5pnf1N8Q@mail.gmail.com>
 <CAHmME9qrtSm1Y-h9FfyXWVCmrvmtciFau0jG2144Yrwu=BRMig@mail.gmail.com>
 <CAHmME9r0hXW8CT5wO10X-b-9HUBDzzvSAbnn69aFav+6ovxQGA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Sep 2017 17:21:31 +0200
Message-ID: <CAHmME9rWpuWBRzZLFeaOG4zG-VxHUEi8wbXe4iL7xYguk0TMFw@mail.gmail.com>
Subject: Re: [wireguard-dev] Help about configuration
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Content-Type: multipart/alternative; boundary="001a113eb8aeda28090559a0873f"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113eb8aeda28090559a0873f
Content-Type: text/plain; charset="UTF-8"

Seems likely the wrong source IP is being used for sending the ping. Use
tcpdump on the initiating computer to make sure the source IP of the ping
packet matches the allowed-ips of the other machine.

--
Sent from my telephone.

On Sep 20, 2017 17:11, "nicolas prochazka" <prochazka.nicolas@gmail.com>
wrote:

Hello, can somebody tells me what I do wrong :
I can ping from server 1 --> client 1  ( ping fd00:14::8b5:8aff:fe85:f3ee )
.
but not from client 1 --> server1  ( ping fd00:14::8b5:8aff:fe85:f3ec )

we can notice
RX packets:230 errors:1112 dropped:0 overruns:0 frame:1112
on server side  seems strange

wireguard : v0.0.20170918]
kernel : 4.9.23 on client1
kernel : 4.4.0 on server 1


Regards,
Nicolas Prochazka

Server 1 :
ifconfig neocoretech_rd
neocoretech_rd Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet6 addr: fd00:14::8b5:8aff:fe85:f3ec/32 Scope:Global
          UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
          RX packets:230 errors:1112 dropped:0 overruns:0 frame:1112
          TX packets:390 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:24672 (24.6 KB)  TX bytes:39104 (39.1 KB)


[52.209.226.5]~/resources/tunnelHelper>wg showconf neocoretech_rd
[Interface]
ListenPort = 6081
PrivateKey = mNHgDu3Nbusb3Xd8tI8imBkFgvnUSCjKGVP5qT8pi2Q=

[Peer]
PublicKey = 5zSx+CxgcjLKE2shpkTrLFgCHNOPM6r7TcuZ5cSx2AA=
AllowedIPs = fd00:14::8b5:8aff:fe85:f3ee/128
Endpoint = 77.156.254.18:25813

wg show neocoretech_rd
interface: neocoretech_rd
  public key: lrJtbn/Jfdb1NyIP78ls11uqAzjcWzDuD+x05RxFk20=
  private key: (hidden)
  listening port: 6081

peer: 5zSx+CxgcjLKE2shpkTrLFgCHNOPM6r7TcuZ5cSx2AA=
  endpoint: 77.156.254.18:25813
  allowed ips: fd00:14::8b5:8aff:fe85:f3ee/128
  latest handshake: 1 minute, 10 seconds ago
  transfer: 23.95 KiB received, 36.07 KiB sent



Client 1 :
ifconfig wg0
wg0       Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet6 addr: fd00:14::8b5:8aff:fe85:f3ee/8 Scope:Global
          UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
          RX packets:230 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1366 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:23632 (23.0 KiB)  TX bytes:230352 (224.9 KiB)


[optimizer] wg showconf wg0
[Interface]
ListenPort = 6081
PrivateKey = IM0tv9xWcVBPhD7+Tny7LHnYu1YHBGCJbBr6fgCdZns=

[Peer]
PublicKey = lrJtbn/Jfdb1NyIP78ls11uqAzjcWzDuD+x05RxFk20=
AllowedIPs = ::/0
Endpoint = 52.209.226.5:6081
PersistentKeepalive = 25

wg show wg0
interface: wg0
  public key: 5zSx+CxgcjLKE2shpkTrLFgCHNOPM6r7TcuZ5cSx2AA=
  private key: (hidden)
  listening port: 6081

peer: lrJtbn/Jfdb1NyIP78ls11uqAzjcWzDuD+x05RxFk20=
  endpoint: 52.209.226.5:6081
  allowed ips: ::/0
  latest handshake: 37 seconds ago
  transfer: 22.99 KiB received, 215.96 KiB sent
  persistent keepalive: every 25 seconds
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--001a113eb8aeda28090559a0873f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Seems likely the wrong source IP is being used for sendin=
g the ping. Use tcpdump on the initiating computer to make sure the source =
IP of the ping packet matches the allowed-ips of the other machine.<br><br>=
<div data-smartmail=3D"gmail_signature">--<br>Sent from my telephone.<br></=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sep =
20, 2017 17:11, &quot;nicolas prochazka&quot; &lt;<a href=3D"mailto:prochaz=
ka.nicolas@gmail.com">prochazka.nicolas@gmail.com</a>&gt; wrote:<br type=3D=
"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hello, can somebody tells me what I =
do wrong :<br>
I can ping from server 1 --&gt; client 1=C2=A0 ( ping fd00:14::8b5:8aff:fe8=
5:f3ee ) .<br>
but not from client 1 --&gt; server1=C2=A0 ( ping fd00:14::8b5:8aff:fe85:f3=
ec )<br>
<br>
we can notice<br>
RX packets:230 errors:1112 dropped:0 overruns:0 frame:1112<br>
on server side=C2=A0 seems strange<br>
<br>
wireguard : v0.0.20170918]<br>
kernel : 4.9.23 on client1<br>
kernel : 4.4.0 on server 1<br>
<br>
<br>
Regards,<br>
Nicolas Prochazka<br>
<br>
Server 1 :<br>
ifconfig neocoretech_rd<br>
neocoretech_rd Link encap:UNSPEC=C2=A0 HWaddr<br>
00-00-00-00-00-00-00-00-00-00-<wbr>00-00-00-00-00-00<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fd00:14::8b5:8aff:fe85:f3ec/=
32 Scope:Global<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP POINTOPOINT RUNNING NOARP=C2=A0 MTU:1=
420=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:230 errors:1112 dropped:0 ove=
rruns:0 frame:1112<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:390 errors:0 dropped:0 overru=
ns:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:24672 (24.6 KB)=C2=A0 TX bytes:=
39104 (39.1 KB)<br>
<br>
<br>
[52.209.226.5]~/resources/<wbr>tunnelHelper&gt;wg showconf neocoretech_rd<b=
r>
[Interface]<br>
ListenPort =3D 6081<br>
PrivateKey =3D mNHgDu3Nbusb3Xd8tI8imBkFgvnUSC<wbr>jKGVP5qT8pi2Q=3D<br>
<br>
[Peer]<br>
PublicKey =3D 5zSx+<wbr>CxgcjLKE2shpkTrLFgCHNOPM6r7Tcu<wbr>Z5cSx2AA=3D<br>
AllowedIPs =3D fd00:14::8b5:8aff:fe85:f3ee/<wbr>128<br>
Endpoint =3D <a href=3D"http://77.156.254.18:25813" rel=3D"noreferrer" targ=
et=3D"_blank">77.156.254.18:25813</a><br>
<br>
wg show neocoretech_rd<br>
interface: neocoretech_rd<br>
=C2=A0 public key: lrJtbn/<wbr>Jfdb1NyIP78ls11uqAzjcWzDuD+<wbr>x05RxFk20=3D=
<br>
=C2=A0 private key: (hidden)<br>
=C2=A0 listening port: 6081<br>
<br>
peer: 5zSx+<wbr>CxgcjLKE2shpkTrLFgCHNOPM6r7Tcu<wbr>Z5cSx2AA=3D<br>
=C2=A0 endpoint: <a href=3D"http://77.156.254.18:25813" rel=3D"noreferrer" =
target=3D"_blank">77.156.254.18:25813</a><br>
=C2=A0 allowed ips: fd00:14::8b5:8aff:fe85:f3ee/<wbr>128<br>
=C2=A0 latest handshake: 1 minute, 10 seconds ago<br>
=C2=A0 transfer: 23.95 KiB received, 36.07 KiB sent<br>
<br>
<br>
<br>
Client 1 :<br>
ifconfig wg0<br>
wg0=C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:UNSPEC=C2=A0 HWaddr<br>
00-00-00-00-00-00-00-00-00-00-<wbr>00-00-00-00-00-00<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fd00:14::8b5:8aff:fe85:f3ee/=
8 Scope:Global<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP POINTOPOINT RUNNING NOARP=C2=A0 MTU:1=
420=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:230 errors:0 dropped:0 overru=
ns:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:1366 errors:0 dropped:0 overr=
uns:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:23632 (23.0 KiB)=C2=A0 TX bytes=
:230352 (224.9 KiB)<br>
<br>
<br>
[optimizer] wg showconf wg0<br>
[Interface]<br>
ListenPort =3D 6081<br>
PrivateKey =3D IM0tv9xWcVBPhD7+<wbr>Tny7LHnYu1YHBGCJbBr6fgCdZns=3D<br>
<br>
[Peer]<br>
PublicKey =3D lrJtbn/<wbr>Jfdb1NyIP78ls11uqAzjcWzDuD+<wbr>x05RxFk20=3D<br>
AllowedIPs =3D ::/0<br>
Endpoint =3D <a href=3D"http://52.209.226.5:6081" rel=3D"noreferrer" target=
=3D"_blank">52.209.226.5:6081</a><br>
PersistentKeepalive =3D 25<br>
<br>
wg show wg0<br>
interface: wg0<br>
=C2=A0 public key: 5zSx+<wbr>CxgcjLKE2shpkTrLFgCHNOPM6r7Tcu<wbr>Z5cSx2AA=3D=
<br>
=C2=A0 private key: (hidden)<br>
=C2=A0 listening port: 6081<br>
<br>
peer: lrJtbn/<wbr>Jfdb1NyIP78ls11uqAzjcWzDuD+<wbr>x05RxFk20=3D<br>
=C2=A0 endpoint: <a href=3D"http://52.209.226.5:6081" rel=3D"noreferrer" ta=
rget=3D"_blank">52.209.226.5:6081</a><br>
=C2=A0 allowed ips: ::/0<br>
=C2=A0 latest handshake: 37 seconds ago<br>
=C2=A0 transfer: 22.99 KiB received, 215.96 KiB sent<br>
=C2=A0 persistent keepalive: every 25 seconds<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br></div>

--001a113eb8aeda28090559a0873f--
