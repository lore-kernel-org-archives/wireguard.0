Return-Path: oiaohm@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62a8d7a4
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 13:34:04 +0000 (UTC)
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f98a306
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 13:34:04 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id a10so425482230ywa.3
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 05:43:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
From: Peter Dolding <oiaohm@gmail.com>
Date: Mon, 9 Jan 2017 23:43:39 +1000
Message-ID: <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
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

On Fri, Jan 6, 2017 at 6:33 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Peter,
>
> On Thu, Jan 5, 2017 at 12:08 PM, Peter Dolding <oiaohm@gmail.com> wrote:
>>> 1. Dynamic IPs.
>>> 2. Both peers behind NAT.
>> That misses one completely
>> 3. Server and Peers both behind NAT.   Yes there is a usage case for this one.
>
> WireGuard has no concept of client/server. There are only peers. So,
> when I wrote "both peers behind NAT", I most certainly had in mind
> what you refer to as "server and peer". Please reread my answer in
> light of this new understanding.
>
>> Dynamic DNS has it weaknesses.   Transparent DNS caching and DNS
>> access restrictions in some networks mess with the solution you
>> describe.
>>
>> https://tools.ietf.org/html/rfc3489
>>
>> For Voip STUN was developed for many reasons three key reasons.
>> 1. you can username and password protect a STUN server so restricting
>> the users who can find out about the service.
>> 2 . It does support TLS so encrypted.
>> 3. Information on a STUN server is not replaced to other servers like
>> lots of dynamic DNS are so in case of attack there are limited sources
>> of information.
>>
>> Dynamic DNS option really using a hack that was not suitable for voip
>> yet for some reason people think it suitable to use for VPN.   Dynamic
>> DNS is not designed for punching though NAT solutions for the server
>> address like STUN is or designed to limit access to the address
>> information like STUN is.
>
> So, as I already wrote in my previous email, implement a STUN tool for
> setting up initial WireGuard communications. The example code I linked
> to already provides a framework on how this might be done. Just
> replace my homebaked hooks with whatever STUN library tickles your
> fancy.
>
>> This example the WireGuard server has a public IP address.   The case
>> I am mentioning Wireguard server may not have a public IP address.
>
> Um, no. Did you even read the example? Both WireGuard peers have
> private IP addresses. Only the NAT-helper server has a public IP
> address. This is the same model as STUN. Spend some time actually
> reading and studying the work already done on this before wasting more
> time with long emails.
>
>> Now STUN will attempt hole punching in the case you don't have a
>> public IP address for the WireGuard server if the NAT in use are
>> cooperative.   Of course if you read STUN rfc they state the case
>> where STUN cannot be used to create a link between server and client
>> both behind NATs as long as the STUN server is in the open.
>
> The example code I linked to presents the same model.
>
It is not the same model some critical is missing.

You example gets you a connection.   You example does not cope with IP
change as that happens in NAT environments.


You need a particular pattern of operations.

NAT Hole punch/dynamic DNS resolve.
Start VPN.
VPN detects connection lost triggers resolve again to check if the IP
address/port it is using is still current and correct.

This way VPN does not fall over and die.   Implementing STUN
completely I need to way of connecting an application to Wireguard
that Wireguard will resort to when connection fails keep alive message
and before informing applications or users VPN is lost.

So I need how to connect resolve to Wireguard so it can be done as
part of maintaining VPN connection.   This connect resolve to be
triggered when keep alive fails need to happen when using a dynamic
DNS.

The problem you have is when you find out your IP address on the
Wireguard server as changed then attempt to inform clients of
Wireguard server by wireguard that the IP address has changed this is
going to fail in NAT guarded clients.   Why NAT rejected IP addresses
that clients behind nat have not attempted to contact.   This is why
you example only really works with Wireguard clients behind nat with
dyanmic IP but if you put a Wireguard Server behind a nat with a
dynamic IP your example code completely fails.

Wireguard idea that Wireguard server can update clients when server IP
address changes only works when you have two public IP addresses old
and new so you can send change messages from old IP address and have
new IP address receive clients.   Problem is reality in dynamic IP
address you don't know what your new IP address will be until after
you have change IP address to the new IP address.   So wireguard
design of how to make server handle changing IP address fails in real
world.  Server changing IP address need clients to drop back to a
resolve solution and when server is behind nat and needing hole
punching rerunning hole punching.

