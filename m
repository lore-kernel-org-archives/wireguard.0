Return-Path: nnet@fastmail.fm
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7361df8f
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 15:16:58 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c03f4947
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 15:16:58 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 53FF821E09
 for <wireguard@lists.zx2c4.com>; Thu, 24 May 2018 11:18:19 -0400 (EDT)
Message-Id: <1527175099.1346238.1383543696.317FDD08@webmail.messagingengine.com>
From: nnet <nnet@fastmail.fm>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Thu, 24 May 2018 08:18:19 -0700
In-Reply-To: <CAHmME9rPPrf3TzWT4EMkm5ixKUpB86Ms3ruVbgQsGhOY8+OdHg@mail.gmail.com>
References: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
 <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
 <CAHmME9pMHQ0hjbZ35sf7d1NQkuOJxwHRhEwJ5PdOP98epmmWWQ@mail.gmail.com>
 <CAHmME9rPPrf3TzWT4EMkm5ixKUpB86Ms3ruVbgQsGhOY8+OdHg@mail.gmail.com>
Subject: Re: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> It would appear that T-Mobile is using 464XLAT ...

Yes, from what I've seen and read.

> ...  and Android runs
> https://github.com/toreanderson/clatd
...
> Can you confirm this suspicion by sending the output of `ip addr show`
> and `ps|grep clat`?

Below follows. Although DHCP is giving IPv4 only on WiFi there is a link local IPv6 address.

$ ps|grep clat
1
$ ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: dummy0: <BROADCAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN group default
    link/ether snipmac brd ff:ff:ff:ff:ff:ff
    inet6 snipinet6 scope link
       valid_lft forever preferred_lft forever
3: sit0: <NOARP> mtu 1480 qdisc noop state DOWN group default
    link/sit 0.0.0.0 brd 0.0.0.0
4: rmnet_ipa0: <UP,LOWER_UP> mtu 2000 qdisc pfifo_fast state UNKNOWN group default qlen 1000
    link/[530]
5: rmnet_data0: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
6: rmnet_data1: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
7: rmnet_data2: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
8: rmnet_data3: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
9: rmnet_data4: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
10: rmnet_data5: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
11: rmnet_data6: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/[530]
12: rmnet_data7: <UP,LOWER_UP> mtu 1500 qdisc htb state UNKNOWN group default qlen 1000
    link/[530] 
    inet6 snipinet6/64 scope global dynamic                             
       valid_lft forever preferred_lft forever
    inet6 snipinet6/64 scope link               
       valid_lft forever preferred_lft forever
13: r_rmnet_data0: <UP,LOWER_UP> mtu 3000 qdisc pfifo_fast state UNKNOWN group default qlen 1000
    link/[530] 
    inet6 snipinet6/64 scope link               
       valid_lft forever preferred_lft forever
14: r_rmnet_data1: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
15: r_rmnet_data2: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
16: r_rmnet_data3: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
17: r_rmnet_data4: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
18: r_rmnet_data5: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
19: r_rmnet_data6: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
20: r_rmnet_data7: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
21: r_rmnet_data8: <> mtu 3000 qdisc noop state DOWN group default qlen 1000
    link/[530]
25: tun0: <POINTOPOINT,UP,LOWER_UP> mtu 1280 qdisc pfifo_fast state UNKNOWN group default qlen 500
    link/none
    inet snipinet/32 scope global tun0
       valid_lft forever preferred_lft forever
32: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 3000
    link/ether snipmac brd ff:ff:ff:ff:ff:ff
    inet snipinet/24 brd snipinet scope global wlan0
       valid_lft forever preferred_lft forever
    inet6 snipinet6/64 scope link
       valid_lft forever preferred_lft forever
33: p2p0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 3000
    link/ether snipmac brd ff:ff:ff:ff:ff:ff


On Thu, May 24, 2018, at 8:04 AM, Jason A. Donenfeld wrote:
> It would appear that T-Mobile is using 464XLAT and Android runs
> https://github.com/toreanderson/clatd
> 
> Can you confirm this suspicion by sending the output of `ip addr show`
> and `ps|grep clat`?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
