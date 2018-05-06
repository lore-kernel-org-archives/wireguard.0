Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d453f50
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 13:32:10 +0000 (UTC)
Received: from mail-1857040135.protonmail.ch (mail-1857040135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a50e5609
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 13:32:10 +0000 (UTC)
Date: Sun, 06 May 2018 09:34:17 -0400
To: "vtol@gmx.net" <vtol@gmx.net>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: WG interface to ipv4
Message-ID: <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
In-Reply-To: <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On May 6, 2018 10:58 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.=
net> wrote:

> > Why? Can you outline the threat model?
> >=20
> > As I mentioned earlier, to disable v6 socket creation, pass
> >=20
> > ipv6.disable=3D1 on the kernel command line, or just unload the v6
> >=20
> > module. If you're worried about the Linux v6 stack being a pile of
> >=20
> > scary bugs, then you certainly want to be doing this already, and not
> >=20
> > relying on simply disabling v6 routing within that network namespace,
> >=20
> > which you're doing with the conf.default.disable_ipv6=3D1. In other
> >=20
> > words, if you don't want v6 for reasons of attack surface, then you
> >=20
> > should actually be disabling v6 properly.
>=20
> Any piece of software is flawed (threat model), proven by the various
>=20
> CVE and others yet to be discovered, that including Linux kernel and its
>=20
> userland.
>=20
> ipv6 deployment/utilization is hardly a matter of black and white, i.e.
>=20
> turning it off/on during boot time. Some scenarios call for ipv6 to be
>=20
> available whilst others not and thus ipv6 routing is disabled whenever
>=20
> not needed in order to tailor mitigation of potential attack surfaces.
>=20
> Like ssh can be constrained to a particular ipv socket and so it can be
>=20
> set for ntp, dnsmasq, bind, unbound, just to name=C2=A0 a few.
>=20
> Why would WG take the high route and curtail user control of whether to
>=20
> open an ipv4 or ipv6 (someone else may not be keen on ipv4) socket, or bo=
th?
>=20
> > Why is this a matter of network security? WireGuard will ignore
> >=20
> > packets that don't have the correct authentication tag. If you're
> >=20
> > receiving authentic packets, you're receiving authentic packets, and
> >=20
> > the origin shouldn't matter, in terms of the packets' authenticity. In
> >=20
> > other words, if an attacker has stolen a private key, this is the
> >=20
> > problem to address.
>=20
> Why to offer a the broadest surface (0.0.0.0 - all IPv4 addresses on the
>=20
> local machine and with the ipv6 socket open also those) for a potential
>=20
> attack in the first place and deprive the user of tailoring/binding WG
>=20
> deployment to the respective network layout?
>=20
> > Anyway, regardless of this, if you want to filter
> >=20
> > out packets coming from a certain interface, a certain subnet, or any
> >=20
> > other characteristics, use netfilter and make these preferences
> >=20
> > explicit in your rules, rather than the implicit details of listening
> >=20
> > sockets.
>=20
> I would not consider binding WG to a particular iface/subnet an implicit
>=20
> choice but rather being explicit, but that is perhaps a matter of
>=20
> perspective then. Netfilter rules can easily get convoluted in complex
>=20
> scenarios.

Jason already explained it but maybe it needs to be repeated several more
times. WG security model doesn't rely on which interface, port or subnet it=
's
listening on. You can screw your network configuration in myriad ways and
WG will still save you due to it's design. Private keys are all that matter=
s.
Keep them secure and forget about the rest of things you know about
unbound, dnsmasq, bind, ssh, openvpn and ipsec. Use route tables and
netfilter rules to choose where the network traffic should go. That's all.

=E2=80=8BJordan
