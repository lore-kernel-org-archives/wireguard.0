Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 369de031
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 13:04:33 +0000 (UTC)
Received: from phare.polynome.dn42 ([172.23.184.97]
 helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1c9Anu-0002UV-V1
 for wireguard@lists.zx2c4.com; Tue, 22 Nov 2016 14:08:07 +0100
Date: Tue, 22 Nov 2016 14:08:05 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20161122130805.GG20343@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Subject: [WireGuard] Pull-based peer configuration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Right now, the only method for configuring peers is "push-based",
i.e. using `wg` to push the public key and AllowedIPs for each peer to the
running wireguard instance.

I'm toying with the idea of a pull-based model, for instance storing peer
configuration in a Radius or SQL database.  But it seems like an
incredibly bad idea to integrate a Radius or SQL library inside the
kernel.

What about having a userspace daemon that wireguard can query from
kernelspace when a new peer connects?  Wireguard would basically ask "Is
this public key allowed to connect, and what are its AllowedIPs?".  The
daemon would then use whatever method it wants (flat file, SQL/Radius
database, LDAP=E2=80=A6) to determine whether the peer is allowed and its
configuration.

I guess it looks a bit like the IKE daemon in IPsec (though not exactly,
since wireguard handles rekeying itself), which I'm not sure is a good
sign :)

Baptiste

--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNEMwAAoJEL4B7CKgTi5GiTYP/AorAzM10Oq16bJoetG1v7LD
6x9jf/vbERLB+C4uNewxz+L4kytAdagmoIfL3o/fAVFPHRpTPM2axh66RRDRVd0B
QR/6jOliEabDBapBPpE9xRcAQ7qhqv4RNNDRW2S5UHDfz/rxnr1TyjMQWzEE3Y67
Tm0wFJ4CmF+qANDSRwnPrndXbDvcylI48ws7UX8VC25GdcZJV73cGD4576PjXgnt
nnxr7MtmODEl7MkVu3LRJF1aZxkuROcvbwSLNMtVqa2uSeddtr9y4zPKvj7fgFCs
57lTzSdURea1R8zkMxdKZlrI2aIiF08fXcJrSPH6o1rDLCLep3qAwID/kt7qESRn
FU/QpA3DTvEDjKAwwS2bcaSrjvsWgNc7K2nIwp/gFzaUU5RfOrpBFIXMjI/NUC6N
TCMraF93qNsHX/VJHpTXyOObDHJQIIX5GUUUNTUFQhvGVx50H4XFYOS51OWzoj0B
rAX1+6cW4jPJt+0rSr3kRIrNop0d/NAp2oHEvIEp7Y+GS56EqEMtisjN29XXu+ni
oT22s42XqCDqqydvJ8tcRFse15bTiMZrV7hAqWMirS1wy/WsZLNfN39zZ+9E/7YA
faICAQ2+h8TZwurlgL2VeMfz6yWwwSWI/f6JJrA6nxUW+oJ8oWS+9/dklKPhdBcS
gFq8MyTa9CeIKPb/SK1E
=f1MT
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--
