Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5e1d6db
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 09:30:13 +0000 (UTC)
Date: Fri, 22 Jul 2016 11:32:11 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Bruno Wolff III <bruno@wolff.to>
Message-ID: <20160722093211.GA12311@lud.polynome.dn42>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
In-Reply-To: <20160722090913.GA8383@wolff.to>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2016 at 04:09:13AM -0500, Bruno Wolff III wrote:
> On Fri, Jul 22, 2016 at 10:18:21 +0200,
>  Baptiste Jonglez <baptiste@bitsofnetworks.org> wrote:
> >
> >Yes, the notion of "immediate next destinaton" does not make sense for
> >Wireguard.  It encapsulates plain IP, not Ethernet.
>=20
> I thought that the next IP address might have been available for wireguard
> to see as the information seems to be available for routing. But as you
> mention below and I realized, that doesn't help with the return packets
> since they can have (almost) any source address.
>=20
> >You need "allowed ips 0.0.0.0/0" here.  Your situation is just a regular
> >client/server tunneling setup, there's nothing special about "proxying",
> >whatever that means.
>=20
> Yeah I realized that when thinking about this some more. "Proxy" in this
> case means source nat will be used on the outgoing packets.

Ok, excellent!  Wireguard really doesn't care or even know about the
source NAT you may apply on the server (well, at least when thinking about
it at a high level).

If you had used a public IP addresses on the client side (instead of
192.168.7.2), and simply forwarded packets on the server without applying
any NAT, it would be exactly the same from the perspective of Wireguard.

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXkegXAAoJEL4B7CKgTi5GZxMP/A/auqdnOmFZclhfUhvhS/Y7
lzj2eIu0zvgSOWLik9rNwgvmsWkrw4Aerm05Lvdaz4Tg9GviJ8S/H7QMtAfHb38m
w9Nsfk7iIanre2bRPIyQ3sEfneV1FIWuJryb2vb78buR+L4H93Nn0nqU+Cx66jCW
7hF0g0KHwC8y9I0zCtEvcf9IZ0J9SnVMs06ZIF2g42GP8N/jvioikZ2LB8qtq41V
OHATm5Dk/w+gSq7pmZ+IueDqjYFT2EPIGjZ9hhSjDxg0te/IFi+lD8dFAG9nbH/f
6IcXhao+l/EmPAJObmW5vbN6X81cTrFutYh3i3pHUX4FBtOQV0zwQYeW9u199lU8
k5jyzj7VTCx6NXd7uvhB/v1TY2FA0+nJ2V2fmOZ7VYcGLgveVWetrk42PbBr7Pwh
neOeZQ3nQg2tN92G1FUXNqCSov8FKze+JmDbTiinvf82Hk8m0NOXBONsRAMT+B9Q
vnqtbUkwBnnCRWZfeRd9As90JLP96wn3b4x2z/wK6OmXRoQfkx+7JSWxT+JUTYNR
yhLwDTtGr98GRzIqlo5mPWPdFeIChHcf2xmfO2KoNl/WOQVmGFulqkGrMNkb/20t
HglWUvRO3DELX0MKBH/g4uSiOPkP1/sYkCUgLGZtR2A/Ux0RfdQfmtFFkOdy6dc0
g+aoDxtDY1L289tjsbnt
=1f3d
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
