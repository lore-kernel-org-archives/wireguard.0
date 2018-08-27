Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 711b9a85
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 12:00:57 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18aeed56
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 12:00:57 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e9:9eff:fe8f:1bcf])
 by len.romanrm.net (Postfix) with SMTP id E27AA20407
 for <wireguard@lists.zx2c4.com>; Mon, 27 Aug 2018 12:14:26 +0000 (UTC)
Date: Mon, 27 Aug 2018 17:14:26 +0500
From: Roman Mamedov <rm@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: Getting IPv6 route advertisements to work over WG
Message-ID: <20180827171426.7c4ec614@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I am trying to get IPv6 link-local IPs and route advertisements to work over
WG. The reason is not for the usual case of address autoconfiguration, but to
use RA as a dynamic routing protocol of sorts, as it can distribute routes --
or in case of WG (where routes need to be static in AllowedIPs), act as a
keep-alive protocol.

Example use: a host can be connected to a network via a number of independent
routers (and separate WG tunnel to each); in case one of the routers goes
down, the route entry that it was sending via RA times out, so the host will
automatically use the other one(s) to reach that network. It would look
similar to this:

# ip -6 route
...
fd00::/32 via fe80::be:a0ff:fe18:4aac dev wg1 proto ra metric 1024  expires 30sec pref medium
fd00::/32 via fe80::e8:4fff:fe94:2d7f dev wg2 proto ra metric 1024  expires 119sec pref medium
fd00::/32 via fe80::43:31ff:fec0:da97 dev wg3 proto ra metric 1024  expires 86360sec pref low
...

What works:

  * manually assigning link-local(LL) IPs on both sides of a WG tunnel
    (fe80:[somethingrandom]/64 scope link);
  * any normal communication over these LL IPs (assuming they are also present
    in AllowedIPs);
  * running RADVD with WG link as one of its interfaces;
  * explicitly requesting and receiving a RA, via using 'rdisc6' while specifying the
    other side's LL IP;

What doesn't:

  * it appears multicast not supported, so anything involving
    multicast, as in automatically requesting RAs on the kernel side, or
    manually with 'rdisc6' but without specifying peer's LL:

      # rdisc6 wg3
      Soliciting ff02::2 (ff02::2) on wg3...
      Sending ICMPv6 packet: Required key not available

I found discussion[1], but it is unclear what is the outcome. In any case, I
would like to add my vote to please add some kind of multicast support, even
if just as a dumb broadcast for now. It would work just fine for a lot of
cases; don't know about others, but my WG networks tend to include at most 2-3
hosts each (but there's a lot of independent networks).

[1] https://lists.zx2c4.com/pipermail/wireguard/2017-April/001177.html

-- 
With respect,
Roman
