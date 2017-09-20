Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 940c7ca9
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 17:42:08 +0000 (UTC)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
 [209.85.223.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 925e5fac
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 17:42:08 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q11so5426522ioe.10
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 11:09:25 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9rWpuWBRzZLFeaOG4zG-VxHUEi8wbXe4iL7xYguk0TMFw@mail.gmail.com>
References: <CADdae-hw0VGaCDGmsVpVT5g56xM3vs+AeOS8MYLwFo5pnf1N8Q@mail.gmail.com>
 <CAHmME9qrtSm1Y-h9FfyXWVCmrvmtciFau0jG2144Yrwu=BRMig@mail.gmail.com>
 <CAHmME9r0hXW8CT5wO10X-b-9HUBDzzvSAbnn69aFav+6ovxQGA@mail.gmail.com>
 <CAHmME9rWpuWBRzZLFeaOG4zG-VxHUEi8wbXe4iL7xYguk0TMFw@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Wed, 20 Sep 2017 20:09:23 +0200
Message-ID: <CADdae-j5Xr0jqB+dHcX7aYat60tahMCBTKiWVnSm_A-cQuf=qA@mail.gmail.com>
Subject: Re: [wireguard-dev] Help about configuration
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

hello,
you're right, sorry , it's just a old nat rule .
regards,
Nicolas

2017-09-20 17:21 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Seems likely the wrong source IP is being used for sending the ping. Use
> tcpdump on the initiating computer to make sure the source IP of the ping
> packet matches the allowed-ips of the other machine.
>
> --
> Sent from my telephone.
>
> On Sep 20, 2017 17:11, "nicolas prochazka" <prochazka.nicolas@gmail.com>
> wrote:
>
> Hello, can somebody tells me what I do wrong :
> I can ping from server 1 --> client 1  ( ping fd00:14::8b5:8aff:fe85:f3ee )
> .
> but not from client 1 --> server1  ( ping fd00:14::8b5:8aff:fe85:f3ec )
>
> we can notice
> RX packets:230 errors:1112 dropped:0 overruns:0 frame:1112
> on server side  seems strange
>
> wireguard : v0.0.20170918]
> kernel : 4.9.23 on client1
> kernel : 4.4.0 on server 1
>
>
> Regards,
> Nicolas Prochazka
>
> Server 1 :
> ifconfig neocoretech_rd
> neocoretech_rd Link encap:UNSPEC  HWaddr
> 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
>           inet6 addr: fd00:14::8b5:8aff:fe85:f3ec/32 Scope:Global
>           UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
>           RX packets:230 errors:1112 dropped:0 overruns:0 frame:1112
>           TX packets:390 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1
>           RX bytes:24672 (24.6 KB)  TX bytes:39104 (39.1 KB)
>
>
> [52.209.226.5]~/resources/tunnelHelper>wg showconf neocoretech_rd
> [Interface]
> ListenPort = 6081
> PrivateKey = mNHgDu3Nbusb3Xd8tI8imBkFgvnUSCjKGVP5qT8pi2Q=
>
> [Peer]
> PublicKey = 5zSx+CxgcjLKE2shpkTrLFgCHNOPM6r7TcuZ5cSx2AA=
> AllowedIPs = fd00:14::8b5:8aff:fe85:f3ee/128
> Endpoint = 77.156.254.18:25813
>
> wg show neocoretech_rd
> interface: neocoretech_rd
>   public key: lrJtbn/Jfdb1NyIP78ls11uqAzjcWzDuD+x05RxFk20=
>   private key: (hidden)
>   listening port: 6081
>
> peer: 5zSx+CxgcjLKE2shpkTrLFgCHNOPM6r7TcuZ5cSx2AA=
>   endpoint: 77.156.254.18:25813
>   allowed ips: fd00:14::8b5:8aff:fe85:f3ee/128
>   latest handshake: 1 minute, 10 seconds ago
>   transfer: 23.95 KiB received, 36.07 KiB sent
>
>
>
> Client 1 :
> ifconfig wg0
> wg0       Link encap:UNSPEC  HWaddr
> 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
>           inet6 addr: fd00:14::8b5:8aff:fe85:f3ee/8 Scope:Global
>           UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
>           RX packets:230 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:1366 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1
>           RX bytes:23632 (23.0 KiB)  TX bytes:230352 (224.9 KiB)
>
>
> [optimizer] wg showconf wg0
> [Interface]
> ListenPort = 6081
> PrivateKey = IM0tv9xWcVBPhD7+Tny7LHnYu1YHBGCJbBr6fgCdZns=
>
> [Peer]
> PublicKey = lrJtbn/Jfdb1NyIP78ls11uqAzjcWzDuD+x05RxFk20=
> AllowedIPs = ::/0
> Endpoint = 52.209.226.5:6081
> PersistentKeepalive = 25
>
> wg show wg0
> interface: wg0
>   public key: 5zSx+CxgcjLKE2shpkTrLFgCHNOPM6r7TcuZ5cSx2AA=
>   private key: (hidden)
>   listening port: 6081
>
> peer: lrJtbn/Jfdb1NyIP78ls11uqAzjcWzDuD+x05RxFk20=
>   endpoint: 52.209.226.5:6081
>   allowed ips: ::/0
>   latest handshake: 37 seconds ago
>   transfer: 22.99 KiB received, 215.96 KiB sent
>   persistent keepalive: every 25 seconds
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
