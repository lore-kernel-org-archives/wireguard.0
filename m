Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 450601c8
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Apr 2018 15:18:34 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41419b95
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Apr 2018 15:18:34 +0000 (UTC)
Message-Id: <1525015194.2266395.1354633912.19433C3F@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: Eddie <stunnel@attglobal.net>, reiner otto <augustus_meyer@yahoo.de>,
 wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Mon, 30 Apr 2018 03:19:54 +1200
Subject: Re: Route all traffic to one IP _only_ via wireguard
References: <570542680.2946509.1524910065103.ref@mail.yahoo.com>
 <570542680.2946509.1524910065103@mail.yahoo.com>
 <1524923360.509743.1353883656.6A466327@webmail.messagingengine.com>
 <f59b002a-21df-6218-db70-bfb8398092c1@attglobal.net>
In-Reply-To: <f59b002a-21df-6218-db70-bfb8398092c1@attglobal.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Eddie and Reiner,=20

I might be misunderstanding the request, but...=20

> the real goal is to tunnel only traffic with a specific destination IP vi=
a wireguard from client to server.

Isn't this just asking the same as:

> I only want to use wg0 for x.x.x.x/32, and I want to use eth0 for everyth=
ing else

If I'm reading that right, I believe it's a simple matter of changing the s=
cope of his AllowedIPs, so his traffic is routed via the correct interfaces=
. No iptables or packet marks required.=20

Reiner - have I misunderstood your question? I've assumed you're using wg-q=
uick?=20

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sun, 29 Apr 2018, at 07:07, Eddie wrote:
> I didn't think that AllowedIPs would filter traffic like that.=C2=A0 But=
=20
> could be wrong.=C2=A0 :-)
>=20
> Here's my take on your problem:
>=20
> Add "Table =3D off" and "FwMark =3D 1234 (or other value)" to the wg conf=
ig,=20
> which will stop the routing tables being updated and add the routing=20
> mark to all encrypted packets.
>=20
> Then you will need a new ip rule table, that runs ahead of "main" that=20
> selects all traffic with the fwmark from wg and routes that directly to=20
> your external interface.=C2=A0 Something like:
>=20
> from all fwmark 1234 lookup net
>=20
> net:
> default via <gateway ip> dev <external interface>
>=20
> Then add a new rule to main, that routes ip 1.2.3.4 out via the wg=20
> interface.
>=20
> Cheers.
>=20
>=20
> On 4/28/2018 6:49 AM, Eric Light wrote:
> > Hi Reiner!
> >
> > I think the problem here is your client's AllowedIPs section. If you on=
ly want to access one address, you only enter that target IP - not the whol=
e internet space (0.0.0.0/0). That's why everything is being routed out via=
 your wg0.
> >
> > So you should change that client AllowedIPs to 172.16.0.1/32, and that'=
ll fix it. Alternatively, set it to /24 if you also want access to other de=
vices within the corporate LAN... That's how I do it.
> >
> > I think that's all you need. Sorry if I've missed something! :)
> >
> > E
> >
> > --------------------------------------------
> > Q: Why is this email five sentences or less?
> > A: http://five.sentenc.es
> >
> > On Sat, 28 Apr 2018, at 22:07, reiner otto wrote:
> >> My basic setup of wg works, I can ssh from/to server or client.
> >> But the real goal is to tunnel only traffic with a specific destinatio=
n IP
> >> via wireguard from client to server.
> >> I.e. a local router, which allows direct access to the web,
> >> _BUT_ all traffic going to the corporate server using wireguard only.
> >> Corporate server (public 1.2.3.4) =3D=3D wireguard server (172.16.0.1).
> >>
> >> I tried various settings on my client, like
> >> ip route 1.2.3.4 dev wg0
> >> ip route 1.2.3.4 via 172.16.0.1
> >> etc.
> >> but nothing worked.
> >>
> >> Any help really appreciated.
> >>
> >> ---
> >> wg0.conf on server (1.2.3.4):
> >> [Interface]
> >> ListenPort =3D 1234
> >> PrivateKey =3D secret
> >> [Peer]
> >> PublicKey =3D secret
> >> AllowedIPs =3D 172.16.0.0/16
> >> -
> >> wg0.conf on client (172.16.18.31):
> >> [Interface]
> >> PrivateKey =3D secret
> >> ListenPort =3D 1234
> >> [Peer]
> >> PublicKey =3D secret
> >> AllowedIPs =3D 0.0.0.0/0
> >> Endpoint =3D 1.2.3.4:1234
> >>
> >>
> >> _______________________________________________
> >> WireGuard mailing list
> >> WireGuard@lists.zx2c4.com
> >> https://lists.zx2c4.com/mailman/listinfo/wireguard
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> >
> >
>=20
