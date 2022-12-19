Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE991C53210
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Jan 2023 02:43:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 941ea75a;
	Tue, 3 Jan 2023 02:42:22 +0000 (UTC)
Received: from withtel.com.au (mail.withtel.com.au [103.62.200.50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68761b71
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2022 03:41:50 +0000 (UTC)
Received: from [192.168.255.143] ([192.168.255.143])
 by withtel.com.au (8.15.2/8.15.2) with ESMTP id 2BJ3fYnb014152;
 Mon, 19 Dec 2022 13:41:35 +1000
Message-ID: <2c5180c0a406fb9a68f367213940d06b2d4340ec.camel@withtel.com.au>
Subject: Re: Connection hangs over CGNAT (Starlink)
From: Dean Davis <dean_davis@withtel.com.au>
To: Nikolay Martynov <mar.kolya@gmail.com>, wireguard@lists.zx2c4.com
Date: Mon, 19 Dec 2022 13:41:34 +1000
In-Reply-To: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
References: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.101.4 at withtel.com.au
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 03 Jan 2023 02:42:20 +0000
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

hi


same issue


I do kind of a automated ping test and if fails on the server side to
many times bring down interface and then back up in a bash script

with=20

nmcli connection down wg0 && nmcli connection up wg0


to me it looks to be connection state issue difference between new and
established/related  ( can not confirm )


ugly but works for me=20



regards
dean


On Thu, 2022-12-15 at 21:12 -0500, Nikolay Martynov wrote:
> Hi!
>=20
> I'm experiencing strange behaviour with wireguard: from time to time
> connection 'freezes'.
> Most often I'm observing this on an Android phone when connected from
> my home over Starlink.
> Server: latest Openwrt, Client: latest Android app.
> The connection establishes and works fine for some time. After some
> time the client still shows connection is established, but no
> incoming
> data is coming.
> On a server side 'latest handshake' goes into hours/days.
> The freeze happens randomly, for no apparent reason and I think only
> over starlink. I do not think I have ever observed this problem on
> cell networks.
>=20
> Reconnection solves the problem immediately.
> I did some tcpdumping when the problem was present and found the
> following:
> * Server side sees incoming traffic from the client and sends
> responses.
> * On my own router connected to Starlink (i.e. interface between my
> router and Starlink router) I see data going from the client to the
> server - but no packets coming back.
>=20
> So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one
> side
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
> I tried experimenting with keepalive messages - but it looks like
> they
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

