Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5d4045c
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 17:01:45 +0000 (UTC)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 103d1dfb
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 17:01:44 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r68so18011280wmr.1
 for <wireguard@lists.zx2c4.com>; Thu, 23 Nov 2017 09:07:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Fri, 24 Nov 2017 01:06:59 +0800
Message-ID: <CAC6SzHLUP5TFnra63T_DXkqxPpDQr_-n5KCNGkWqG02DyBvgVA@mail.gmail.com>
Subject: Re: multi-home difficulty
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

2017-11-23 7:35 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Tue, Nov 21, 2017 at 3:35 PM, d tbsky <tbskyd@gmail.com> wrote:
>> thanks for the quick reply. my wireguard configuration is in the
>> previous mail, so I think the linux firewall part is what you want.
>
> Right. So if you can give me minimal instructions on how to set up a
> box that exhibits the buggy behavior you're seeing, I can try to fix
> it.
>
> Jason

sorry for the delay.  I try to make a minimal config to reproduce the
problem in our firewall, but it's not easy. the communication
sometimes works, sometimes failed. suddenly I remember many years ago
I got similar problems with openvpn. according the manual pages of
openvpn:

 --multihome
              Configure a multi-homed UDP server.  This option needs
to be used when a server has more  than  one  IP
              address  (e.g. multiple interfaces, or secondary IP
addresses), and is not using --local to force bind=E2=80=90
              ing to one specific address only.  This option will add
some extra lookups to the packet path to ensure
              that  the UDP reply packets are always sent from the
address that the client is talking to. This is not
              supported on all platforms, and it adds more processing,
so it's not enabled by default.

              Note: this option is only relevant for UDP servers.

              Note 2: if you do an IPv6+IPv4 dual-stack bind on a
Linux machine with multiple IPv4  address,  connec=E2=80=90
              tions  to  IPv4 addresses will not work right on kernels
before 3.15, due to missing kernel support for
              the IPv4-mapped case (some distributions have ported
this to earlier kernel versions, though).

  I forgot these. many strange things happen if you didn't bind
specific ip, even with "--multihome"

  finally I made a environment for you to test. my OS is rehl 7.4,
kernel version 3.10.0-693.5.2

  1. build a virtual rhel 7.4 box, bind 2 virtio nic to it. (single
nic won't show the problem, I don't now why).
  2. stop NetworkManager
  3. setup network environment like below(skip eth0, setup eth1 with
two ip addresses):

ip addr flush dev eth1
ip addr add 10.99.1.99/24 dev eth1
ip addr add 10.99.1.100/24 dev eth1
ip link set eth1 up
ip route add default via 10.99.1.254

ip link add wg0 type wireguard
ip addr add 172.31.21.1 peer 172.31.21.2 dev wg0
wg setconf wg0 /root/server.conf
ip link set wg0 up

/root/server.conf like below:
[Interface]
PrivateKey =3D ****
ListenPort =3D 51820
[Peer]
PublicKey =3D ****
AllowedIPs =3D 0.0.0.0/0

    4. setup wireguard at client site. client.conf like below:

[Interface]
PrivateKey =3D ****
ListenPort =3D 51820
[Peer]
PublicKey =3D ****
Endpoint =3D  10.99.1.100:51820
AllowedIPs =3D 0.0.0.0/0

    5. at client site, "ping 172.31.21.1".

    6. at server site, "modprobe nf_conntrack_ipv4;cat
/proc/net/nf_conntrack | grep 51820":

ipv4     2 udp      17 29 src=3D10.99.1.99 dst=3D10.99.20.254 sport=3D51820
dport=3D51820 [UNREPLIED] src=3D10.99.20.254 dst=3D10.99.1.99 sport=3D51820
dport=3D51820 mark=3D0 zone=3D0 use=3D2
ipv4     2 udp      17 29 src=3D10.99.20.254 dst=3D10.99.1.100 sport=3D5182=
0
dport=3D51820 [UNREPLIED] src=3D10.99.1.100 dst=3D10.99.20.254 sport=3D5182=
0
dport=3D51820 mark=3D0 zone=3D0 use=3D2

   I don't know if you can reproduce in your environment.
   hope  wireguard can bind to specific ip in the future..

Regards,
tbskyd
