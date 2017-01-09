Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3583a00d
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 11:26:12 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 294e78f4
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 11:26:11 +0000 (UTC)
Date: Mon, 9 Jan 2017 12:35:44 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Varying source address and stateful firewalls (Was: Multiple
 Endpoints)
Message-ID: <20170109113544.GB4526@lud.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
 <20170108225732.GC9445@tuxmachine.polynome.dn42>
 <CAHmME9pSJ3gsAUdNhk_Lt-QzOf6+eS=cay_Chq8YpdcaZJbCsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
In-Reply-To: <CAHmME9pSJ3gsAUdNhk_Lt-QzOf6+eS=cay_Chq8YpdcaZJbCsA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2017 at 12:00:17AM +0100, Jason A. Donenfeld wrote:
> > I merely pointed out that a stateful firewall is similar to a symmetric
> > NAT, that is, both would cause issue with peer roaming.
>=20
> Are you sure about this for UDP? I did a bunch of tests several months
> ago, and was able to punch holes in a variety of stateful firewalls
> with changing remote IPs.

I must admit I had never tested :)

I just did, though, and yes, the stateful firewall from Linux does block
UDP traffic from unrelated source IP addresses.  So I guess your hole
punching was based on some other property.

Here is the setup with 3 computers A, B, C.  There is a stateful firewall
on A, and A opens a UDP connection towards B.  C then tries to pretend to
be B and contacts A with the same src/dest port.

    A# iptables -F INPUT
    A# iptables -A INPUT -p udp -m conntrack --ctstate ESTABLISHED -j LOG -=
-log-prefix=3D"established: "
    A# iptables -A INPUT -p udp -m conntrack --ctstate RELATED -j LOG --log=
-prefix=3D"related: "
    A# iptables -A INPUT -p udp -m conntrack --ctstate RELATED,ESTABLISHED =
-j ACCEPT
    A# iptables -A INPUT -p udp -j LOG --log-prefix=3D"drop: "
    A# iptables -A INPUT -p udp -j DROP

A and B communicate normally:

    B# nc -l -u -p 5001
    A# nc -u -p 60000 $IP_B 5001
    A# #type something
    B# #type something else

At this point, there is an entry in the conntrack table of A:

    A# conntrack -L | grep $IP_B
    udp      17 22 src=3D$IP_A dst=3D$IP_B sport=3D60000 dport=3D5001 src=
=3D$IP_B dst=3D$IP_A sport=3D5001 dport=3D60000 mark=3D0 use=3D1

Also, the packet from B to A has been logged by our firewall rules:

    kernel: established: IN=3Dwlan0 OUT=3D SRC=3D$IP_B DST=3D$IP_A LEN=3D33=
 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D43432 DF PROTO=3DUDP SPT=3D5001 DPT=
=3D60000 LEN=3D13

Now C tries to chime in, contacting A and pretending to be B:

    C# nc -u -p 5001 $IP_A 60000

The result:

    kernel: drop: IN=3Dwlan0 OUT=3D SRC=3D$IP_C DST=3D$IP_A LEN=3D34 TOS=3D=
0x00 PREC=3D0x00 TTL=3D64 ID=3D43124 DF PROTO=3DUDP SPT=3D5001 DPT=3D60000 =
LEN=3D14

So, the packet from C is dropped, even though it has the same source port
and destination port as the ones from B.

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhzdYcACgkQvgHsIqBO
Lkbh2xAAu+T2s0pldMiuZLizBWYp6ttFCU+d8XG3rrvg9DFxo/7NjZRZNbsc9Zuc
TOAUv531RSiDzby0qHKTN+sgO8X68DOu/6P49T4gvsfM/QbGbqiHHO0B6Fa5lXF/
hTnp0YUfQHAs3NvuA2FpC5rVoflNAI9zYInf42pzFTV0/Go07Jz9n2ku9MGn3O5q
+lkqz6cKEZCC924af4EZLElnjgOTMq0GvwZChljbF2WEmcvkdkFdPMi2PeD+FsBd
e0kRf6aNhmaZBDhsQUDEUv73yHiqT6AjL663gYm8o/+lYKrl7qW4x4AU/LLloJ8L
d2IwMYnYVOr0NDw4etGfZf0m5ZLYSE5W/5V8No6WaRGfYkkQm4lS4kA/EhuHBXp9
eLyz8VMI2E1CLv/B9JnZOqK5LWhkNc/vhQyJpTZR45VMNlCHJhh0a1mmEW+HhMcD
6kfbiNinDwim2L6Rd7DLGbl0IJg0g48qbyh/JoHzyePiNBZUHsiWIEEokHeFJ/fH
dXxMF6Gvyf4g2u78g1Agb9+wRCYyPevGLMbg2uMDDu5W6qPEz4TY7LECaGQQzFmI
BHZm5BMonaxpK1PzUSR/qGU4EtCKY8mC8WIeA6pU0+K13yZAfTE2inbBtpPM4MtX
/0GtYpEJTa7q0KNXnMCRp+EzsxyKNKQSCvhqywVfi4l6EMQLvOM=
=vqXS
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
