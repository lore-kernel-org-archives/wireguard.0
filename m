Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a248c5da
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 07:39:10 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d54b62e3
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 07:39:10 +0000 (UTC)
Message-Id: <1529999079.2386846.1420537656.511A8484@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: Adrian Sevcenco <adrian.sev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
 <8736xaod3b.fsf@toke.dk>
 <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
 <87woummwlh.fsf@toke.dk>
 <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
Date: Tue, 26 Jun 2018 19:44:39 +1200
In-Reply-To: <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi, Adrian!

The reason you can't have the _same_ AllowedIPs for two different peers is =
because that's what's used to set the routes.  How can you set two differen=
t routes for the same destination?

So, because you're trying to set 0.0.0.0/0, there can only ever be one peer=
 at the end of that route.

What you need to do is set a more precise range for the AllowedIPs.  For ex=
ample, 192.168.100.0/24 and 192.168.101.0/24 (for two hosts on different ne=
tworks), or 192.168.88.200/32 and 192.168.88.201/32 (for two hosts on the s=
ame network).

Then if you want one host that just *everything else* tunnels through, you =
can set a 0.0.0.0/0 - which behaves as your default route.

Hope that helps  :)

Eric

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Tue, 26 Jun 2018, at 19:34, Adrian Sevcenco wrote:
> On 06/25/2018 11:37 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > Adrian Sevcenco <adrian.sev@gmail.com> writes:
> >=20
> >> On 06/25/2018 10:55 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> >>> Adrian Sevcenco <adrian.sev@gmail.com> writes:
> >>>
> >>>> Hi! It seems that AllowedIPs declaration gets erased when peers are
> >>>> added with addconf
> >>>
> >>> You can't have the same AllowedIPs for two different peers... :)
> >>
> >> Err... so, it's a bug or a feature?
> >=20
> > A feature. The AllowedIPs controls which IP addresses will be routed to
> > that peer. They refer to addresses inside the tunnel. So depending on
> > your setup you'd specify the single IP you assign each peer, or possibly
> > any subnets behind that peer you want routed through the tunnel.
> Then, how can i set a default allow everything for each peer? Should i=20
> make a different tunnel for each peer?
> But given your explanation i still feel that it is a bug that when an=20
> AllowIPs is declared with the addition of a second peer the declaration=20
> from the first peer gets erased ...
> It should be either a global setting per tunnel OR an individual setting=
=20
> per peer (in which case it should stay set)
>=20
> Thank you!!
> Adrian
>=20
> >=20
> >> If it is a feature how can i make server accept whatever ip get the
> >> client(s) in various networks?
> >=20
> > Changing IPs *on the outside* of the tunnel will be accepted
> > automatically. The Endpoint specifier is only the initial address; if a
> > device changes its IP, it'll just keep sending packets from the new IP,
> > and because they are authenticated by the crypto, the other peer will
> > accept them and change its notion of what IP the other peer is
> > reachable at automatically. So as long as only one peer changes its IP
> > at a time, roaming mostly just works :)
> >=20
> > -Toke
> >=20
>=20
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
