Return-Path: oiaohm@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b52ca57b
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 06:01:25 +0000 (UTC)
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 678787b6
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 06:01:25 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id a10so262485692ywa.3
 for <wireguard@lists.zx2c4.com>; Sun, 01 Jan 2017 22:10:05 -0800 (PST)
MIME-Version: 1.0
From: Peter Dolding <oiaohm@gmail.com>
Date: Mon, 2 Jan 2017 16:10:04 +1000
Message-ID: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
Subject: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more durable.
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

https://en.wikipedia.org/wiki/Traversal_Using_Relays_around_NAT

We are living in a age of multi levels of NAT and dynamic IP address at times.

Yes I like how wireguard is design.   Current design over looks
dealing with the case of where client and server cannot ip connect to
each other or that the wireguard server does not have a fixed IP
address so changes IP address while clients are off-line or changes IP
address due to being on a dynamic IP so unable to inform clients.
Dynamic DNS updates can be slow where STUN/TURN connections can be
very quick to get update information out there.

**The client configuration contains an initial endpoint of its single
peer (the server), so that it knows where to send encrypted data
before it has received encrypted data.**

Its basically this bit that is the mistake.

**If the server itself changes its own endpoint, and sends data to the
clients, the clients will discover the new server endpoint and update
the configuration just the same.**

If a client is not connected at the time server changes it address
information how is the client going to find it now.   The answer is
with current design client is not going to be able to.   This has been
existing bug bear of existing VPN solutions.

Now if the client config includes fall back STUN/TURN configurations
the server can have moved it IP address the client configuration can
be old and the vpn client able to find it way back to server as long
as the STUN/TURN servers have not disappeared as well.

So a more options to get Endpoint information will make the protocol a
lot more durable.   If client loses connection to server and endpoint
address appears incorrect there need to be a server discovery process.
  Server endpoint discovery on clients could be calling a user-space
program that goes though stun/turn/IRC/xmmp.... options in the
configuration file searching for a current valid endpoint information.
  This is to reduce amount of code kernel side and allow discovery
options to be updated without requiring kernel changes.

There is the possible case that endpoint address is current but not
workable because client has changed to a internet connection where
direction connection between wireguard server and client is not
possible with current design roaming fails  this why TURN need to be
in the mix.   If sending data to a turn server to get it relayed will
not work you are fairly much stuffed.   Adding relay by turn server
could cost kernel side code.

Really we need wireguard vpn clients to be able to start up
connections without valid endpoint information in configuration file
just with valid discovery information list  so able to go use like
STUN/TURN/IRC/xmmp.... and request current endpoint information.   Of
course this means wireguard server need to run a service to answer
endpoint information requests.   Items answering and processing end
point information request could be quite variable and not requiring
lots of different privileges and be shared between user-space and
kernel space implementations it not like you should be running end
point discovery all the time client side.

https://nice.freedesktop.org/wiki/

None of what I am suggesting is required starting from scratch at
first.  libnice includes stun and turn.   Its just the weakness in the
design I see.   Of course some users will want to keep discovery
options to a min other will have no choice but to use them.


Peter Dolding
