Return-Path: quanzhou822@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d42d1adc
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jul 2018 08:42:44 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b6fedb0
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jul 2018 08:42:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x12-v6so3565858ljj.9
 for <wireguard@lists.zx2c4.com>; Mon, 16 Jul 2018 01:50:50 -0700 (PDT)
MIME-Version: 1.0
From: Quan Zhou <quanzhou822@gmail.com>
Date: Mon, 16 Jul 2018 16:50:38 +0800
Message-ID: <CAMRLKH-8fEJ9Cv9rMT2u3sv0oUqu1dD++xXV51dZh3CxmCHBsg@mail.gmail.com>
Subject: multiple wg interface in different namespace
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all,

I've been using wg for a while without any problem, but today I wanted
to try something with the namespace[1]. There's a difference in my
settings, I already have a wg working without the netns. This or
perhaps other factors results in a failure bringing up the interface:
``RTNETLINK answers: Address already in use.'' Details follow.

[1]: https://www.wireguard.com/netns/

Configuration:
==== SiteA to SiteC (working correctly):

```bash
ip link add dev wg0 type wireguard
wg setconf wg0 /etc/wireguard/wg0.conf
ip link set up dev wg0
ip route add 192.168.<>.0/24 dev wg0
ip route add 10.12.<>.0/24 dev wg0
```
==== SiteA to SiteB (Trouble bringing up iface on Site A):
```bash
ip netns add sv0
ip link add sv0en0 type veth peer ens3
ip link add sv0wg0 type wireguard
ip link set sv0en0 netns sv0
ip link set sv0wg0 netns sv0
ip -n sv0 addr add <IP>/32 dev sv0en0
ip -n sv0 route add default dev sv0en0
ip -n sv0 link set up sv0en0
ip netns exec sv0 wg setconf sv0wg0 ./sv0wg0.conf
ip -n sv0 addr add <IP>/31 dev sv0wg0
ip -n sv0 link set up sv0wg0
```
# ip -n sv0 link set up sv0wg0
RTNETLINK answers: Address already in use

==== dmesg |grep wireguard
```
[   16.051148] wireguard: loading out-of-tree module taints kernel.
[   16.051390] wireguard: module verification failed: signature and/or
required key missing - tainting kernel
[   16.051880] wireguard: WireGuard 0.0.20180708 loaded. See
www.wireguard.com for information.
[   16.051881] wireguard: Copyright (C) 2015-2018 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
[  214.191712] wireguard: sv0wg0: Could not create IPv4 socket
[  233.096882] wireguard: sv0wg0: Could not create IPv4 socket
[  250.411586] wireguard: sv0wg0: Could not create IPv4 socket
[  522.266844] wireguard: sv0wg0: Could not create IPv4 socket
[  950.891264] wireguard: sv0wg0: Could not create IPv4 socket
[ 1004.031902] wireguard: sv0wg0: Could not create IPv4 socket
[ 1044.773710] wireguard: sv0wg0: Could not create IPv4 socket
[ 1053.273612] wireguard: sv0wg0: Could not create IPv4 socket
[ 1057.656802] wireguard: sv0wg0: Could not create IPv4 socket
[ 1312.781415] wireguard: sv0wg0: Could not create IPv4 socket
[ 1359.582271] wireguard: sv0wg0: Could not create IPv4 socket
[ 1370.719755] wireguard: sv0wg0: Could not create IPv4 socket
[ 1586.955734] wireguard: sv0wg0: Could not create IPv4 socket
[ 1603.063851] wireguard: sv0wg0: Could not create IPv4 socket
[ 2257.095367] wireguard: wg0: Could not create IPv4 socket
[ 3631.242070] wireguard: sv0wg0: Could not create IPv4 socket
```
==== Workaround (not really)
```bash
# ip link set down wg0
# ip -n sv0 link set up sv0wg0
# # >>> Works
# ip link set up wg0
# # >>> RTNETLINK answers: Address already in use
# # >>> See entry [ 2257.095367] in the dmesg above
```
-- 
Regards,

Quan Zhou

E271C0D1BD90012B8D8EECF6F822BC9F8E1C35C8
quanzhou822@gmail.com
