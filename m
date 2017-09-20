Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8646a234
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 14:44:17 +0000 (UTC)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
 [209.85.218.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 767d9571
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 14:44:17 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id l74so3069771oih.1
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 08:11:32 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Wed, 20 Sep 2017 17:11:31 +0200
Message-ID: <CADdae-hw0VGaCDGmsVpVT5g56xM3vs+AeOS8MYLwFo5pnf1N8Q@mail.gmail.com>
Subject: [wireguard-dev] Help about configuration
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello, can somebody tells me what I do wrong :
I can ping from server 1 --> client 1  ( ping fd00:14::8b5:8aff:fe85:f3ee ) .
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
