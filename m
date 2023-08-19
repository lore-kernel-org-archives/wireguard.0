Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1030EE49A6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 20:00:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5034a68;
	Sat, 19 Aug 2023 20:00:21 +0000 (UTC)
Received: from mail.0l.de (mail.0l.de [83.243.41.180])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22cb89fc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 20:00:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id EC649201DADE; Sat, 19 Aug 2023 22:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffenvogel.de;
 s=dkim; t=1692475218;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=I1pgjO/YqdEkW1vZXGBuLPvdFgwgWIuquNQwFZn9hT4=;
 b=DgvdlbvY2jGpIasxC4JxoWQFJJ4luBjBFOBcgJdvXZYv0LNcovCj4xX7qlTfbiP/FxHH2h
 Xar50rS0/5XLYGb//b0T+Iu2E6FEOJvaM6zasHvwqSD4AWdkLJoIpY+wZkYBSL6YSHkLwF
 YsO3flUDKV3qeFTGBqFQxft4N0jdWNycjYjbVSLqzTg3s6Lqyqz4MWukuZz/V1qAm2/UAs
 IqFxPsAknc5SpFK99H3g4CXE8VKzTXIf/YUREDCGSDFRvpjB+NtD5y/bbYMD1Pw4uYwxo/
 ahmoa0eiqFftMbToTuBtUer9te1+IaOhaUONJUfk0vC0+oU7UN1r0yHYtuPTig==
From: "Steffen Vogel" <post@steffenvogel.de>
In-Reply-To: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
Content-Type: text/plain; charset="utf-8"
Date: Sat, 19 Aug 2023 22:00:17 +0200
Cc: wireguard@lists.zx2c4.com, bird-users@network.cz,
 babel-users@alioth-lists.debian.net
To: =?utf-8?q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
MIME-Version: 1.0
Message-ID: <4b-64e11f80-13-5e880900@8744214>
Subject: =?utf-8?q?Re=3A?= [Babel-users] [RFC] Replace WireGuard AllowedIPs
 with IP route attribute
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
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

Hi Daniel,

Interesting ideas! I am wondering if this complexity is really necessar=
y?
How many routes do you have per peer? In my personal setup I have maxim=
um of 1-100 routes per peer which I can handle with the current API qui=
te comfortably.

My biggest concern about the introduction of a route attribute is that =
this adds complexity for users.
WireGuard's simplicity (and portability) have been important factors fo=
r its success.

A route attribute would introduce another source for the crypto-routing=
 peer selection process.
What happens if the two mechanisms select different peers? Which one wo=
uld have precedence?
Similarly also for incoming packets. WireGuard's current principle is r=
eally easy to understand. If the source address in in the peers Allowed=
IP list, we will accept the packet. If not its discarded. This is a cen=
tral part of WireGuard's crypto-key routing feature which would become =
more complex.

Also implementation wise I would have doubts: Should WireGuard itself p=
erform route lookups to determine which packets will be accepted? Or do=
es WireGuard needs to synchronize the kernel routing table with its int=
ernal data structures itself?

A second concern I have with the use of route attributes is limited por=
tability. Not all platforms support them.
How do we handle WireGuard userspace implementations?

I've tackled this problem in a userspace daemon. The synchronisation of=
 a kernel routing table with a WireGuard AllowedIPs settings can be don=
e by cunicu's route synchronization feature: https://cunicu.li/docs/fea=
tures/rtsync

The route synchronization feature keeps the kernel routing table in syn=
c with WireGuard's AllowedIPs setting.
This synchronization is bi-directional:

- Networks which are found in a Peers AllowedIP list will be installed =
as a kernel route
- Kernel routes with the peers unique IP address as next-hop will be ad=
ded to the Peers AllowedIPs list.

This rather simple feature allows user to pair cunicu with a software r=
outing daemon like Bird2 while using a single WireGuard interface with =
multiple peer-to-peer links.

I am assigning each WireGuard interface a link-local address which is d=
erived from the peers public key.
I am using the peers link-local address as the next-hop in my routing d=
aemon to differentiate to which Peer the AllowedIP entry must be added.

I am keeping track of the kernel's routing table and AllowedIPs by regu=
larly polling the kernel.
As the route synchronisation is just one of cunicu's features [1], I ha=
ve a central "watcher" routine in cunicu which observes any modificatio=
n the the WireGuard interfaces and dispatches events which the individu=
al features then can hook into. These observations are not limited to t=
he AllowedIPs but basically any state of the WireGuard interface. E.g. =
last handshake time or per/peer traffic counters.

