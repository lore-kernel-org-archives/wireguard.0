Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26cd9e79
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 16:02:51 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bbd9b18
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 16:02:51 +0000 (UTC)
Date: Wed, 8 Mar 2017 17:05:29 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Stuart Cardall <developer@it-offshore.co.uk>
Subject: Release monitoring (Was: Wireguard added to Alpine Linux)
Message-ID: <20170308160529.GB21799@tuxmachine.polynome.dn42>
References: <6b590394-3134-b725-a063-0993b32a51c4@it-offshore.co.uk>
 <CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com>
 <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
In-Reply-To: <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stuart,

On Thu, Mar 02, 2017 at 09:49:53PM +0000, Stuart Cardall wrote:
> To monitor releases @ Alpine we use https://release-monitoring.org/ - if
> it doesn't pick up the changes I'll subscribe.

Thanks for mentioning this, it's a nice tool!  I started using it for
other projects.  By the way, receiving notification emails is non-obvious:
you have to register on https://apps.fedoraproject.org/notifications and
add a filter that matches the upstream projects you are interested in.

I just added wireguard [1], the monitoring system is configured to scrape
https://git.zx2c4.com/WireGuard/ and look for "WireGuard-([\d\.]*).tar.xz"
to extract a version number.

Baptiste

[1] https://release-monitoring.org/project/13481/

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAljAK8gACgkQvgHsIqBO
LkZh+A/+PWoEBlco5+u++TNG0f1HeJOldSFvgp7DOEczeDsq5cljShBbsONKOYpM
rKUgkRnfYpKTwLqF1kWupMcJuHm4XqEeb5bEFPHl3IQzU+czhubocDvFpnHtXOiS
DWZHfyRmKdhfwDfwDKLW0RPiV+t5tt9xNDNIyO3DAFszOCix9BLHO6vzx7EQwngM
wZci2crmKuv+l+DhitSMVEMDW7pUAqO7Tx4dhhxXrhnw3kv2mLI88PXITQf0xNmV
S+wrpdnHxrQImsSGuS+S8SzImKexqx9j5AtjdxDnXedYjelqqEruirJZdjWssjPQ
ltHQ9qOXy4sZ3oF3fhDTXnnnbw4IDBEFsUCzNAcqaMa+qhcvQ04hjTdqG/xNLG6H
1kI5jFx9dMy6eFnfzYfQIaLFfWdAHzgH39/uRWZqnRaFby6klLi/5voxQbYsfwuD
UgG6iTENMZ8pbV6ljTRQ9iMcvFNNDfZK0XSHrHrXMKWnjHw8nKGYrc9Pnf38NfOr
kjy9EjLfzc5NiecgEExNjwB4To1TsnOuN4diDOuCalX1oL+JvV8d74YgK50f8yCz
X2c0sv9HgS65QNzAavw3Kk/GUHYquN6hYVic/07VxgzPdBCEsaCtKxaF7FVRzJVT
GXSjWDsomU4SC/K5cRDLKB+ni+cqTPEDaMTicA/Ji0p0oaW9CZA=
=7Zob
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
