Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 492ec629
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 14:03:21 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6c97345
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 14:03:21 +0000 (UTC)
Date: Mon, 17 Apr 2017 16:11:07 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
Message-ID: <20170417141107.GA10609@tuxmachine.polynome.dn42>
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
In-Reply-To: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
Cc: Juliusz Chroboczek <jch@irif.fr>,
 Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

On Fri, Apr 07, 2017 at 04:02:49PM +0200, Jason A. Donenfeld wrote:
> Various networking people have been poking and prodding about
> supporting IPv6 Link Local addresses and about supporting special
> multicast addresses. *I MAY VERY WELL NEVER CHOOSE TO IMPLEMENT THIS*
> but in case I do, I wanted to start spec'ing out what this might look
> like in order to think about it better. There are a lot of odd
> concerns to take into account, so I doubt that the below will wind up
> as a final solution.

This is good news!  I can't wait to see Babel running on a wireguard
interface with several peers, or even what OSPF would look like on such a
network.

That being said, for the purpose of a routing protocol like Babel, I think
it still makes more sense to use only *point-to-point* wireguard links.
Link-local and multicast communication solves the problem of discovering
remote routing daemon, but the AllowedIPs list is still static, which does
not make sense for a routing protocol.  With point-to-point links, you can
bypass this limitation by simply setting AllowedIPs to ::/0.  Of course,
once we have dynamic AllowedIPs, this will change :)

Regarding the current consensus about link-local and multicast:

1) link-local:

> This command fails and returns -ENOTUNIQ if two existing peers have
> the same value of hash(pubkey). When this command succeeds:, the wg0
> interface receives an automatically assigned IP address of
> fe80::hash(interfacepubkey)/64. Every peer has
> fe80::hash(peerpubkey)/128 implicitly added to their allowed-ips. When
> adding a new peer, if hash(pubkey) is the same value of an existing
> peer, the command fails and returns -ENOTUNIQ.

This looks like a very good idea, and I think it should be enabled by
default.  What would be the cost of doing this, except for the risk of
collision?  If I'm not mistaken, you would have a high chance of collision
starting with around 2**32 peers (see [1]).

2) multicast:

I agree that George's solution (no implicit multicast AllowedIPs, and
AllowedIPs in a multicast range have a "cloning" semantic instead of the
usual "moving" semantic) is clean.

There is just the minor issue of subnets that encompass both unicast and
multicast addresses, the simplest one being ::/0.  Such subnets could be
automatically split by wireguard, or just have the "moving" semantic of
unicast subnets.  With this last option, a user would have to explicitly
add a subnet which is *within* a multicast prefix to trigger the "cloning"
semantic.

Another idea could be to add ff02::1/128 (the all-nodes multicast address)
by default to every peer.  This would allow to nicely discover the
link-local address and RTT of neighbouring peers by simply running:

  $ ping -6 -L -I wg0 ff02::1
  PING ff02::1(ff02::1) from fe80::XXX%wg0 wg0: 56 data bytes
  64 bytes from fe80::YYY%wg0: icmp_seq=1 ttl=64 time=0.459 ms
  64 bytes from fe80::ZZZ%wg0: icmp_seq=1 ttl=64 time=0.692 ms (DUP!)

However, it would be another special case in Wireguard, and some people
might want to disable this behaviour if it's enabled by default.

Baptiste

[1] https://en.wikipedia.org/wiki/Birthday_problem#Probability_table

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlj0zO4ACgkQvgHsIqBO
LkYLsg//fp+KPOZ/QSxOVDnCzCD85ptkP/1f2Abg85CnRun6tq+swxxEKEE9/YjZ
aq/fxVwqckss5XsbkFBVoArdxjgXPwH0Ii+RXlME2DU1mvp6xYZNBfuGeoPWapH5
QfD6La/I+0JNZ54Aima6mCr318hmbCpRJzJEX2Mkk1bhg8hMIL9Bxck8WTmL8jGF
Y2g4Ri58BGCOGUOWg/pkR6yJcTdbTnBlzZx3sy4XHFtkUGKXqSZpQDJ8gOUnPklY
blRWK++GrQn1cBalu0UVMeqQaaUIee0wHwGkFv4s5STUn+xY1FaUgWrj5DhdbVzU
LJbjxINtDKWwAO1F0tg1jNrBj3QPPUD+GXj1yDhcJYcJU2lsXo7x286wpX5n+cpU
HZ8FxOwTxQRrZA+R7k1xYxjiF0xEyK+JtqesYCeGaHbC2MpNlyCGE/Q+hb5DA/Vb
EnxjgsiCrjLhZ1DjygKhEj6AR32G4M6UZxMsSM50lrd9Nokl00uj6ca+qV7ceguK
DAu32ZoBPTPmAJ48S1DP8ilQ8qUQG92F5qNB66powSUN+IKtFgpuS+2oi6edxkJe
xIeBMfF8WmGwgSEV7PJDv05wCxqNfVxccGtzCoBchPx66UlD+5tDoeiD3w1Gtogp
VGnyI8dk0CKVWTLlTSh7sU0e0Z63qeeYFuHOTDnq4vIT5bfhUPQ=
=p+sA
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
