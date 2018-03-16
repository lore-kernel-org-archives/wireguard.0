Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d08971c
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 17:24:45 +0000 (UTC)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adc93413
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 17:24:45 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 139so4451450wmn.2
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 10:35:24 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Reconciling "cryptokey-based" and regular routing
References: <20180316220111.594ee06f@natsu>
To: Roman Mamedov <rm@romanrm.net>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <775e120b-b0cc-bf79-f4e1-b555dd5a5fab@gmail.com>
Date: Fri, 16 Mar 2018 17:35:21 +0000
MIME-Version: 1.0
In-Reply-To: <20180316220111.594ee06f@natsu>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 16/03/18 17:01, Roman Mamedov wrote:
> Hello,
> 
> I need to have multiple gateways on my WG network that can provide
> access to the entire IPv4 (or IPv6) Internet, for redundancy and
> load-balancing purposes.
> 
> In WG terms this means I need to set AllowedIPs to 0.0.0.0/0 on
> more than one peer. Then I would add routes into the regular
> routing table for various destinations,
> 
> ip -4 route add 8.8.8.8 via 10.0.0.1 ip -4 route add 8.8.4.4 via
> 10.0.0.2
> 
> or
> 
> ip -4 route add default \ nexthop via 10.0.0.1 weight 1 \ nexthop
> via 10.0.0.2 weight 1
> 
> or whatever.

WireGuard is a layer 3 interface; there is no ARP/NDP or other layer 2
semantics. This means "via foo" doesn't mean anything and is pointless.

> But as documentation and some testing show, this can't really work
> in WG's "cryptokey-routing" system. If multiple hosts have
> 0.0.0.0/0 as allowed IPs, WG just sends everything to a random one
> of them (the first one?), disregarding all of the routing table
> settings from the examples above.

If you add a duplicate AllowedIPs to a peer, it will remove it from the
previous peer, so the "order" is "most recently-configured".

> Is there any possibility to still use multiple routers like that?

Use multiple WireGuard interfaces.

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJarABUAAoJEIrwc3SIqzAS3K0P/j3RSFF1ba+1r+hi5TEGc5aJ
RdbMHptnuyMseNZ2YluipgMMxapQ5dv0jd90zWvqAnL+Sg5rWjl7J3IrMByOmW+1
SJsKUiqTbrscQmJKYHgElxDEmDO294DR51GXJdh3+RvUbXy/dqGwkRbm2WH1qc7c
URH5/Pz734fLyFJ/ISDPzHRYhxqj9d8+W9sylR9QW6y4Lo4s31H6K42qplNdoQIL
gRvyTDCFzRhetOeolRb1Rq0wc/BF/OpoqijS4U+hkwB+o0cXZqFL4iGoGM8ePStQ
zGT3nBQfLENAlCP2JJ0Jfu2Lbo9efO1lY1dDDR/y7HsukkwSKEE6hTQPhei9S1J8
pI8r0C225hrr/1G3acpBKZ5TRrFyatlwbyXPvFx49ntW5w+1wbiKe9HEKRBNFmSz
37VT7s5ahwT3GaWOFuLrWGfqlz7Z2FnDXq9zLaKWF/IcdXuuMAfcpUvt8UIeNJi7
Vfe9tgwIz4RdIkd/tv9vKY9O5FEV3ui99P8naZQk3aHnbcerQ9KXsNyUvBZeAIzk
NQL8xbL8fKx8f+r7jUZTPrQp/6m6uB+YvXwmZnB9aWCgBqNMuAmgU6PwKHUyYc86
4SRUtm3lsJRuSATJZJAM48AnMEeGdR0cdiLnY5Q+EqTHY/vAxFspC9P8YZtHA5ZC
cr0oFDndYvwyRtarOsQq
=V9Ys
-----END PGP SIGNATURE-----
