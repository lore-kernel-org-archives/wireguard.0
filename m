Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c477c8b2
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:51:03 +0000 (UTC)
Date: Wed, 13 Jul 2016 19:51:56 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Message-ID: <20160713175156.GA28141@lud.polynome.dn42>
References: <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
 <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
 <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
 <20160713083633.4c3c07f9.alex_y_xu@yahoo.ca>
 <20160713165745.GB25457@lud.polynome.dn42>
 <8737ndo2t2.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
In-Reply-To: <8737ndo2t2.fsf@alice.fifthhorseman.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 07:39:21PM +0200, Daniel Kahn Gillmor wrote:
> On Wed 2016-07-13 18:57:45 +0200, Baptiste Jonglez wrote:
> > Actually, it does !  This dual usage brings more confusion.  Despite the
> > name, "AllowedIPs" controls both:
> >
> > 1) packets that are *received* from a peer (by looking at the source IP
> >    address after decrypting an incoming packet, and only allowing the
> >    packet if it matches an AllowedIPs rule for this peer)
> >
> > 2) packets that are *sent* through a wireguard interface, where the rig=
ht
> >    peer is found by looking for a matching AllowedIPs entry (using the
> >    destination IP address of the packet, this time).  That's the
> >    "cryptokey routing" part.
>=20
> so if a given interface has two peers, their AllowedIPs (or whatever we
> end up calling it) are not permitted to overlap?

It's a longest-prefix-match on the destination IP address.  So, the
"AllowedIPs" for two peers can overlap, but then the most specific prefix
will win.  If two peers have the exact same AllowedIPs entry, then I'm not
sure what happens.

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhn+wAAoJEL4B7CKgTi5GzcwP/108Q4wgL0Eei3A+8uG0BCE0
aEoY3NmDcVdA+nfYftO71q73o1dlMn1kxGecsc8rPuJm4lBHlhV+/COaHYUYrjGS
ASTZhFleSyHcHBdofd8gy0erTUaS6nbxRrhsgPw8Wu110WUP0JGchfcnG3D+u9Vz
Tp90E13/JWpsR/31Dp04j0JRUXNLgXI8H2B7/tK3W81IOLNDuujeUP4O9UIoJckF
JzrkQ9zfoWvQGlMcwV+0ixvhikFIsIiFgxMTvrSjoNt1jxQXhbxijcfzhuVr4PbU
h66A6sF+4EqTMbMx7fNStf1O7I5tGTqtesa6Em28aA3Omx6EKA8b7Sc4dzZqwBw2
RHeL2daeG65muQWH/VVlc6TsoXmoQwgNTQsLH7j+iADRCzEHWCIvXiRWqxU/uVlb
SX4IU0VkhnLeqetx71jpLHUZmjjXm/YIL1sa3o/f/NaqmUwsM84K/6+NtHz7aFji
w9hSXB0RcdQ8xU3C118z/2hlIgjzwQZsZoNARL3wlX3cuUkLvgJQ8vHekxLSI4ac
1UyX65dPu1ifQ0mVwQmdqfQ2CF1hXr5FGVLPFQ8KpyhjcQHFCH0wEweQEhfLZpNq
DtEBOPYoXRvcUWZzSQGoBtSG+18GuIZSppl4K/CCcGex+JbN5DBA6lYyQ4/MD50Y
dPUyxmDsf+TXy1UhpHV6
=d+Ai
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
