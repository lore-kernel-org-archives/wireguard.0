Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4c3aeac
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 13:58:50 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3117280e
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 13:58:50 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fo86H-0004Os-4m
 for wireguard@lists.zx2c4.com; Fri, 10 Aug 2018 16:09:09 +0200
Subject: Re: Reflections on WireGuard Design Goals
To: wireguard@lists.zx2c4.com
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <6dfa58da-c733-e08d-c4e4-7ddfd6511e71@urlichs.de>
Date: Fri, 10 Aug 2018 16:09:04 +0200
MIME-Version: 1.0
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="0Gy4Af1k1dGk9LQG5zSzFSkt9IxDWISHp"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0Gy4Af1k1dGk9LQG5zSzFSkt9IxDWISHp
Content-Type: multipart/mixed; boundary="OnBckDPQzUKxbaDk3uYdtFC31yIVI9hnC";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <6dfa58da-c733-e08d-c4e4-7ddfd6511e71@urlichs.de>
Subject: Re: Reflections on WireGuard Design Goals
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>

--OnBckDPQzUKxbaDk3uYdtFC31yIVI9hnC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

On 10.08.2018 15:35, Brian Candler wrote:
> Whilst I appreciate that wireguard is symmetrical, a common use case
> is to have remote "clients" with a central "office".=C2=A0 I'm thinking=

> about a hook whereby the "office" side could request extra
> authentication when required - e.g. if it sees a connection from a
> wireguard public key which has been idle for more than a configurable
> amount of time, then it sends a challenge which requires (e.g.) a
> Yubikey to complete.=C2=A0 I appreciate that it's not going to be
> straightforward, requiring the kernel module to talk to userland
> components at both ends.=20

It's reasonably easy to add that as a service on top of Wireguard, once
you have an authenticated connection. The office can easily talk to an
app on the mobile device when it notices a re-awakened stale connection
(triggered by a firewall logging rule, for instance), exchange whatever
crypto it requires, and only then allow packets other than those
required for authenticating to flow through the interface (another
simple firewall rule change).

Adding a feature like this to the WG kernel itself would not be any more
secure (and indeed add a significant amount of complexity which may
exhibit exploitable bugs). It would also unnecessarily enshrine a
particular 2FA scheme into wireguard.

--=20
-- Matthias Urlichs



--OnBckDPQzUKxbaDk3uYdtFC31yIVI9hnC--

--0Gy4Af1k1dGk9LQG5zSzFSkt9IxDWISHp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEr9eXgvO67AILKKGfcs+OXiW0wpMFAlttnIAACgkQcs+OXiW0
wpNxYRAA0VPUNKW/bAjDNxWARxMk+viCNKy/EPA+C0cvcaM8X68tpFYEM0+cLC5w
B4MSrz7oSGNnaqusGZfPAIoK8Zi43jj93oBNcbMFY33O/KfyI0S14XHr1aAM8oE1
NMTFLXxIGE0ny4+UXSSfRY5EvNrA/szjGMJO9RhXbJs9Pd3rjL6nZKV2RLjTSjFa
un8JgZyAmb9r0qnoNLY/RA8iJao8xHV3YhP5g2MKmuKzVYCyGAOcvx8UBByFP6ql
oN59Kc4Y+3W3cXOzwbd/tBz669UbChDuHifAfZR85wi6NqjYN6cZdzPrqVZ6Mlx2
1nNwoP6yzBpGG6aPf9mLJXhSh181/H81WtmRqXH0HhgvDljRt1+v0mleSiGY5cce
EzeTBgTEtPhriNSVrxdfVyLbQd3Z+pWSvvQz8PlOC5yntm/51Ypt+pHxxQdP9e5N
vwLA9dEiQiJyn46iBS4s26XciKz37+4vzcMsiyoQEoz8ZEv9eaOMYwhm2YWcit/M
Q9S0IAdkTg9akT1qX7BVsi/aXHqT6YWdQUfzoIG83KFIx7VLc65i2S7OS0vc9le3
bTE0l0qhaf++TSS8B5wiHEz/uqYAIOzhlKt44t3bV1VcfuezajEwbV+w47b9Ixa8
jqmhEI0wV4tjp8rMgCbG/nQiAZw7CCohNmNMFpjJpt3Fq2pY/E8=
=BIPl
-----END PGP SIGNATURE-----

--0Gy4Af1k1dGk9LQG5zSzFSkt9IxDWISHp--
