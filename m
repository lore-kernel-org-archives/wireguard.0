Return-Path: oiaohm@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de0343a5
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jan 2017 07:27:22 +0000 (UTC)
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afba4338
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jan 2017 07:27:22 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id l75so3056815ywb.0
 for <wireguard@lists.zx2c4.com>; Tue, 17 Jan 2017 23:38:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9prbSxXRK+MvZvfmF4EnzMST0o7gRtc6UqMUn+ZTJk2xg@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
 <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
 <CAHmME9prbSxXRK+MvZvfmF4EnzMST0o7gRtc6UqMUn+ZTJk2xg@mail.gmail.com>
From: Peter Dolding <oiaohm@gmail.com>
Date: Wed, 18 Jan 2017 17:38:04 +1000
Message-ID: <CANA3KFVxY3+A00642qCi8YxV=-fYi7C+mU1VzMDDOZrptj=3dw@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Jan 15, 2017 at 8:40 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Peter,
>
> On Mon, Jan 9, 2017 at 2:43 PM, Peter Dolding <oiaohm@gmail.com> wrote:
>> You example gets you a connection.   You example does not cope with IP
>> change as that happens in NAT environments.
>
> Yes, example only code.
>
>> VPN detects connection lost triggers resolve again to check if the IP
>> address/port it is using is still current and correct.
>
> As mentioned elsewhere, at some point there will be userspace
> notification for these sorts of events. I agree it's necessary for
> this kind of detection.
>
>> if you put a Wireguard Server behind a nat with a
>> dynamic IP your example code completely fails.
>
> Yea. This was similarly discussed in the other thread from Emmanuel.
> That discussion veered toward a multiendpoint-like solution. What
> you're suggesting, here, is a STUN-based solution, which depends on
> userspace connectivity notification. Your suggestion indeed is
> interesting to me.
>
>> The reality is you cannot run resolve just once you are operating in
>> dynamic IP address with NAT.
>
> If the server is behind a dynamic IP firewalled situation, right.

Firewall or NAT.   IPv6 has NATs not seen in large numbers these don't
have to be officially called firewalls.   Just like IPv4 NAT they go
has the source address be contacted by someone behind the NAT if no
drop packet.

Yes a dynamic firewall could be configured to have the same behaviour
as a IPv6 nat.   Routers provided by ISPs will most likely still have
a IPv6 nat in time so ISP can allocate 1 ipv6 address per customer for
simple accounting.

So mutable machines behind 1 address is still in ipv6 world.    Ipv6
address change could be local ipv6 address change by router and the
router being stupid.   Routers being buggy I don't see that
disappearing any time soon either.
>
>> Relay is not exactly possible to performing with existing code.   From
>> what I have seen of wireguard I cannot tell it to use a standard
>> socket file.  Like /var/lib/mysql/mysql.sock with mysql.   Because
>> when you are going to be relaying all packets you don't need a IP
>> addressed port.   Ok now we have extra performance overhead and over
>> expanded packet attempting to get into TURN effecting every packet
>> sent by current Wireguard design.
>
> I think you could set the WireGuard endpoint to be localhost pointing
> to some TURN daemon to do it in userspace?
>
> By the way, would that kind of hack be an acceptable way to go about
> STUN for you? A userspace daemon that forwards packets to a
> dynamically changing IP? Maybe that's simpler to implement than the
> userspace state notification stuff I mentioned before.

The issue for a socket is when you use a file socket you can skip
putting the IP packet  and UDP information on the data to be sent.
So that the system sending the data out by TURN or some other protocol
is not having to strip ip and UDP information put on by Wireguard
before adding the ip/tcp/udp information the relay server wants to
keep packet as compact as possible.   Of course the relay sever header
size is not going to match the Wireguards packet in current design so
you cannot edit the already allocated packet memory to make the packet
being sent on to relay..

Using localhost means calculating checksums and creating real packets
  This means wireguard would be calculating checksum on every packet
