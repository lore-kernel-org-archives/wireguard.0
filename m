Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd9787f9
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:31:50 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6368cce
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:31:50 +0000 (UTC)
Received: from phare.polynome.dn42 ([172.23.184.97]
 helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1cQM9O-0002SK-Np
 for wireguard@lists.zx2c4.com; Sun, 08 Jan 2017 23:41:18 +0100
Date: Sun, 8 Jan 2017 23:41:17 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: [RFC] Handling multiple endpoints for a single peer
Message-ID: <20170108224117.GB9445@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here is a proposal for handling multiple endpoints for a single Wireguard
peer.  This includes handling dual-stack peers (IPv4 and IPv6) but is more
general.

This is something I had discussed with Jason at the beginning of the
project, but we agreed at the time that it was too early for the added
complexity.  It has since been requested several times on the mailing
list, and properly handling dual-stack is an important feature to have.

There is no code yet, the goal is to brainstorm possible methods.  Please
read and provide feedback on the specification, the use-cases and the
implementation suggestions (especially "Select new endpoint during each
handshake").  Sorry for the long email.


Problem
=======

Currently, Wireguard only allows a single Endpoint for a given peer,
where:

- Peer: remote computer implementing Wireguard, identified by its cryptographic public key.

- Endpoint: IP address and UDP port (written "IP:port") at which a Wireguard peer can be reached on the public Internet.

The big advantage of the current method is simplicity, because when
Wireguard needs to send an encrypted packet to a peer, it just sends the
packet to the (unique) endpoint of the peer.


Specification
=============

Allow multiple endpoints for the same Wireguard peer.  With the "wg
setconf" syntax [WG], it would look like this:

    [Peer]
    PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
    Endpoint = 192.95.5.67:1234, [2607:5300:60:6b0::c05f:543]:1234, myserver.dyndns.tld:1234, 192.168.1.42:1234
    AllowedIPs = 10.192.122.3/32, 10.192.124.1/24

Here, this peer (identified by its public key) has four different
endpoints:

- one public IPv4 address
- one public IPv6 address
- one hostname, which may resolve to multiple IPv4 and IPv6 addresses
- one private IPv4 address

When configuring the Wireguard kernel module itself, this information
would be translated to a list of IP:port entries.  To achieve this, each
hostname would be resolved to a list of IPv4 and IPv6 addresses by `wg`,
while IP addresses would be passed directly.


The decision of which endpoint to use for a given peer should be made
continuously during the entire lifetime of the Wireguard connection, and
not just when performing the initial connection.  This would allow to
handle events such as transient connectivity issues, performance
anomalies, mobility, etc.  It is also more consistent with the current
roaming functionality.

This decision could be based on either:

- simple connectivity: for instance, when an endpoint stops working, try
  another one;

- a performance metric: for instance, always use the endpoint with the
  lowest measured latency.

Moreover, the current roaming functionality should be preserved, at least
partially.  Currently, when a peer sends us a valid packet from a new
IP:port endpoint, we use this endpoint for all our subsequent outgoing
packets.


Use-cases
=========

## IPv4 and IPv6 cohabitation

In this case, one peer ("the server") is reachable via both IPv4 and IPv6.
Clients, on their physical network, may have IPv4-only connectivity,
IPv6-only connectivity, or dual-stack connectivity, and may move from one
such physical network to another.

For clients, it should be enough to use:

    Endpoint=myserver.tld:4242

where myserver.tld has both A and AAAA records.


## Server multi-homing

A peer may have multiple IPv4 or IPv6 addresses if it is multi-homed to
several networks (several ISPs).

In this case, clients could configure multiple endpoints for the peer:

    Endpoint=myserver.firstisp.tld:4242, myserver.secondisp.tld:4242

It is expected that Wireguard can always communicate with the peer even if
either one of the network path is broken (using fail-over to increase
reliability).  Also, it would be nice to select the endpoint based on a
performance metric (lowest RTT).

This also covers a use-case exposed on the mailing list [DYNDNS].


## Local and scope-dependent addressing

Let's assume my Wireguard server is at home, behind an IPv4 NAT or an IPv6
tunnel.  From the Internet, I want to use the public IPv4 or tunneled IPv6
as endpoint, but when I move to my local network, I want to use the
private IPv4 address.  This avoids connection failure if my home router
does not implement hairpinning (for IPv4) and avoids a potential
round-trip to the Internet (for tunneled IPv6).

In that case, I should be able to use:

    Endpoint=myserver.tld:4242, 192.168.1.100:4242

The connection to the private IP would not work while I am on a random
network, but once I connect to my home network, I expect Wireguard to
switch to the private IP endpoint.


Challenges
==========

The main problem to solve is that Wireguard would now have a choice to
make: when an encrypted packet needs to be sent towards a peer, what
destination address and UDP port should be used?  Currently, this task is
trivial since there is a 1-to-1 mapping between peer and endpoint.

This decision-making is difficult because Wireguard has access to very few
connectivity- or performance-related information.  For instance, Wireguard
currently cannot measure the RTT towards a given peer, except during the
handshake.  Even worse, Wireguard has no way to check that encrypted
packets are indeed received by the peer.  There is no acknowledgement
system at the level of Wireguard.  This means that dropped packets will
not be detected until the next handshake, which could create a temporary
blackhole.

It means that Wireguard is not in position to make informed decisions: it
needs to either delegate the decision to someone else, for instance a
user-space process, or find a way to have enough information to make
informed decisions itself.


Implementation suggestions
==========================

## Existing strategies

Choosing between IPv4 and IPv6 in a dual-stack environment is not new.
When IPv6 was not working very well, some people designed an algorithm
called "happy eyeballs" [HAPPYEYEBALLS].  A program basically tries to
connect over IPv4 and IPv6 quasi-simultaneously (with a small timing
advantage for IPv6), and chooses the address family based on the first
answer it receives.  If IPv6 works reasonably well, it will be used,
because it had a head-start of a few tens of milliseconds.  If IPv6 is
completely broken, then the connection will quickly fallback to IPv4.

The same idea could be used here to choose one of the multiple endpoints.
However, happy eyeballs is only used during connection establishment,
because the main use-case are short-lived connections like HTTP.  Here, we
would like Wireguard to switch to a new endpoint at any time, so that it
can react to changing network conditions.


## Select new endpoint during each handshake

This is perhaps the most clean and simple trade-off, and exploits the fact
that Wireguard regularly performs a new handshake with a peer:

- during the handshake, select the "best" endpoint
- while the symmetric key is in use (a few minutes), keep the same endpoint
- the roaming functionality can still update the current endpoint between two handshakes
- during the next handshake, repeat the procedure, potentially selecting a new endpoint

Selection of the "best" endpoint can be quite simple: send a handshake
packets to all endpoints simultaneously, and select the endpoint for which
the answer arrives the first.  This would select the endpoint with the
lowest RTT at this point in time.  To avoid switching endpoint too often,
the current endpoint can be given a slight advantage, similarly to happy
eyeballs: first send the handshake packet to the current endpoint, wait
e.g. 10 ms, and then send the handshake packet to all other endpoints.
This way, we switch to a new endpoint only if that would improve the RTT
by 10 ms.

It looks quite simple, but I am sure there would be a lot of
implementation difficulties:

- What if the remote peer always performs key exchange just before us?  We
  would never be able to try other endpoints.

- What should be the behaviour of the peer when it receives several
  handshake packets?  Should it reply to all of them? (probably, because
  of asymmetric RTT on Internet paths).  How would the peer select its own
  endpoint towards us?


Since Wireguard performs handshakes at relatively short intervals, this
method provides some amount of liveliness: if connectivity with the
current endpoint breaks (blackhole), it will be detected and corrected
within a few minutes.

Of course, there can be optimisations for cases with obvious lack of
connectivity.  For instance, if the current endpoint is an IPv6 address
and we are moving to a network with no IPv6 connectivity, trying to send
an IPv6 packet will result in an immediate error.  In this case, we would
immediately initiate a new handshake and use the IPv4 endpoint.
Similarly, if sending an encrypted packet elicits an ICMP error in
response (host or port unreachable), then we can initiate a new handshake
to test other endpoints.


## Extend Wireguard to perform measurements

Currently, Wireguard can already send traffic to a peer: persistent
keepalives.

There could be a new type of message ("ping" or "hearbeat" messages),
where Wireguard regularly solicits its peers through the encrypted
channel.  Wireguard could then use these messages to detect a connectivity
problem (packet loss) or a performance degradation (high RTT) towards a
peer, and try to use a new endpoint.


## Decision-making in userspace

An alternate solution is to use a userspace program to monitor
connectivity, and ask Wireguard to use a new endpoint if needed.  For
instance, a script could ping through the tunnel, and ask Wireguard to use
another random endpoint when it detects a problem.

A more elaborate solution would allow a userspace program to choose which
endpoint is used when sending a packet through Wireguard.  A daemon could
then use this feature to periodically ping the remote peer through the
tunnel using different endpoints, and based on the result, tell Wireguard
which endpoint it should use for the "regular" traffic.


References
==========

[WG] https://git.zx2c4.com/WireGuard/about/src/tools/wg.8
[HAPPYEYEBALLS] https://tools.ietf.org/html/rfc6555
[DYNDNS] https://lists.zx2c4.com/pipermail/wireguard/2017-January/000903.html

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhywAkACgkQvgHsIqBO
LkatnQ/+LWAQzoVTw3rzh9GIlVnJHKpGJn2ghDulZSjA7ASBcAKONRhZB+DLZb/4
hAeZ9fhXccizNbssFpsAL4O8iYC0b3p0LQlX+zpf4rHETZiH9CK7vb2yR+Ls0Xs8
LVsHBXszx6Eb8GN204TOs+hcR9tv/MAsPrUYL5hcoEBGKSL0W9uuLUcDCn7QM0Cy
2pEFDp2hDD15YPLJQ4SRxqDOUQrOWbcXmSpIqZRLBOanx6p+Abwolt+ox2we0BA6
Ltorfp9wEbe5DijH+YgIkVe2FF8frq69EJtwcMJKyVUcR2BEvx2+Us3fTEooPrFz
PbkdPu4GEnO0YjuRGGRZr1e/9fdaQn7f2BJuu9nAxrbId2xUJNORNo1WWc5JVv4s
ncG9zVYogOb7HlAWCYyz6pzBFj+S6i6Zm6Z8vhrE0ixTsebBId7sPmjAQDNrmTJ4
sKN1bXGzjC/bMdC4QO8rJpJ9nPEgNsJQr4Bz2u8h2vnjbril9nFEOW5dKK8uC31D
+fmh/uMva3OCF8PzG8SgA05AF1+4Ybv0uan3PPGGo/wLvbvcsKJ8fO4F8ZTxwOpr
KfYhtUa/GsqppBfLNLpLjE9Y/6WUh4eCV4iWHVzvJyZ7lAgtE2PkdpndIui3+Mgg
U8wEagIogcwce04vTgWXrspd2dIvElS6CYe3p6k2UGa0T9e8iUU=
=9JBB
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
