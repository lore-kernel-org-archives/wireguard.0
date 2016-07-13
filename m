Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59135fd9
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:56:50 +0000 (UTC)
Date: Wed, 13 Jul 2016 18:57:45 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Alex Xu <alex_y_xu@yahoo.ca>
Message-ID: <20160713165745.GB25457@lud.polynome.dn42>
References: <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
 <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
 <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
 <20160713083633.4c3c07f9.alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
In-Reply-To: <20160713083633.4c3c07f9.alex_y_xu@yahoo.ca>
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


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 08:36:33AM -0400, Alex Xu wrote:
> On Wed, 13 Jul 2016 10:28:17 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>=20
> > TunnelIPs ?
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > http://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
> I vote for ReceiveSubnets. I also support PeerSubnets. "CIDR" is also
> not too complex because you must know what CIDR is to set the option
> properly anyways.
>=20
> IMO the use of the term "VPN" should be avoided to cases where an
> actual private network is being used. Here, it is simply referring to
> the subnets on the other side.

Right, please mentally replace "VPN" by "Tunnel" in the propositions then.

> I also considered "RemoteSubnets", but that would seem to imply that
> that also affects the subnets that are *sent* in the wg tunnel, which
> AIUI is actually controlled by routing tables.

Actually, it does !  This dual usage brings more confusion.  Despite the
name, "AllowedIPs" controls both:

1) packets that are *received* from a peer (by looking at the source IP
   address after decrypting an incoming packet, and only allowing the
   packet if it matches an AllowedIPs rule for this peer)

2) packets that are *sent* through a wireguard interface, where the right
   peer is found by looking for a matching AllowedIPs entry (using the
   destination IP address of the packet, this time).  That's the
   "cryptokey routing" part.

So, the name should reflect this dual usage, which is difficult.

> For the record as well, the SWAN family of IPsec implementations calls
> a similar configuration option "rightsubnet", which is not terrible
> but applies poorly in this case, since (AIUI) that one actually
> configures the xfrm tables.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhnMJAAoJEL4B7CKgTi5GTtMP/R1nOvIlduZv+8GVhSFqFPWx
T7pBUQGeLNiSf0jnqVEk2UBbk5squTeQ63u8Uga0dSsbPdN/2wBXlYyZs2et8gSx
3iRHcShgtFVFrzXo755GhB3s9BLz6otx6oJrc8J3wQin4Zb0mBT6rsoqkZdu7uRJ
W8xxrjWCHMHY6AaKME38HQ1+zMUNoRQZnsy6h7EnwLZKEiwLSIfqWKaZxYQp6Rkv
f6ZXyAi5sTm9p+K9GivT8H7TqJouzjL1Hhl+WyLG+3bbWdWupf7aDcOkkJDO1X05
Jbaane2PoupVoNlyI8NU+27SlxI2/FOYYZQOvdPWmr+H3LBLs8QkWXG93Tg2npmS
7Jk8TaaeVLFitCahiQvMcPwO8Cv2UNnae0/qgqAbtcgwW5UWdA7Gg7JSLxAvxu0d
TdoKp1qdibMpRVVL9Vc7ffd76Sx3tauKDra3UPEPMp9L2gry0TydNSIXI1ix6WRx
a8F0Ux+7XrDuyjFidelemOzZplu3EK/pSm9/iVkAL4iKV+G4njKFxqPTLhT/Xzv5
jb5dnBuCye+RQ2MQ2O1/Xo93Qv3pA5ws3zyoclDX/wRV+0zCK2+uvtAFhTP1wCz1
Q+YB24FMneoeN/BiyyNSjovzdZFIlOYdOw1nHyyVaW6GCKgJeufALsQA57mtc/yJ
moT+ehXr1UBf9uapC6Lp
=19M7
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
