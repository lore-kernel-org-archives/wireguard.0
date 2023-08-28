Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D00C83F11
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Aug 2023 22:18:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa911a23;
	Mon, 28 Aug 2023 22:13:23 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40609fc3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Aug 2023 22:13:20 +0000 (UTC)
Received: janet.servers.dxld.at; Tue, 29 Aug 2023 00:13:14 +0200
Date: Tue, 29 Aug 2023 00:13:12 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Juliusz Chroboczek <jch@irif.fr>
Cc: Kyle Rose <krose@krose.org>, bird-users@network.cz,
 babel-users@alioth-lists.debian.net, wireguard@lists.zx2c4.com
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <20230828221312.fw5pvnt4x7p2c52k@House.clients.dxld.at>
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
 <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
 <20230828160705.a5uxv5l2zknna7yj@House.clients.dxld.at>
 <87v8czqd3w.wl-jch@irif.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d7vxlx462b4iuqju"
Content-Disposition: inline
In-Reply-To: <87v8czqd3w.wl-jch@irif.fr>
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


--d7vxlx462b4iuqju
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Juliusz,

On Mon, Aug 28, 2023 at 07:40:51PM +0200, Juliusz Chroboczek wrote:
> I've read the whole discussion, and I'm still not clear what advantages
> the proposed route attribute has over having one interface per peer.  Is
> it because interfaces are expensive in the Linux kernel?  Or is there some
> other reason why it is better to run all WG tunnels over a single interface?

Off the top of my head UDP port exhaustion is a scalability concern here,
just as an example, not that I'd actually ever need that many peers in my
network :)

One wg-device per-peer means we need one UDP port per-peer and since
currently binding to a specific IP is also not supported by wg (I have a
patch pending for this though) there's no good way to work around this.

Frankly having tons of interfaces is just an operational PITA in all sorts
of ways. Apart from the port exhaustion having more than one wg device also
means I have to _allocate_ a new port for each node in my managment system
somehow instead of just using a static port for the entire network. This
gets dicy fast as I want to move in the direction of dynamic peering as in
tinc.

Other than that my `ip -br a` output is getting unmanagably long and having
more than one device means I have to keep ACL lists in sync all over the
system. This is a problem for daemons that don't support automatic reload
(babeld for example :P). I also have to sync the set of interface to
nftables which is easy to get wrong as it's still manual in my setup.

All of that could be solved, but I would also like to get my wg+babel VPN
setup deployed more widely at some point and all that friction isn't going
to help with that so I'd rather have this supported properly.

--Daniel

--d7vxlx462b4iuqju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEV6G/FbT2+ZuJ7bKf05SBrh55rPcFAmTtG/UACgkQ05SBrh55
rPecxA//ZJCU+iAPq/visvhzdxoa3ex837TVXaLUeSzuS1uvH8X+83JmwzvcAuTd
jBND+NRG9Qw7BB7awnaDOhSxE5bFHG6rMcszaEN5dvxD6gub/CM1YZEpOdmYibnY
yTaWkeqB/LxypYLpdwiaUiCN1G7RXaW1Or0ZF16IN5NG3EXgxDRIc/QlLOMIdfQW
aCrftH5h/bV+qIpws/ytd9+4BsBVJFvQPMdEcHjQirB7MjKORu3tqsTGUHX8WEV7
jPHAmfSavM+n83taIHXqOSTzbzWku32IHVAPS5JAFZ9UVBdZRmT//9w+OSuMvrFf
JOJTDqhjYzFy+4rmq/6py4e2jEUraIm26/cDsDtuv5BUv409BL5mdQZTmsGAowq+
GS1/DTzdJckg2otWbTVC7VbyLPJWCqM2JuuCMA9opetHgb9M2YOznJVzXHOljkH9
lj4F9GlzNcPA/gJwBGsbSRPI2l11xpY4LC3Ux2AQsAefDttBzpimCPF/JwbpIadc
bTAKFNxioX0SFNTAnSiM6y9HT2UpBTuBc11xikn2/U4Z1j/jecoR2anoaIafrzqG
JQbkjW6wA5Mr8a8QllYWQEXdlC7krsrP8WVd83q19RdAQNVFHdf3xeLw8Zwv1CAq
5Y5cDK1vrGc8kBB0uF/2U3JzLHB4XLJ1M6uTZmeojzAvnB1qq+k=
=I7Me
-----END PGP SIGNATURE-----

--d7vxlx462b4iuqju--
