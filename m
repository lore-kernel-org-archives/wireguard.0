Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd97da42
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 16:50:34 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41a19262
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 16:50:34 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e9:9eff:fe8f:1bcf])
 by rin.romanrm.net (Postfix) with SMTP id 6E60C4059D
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 17:01:12 +0000 (UTC)
Date: Fri, 16 Mar 2018 22:01:11 +0500
From: Roman Mamedov <rm@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: Reconciling "cryptokey-based" and regular routing
Message-ID: <20180316220111.594ee06f@natsu>
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

I need to have multiple gateways on my WG network that can provide access to
the entire IPv4 (or IPv6) Internet, for redundancy and load-balancing
purposes.

In WG terms this means I need to set AllowedIPs to 0.0.0.0/0 on more than one
peer. Then I would add routes into the regular routing table for various
destinations,

ip -4 route add 8.8.8.8 via 10.0.0.1
ip -4 route add 8.8.4.4 via 10.0.0.2

or

ip -4 route add default \
  nexthop via 10.0.0.1 weight 1 \
  nexthop via 10.0.0.2 weight 1

or whatever.

But as documentation and some testing show, this can't really work in WG's
"cryptokey-routing" system. If multiple hosts have 0.0.0.0/0 as allowed IPs,
WG just sends everything to a random one of them (the first one?),
disregarding all of the routing table settings from the examples above.

Is there any possibility to still use multiple routers like that?

If not, then could you add an option to not use AllowedIPs for routing?
Or at least to not enforce filtering on incoming packets -- then perhaps I
could have only 10.0.0.1 and 10.0.0.2 in AllowedIPs for those hosts, and
outgoing routing would work properly, with replies from Internet hosts not
getting filtered out?

(Apologies for multiple posts per day, I'm just deploying WireGuard for the
first time today, and it's quite unusual compared to what I used before. I
will stop soon :)

-- 
With respect,
Roman
