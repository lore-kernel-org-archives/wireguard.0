Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e81d9a5f
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Feb 2017 13:09:37 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbf1e9c6
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Feb 2017 13:09:37 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [ wireguard-dev ] About configuring allowedip
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CADdae-gK=tqCao84KBzBYrjpTyBRT_QSeSEyQ4rwybypE6wK8w@mail.gmail.com>
Date: Fri, 24 Feb 2017 14:10:45 +0100
Message-Id: <71F759EB-03D2-4769-9B8D-F92C4A19D2C6@danrl.com>
References: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
 <241066D3-A3AD-4E76-B7E0-9C0DC26713D6@danrl.com>
 <CADdae-gK=tqCao84KBzBYrjpTyBRT_QSeSEyQ4rwybypE6wK8w@mail.gmail.com>
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

Nicolas,

I draw your network including the allowed_ips restrictions.

> ping peer3 --peer1--->peer2 : not ok .

This can not work! Peer 2 does not accept the source address from Peer =
3. Please review your allowed_ips settings. Draw the things on paper, =
make PostIt notes representing the packets including their destination =
address and source address. Draw a little "firewall" on the tunnels =
(whitelist is allowed_ips, all the rest gets dropped!) and see if the =
PostIt can make it through with it's source address. Yes, this sounds =
like child play, but it works. I have taught complex firewalling and VPN =
setups to lawyers and law makers this way. It helps understanding, if a =
simple diagram does not cut it.

Allowed IPs is probably the most complex thing WireGuard has to offer =
from a user perspective. Rename it to Allowed Source Addrresses in your =
head it becomes clearer.

HTH

Dan

> On 24 Feb 2017, at 11:41, Nicolas Prochazka =
<nicolas.prochazka@gmail.com> wrote:
>=20
> hello again,=20
> my configuration ,=20
> ping peer 1-->peer 2  : ok   ( on ipv6 wg0 )=20
> ping peer 3 --> peer 1 : ok=20
> ping peer3 --peer1--->peer2 : not ok .
>=20
>=20
> On peer 1 , forwarding is setting
> net.ipv6.conf.all.forwarding =3D 1
> net.ipv4.conf.all.forwarding =3D 1
>=20
>=20
> Peer 1 : wg configuration =20
>=20
> interface: wg0
>   public key: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
>   private key: (hidden)
>   listening port: 6081
>=20
> peer: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D
>   endpoint: 52.49.x.x:6081
>   allowed ips: ::/0
>   latest handshake: 8 seconds ago
>   transfer: 71.29 KiB received, 60.28 KiB sent
>   persistent keepalive: every 25 seconds
>=20
> peer: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D
>   endpoint: 10.10.0.69:6081
>   allowed ips: fd00::baae:edff:fe72:5094/128
>   latest handshake: 45 seconds ago
>   transfer: 5.49 KiB received, 6.36 KiB sent
>=20
>=20
> Peer 3 :=20
>=20
>=20
> interface: wg0
>   public key: bqwiLTe/hr0JJMz3IvnDXqS5nOT6u/WL75dasmTE/ko=3D
>   private key: (hidden)
>   listening port: 6081
>=20
> peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
>   endpoint: 10.10.99.230:6081
>   allowed ips: ::/0
>   latest handshake: 33 seconds ago
>   transfer: 4.92 KiB received, 7.55 KiB sent
>   persistent keepalive: every 25 seconds
>=20
>=20
> Peer 2 :=20
>=20
> interface: wg0
>   public key: dOXT9AvlEt9KSl3ricE12GuVa+U4XB0s1c92s8W+9VA=3D
>   private key: (hidden)
>   listening port: 6081
>=20
> peer: q5ypTBI7bN0vPGzvlGYyF6pCqYgrDsEjO827duAwjX4=3D
>   endpoint: 77.156.x.x:58943
>   allowed ips: fd00::eea8:6bff:fef9:23bc/128
>   latest handshake: 1 minute, 43 seconds ago
>   transfer: 52.59 KiB received, 79.01 KiB sent
>=20
>=20
> 2017-02-23 14:41 GMT+01:00 Dan L=C3=BCdtke <mail@danrl.com>:
> Nicolas: Could you provide the configuration files? Because from your =
little graphic or schema I can not even derive what you are configuring. =
I guess there is something overlapping prefixes maybe?
>=20
> Jason: I think we are approaching the point in time when there will be =
a -dev and a -users ML :)
>=20
>=20
> > On 23 Feb 2017, at 14:03, Nicolas Prochazka =
<nicolas.prochazka@gmail.com> wrote:
> >
> > Hello, i'm trying to do this with wireguard, withtout success :
> >
> > peer1 ---> peer2   : config ok , works
> > peer3 ---> peer1  : config ok , works
> > peer3 --->peer1 ---> peer2  : not ok .
> >
> > I suspect allowed-ip configuration, but all my tests does not works.
> > perhaps I must create two wireguard interface on peer 1 and do =
forwarding/routing ?
> > i'm using ipv6 as internal ip.
> >
> > so my question is :
> > - two interface ?
> > - specifiq magic allowedip ?
> > ( allowed ip is confusing for, it is using for routing and for =
evicting paquet ? )
> >
> > Regards,
> > Nicolas
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
>=20