The reality is you cannot run resolve just once you are operating in
dynamic IP address with NAT.



>> Jason the issue here to be able to use STUN/TURN combination in all
>> cases I need Wireguard to be able to be directed to use TURN.
>
> Great. I already outlined how this could be done, and I provided
> example code. Plug your STUN or TURN library into that, and you'll be
> all set.
>
> No, I'm not going to write it for you. You got a NAT-punching example
> from me. You can get a STUN/TURN library from somebody else. All
> that's left for you is putting them together.
>> Current model is
>> [Client]-[Server]
>> What is needed is
>> [Client]-[Relay]-[Server] with [Client]-[Server] to cover all usage
>> cases.   Of course the relay being something standard and common
>> reduces the number of servers that have to be publicly deployed and
>> maintained.
>
> Yes, I'm aware. And this is exactly what the example code demonstrates
> is possible.
>
No relay is something different to what you demoed.   TURN is relay.
When using TURN Wireguard clients/server would not be able to connect
to each other so would be sending all packets by the TURN server.

Relay is not exactly possible to performing with existing code.   From
what I have seen of wireguard I cannot tell it to use a standard
socket file.  Like /var/lib/mysql/mysql.sock with mysql.   Because
when you are going to be relaying all packets you don't need a IP
addressed port.   Ok now we have extra performance overhead and over
expanded packet attempting to get into TURN effecting every packet
sent by current Wireguard design.

Current from client packets roughly look like(yes this is rough I have
skipped over lots.
cleint send [destination IP address of wireguard server][source IP
address of wireguard client][wirguard data]
server send [destination IP address of wireguard client ][source IP
address of wireguard server ][wirguard data]
In Turn it need to do the following after connection stuff on the turn
server is setup.
wireguard cleint send [destination IP address turn server][source IP
address of wireguard client][Turn channel ID for server][wirguard
data]
wireguard server send [destination IP address turn server][source IP
address of wireguard server][Turn channel ID for client][wirguard
data]

Of course all packets the wireguard client or server would be
receiving would have address of TURN server because it a relay.

So current design would be rewriting all the packet headers to send
wireguard to TURN.   This is why with TURN it would be way better
built into the base design.

If connection fails due to any number of causes a connection using
TURN need to some how trigger running resolve again.

 Using TURN you basically are not using IP addresses any more but an
abstraction system.   Using TURN you can technically send packets
between two~16 thousand clients with identical IP address.

Relay solution is basically for when you cannot punch a hole through
the nat or have direct connection between client/server.

What you code demonstrates is a resolve server with client code to
interface with it.    This is what STUN is.   STUN is just a rfc
standard defining how to go about implementing a resolve server and
clients with all the nice stuff.

STUN rfc goes and documents all the ways a resolve sever solution with
NAT will hit brick walls.   So you want to design something for
punching holes in NAT read the STUN rfc completely.
 https://tools.ietf.org/html/rfc5389

Basically you have been doing NIH syndrome.   The punching though NAT
has been done very completely with STUN to make viop and other
services like it work.   In fact STUN has done it about as far as can
be done this is why TURN support for relaying was added as it own rfc
to cover the cases where there is no way to punch though the NAT.

My step one is somehow have wireguard support calling/registering with
a userspace resolve program for when connection fails.   The one thing
about implementing going though nat with dyanmic IP address is that
connection failure is a given.  The key trick is handling connection
failure not making the connection.   Basically punching a NAT hole to
make a connection in most cases is either easy or not possible
maintaining the hole is the hard bit because nats can clear the
information ip address can change.....  Wireguard servers and clients
have a keep alive message these messages not turning up can be a clear
sign that resolve program need to rerun.

I am not going to write something that I know end users are going to
have trouble with.   Both STUN/TURN mandates that resolve interface to
be workable.

Basically you did the easy bit and punched the hole and have missed
all the steps required to maintain that hole as the network
environment changes around you.      Resolver should not be running on
the clients all the time and should not need to be perfectly fast just
run when ever the connection looks dead to make sure settings are
right before calling the connection absolutely dead if the settings
are wrong correct settings and attempt to rejoin up.  This is a
interface for auto healing of failures..

Peter Dolding
