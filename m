Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9ECC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 15:46:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F00160200
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 15:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F00160200
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=massar.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26328412;
	Fri, 24 Sep 2021 15:46:36 +0000 (UTC)
Received: from citadel.ch.unfix.org (citadel.ch.unfix.org [213.144.131.50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 98cee556
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 15:46:32 +0000 (UTC)
Received: from [IPv6:2a10:fc42:a:1042:ca2a:14ff:fe1f:2b7b] (unknown
 [IPv6:2a10:fc42:a:1042:ca2a:14ff:fe1f:2b7b])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: jeroen@massar.ch)
 by citadel.ch.unfix.org (Postfix) with ESMTPSA id E4DC722B056AC;
 Fri, 24 Sep 2021 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=massar.ch; s=DKIM2009;
 t=1632498363; bh=IBbJC6U158fqmn2rrffHsxFUqZYNxl7hikM0wYwrWmo=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=WNGiRD9jtFbDQYKB6LEMqJUhVJwyhVKaP2ZhwmzCCakyGZvFXKbbarhusp1vgKT1l
 NicOC5WC8PehRojtzn7CBBMnxkeBp10kbqnjAYb0M9H9KH9O6ZAQcWcEywiTYFrFtd
 hsvVZqADaNnU8fX/WX3vWuzq7Mr5Mp5wZVCPZRBpEe4R76QwmjpblSwZjSUks9p+T1
 H/AVSfW4tz6GEJjLtvSOPVT0nEjQ0xe1jFL/rUwXDe4nSi38Q2q26H0XggFeoDYNED
 8ihtg9q8NARCbPHZMjM/vmZQJUP9a6KTs/sfnl0B3PMI7ZEkYLyDecX3zxTZco4xro
 gcDggqd19Oigw==
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: Wireguard Neighborhood (IPv6)
From: Jeroen Massar <jeroen@massar.ch>
In-Reply-To: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec@yahoo.com>
Date: Fri, 24 Sep 2021 17:45:58 +0200
Cc: wireguard <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9B390ADB-BDD6-4BF5-8205-65B215F63746@massar.ch>
References: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec.ref@yahoo.com>
 <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec@yahoo.com>
To: tlhackque <tlhackque@yahoo.com>
X-Mailer: Apple Mail (2.3445.9.7)
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

If you have something like the very common setup:

{internet} -> [wgserver] -> [wgclient] -> [local LAN]

Then if you have address space routed to wgserver, just route a /64 to =
wgclient and then normally radvd(&dhcpv6) it, done.

If you only have a single /64 on the server, then indeed you need to =
hack around with ndproxy.

But given that ISPs have near infinite IPv6 space... they should be able =
to route you a simple /64 and technically, from a RIR perspective should =
even be doing minimal /56 or even a /48...

Greets,
 Jeroen

--

> On 20210924, at 17:31, tlhackque <tlhackque@yahoo.com> wrote:
>=20
> TLDR; It seems that WireGuard isn't supporting IPv6 NDP, and it =
should.=20
> Use case & a work-around.
>=20
> Full story:
>=20
> Configuration:
>=20
> WireGuard server (Linux, details below) behind a site router that
> handles IPv4 NAT & an IPv6 tunnel.
>=20
> Server LAN has other hosts (and multiple subnets/vlans) - mostly dual =
stack.
>=20
> The WireGuard server is able to access the WireGuard peers (clients)
> over IPv6.  The other hosts (and the router) are not.
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
> clients are connected, and since it requires one proxy process/wg =
interface.
>=20
> It seems to me that WireGuard (in this case on the server) should at
> least be responding to Neighbor Solicitations for AllowedIPs of its
> active peers... Of course in the case of a WireGuard tunnel between =
two
> such sites, this is symmetric.
>=20
> I did look at net.ipv6.conf.*.proxy_ndp, but that requires adding each
> address - and in any case I couldn't get it to work.  Neither did
> advertising the server as a "router" with radvd.
>=20
> Unless I'm missing something, it seems to me that supporting NDP is =
the
> simplest "it just works" approach in any case...
>=20
> wireguard-tools v1.0.20210424 - https://git.zx2c4.com/wireguard-tools/
>=20
> Linux hagrid 5.13.16-200.fc34.x86_64 #1 SMP Mon Sep 13 12:39:36 UTC =
2021
> x86_64 x86_64 x86_64 GNU/Linux
>=20
>=20

