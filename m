Return-Path: guus@tinc-vpn.org
Received: from arianus.sliepen.org (arianus.sliepen.org [92.243.30.131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85c5e02f
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 15:17:53 +0000 (UTC)
Received: from sliepen.org (unknown [10.1.1.1])
 by arianus.sliepen.org (Postfix) with ESMTP id A142326504
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 17:19:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sliepen.org (Postfix) with ESMTP id 57D5822005D
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 17:19:03 +0200 (CEST)
Date: Fri, 15 Jul 2016 17:19:03 +0200
From: Guus Sliepen <guus@tinc-vpn.org>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <20160715151903.GN3939@sliepen.org>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
 <20160714105500.GT3952@sliepen.org>
 <CAHmME9pVwcxZS1NaH2=7c=hpiUqbSWDC6rZL0iLLyr50+TZQyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hNG1vEeyG8BCaHbQ"
In-Reply-To: <CAHmME9pVwcxZS1NaH2=7c=hpiUqbSWDC6rZL0iLLyr50+TZQyw@mail.gmail.com>
Subject: Re: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--hNG1vEeyG8BCaHbQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 02:07:54PM +0200, Jason A. Donenfeld wrote:

> > A zero-length UDP packet should be fine, although it might upset some
> > OSes or firewalls.
>=20
> In fact, we wound up switching to an encrypted keepalive, so that it
> would work nicely with roaming and endpoint discovery. Now, setting
> persistent-keepalive mode on will ensure that wireguard remains
> "connected", while its default is to "go to sleep".

Great!

> > Discovering the PMTU between two peers and enforcing this inside the
> > tunnel helps prevent fragmentation of the outer UDP packets. This
> > improves performance and sometimes it's just necessary because there are
> > firewalls out there that block fragments.
>=20
> Doesn't the Linux kernel already support PMTU discovery with the usual
> ICMP notifications, unless you turn it off with the sysctl nob? Have
> you experimented at all with how this discovery trickles down to tinc?
> I wonder if, since I'm inside the kernel, I'd have an even closer way
> of integrating with the already existing mechanisms.

The kernel does a limitted form of PMTU discovery. It assumes the PMTU
is the same as the local network interface's MTU. When the real PMTU is
smaller, its only form of discovery is by receiving ICMP Fragmentation
needed/Packet too big messages from somewhere along the path. It can be
that these ICMP packets are blocked by firewalls along the return path.

If it receives those ICMP packets, then the next time it sends a packet
to the peer with the Don't Fragment bit set, and the packet is bigger
than the PMTU, the send() call will fail, and then you have to do some
other query to find out what the current idea of the PMTU is. Doing this
in the kernel is probably easier than in userspace, where there is no
easy, cross-platform way to get the PMTU for a given destination from an
unconnected UDP socket.

So when the send() call fails because of the PMTU, you have to generate
your own ICMP Fragmentation needed/Packet too big packet inside the
tunnel.

If you don't receive ICMP packets telling you your packets are too big,
then you have a problem. The kernel doesn't do any kind of proactive
PMTU discovery, it only reacts to those ICMP packets. What typically
happens is that if you make a TCP connection via your VPN, the initial
connection works, and as long as you don't send a lot of data at a time,
it keeps working. But as soon as you send a lot of data, the packets
will be larger than the PMTU and they get dropped without notice. The
connection then hangs indefinitely. Typically, if you log in to a remote
machine via SSH over the VPN, the connection works, and you get a login
prompt. Some commands work fine, but if you do for example "ls -lR
/usr", it will hang.

If you don't set the DF bit on the outer UDP packets, then things work
fine until you have a firewall blocking fragments along the way.

I gave a talk about this at FOSDEM in 2010:

https://tinc-vpn.org/presentations/fosdem-2010/tinc_fosdem2010_slides.pdf

I don't know what WireGuard should do. Do you want it to be very robust
or a low-level thing that people might need to tweak (ie, setting the
MTU of the wireguard interface manually)? I think the best solution is
that you keep the kernel code as simple as possible, and have a
userspace daemon take over tasks that don't require high performance. I
believe it is only necessary to have the kernel handle packets from
known, already authenticated peers. Everything it cannot handle, have
the userspace daemon deal with.

This daemon could then also do proactive PMTU discovery between peers.
Basically, tinc does this at the start of a connection by regularly
sending packets with a random size between (lower_pmtu, upper_pmtu),
where lower_pmtu is the biggest packet that has succesfully been sent
and received, and upper_pmtu starts at the interface MTU, and is lowered
whenever an ICMP Fragmention needed/Packet too big packet is received,
until the lower and upper bounds converge or a timeout occurs (after
which the lower_pmtu is used as the actual PMTU).

> In practice, have you seen any devices that are worse than 30 seconds?
> That's about the lowest I saw.

Yes; several people have reported issues with UDP connectivity, and upon
closer inspection the culprit was a NAT or stateful firewall that had a
timeout of less than 30 seconds. A heartbeat interval of 10 seconds
worked, whereas longer intervals resulted in lost UDP mappings.

I've also personally had a broadband router that did have very
reasonable timeouts, but it could only remember a very small amount of
mappings. As soon as you started something that created lots of
connections (say, a torrent), it would cause it to lose other mappings
that did not have regular traffic.

--=20
Met vriendelijke groet / with kind regards,
     Guus Sliepen <guus@tinc-vpn.org>

--hNG1vEeyG8BCaHbQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXiP7nAAoJED9JDeuHHvn6ZoUP/0LNTKCLmVz97uqwDASxN4kn
NWi+YN5qEWkNEmjEsQODBDhZ/03LxHyVAA5cY749mvVxZU1aB1mFzYS80/R4R9Bz
VLfN8zsRYijpdvJwupbuJD/Aw0NogR6OaYKCeIx/WecS+VOI4Uq0am0FyCuaK01r
7JLI428uTx9KfMbglWwKm3JNDzd/6l9TG+jghvwtmkfr/TJZK2rnZOQJ0ZTb0Oax
4WougXSOg6plPStw3qu2Bdudxlpjkc8/6umq5KGAZLbLtZWRuisSBE4O6ziLdYw8
vk57LsiXAtYkRr09WaXNPxu0vWoD8qFMH6sFXhB23nxJp8HC0VqHCWAEYKpsTaB6
7fDj80bryzwUYmCKNumE9UqmKo+sYDdw+QozuNLzERbR+MLuzNz+76SsZCi9K7bM
EzwyPDAOp+BhAxsSiDA9IoFLbuFBpRaxUjnT1sR+QaLm9Zuk9JuHDqNnZso+vLIE
mSt1BiuoyZ1VpwNHtlbmFAY40btL2NI/DyxinvLcQk/Nm1m1hU/ZhJ3cN54cRTDR
ovYKml93sj/KwErBDgQBb1O+k0f5uG6is6dk7ETNifOi55DbzkByviCEjpXONP0N
p1TYiADP9I5I+qkxTgLppRFouKE8QsSIvTmKMQRSbdMBpjr3fokecVgEFBm2vEu9
aPTvGQZjgxHVwqSNQPKX
=NJxc
-----END PGP SIGNATURE-----

--hNG1vEeyG8BCaHbQ--
