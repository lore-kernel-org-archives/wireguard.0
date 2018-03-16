Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7905fc7
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 02:13:28 +0000 (UTC)
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
 [209.85.223.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5f9d79b
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 02:13:28 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e79so2668637ioi.7
 for <wireguard@lists.zx2c4.com>; Thu, 15 Mar 2018 19:24:02 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com.
 [209.85.214.54])
 by smtp.gmail.com with ESMTPSA id s1sm4282233ioe.79.2018.03.15.19.24.00
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Mar 2018 19:24:00 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f54.google.com with SMTP id k135-v6so320453ite.2
 for <wireguard@lists.zx2c4.com>; Thu, 15 Mar 2018 19:24:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPGejTe5nKoZfQbyZYfpz5GmiC+UAvkmnuTehKvXjzLxUeHbaw@mail.gmail.com>
References: <CAPGejTe5nKoZfQbyZYfpz5GmiC+UAvkmnuTehKvXjzLxUeHbaw@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Thu, 15 Mar 2018 22:24:00 -0400
Message-ID: <CAK_h9uGv7ajAU4QpLTwJEmL2k_G7+GH73nPU4Dw8rKpoVm_qfw@mail.gmail.com>
Subject: Re: Cannot ping peer 1 from peer 2
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

The ip address for the wg0 interface on peer 2 is set to 10.100.1.2/32
so peer2 has no route to reach 10.100.1.1. You either need to set a
route to 10.100.1.1 on peer 2 or change the address on peer 2 so the
subnet it is in includes 10.100.1.1. For example 10.100.1.2/24.

On Thu, Mar 15, 2018 at 10:07 PM, Vikas <kedia.vikas@gmail.com> wrote:
> Here is the config on peer 1 (Vmware VM running ubuntu 16.04):
> =================================================
>
> vk@ubuntu /g/r/c/w/server> ifconfig ens33
> ens33     Link encap:Ethernet  HWaddr 00:0c:29:c8:6c:d5
>           inet addr:10.0.1.77  Bcast:10.0.1.255  Mask:255.255.255.0
>           inet6 addr: fe80::5b06:24b6:c9e4:954e/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:327949 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:87146 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:351155285 (351.1 MB)  TX bytes:12179516 (12.1 MB)
>
>
> vk@ubuntu /g/r/c/w/server> more etc-wireguard-wg0.conf
> [Interface]
> Address = 10.100.1.1/24
> ListenPort = 51820
> PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
> POSTROUTING -o ens33 -j MASQUERADE
> PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
> POSTROUTING -o ens33 -j MASQUERADE
> PrivateKey = CPQLRq40QGY3+8yn2LlYb1x3zU/3/Ki+A4QjVYgbakY=
> SaveConfig = true
>
> [Peer]
> PublicKey = uL8bs5596DJO7BMnrIVG5btvr4LTzlbx1ovwHe59NBc=
> AllowedIPs = 10.100.1.2/32
>
>
> vk@ubuntu /g/r/c/w/server> ifconfig wg0
> wg0       Link encap:UNSPEC  HWaddr
> 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
>           inet addr:10.100.1.1  P-t-P:10.100.1.1  Mask:255.255.255.0
>           UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:459 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
>
>
> Here is the config on peer 2  (Vmware VM running ubuntu 18.04):
> ==================================================
>
> root@ubuntu /g/r/c/w/client# ifconfig ens33
> ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>         inet 10.0.1.71  netmask 255.255.255.0  broadcast 10.0.1.255
>         inet6 fe80::c4d7:35d6:306b:fc91  prefixlen 64  scopeid 0x20<link>
>         ether 00:0c:29:b6:bb:18  txqueuelen 1000  (Ethernet)
>         RX packets 532611  bytes 765847699 (765.8 MB)
>         RX errors 0  dropped 0  overruns 0  frame 0
>         TX packets 71767  bytes 5458394 (5.4 MB)
>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>
>
> root@ubuntu /g/r/c/w/client# more etc-wireguard-wg0.conf
> [Interface]
> Address = 10.100.1.2
> PrivateKey = AMZXJ1vBx6OOnZlbnYHuShTBAPuOzwCgweG73BS/4WY=
>
> [Peer]
> PublicKey = KNuvytvYu9NktxybaOHsCF11q96IGfc+dT/Dv8L6KB0=
> AllowedIPs = 0.0.0.0/0
> Endpoint = 10.0.1.77:51280
>
>
> root@ubuntu /g/r/c/w/client# ifconfig wg0
> wg0: flags=209<UP,POINTOPOINT,RUNNING,NOARP>  mtu 1420
>         inet 10.100.1.2  netmask 255.255.255.255  destination 10.100.1.2
>         unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
> txqueuelen 1000  (UNSPEC)
>         RX packets 0  bytes 0 (0.0 B)
>         RX errors 0  dropped 0  overruns 0  frame 0
>         TX packets 10  bytes 1480 (1.4 KB)
>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>
>
> root@ubuntu /g/r/c/w/client# ping 10.0.1.77
> PING 10.0.1.77 (10.0.1.77) 56(84) bytes of data.
> 64 bytes from 10.0.1.77: icmp_seq=1 ttl=64 time=0.464 ms
> 64 bytes from 10.0.1.77: icmp_seq=2 ttl=64 time=0.715 ms
>
>
> root@ubuntu /g/r/c/w/client# ping 10.100.1.1
> PING 10.100.1.1 (10.100.1.1) 56(84) bytes of data.
> ^C
> --- 10.100.1.1 ping statistics ---
> 3 packets transmitted, 0 received, 100% packet loss, time 2033ms
>
>
> What am I doing wrong?
>
> --
> VK
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
