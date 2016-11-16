Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b1ca637
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 16:59:21 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9pX8iG67Mz_0zN-biOTyGXtm2DjRtQQwJTw9UTxz3ar4w@mail.gmail.com>
Date: Wed, 16 Nov 2016 18:04:38 +0100
Message-Id: <1F78626C-0102-4833-8E86-AEC1403507BF@danrl.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <E0BFF696-C9B9-45BC-98E5-E736C1AE11EF@danrl.com>
 <CAHmME9ph6MXEkwTdSgQ5MBRAimOv512zNjipxAo+qXSbLDpscg@mail.gmail.com>
 <CAHmME9pX8iG67Mz_0zN-biOTyGXtm2DjRtQQwJTw9UTxz3ar4w@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> The config value has to be the same to correlate them. In that case,
> you should show an example with multiple peers, so that it's clear
> what's happening.

It says "Peer configurations are managed via one or more =
wireguard_<ifname> sections." to introduce the example. However, won't =
hurt to add another peer for clarification.

Consider it done :)

DUMP:

Create a WireGuard tunnel interface named ''foo'' that connects to one =
peer (VPN server at vpn.example.com) and allows another peer (e.g. road =
warrior) to connect.
Peer configurations are managed via one or more ''wireguard_<ifname>'' =
sections.

<code>
config interface 'foo'
	option proto 'wireguard'
	option private_key =
'qLvQnx5CpXPDo6oplzdIvXLNqkbgpXip3Yv4ouHWZ0Q=3D'
	option preshared_key =
'M1IbkkDVwXsQbFbURiMXiVe/iUCjC5TKHCmemVs+oLQ=3D'

config wireguard_foo
	option public_key '9mD+mTiOp7SGIkB4t3ZfWAcfp5iA/WwQRdVypKKwrjY=3D'=

	option route_allowed_ips '1'
	list allowed_ips 'fd00:13:37::/48'
	option endpoint_host 'vpn.example.com'
	option persistent_keepalive '25'

config wireguard_foo
	option public_key '4mLeSytW6/y4UcOT6rNorw1Ae9nXSxhXUjxsdzMWkUA=3D'=

	list allowed_ips 'fd00:13:37:ffff::23'
</code>

To use static addresses on a WireGuard interface, create a static =
address configuration on top of the interface.

<code>
config interface 'bar'
	option proto 'static'
	option ifname 'foo'
	option ip6addr 'fd00:13:37::2/64'
</code>=
