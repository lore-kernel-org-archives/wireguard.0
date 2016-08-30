Return-Path: labawi-wg@matrix-dream.net
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 284db1ec
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Aug 2016 19:20:59 +0000 (UTC)
Date: Tue, 30 Aug 2016 20:27:54 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Bruno Wolff III <bruno@wolff.to>
Message-ID: <20160830192754.GA18189@matrix-dream.net>
References: <20160830064454.GA12680@matrix-dream.net>
 <20160830154439.GA5923@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20160830154439.GA5923@wolff.to>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] wg set - unexpected change of routes
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Aug 30, 2016 at 10:44:39AM -0500, Bruno Wolff III wrote:
> On Tue, Aug 30, 2016 at 07:44:54 +0100,
>   Ivan Labáth <labawi-wg@matrix-dream.net> wrote:
> >
> >I think repeating subnets in different peers is most probably
> >an error and in such circumstances the most useful action would
> >be to fail and report it as such.
> 
> Except in some cases it is convenient to use a large network for one peer 
> and carve out a small subnet in another. Having to list a big subnet with 
> a carve out as the sum of smaller networks can be a big pain.

By repeating subnets, I meant repeating ip/mask tuples.
It is something that wireguard already enforces, but it
does so by silently dropping all but the last occurence
of the ip+mask.


Currently it will even happily load the following configuration,
dropping the first occurence of the 10/24 subnet:

[Interface]
PrivateKey = mP3lDaGe7Ge/fo1k+TNnBlRVXiZKJSiWfwFrCdcaDGM=

[Peer]
PublicKey = iiLB93qP+YnDqxN4UixSpEWhvqWdZYmcs0fjKRShNmA=
AllowedIPs = 10.0.0.0/16

[Peer]
PublicKey = qAoLCCM/K3JWqaaSdOy2SmuzMTRwTaxyRR3g36tdzgY=
AllowedIPs = 10.0.0.0/16



The following is valid, correctly loaded, as should remain so
(I don't know whether it routes among peers)

[Interface]
PrivateKey = mP3lDaGe7Ge/fo1k+TNnBlRVXiZKJSiWfwFrCdcaDGM=

[Peer]
PublicKey = iiLB93qP+YnDqxN4UixSpEWhvqWdZYmcs0fjKRShNmA=
AllowedIPs = 10.0.0.0/16

[Peer]
PublicKey = qAoLCCM/K3JWqaaSdOy2SmuzMTRwTaxyRR3g36tdzgY=
AllowedIPs = 10.0.0.0/24


I am concerned about situations where one would issue commands
that reuse a route and would not know that a route was removed
from a peer. For example, with the last configuration:

wg set wg0 peer qAoLCCM/K3JWqaaSdOy2SmuzMTRwTaxyRR3g36tdzgY= allowed-ips 10.0.0.0/16
wg set wg0 peer qAoLCCM/K3JWqaaSdOy2SmuzMTRwTaxyRR3g36tdzgY= allowed-ips 10.0.0.0/24

One might think he restored the configuration, but the /16 route was
removed from the first peer.
