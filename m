Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92f2c8e1
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 21:54:03 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d72f0b2
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 21:54:03 +0000 (UTC)
Date: Fri, 11 Aug 2017 00:16:06 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Multihomed server issue
Message-ID: <20170810221606.GC30478@lud>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
 <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
 <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
In-Reply-To: <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, Aug 10, 2017 at 04:29:54PM +0200, Jason A. Donenfeld wrote:
> 1. Packet from peer P arrives from src:A dst:B
> 2. WireGuard records that it should contact P at src:B dst:A
> 3. When sending an encrypted packet to P, it asks for which interface
> to use for src:B dst:A. The routing API returns interface I.
> 4. We ask whether interface I has an address B assigned to it. If yes,
> we transmit the packet as src:B dst:A using interface I, and return.
> If no, we move to step 5:
> 5. We ask which interface and src IP we should use for src:default
> dst:A. The routing API returns interface I' (which may be the same as
> I or perhaps not) and a default src address, B', for interface I'.
> 6. We transmit the packet as src:B' dst:A using interface I'.
>=20
> In the past, this has been sufficient for handling issues with
> multihomed servers, while still dealing gracefully with IP address
> changes.
>=20
> It seems like the problem you're facing is that B does not belong to
> I, because B belongs to an unrouted dummy0 interface. The solution
> would be to change the question of step 4 to instead ask if _any_
> interface contains B, not just the returned interface I. While this is
> essentially what's done for IPv6, I'm not certain this is the correct
> behavior for IPv4. Do you know of any relevant RFCs for your use of v4
> dummy interfaces and RTS routing? Or some other reference?

This is essentially a difference of weak vs. strong host model, see
https://tools.ietf.org/html/rfc1122#page-61

The RFC is quite clear:

    If the datagram is sent in response to a received datagram, the source
    address for the response SHOULD be the specific-destination address of
    the request.

However, a system with a strong host model would drop the incoming packets
in the first place, still from the RFC:

    A host MAY silently discard an incoming datagram whose destination
    address does not correspond to the physical interface through which it
    is received.

    A host MAY restrict itself to sending (non-source-routed) IP datagrams
    only through the physical interface that corresponds to the IP source
    address of the datagrams.

But Linux has adopted the weak host model, see for instance the documentati=
on
for "arp_filter" and "arp_announce" in Documentation/networking/ip-sysctl.t=
xt.

So I think your proposed change makes sense, you should use the
destination address of the request as source address, even if this address
is not assigned to the outgoing interface.

Baptiste

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlmM2x0ACgkQvgHsIqBO
LkZEHA//fz8xApGgM35TGG7DjVgw2zvy2CLN7V+qQ9PY2G1PJUZ0zyz4HxhjQpVk
VTrfVoGDoOfbQ0ANlvpxWZmnDyRDTaFuTHptchGmmYz0Q3bx6tZ/rEkxOUX7az74
dtlfIDLsuyjYKa23jXQGN4kYx0kdR80hsOdG4BKfHOrN+jU6i33xqNtnqkX/JoAk
+3H7KHen2kVGNiuz+v7Uuw813dj0Jx/PJz9shboTDSmUW0DHv+TfLKey/vaBNLAH
pnaXMOA1I/F5j4U03WoG+aaToCShUw+3xPo2n9pktqMtS23x4G9t+MnGsoRcUDub
KBJ7t6gy4cQ8g39Oelu1dDbQ8KHxJIHu8ZF+tg6chQVncBz5slU6nh5VrfrLD3uZ
NA4T0PeZtvu6RvpXg/+UhjS4TQCc/6YIhov92oG83RrIzFBrYDnqOV1b8D/6k3Vb
iC81PPCgqCsPuciyrN5iQ/ErEZ7eK2omuWQLYDXN0GdhiBjZ5IFmT6XkmC4l+565
LuH1Z2fBYyKWqpIMw3z2WBnsW4+CBaevPDJ2RTfoqV8tdcAOoWYICQGyJvCofDGD
hr2ZUFdjvkUX2uYmdQaNPub79XphlznkNlux7NBWp9TaaHpxYYWR16xlozl18FWl
vkqktABseUWT3DenR6aBM1cCWHbXbZy84drz72CkUfqfomReM20=
=elrj
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--
