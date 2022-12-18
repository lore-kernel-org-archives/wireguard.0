Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78743C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Dec 2022 13:24:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7ba7bb1;
	Sun, 18 Dec 2022 13:24:08 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0304f45
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2022 13:24:06 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 250601E3119;
 Sun, 18 Dec 2022 08:24:05 -0500 (EST)
Received: from smtpclient.apple (wsip-98-188-140-22.om.om.cox.net
 [98.188.140.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id EB7901E3122;
 Sun, 18 Dec 2022 08:24:04 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Connection hangs over CGNAT (Starlink)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
Date: Sun, 18 Dec 2022 07:24:04 -0600
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4EFD21AB-EB67-4561-B5C6-28E3BC582936@lonnie.abelbeck.com>
References: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
To: Nikolay Martynov <mar.kolya@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Scanned-By: mailmunge 3.10 on 209.68.5.177
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

Have you tried reducing the MTU of the WG tunnel?

I have a similar use case with a WG tunnel over a T-Mobile Home Internet =
(TMHI) CGNAT network.

After some testing determining the reduced MTU of the TMHI network, I =
set the WG endpoints' MTU to be 1340.

The WG tunnel has been rock solid.

Lonnie


> On Dec 15, 2022, at 8:12 PM, Nikolay Martynov <mar.kolya@gmail.com> =
wrote:
>=20
> Hi!
>=20
> I'm experiencing strange behaviour with wireguard: from time to time
> connection 'freezes'.
> Most often I'm observing this on an Android phone when connected from
> my home over Starlink.
> Server: latest Openwrt, Client: latest Android app.
> The connection establishes and works fine for some time. After some
> time the client still shows connection is established, but no incoming
> data is coming.
> On a server side 'latest handshake' goes into hours/days.
> The freeze happens randomly, for no apparent reason and I think only
> over starlink. I do not think I have ever observed this problem on
> cell networks.
>=20
> Reconnection solves the problem immediately.
> I did some tcpdumping when the problem was present and found the =
following:
> * Server side sees incoming traffic from the client and sends =
responses.
> * On my own router connected to Starlink (i.e. interface between my
> router and Starlink router) I see data going from the client to the
> server - but no packets coming back.
>=20
> So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one side
> of the connection - and so data continues to go in one direction, but
> it doesn't come back. The thing with the wireguard is that it looks
> like it doesn't change the outgoing port when it attempts to do
> another handshake. This means that it continues using the same 'half
> broken' connection forever.
>=20
> I think the same happens to me at least once on a Linux client - but
> the difference with the phone is that the phone is always on and
> therefore the duration of the connection is much longer.
>=20
> I tried experimenting with keepalive messages - but it looks like they
> make no difference. Once connection freezes I see keepalived arriving
> onto the server, server sending reply - but that reply never arrives
> to the client.
>=20
> It looks like the solution to this problem would be for the client to
> use a different outgoing port when sending a handshake but I was not
> able to find an option for that.
>=20
> Is this something that is possible to do?
> Thanks!
>=20
>=20
> --=20
> Martynov Nikolay.
> Email: mar.kolya@gmail.com
>=20