TURN relay got from localhost then TURN relay would have to be
calculating a checksum for every packet it sends to wireguard what are
both really wasting CPU time if the UDP checksum is not important to
wireguard.    If that checksum

File Socket you would have a process per connection.    So for TURN if
it not going to be in kernel is a wireguard support file socket mode
without IP/UDP information as anything relaying will be straight up
junking this information and putting the information on the relay
protocol needs.   Wireguard would be able to tell what connection its
meant to be by the process..

In fact wireguard for supporting Relay solution asking for so much
blank space/ignore space.   So a relay solution knows is need x number
of bytes for its ip/nat/relayid and is able to tell wireguard to send
to packets with that free.  Of course wireguard could also process
packets with the relay solutions ip/udp/relayid on by knowing how far
to skip forwards so avoiding reworking memory.

Using STUN without TURN it only need to be informed when connection
has disappeared to NAT punch the connection back open.   Otherwise a
successful NAT punching works exactly like a normal connection.

Even so providing a file socket method would allow STUN in the middle
to be fully dynamic.   By fully dynamic I mean changing from direct
connection to NAT punching to TURN all without having to stop the VPN.

Now if for some reason Wiregaurd was being used between containers
split by network namespace could be sharing a file namespace and use a
socket this is also where local address fails.

>
>> So current design would be rewriting all the packet headers to send
>> wireguard to TURN.   This is why with TURN it would be way better
>> built into the base design.
>
> There's zero chance I'm going to incorporate TURN into the wireguard
> core protocol, but I am amenable to discussing ways in which it could
> be built on top in some nice composable fashion.

I should be more correct built into the base design.  I include this
as supporting file sockets so you can cleanly be used by something
relay like TURN without items a Relaying program really does not need.

So when you draw a a diagram of how wireguard works there is a relay
interfaces go here box this  could be in userspace would be still
being part of the base design in my eyes.

TURN protocol is just a good standard relay protocol that shows what
is needed and what is not.     So going though the process of
implementing TURN with the least modifications to wireguard at the
best performance will cover fairly much every case.

Going though a relay and not having excess cpu usage or memory
allocations takes serous thinking.   Its really easy to end up having
to duplicate memory to modify packets to add the information relay
server needs or waste time calculating checksums that are not
important when attempting to relay that could have be not generated in
the first place.

Issue is going relay is not the same as going direct.   Its a
different problem because no matter the relay there is always extra
information need at the start after the either TCP/UDP header to tell
the relay what end point to relay the data to.   So a relay packet
always bigger than standard packet.   Relays don't always accept
fragmented packets either.

Supporting a relay be it turn or any other relay solution is in fact
different to direct connections.   It is really easy to end up round
peg square hole.  vpn set-up for direct connection attempting to be
sent by relay can have time out issues due to overhead of relay and
userspace relay program needing to break up packets then have assembly
problems


If wireguard design include a design for doing something like TURN
without massive pain possible.    Now if the design like it current
does does not include anything for doing relay.

>
>> STUN rfc goes and documents all the ways a resolve sever solution with
>> NAT will hit brick walls.   So you want to design something for
>> punching holes in NAT read the STUN rfc completely.
>>  https://tools.ietf.org/html/rfc5389
>
> Yes, I know what STUN is; I know what TURN is; I've read your linked RFC.
>
>> Basically you have been doing NIH syndrome.
>
> No I haven't. I made some quick example code as a PoC in a hundred
> lines of C, so that somebody wanting to incorporate STUN later on
> would have something concrete to visualize the design. Maybe that
> person is you? Perhaps you'll be the one to contribute something
> useful.
>
>> My step one is somehow have wireguard support calling/registering with
>> a userspace resolve program for when connection fails.
>
> I'll work on this and give some thought about the cleanest solution.
>
>> I am not going to write something that I know end users are going to
>> have trouble with.   Both STUN/TURN mandates that resolve interface to
>> be workable.
>
I am not sure if I will implement code.   But with the problems I have
in different places I may end up doing so.

Peter Dolding
