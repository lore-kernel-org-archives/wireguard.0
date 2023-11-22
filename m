Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94673C61D92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Nov 2023 07:42:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ce9278b;
	Wed, 22 Nov 2023 07:39:49 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9750dcca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2023 07:39:47 +0000 (UTC)
Received: janet.servers.dxld.at; Wed, 22 Nov 2023 08:39:40 +0100
Date: Wed, 22 Nov 2023 08:39:35 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Alexander Zubkov <green@qrator.net>
Cc: Erin Shepherd <bird-users@erinshepherd.net>,
 Juliusz Chroboczek <jch@irif.fr>,
 babel-users@alioth-lists.debian.net, Kyle Rose <krose@krose.org>,
 BIRD Users <bird-users@network.cz>, wireguard@lists.zx2c4.com
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
Message-ID: <20231122073935.7bkugxmv4wknsqfb@House.clients.dxld.at>
References: <918e1d5b-9f11-4f9c-bf9a-94cb0d41ce2b@app.fastmail.com>
 <871qcn8d5g.wl-jch@irif.fr>
 <20231120020501.t6jw2k2u42y2ntqt@House.clients.dxld.at>
 <CABr+u0b6vrZoYzQcMiCXX7W0XsQRNMzQfZnT5cK1MQoZ4NoqkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cnob7nwxinq5tsx3"
Content-Disposition: inline
In-Reply-To: <CABr+u0b6vrZoYzQcMiCXX7W0XsQRNMzQfZnT5cK1MQoZ4NoqkA@mail.gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--cnob7nwxinq5tsx3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, Nov 22, 2023 at 12:17:49AM +0100, Alexander Zubkov wrote:
> > Can you think of a use-case where fpRPF isn't enough?
>=20
> Yes. IMHO, the problem with RPF is that routing table doesn't reflect the
> network topology, but only a subset of it.

Right that is the fundamental problem, so my solution to that is: routing
should "just represent the full network topology" :)  As the routing
protocol sees it anyway, since the whole point of RFP is to only allow
paths that the routing system chooses.

Do note that while I implement the topology information using ECMP routes
there's no reason you actually have to use ECMP. You could still have
regular routes in your (main) routing table and use a separate table with
ECMP routes for RPF and this is very much something I want us to support.

> I mean in topologies where multiple pathes are possible, you can choose
> to use or even learn only a subset of those pathes.

If I undestand correctly you're talking about (local) routing daemon policy
here. Yes this is something you can do and my current approach of (abusing)
ECMP only works when your routing policy satisfies some symmetry criteria.

However as Juliusz pointed out integrating this idea into the routing
protocol proper could allow using arbitrary policy without ever breaking
RPF, but figuring out the details is (exciting) future work.

> In that sense might be yes, the original sin is that the routing table
> doesn't reflect all the topology, not only the pathes we choose for egres=
s.
> Not sure though if it is a sin, in that case routing table would be too
> overcomplicated.

Right routing table (modification) performance and clutter is certainly a
reason to forgoe this approach but I find that for the kind of (small)
networks I want to run and that many people might run using wireguard this
is perfectly fine.

> If I understand correctly, such fpRPF approach works only if you both lea=
rn
> all possible pathes and use all of them in a multi-nexthop route. But for
> example in the Internet with its advanced BGP announcement policies it is
> not true at all.

Right to deply fpRPF on a large scale you really need some kind of support
=66rom the routing protocol. AFAIK there's nothing like that for BGP yet?

I don't think it's completely inapplicable either though, might still work
for iBGP with appropriately designed routing policy. My interest lies
mostly with doing this using babel though.

> So from my point of view it is good to split the topology definition
> (ingress decapsulation) and the chosen pathes (egress routing). Because it
> is related, but still different processes. So the system can be more
> flexible. Although we need to repeat common things and keep ingress and
> egress consistent/synced.

To me flexibility is only desirable insofar as it doesn't conflict with
system security. Source address authenticity is an important property I
wouldn't want to give up here. If it's easier to ignore source address
filtering than it is to implement it nobody is going to do it (cf. the
internet) and I think that's the crux of the problem with "encap".

Wireguard gifted us this amazing state of source filtering being the easy
default and I want to keep it that way.

> my point is that RPF (with its variations too) has its bounds and cannot
> be a universal solution, there is no silver bullet here.

No, ofc. nothing we do can possibly "fix everything for everyone" but
that's no reason not to try a new approach for a particular problem in a
particular use-case :)

--Daniel

--cnob7nwxinq5tsx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEV6G/FbT2+ZuJ7bKf05SBrh55rPcFAmVdsDQACgkQ05SBrh55
rPcrghAAigwl3TC7Ob/LxV9p9a/nLcZilRhEwyQVugak7nksUHU9RMIC2ddMfagm
2te1fm05ZwvxNc+XXpeNTte5gq03fkRQKq8Lkv9UNGoXq/AB7YgUB8Gr5wFjZZYZ
BWtd4hLi7+aQpQcSofbrw96VylG9rhJf8Da5x//3WgCtwOpXw+T+T760yAko0HiN
XVUy5CL7ccVOteMY5OfrCwgQ/HVajMhEWnc6th93+w71ikMpnIzarB68U6YTeqaR
Dnrtfr94eMPdn3CRgttwS96G6igkeavo0MDivg0K8Iz8Hp4Dxo1v2VE+59vA6oQn
N+oiwujROwVzZ+yOfSfXmC5YqkEFF+nr1607ajtbRZD1m/ZCqO+fjK0vv58JAhq5
nNBzBeCDG8aF9H36brrv3/522FcKZs9rLVKVpOOAqGoVf+nTLFFog/45YZgb6F4h
HAQfkMPkSQ6NFj7/F++sg+2jcZQRob37jKnV8d5aSFseyOZUdPLcG7NqGDbyVD7q
4K85yyNNbw2M4aVgWRUgWVDhcheYKetIb9GYJjIHJG0JiDztmRL0MNYzODbBE+68
h8vJ7KQUcInRWvr6dfAAivtTsedd9NBQ93lkRdwrPG1VFEaLTkUSvwmtugen8Md5
J3oVbCKH7SGdZr68Tz8d27uCSxRZjnQuG2fSDhWg5bDlOPSw7kA=
=95wQ
-----END PGP SIGNATURE-----

--cnob7nwxinq5tsx3--
