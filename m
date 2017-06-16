Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e26a5de5
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 02:27:37 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4f069cf
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 02:27:37 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Oliver Beattie <oliver@monzo.com>, wireguard@lists.zx2c4.com
Subject: Re: Git tags
In-Reply-To: <CAA9f-OfbUrvM5PgL-ZHMCzDJuX9Vcoc84TJkK9yU7DGK7Tf2xw@mail.gmail.com>
References: <CAA9f-OfbUrvM5PgL-ZHMCzDJuX9Vcoc84TJkK9yU7DGK7Tf2xw@mail.gmail.com>
Date: Thu, 15 Jun 2017 21:14:29 -0400
Message-ID: <87a858n37u.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Thu 2017-06-15 18:07:17 -0700, Oliver Beattie wrote:
> I have noticed that when a new snapshot is released, it is tagged in
> the Git repository, and an old tag is typically removed. While I
> understand Wireguard is considered experimental, this is quite
> frustrating as a user of the project.

Huh, i hadn't noticed that older tags had been removed in the canonical
upstream git repo, i agree that's unusual and rather strange.

> Given tags in Git are extremely lightweight, would it be unreasonable
> to keep them around?

The repository where i record debian packaging changes includes a full
copy of the upstream repo (at least as far as what's been packaged) and
that naturally includes the older tags as well:

    https://anonscm.debian.org/git/collab-maint/wireguard.git/refs/tags

You're always welcome to pull the tags from there (the upstream takgs
should all be cryptographically signed by Jason, so you can verify
authenticity even if the network source is different).

regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAllDMPUACgkQFJitxsGS
Mjc1Gw/9EBbT7UOPw/a7WMb1Ffi5ifjNIMO19oQWr9yPTbmoWFK1gJ+aIvoaJJXI
Qud9bxB/5GTStiDAFUDpQDVdbZj7i/Cq+6JRpMSePEbiUG2AoR3zxYsJUY7LDtpa
Z/WwRTFF4jpN0QzYVkKQrTykB1nWq7+Swov+c1DtSn3ytotUSZ2zlCaDF9R4OqQX
QJCh8x++GrvaRdJ656G5SlubUj5n4ysHMLVkbxQD+S7kd4uQ8Or62KLmyyj4rw2/
ZrnzeJMo2MslEnE2hbZuqvUz92sUyJANtbmrZ4DR+tKbq7dszILvNOYQ+GiP0UMo
h8hZSDa6BggS3UbZyrXp5BUdJ2xEkGRmK3RBxCJetJDMr8eIxB1002un8ripwe0J
CjIyNWdNke0QS5bobBk6H2ooAaR0YSFXWTWtnALBAtJEXsiPUFPNIwM81FXPyn/b
NQPBD7q1l5mAgTVcqj5ttZ2i7T3PDkhMrKiFT9XFV7DfMB0u/bvAG4vkDUgaPwoY
z2IWMmcsqaZyUWHPBvdRYBy7BUepelSU4xso24c65Ek8y2UmQor2lze37PuwAgTF
Mg7SP6f09nSo2UgmDBecqm1klL2M7AuYkSRG5VShL7oCeJJrVSeq26eqLrR7IhYf
JiWjitdsRFPl/uzn5xfk4HWfURLex8kFRC54cRTajN0ifcjm1QY=
=e1+y
-----END PGP SIGNATURE-----
--=-=-=--
