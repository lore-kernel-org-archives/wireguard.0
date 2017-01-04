Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c65fe4d
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:02:19 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf1b292c
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:02:19 +0000 (UTC)
Received: from [172.16.4.126]
 (dslb-092-074-243-193.092.074.pools.vodafone-ip.de [92.74.243.193])
 by v32412.1blu.de (Postfix) with ESMTPSA id 00B3C2055F
 for <wireguard@lists.zx2c4.com>; Wed,  4 Jan 2017 22:11:18 +0100 (CET)
From: jens <jens@viisauksena.de>
Subject: wg set allowed ip confusion
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <5674e440-84df-dab2-41ef-327cf61dca1e@viisauksena.de>
Date: Wed, 4 Jan 2017 22:10:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

hi,

after playing around with more than 1 peer i got in trouble ... i
realized that a endpoint itself it is not needed "server"side. so i set
none, but allowed-ips is ! but if i set one,the other one is deleted.
What do i miss?
thx so far.


i set up a second peer on a server like this (or in config file it is
the same)
a@freifunk # wg set wg0 peer abcdefsomenicekey=3D allowed-ips 0.0.0.0/0  =
   =20
a@freifunk # wg set wg0 peer abcdefothernicekey=3D allowed-ips 0.0.0.0/0

than the first peers allowed IP fields become empty and connection from
peer1 is no longer possible, same vice versa

some more notes..
the peers are running on different uplinks on small embedded devices,
single (wireguard) used - no problem so far.
the wg"server" is running on a VM and port 10099 is NATted there. so
both incoming connection (with different IPv4) are on the same port like
this ...

# wg
=2E..
  endpoint: 111.123.123.100:10099
=2E..
  endpoint: 222.321.321.200:10099
=2E..


--=20
make the world nicer, please use PGP encryption
