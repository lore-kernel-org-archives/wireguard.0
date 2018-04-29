Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77319786
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Apr 2018 21:03:35 +0000 (UTC)
Received: from sonic311-31.consmr.mail.ir2.yahoo.com
 (sonic311-31.consmr.mail.ir2.yahoo.com [77.238.176.163])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55b4a0d7
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Apr 2018 21:03:35 +0000 (UTC)
Date: Sun, 29 Apr 2018 21:04:52 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: Eddie <stunnel@attglobal.net>, reiner otto <augustus_meyer@yahoo.de>,
 <wireguard@lists.zx2c4.com>, Eric Light <eric@ericlight.com>
Message-ID: <1277744751.3560998.1525035892916@mail.yahoo.com>
Subject: Re: Route all traffic to one IP _only_ via wireguard
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <1277744751.3560998.1525035892916.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Eric, yes,

> I only want to use wg0 for x.x.x.x/32, and I want to use eth0 for everyth=
ing else<
this is correct.

No wg-quick used, as client-OS is openwrt.

I suspect a problem, that the IP of my endpoint is the IP, too, the traffic=
 for I want to route via wg0.

Or, in other words, Endpoint=3D1.2.3.4, and I want all traffic to 1.2.3.4 f=
rom my router to be routed via wg0.



I have found a working version, still under investigation/test:

wg0-client, wireguard_up.sh:
#!/bin/sh
ip link add wg0 type wireguard
wg setconf wg0 /etc/wireguard/wg0.conf
ip address add 172.16.18.31/16 dev wg0
ip link set mtu 1420 dev wg0
ip link set wg0 up
sleep 10 #sometimes helps with async ops
iptables -t nat -I POSTROUTING -o wg0 -j MASQUERADE
sleep 10 #sometimes helps with async ops
ping -c 3 172.16.0.1 #To force some traffic to server, persistent connectio=
n to be established (??)
iptables -t nat -A OUTPUT -d 1.2.3.4 -j DNAT --to-destination 172.16.0.1 #w=
g0 on server has 172.16.0.1
ping -c 3 1.2.3.4


wg0-client, wg0.conf:
[Interface]
PrivateKey =3D ....
ListenPort =3D 5555
[Peer]
PublicKey =3D ....
AllowedIPs =3D 172.16.0.0/16
Endpoint =3D 1.2.3.4:5555
PersistentKeepalive =3D 25


--------------------------------------------
Eric Light <eric@ericlight.com> schrieb am So, 29.4.2018:

 Betreff: Re: Route all traffic to one IP _only_ via wireguard
 An: "Eddie" <stunnel@attglobal.net>, "reiner otto" <augustus_meyer@yahoo.d=
e>, wireguard@lists.zx2c4.com
 Datum: Sonntag, 29. April, 2018 17:19 Uhr
=20
 Hi Eddie and Reiner,=20
=20
 I might be misunderstanding
 the request, but...=20
=20
 >
 the real goal is to tunnel only traffic with a specific
 destination IP via wireguard from client to server.
=20
 Isn't this just asking the
 same as:
=20
 > I only want
 to use wg0 for x.x.x.x/32, and I want to use eth0 for
 everything else
=20
 If I'm
 reading that right, I believe it's a simple matter of
 changing the scope of his AllowedIPs, so his traffic is
 routed via the correct interfaces. No iptables or packet
 marks required.=20
=20
 Reiner -
 have I misunderstood your question? I've assumed
 you're using wg-quick?=20
=20
 E
=20
 --------------------------------------------
 Q: Why is this email five sentences or less?
 A: http://five.sentenc.es
=20
 On Sun, 29 Apr 2018, at 07:07, Eddie wrote:
 > I didn't think that AllowedIPs would
 filter traffic like that.=C2=A0 But=20
 > could
 be wrong.=C2=A0 :-)
 >=20
 >
 Here's my take on your problem:
 >=20
 > Add "Table =3D off" and
 "FwMark =3D 1234 (or other value)" to the wg config,
=20
 > which will stop the routing tables
 being updated and add the routing=20
 > mark
 to all encrypted packets.
 >=20
 > Then you will need a new ip rule table,
 that runs ahead of "main" that=20
 > selects all traffic with the fwmark from
 wg and routes that directly to=20
 > your
 external interface.=C2=A0 Something like:
 >
=20
 > from all fwmark 1234 lookup net
 >=20
 > net:
 > default via <gateway ip> dev
 <external interface>
 >=20
 > Then add a new rule to main, that routes
 ip 1.2.3.4 out via the wg=20
 >
 interface.
 >=20
 >
 Cheers.
 >=20
 >=20
 > On 4/28/2018 6:49 AM, Eric Light wrote:
 > > Hi Reiner!
 >
 >
 > > I think the problem here is
 your client's AllowedIPs section. If you only want to
 access one address, you only enter that target IP - not the
 whole internet space (0.0.0.0/0). That's why everything
 is being routed out via your wg0.
 >
 >
 > > So you should change that
 client AllowedIPs to 172.16.0.1/32, and that'll fix it.
 Alternatively, set it to /24 if you also want access to
 other devices within the corporate LAN... That's how I
 do it.
 > >
 > > I
 think that's all you need. Sorry if I've missed
 something! :)
 > >
 >
 > E
 > >
 > >
 --------------------------------------------
 > > Q: Why is this email five sentences
 or less?
 > > A: http://five.sentenc.es
 > >
 > > On Sat, 28
 Apr 2018, at 22:07, reiner otto wrote:
 >
 >> My basic setup of wg works, I can ssh from/to
 server or client.
 > >> But the real
 goal is to tunnel only traffic with a specific destination
 IP
 > >> via wireguard from client
 to server.
 > >> I.e. a local
 router, which allows direct access to the web,
 > >> _BUT_ all traffic going to the
 corporate server using wireguard only.
 >
 >> Corporate server (public 1.2.3.4) =3D=3D wireguard
 server (172.16.0.1).
 > >>
 > >> I tried various settings on my
 client, like
 > >> ip route 1.2.3.4
 dev wg0
 > >> ip route 1.2.3.4 via
 172.16.0.1
 > >> etc.
 > >> but nothing worked.
 > >>
 > >> Any
 help really appreciated.
 > >>
 > >> ---
 > >>
 wg0.conf on server (1.2.3.4):
 > >>
 [Interface]
 > >> ListenPort =3D
 1234
 > >> PrivateKey =3D secret
 > >> [Peer]
 >
 >> PublicKey =3D secret
 > >>
 AllowedIPs =3D 172.16.0.0/16
 > >>
 -
 > >> wg0.conf on client
 (172.16.18.31):
 > >> [Interface]
 > >> PrivateKey =3D secret
 > >> ListenPort =3D 1234
 > >> [Peer]
 >
 >> PublicKey =3D secret
 > >>
 AllowedIPs =3D 0.0.0.0/0
 > >>
 Endpoint =3D 1.2.3.4:1234
 > >>
 > >>
 > >>
 _______________________________________________
 > >> WireGuard mailing list
 > >> WireGuard@lists.zx2c4.com
 > >> https://lists.zx2c4.com/mailman/listinfo/wireguard
 > >
 _______________________________________________
 > > WireGuard mailing list
 > > WireGuard@lists.zx2c4.com
 > > https://lists.zx2c4.com/mailman/listinfo/wireguard
 > >
 > >
 >=20
