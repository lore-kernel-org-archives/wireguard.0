Return-Path: florian.werner@dev.xod.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a415e63
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 02:45:22 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 079d368d
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 02:45:22 +0000 (UTC)
Received: from KZ3 ([95.91.106.14]) by mrelayeu.kundenserver.de (mreue004
 [212.227.15.167]) with ESMTPSA (Nemesis) id 0MPKs8-1dyt9t1Hii-004TF3 for
 <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 05:12:33 +0200
From: "Florian Werner" <florian.werner@dev.xod.de>
To: <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard and VRFs?
Date: Wed, 20 Sep 2017 05:12:34 +0200
Message-ID: <000001d331be$4e5d4900$eb17db00$@dev.xod.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

does Wireguard support to bind to a specific interface?

For e.g. gre interface it is possible with
ip tunnel add name gre0 mode gre remote 1.2.3.4 dev eth0
to bind the gre0 interface to eth0.

Quoting ip-tunnel(8):
dev NAME
	bind the tunnel to the device NAME so that tunneled
	packets will only be routed via this device and will
	not be able to escape to another device when the route
	to endpoint changes.

But I don't think ip link supports this.
The question is, why are there 2 commands to create new
interfaces (ip link add, ip tunnel add)...

With binding support one can simply bind to a vrf master
interface and all outer-traffic is sent to the associated
routing table. Using vrf instead of network namespace has
the advantage of allowing daemons to operate in multiple
vrf (e.g. routing daemons), where network namespace are
more separated but also don't allow much communication.

Florian
