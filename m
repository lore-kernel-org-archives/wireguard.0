Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa2664cd
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 15:53:19 +0000 (UTC)
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4253712c
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 15:53:19 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Multicast over a wireguard link?
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <87fuli7itj.fsf@toke.dk>
Date: Tue, 20 Dec 2016 17:04:03 +0100
Message-Id: <279260F6-BDCD-451D-B3C5-2BCCCA3B548D@danrl.com>
References: <87fuli7itj.fsf@toke.dk>
To: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

[Caution: Unfiltered thoughts and ideas, untested from mind to mail. WoT =
ahead.]

Hi Toke,

I am on the road so can't test right now. Can you elaborate on babel a =
bit? Would you be able to use non-link-local multicast addresses? Let's =
call it "routed multicast" for now.

Maybe related/similar case: DHCPv6 =
https://github.com/openwrt/luci/issues/854#issuecomment-261588333

This message is probably not much of help. However, it made me thinking =
about deriving solicited node address from the peer public keys would be =
theoretically possible (nothing like that is implemented and may not =
even be a wise idea at all). In a centralized setup (one server many =
road warrios/sites) this should theoretically straightforward.

Not having multicast on VPN links is an inconvenience, especially with =
all the zeroconf and mdns devices in our networks sometimes. But =
multicast on VPN links can be a pain, too.

One thing you could do, although not very clean, is to unicast-announce =
to all /128 IP addresses from your allowd_ips per peer. If babel can do =
that or can be modifed to do so. /128 are often the addresses of the =
wg-interface on the other end. However, keep in mind that this is a wild =
guess and not a clean solution.

Another thing I can't try right now but may be worth playing with is =
assigning addresses from the ff-range and see what happens. How well =
does the kernel like it and how will wireguard threat these addresses. I =
never tried.

A all-nodes multicast will probably not scale well in more complex =
setups (some people run many peers on one interface, imagine what =
happens then...). However, solicited-node multicast based on a 24bit =
hash (blake?) of the public key should reduce the amount of packets that =
need to be sent. I wonder how reliable it is to generate EUI64 out of =
the public keys and thus provide link-local addresses without any need =
for allowed-ips at all for tunnel setup. Wouldn't that be just awesome?

Multicast... keeps me thinking. I'll post again if I come up with =
anything that might help.

Cheers,

Dan

PS: Don't take anything for granted. I wrote this done while thinking =
about it. Better trust Jason's words, he knows it right.

> On 20 Dec 2016, at 15:53, Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@toke.dk> wrote:
>=20
> Does Wireguard has a notion of multicast? I would like to eventually
> replace my current VPN setup with wireguard. I currently run Tinc in
> switch (layer 2) mode, and run the Babel routing protocol on top.
>=20
> Babel announces itself via link-local multicast to everyone on the =
link.
> Does this work with wireguard? I guess the equivalent semantics would =
be
> "send this packet to all known peers"...
>=20
> -Toke
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
