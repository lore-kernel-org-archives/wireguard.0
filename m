Return-Path: quanzhou822@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7dec147
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jul 2018 13:05:26 +0000 (UTC)
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4db4d92
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jul 2018 13:05:26 +0000 (UTC)
Received: by mail-lf0-x241.google.com with SMTP id b22-v6so808125lfa.3
 for <wireguard@lists.zx2c4.com>; Tue, 17 Jul 2018 06:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRLKH-8fEJ9Cv9rMT2u3sv0oUqu1dD++xXV51dZh3CxmCHBsg@mail.gmail.com>
 <9698f870-3e78-5ccb-b612-1eeef7d18f2c@sholland.org>
In-Reply-To: <9698f870-3e78-5ccb-b612-1eeef7d18f2c@sholland.org>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Tue, 17 Jul 2018 21:13:27 +0800
Message-ID: <CAMRLKH9uHdchRQjy4x4Q3icQK-1FoKcA_NsRGb_tLXBs=9WAVg@mail.gmail.com>
Subject: Re: multiple wg interface in different namespace
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It works! Thank you!
On Tue, Jul 17, 2018 at 6:23 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Hello,
>
> On 07/16/18 03:50, Quan Zhou wrote:
> > I've been using wg for a while without any problem, but today I wanted
> > to try something with the namespace[1]. There's a difference in my
> > settings, I already have a wg working without the netns. This or
> > perhaps other factors results in a failure bringing up the interface:
> > ``RTNETLINK answers: Address already in use.'' Details follow.
> >
> > [1]: https://www.wireguard.com/netns/
> >
> > Configuration:
> > ==== SiteA to SiteC (working correctly):
> >
> > ```bash
> > ip link add dev wg0 type wireguard
> > wg setconf wg0 /etc/wireguard/wg0.conf
> > ip link set up dev wg0
> > ip route add 192.168.<>.0/24 dev wg0
> > ip route add 10.12.<>.0/24 dev wg0
> > ```
> > ==== SiteA to SiteB (Trouble bringing up iface on Site A):
> > ```bash
> > ip netns add sv0
> > ip link add sv0en0 type veth peer ens3
> > ip link add sv0wg0 type wireguard
> > ip link set sv0en0 netns sv0
> > ip link set sv0wg0 netns sv0
>
> Here you're creating the WireGuard interface before moving it to the sv0
> namespace. The underlying UDP socket used by WireGuard is created in the
> original namespace, and is _not_ moved with the interface. If you're using the
> same ListenPort on both interfaces, the sockets will conflict, as you can see in
> dmesg. Either:
> - Use different listen ports for the two WireGuard interfaces, or
> - Create sv0wg0 in the sv0 namespace instead of moving it there after the fact.
>
> > ip -n sv0 addr add <IP>/32 dev sv0en0
> > ip -n sv0 route add default dev sv0en0
> > ip -n sv0 link set up sv0en0
> > ip netns exec sv0 wg setconf sv0wg0 ./sv0wg0.conf
> > ip -n sv0 addr add <IP>/31 dev sv0wg0
> > ip -n sv0 link set up sv0wg0
> > ```
> > # ip -n sv0 link set up sv0wg0
> > RTNETLINK answers: Address already in use
> >
> > ==== dmesg |grep wireguard
> > ```
> > [   16.051148] wireguard: loading out-of-tree module taints kernel.
> > [   16.051390] wireguard: module verification failed: signature and/or
> > required key missing - tainting kernel
> > [   16.051880] wireguard: WireGuard 0.0.20180708 loaded. See
> > www.wireguard.com for information.
> > [   16.051881] wireguard: Copyright (C) 2015-2018 Jason A. Donenfeld
> > <Jason@zx2c4.com>. All Rights Reserved.
> > [  214.191712] wireguard: sv0wg0: Could not create IPv4 socket
> > [  233.096882] wireguard: sv0wg0: Could not create IPv4 socket
> > [  250.411586] wireguard: sv0wg0: Could not create IPv4 socket
> > [  522.266844] wireguard: sv0wg0: Could not create IPv4 socket
> > [  950.891264] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1004.031902] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1044.773710] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1053.273612] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1057.656802] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1312.781415] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1359.582271] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1370.719755] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1586.955734] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 1603.063851] wireguard: sv0wg0: Could not create IPv4 socket
> > [ 2257.095367] wireguard: wg0: Could not create IPv4 socket
> > [ 3631.242070] wireguard: sv0wg0: Could not create IPv4 socket
> > ```
> > ==== Workaround (not really)
> > ```bash
> > # ip link set down wg0
> > # ip -n sv0 link set up sv0wg0
> > # # >>> Works
> > # ip link set up wg0
> > # # >>> RTNETLINK answers: Address already in use
> > # # >>> See entry [ 2257.095367] in the dmesg above
> > ```
> >
>
> Regards,
> Samuel



-- 
Regards,

Quan Zhou

E271C0D1BD90012B8D8EECF6F822BC9F8E1C35C8
quanzhou822@gmail.com
https://keybase.io/qzhou
