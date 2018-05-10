Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42afc135
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:19:31 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b38976a
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:19:31 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fGhln-0004bC-DP
 for wireguard@lists.zx2c4.com; Thu, 10 May 2018 11:21:52 +0200
To: wireguard@lists.zx2c4.com
From: Matthias Urlichs <matthias@urlichs.de>
Subject: WG load balancing?
Message-ID: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
Date: Thu, 10 May 2018 11:21:44 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="AoMV00iayclFbhbwwW3LrIrAENXRfzD1F"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AoMV00iayclFbhbwwW3LrIrAENXRfzD1F
Content-Type: multipart/mixed; boundary="IMVusAq4rt3rIP2onTxkOb4AItTtI7SuX";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
Subject: WG load balancing?

--IMVusAq4rt3rIP2onTxkOb4AItTtI7SuX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

Hello list,

Assume a branch office with two uplinks to the Internet that wants to
use WG to talk to the main office, using both of these uplinks in
parallel (assuming they're both up) for better uplink speed (and for
redundancy if they aren't). Now the obvious idea is to create two WG
interfaces on each side, and add a couple of firewall rules to make sure
that packets fwmarked 1 go out on the first uplink, and so on.

That's the easy part. The hard part is how to teach the kernel to load
balance its default route between the WG interfaces. I tried to use a
libteam or bonding interface to tie them together, but apparently WG
isn't Ethernet, so that doesn't work.

I thought about using a GRE tunnel, but tunnels have fixed endpoint
addresses =E2=80=93 somehow I don't think it'd be a good idea to create t=
wo
wireguard interfaces with the same IP address =E2=80=A6 and I don't reall=
y want
to do heavy-handed address mangling on every packet. Losing all
connectivity whenever I happen to flush my firewall tables doesn't
appeal to me.

Ideally I would like the kernel's wireguard interfaces to be compatible
with teaming =E2=80=A6 any takers?

--=20
-- Matthias Urlichs



--IMVusAq4rt3rIP2onTxkOb4AItTtI7SuX--

--AoMV00iayclFbhbwwW3LrIrAENXRfzD1F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEr9eXgvO67AILKKGfcs+OXiW0wpMFAlr0DykACgkQcs+OXiW0
wpPZ1RAAht2JjDnlhzKCUlc47VZA2RnJMiPLrXTi9JfQI/tH809RuUfmHal4LKvh
k8h4EMIy3LAy4RSSF4UYHEFtg9HIwS1eUDwpCMAcGbvc+T+8/xEtpzzer4rZNoOi
Q2qsYvVDju2GtmSnKqONbjLfloekkwSBBkxfIlDOErZGjKmZR/GcUO6qgDx1e7pa
NOnXdO6J7O8XvRWpRRj8mPmASrCRz252qDOj9mB+r3QGBMRjcoPC7oIQfZvlyqAJ
GB3d3JK0vV60DYJPKnJuJYlaptRu2GKN2DlJ7qItxhEZVj1eurr/R3DWmtoqMr/o
8vgmNeTd0/NZppPm3z8my9XHSwvMla1UwvqHUz+ZL21YPFXCJqcvKlx4UMDHbQzW
14r3qkuvWrzyQ54Jq1zA1oJ1OxAkIYDIQxJDX/CCAHd+7IsYmL83xq44cZyxwvCK
FW4hG0ROVOhdPg5U3NoFXmw3sy8+8HyVjYNaau6G2KCQENALKIwDjm+/6Mn0JRbp
gJ65M0RZsuN94+HAH0oIGgWCcO7FjHx1AbeHHxqiF4R4wVh1dufLhm+qL4OSJfeY
sTp6I+twSl4XBfLRvOFUqRea++mxgjXzNjnElgNeMIwVik4tnXZioe2+jgQ+axRH
szfI3OqaU4TRgirNiaTzkgdter3eZSwRNzqYJ8qFItR98HEZj74=
=CwsY
-----END PGP SIGNATURE-----

--AoMV00iayclFbhbwwW3LrIrAENXRfzD1F--