In my setup a periodic synchronization worked fine. But I agree that it=
 would be nice if we could have a Netlink multicast group for subscribi=
ng to changes like we also have for other parts of the Linux network st=
ack like routing tables, or link states. This feature was already discu=
ssed on the WireGuard mailing list [7]. But unfortunately the patch was=
 never accepted. Maybe we can revisit this patch?

I would also be a big supported of extending the netlink API for suppor=
ting incremental updates the AllowedIP lists. The netlink APIs are alre=
ady different for each platform. So extending it for one platform would=
n't hurt here.

Unfortunately, I have far too many ideas for cunicu and limited time to=
 realize them all. So I've recently moved the whole cunicu project into=
 its own organization at GitHub/Codeberg [6] in attempt to find more co=
ntributors.

Best regards,
Steffen (stv0g)

[1] Others planned features are:
- Endpoint discovery via ICE/STUN/TURN
- Peer discovery
- IP-autoconfiguration by deriving link-local addresses from peers publ=
ic keys

I have a lot more ideas here like integrating my
- Go babel routing implementation [2]
- or Rosenpass PQC key-exchange [3]
- or performing proper path-MTU discovery using DPLPMTUD [4]
- or using hardware tokens, TPMs, secure enclaves to rotate pre-shared =
keys backed by a hardware source-of-trust [5]

[2] https://github.com/cunicu/go-babel
[3] https://github.com/cunicu/go-rosenpass
[4] https://github.com/cunicu/go-pmtud
[5] https://github.com/cunicu/go-skes
[6] https://codeberg.org/cunicu
[7] https://lists.zx2c4.com/pipermail/wireguard/2021-January/006318.htm=
l

On Saturday, August 19, 2023 16:02 CEST, Daniel Gr=C3=B6ber <dxld@darkb=
oxed.org> wrote:

> Hi wireguard, birds, and babelers,
>=20
> tl;dr I want to add a new Linux route attribute (think "via $wgpeer")=
 to
> supplement wireguard's internal AllowedIPs logic for both routing and
> source address filtering.
>=20
> I've been pondering how to better integrate wireguard into dynamic ro=
uting
> daemons, particularly BIRD and babeld. Essentially we want to be able=
 to
> dynamically add/remove AllowedIPs depending on current reachability a=
nd/or
> link quality stats.
>=20
> Looking at the wg netlink API I see two major efficiency/scalability
> problems: 1) there is no way to be notified of changes in AllowedIPs =
made
> by other processes meaning we have to do periodic scans and 2) a peer=
's
> AllowedIPs set can only be replaced wholesale, not modified
> incrementally. This is problematic as "someone" might, in the worst c=
ase,
> want to install an entire internet routing table's worth of AllowedIP=
s and
> the set will likely change frequently. FYI: The IPv4 table has ~1M en=
tries
> at present, yikes.
>=20
> Assuming external AllowedIPs changes are infrequent occationally dump=
ing
> them all to keep a consistent view of the state shouldn't be too much=
 of an
> issue as long as the netlink interface is performant enoug, so I'm go=
ing to
> concentrate on the add/remove API for now.
>=20
> Instead of doing the obvious thing and adding a more efficient increm=
ental
> AllowedIPs netlink interface I figure why not just add a route attrib=
ute to
> select a target wg peer on a device. That way we could not only save =
memory
> (no separate AllowedIPs trie) but also simplify routing daemon
> implementation considerably.
>=20
> This would mirror how on ethernet you can have `dev eth0 via $router=5F=
ip`.
> I'm still reviewing the net/ code to find the best way to do this, bu=
t I'm
> thinking either a new RTA=5FWGPEER, like: `default dev wg0 via-wgpeer
> $peer=5Fpubkey` or perhaps re-using RTA=5FVIA and keying off a static=
ally
> configured AllowedIP addresses.
>=20
> To start I'd make this an opt-in replacement for our usual AllowedIPs
> logic, making sure to only activate it if any via* RTAs are active on=
 a
> particular device, but if it proves to work well I don't see why we
> couldn't adapt the netlink code to maintain AllowedIPs using this RTA=
 (but
> invisible to userspace) to re-use the same code and get rid of allowe=
dips.c
> altogether. That's assuming this ends up being less code overall or p=
erhaps
> more performant.
>=20
> Happy to hear your thoughts,
> --Daniel
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Babel-users mailing list
> Babel-users@alioth-lists.debian.net
> https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/babel-users

