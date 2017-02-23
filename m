Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d751c2f3
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 13:40:43 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6c9750b
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 13:40:43 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [ wireguard-dev ] About configuring allowedip
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
Date: Thu, 23 Feb 2017 14:41:47 +0100
Message-Id: <241066D3-A3AD-4E76-B7E0-9C0DC26713D6@danrl.com>
References: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
To: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Nicolas: Could you provide the configuration files? Because from your =
little graphic or schema I can not even derive what you are configuring. =
I guess there is something overlapping prefixes maybe?

Jason: I think we are approaching the point in time when there will be a =
-dev and a -users ML :)


> On 23 Feb 2017, at 14:03, Nicolas Prochazka =
<nicolas.prochazka@gmail.com> wrote:
>=20
> Hello, i'm trying to do this with wireguard, withtout success :=20
>=20
> peer1 ---> peer2   : config ok , works
> peer3 ---> peer1  : config ok , works=20
> peer3 --->peer1 ---> peer2  : not ok .
>=20
> I suspect allowed-ip configuration, but all my tests does not works.
> perhaps I must create two wireguard interface on peer 1 and do =
forwarding/routing ?=20
> i'm using ipv6 as internal ip.
>=20
> so my question is :=20
> - two interface ?
> - specifiq magic allowedip ?
> ( allowed ip is confusing for, it is using for routing and for =
evicting paquet ? )
>=20
> Regards,=20
> Nicolas=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
