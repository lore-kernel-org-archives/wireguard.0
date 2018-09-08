Return-Path: steven@honson.id.au
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edffba3c
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 10:23:27 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d832343
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 10:23:27 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id d1-v6so8181466pgo.3
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 03:23:55 -0700 (PDT)
Return-Path: <steven@honson.id.au>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Routing to a network behind a node
From: Steven Honson <steven@honson.id.au>
In-Reply-To: <1536396708.rkbb1jpywa.astroid@morple.none>
Date: Sat, 8 Sep 2018 20:23:50 +1000
Message-Id: <4608FEAE-C918-4D38-9CE0-3712C91687C7@honson.id.au>
References: <1536396708.rkbb1jpywa.astroid@morple.none>
To: "M. Dietrich" <mdt@emdete.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

Have you added 172.16.0.0/24 to the AllowedIPs entry for the =
172.16.215.2 Peer on 172.16.215.1?

Are you able to share your WireGuard configuration?

Cheers,
Steven

> On 8 Sep 2018, at 7:06 pm, M. Dietrich <mdt@emdete.de> wrote:
>=20
> Hi,
>=20
> i have setup a wg vpn with several nodes, lets say in a
> network 172.16.215.0/24. one of the boxes (ip 172.16.215.2) in
> that network has an interface to a different network with
> additional boxes, lets say 172.16.0.0/24. i would like to
> reach the boxes in that network directly so i established a
> route on another node in the wg network (172.16.215.1) like
> this:
>=20
> 	ip route add 172.16.0.0/24 via 172.16.215.2
>=20
> but once i ping 172.16.0.1 i get the error
>=20
> 	=46rom 172.16.215.1 icmp_seq=3D1 Destination Host Unreachable
> 	ping: sendmsg: Required key not available
>=20
> it seems the package reaches wireguard but wireguard doesnt
> know the "via" and tells it has no key to route to 172.16.0.1
> which is fine. but why doesn wg honour the via and send it to
> the router 172.16.215.2?
>=20
> i think its more or less whats done if you route all your
> traffic through wg so i assume i do a terrible stupid mistake
> (i am no network or kernel routing expert which may be an
> excuse), can someone help?
>=20
> best regards,
> M. Dietrich
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
