Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E35DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 15:59:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039816103B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 15:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 039816103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abd9c71a;
	Fri, 24 Sep 2021 15:59:03 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1218a49a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 15:59:00 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 125B069F;
 Fri, 24 Sep 2021 15:58:58 +0000 (UTC)
Date: Fri, 24 Sep 2021 20:58:58 +0500
From: Roman Mamedov <rm@romanrm.net>
To: tlhackque <tlhackque@yahoo.com>
Cc: wireguard <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard Neighborhood (IPv6)
Message-ID: <20210924205858.3805c65a@natsu>
In-Reply-To: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec@yahoo.com>
References: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec.ref@yahoo.com>
 <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 24 Sep 2021 11:31:40 -0400
tlhackque <tlhackque@yahoo.com> wrote:

> WireGuard server (Linux, details below) behind a site router that
> handles IPv4 NAT & an IPv6 tunnel.
>=20
> Server LAN has other hosts (and multiple subnets/vlans) - mostly dual sta=
ck.
>=20
> The WireGuard server is able to access the WireGuard peers (clients)
> over IPv6.=C2=A0 The other hosts (and the router) are not.
>=20
> The clients can't even ping the other hosts - the echo replies are
> generated, but they end up with an icmp6 unreachable.
>=20
> It turns out that the other hosts (and router) send an icmp6 Neighbor
> Solicitation for the clients, which is never answered.
>=20
> My interim solution was to implement
> https://github.com/setaou/ndp-proxy, which will respond with Neighbor
> Advertisements for the entire WireGuard subnet.
>=20
> This is a rather crude solution - since ndp-proxy doesn't know what
> clients are connected, and since it requires one proxy process/wg interfa=
ce.
>=20
> It seems to me that WireGuard (in this case on the server) should at
> least be responding to Neighbor Solicitations for AllowedIPs of its
> active peers... Of course in the case of a WireGuard tunnel between two
> such sites, this is symmetric.
>=20
> I did look at net.ipv6.conf.*.proxy_ndp, but that requires adding each
> address - and in any case I couldn't get it to work.=C2=A0 Neither did
> advertising the server as a "router" with radvd.
>=20
> Unless I'm missing something, it seems to me that supporting NDP is the
> simplest "it just works" approach in any case...

You are not configuring your network correctly routing-wise, and the issue =
is
not "WireGuard not supporting NDP" -- yes it doesn't, but that's not the po=
int
to blame for the behavior that you observe -- which is completely normal.

Server LAN is one L2 network, the WG network is *another* and L3 network.
There is nothing nowhere that dictates that there would be NDP replies
*across* separate networks, let alone L2 vs L3.

The WG network needs its own separate IPv6 range, and other hosts need to h=
ave
a route to that range "via" the VPN server (if its not their default gatewa=
y).
Then, the WG clients need to know the route back to those other hosts, i.e.
the network they use needs to be in AllowedIPs for the VPN server.

--=20
With respect,
Roman
