Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 209cc26a
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 20:57:38 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a942d97f
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 20:57:38 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Max Moser <e1326252@student.tuwien.ac.at>
Subject: Re: NetworkManager Plugin
In-Reply-To: <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
Date: Wed, 14 Feb 2018 14:47:20 -0500
Message-ID: <87zi4bpd4n.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed 2018-02-14 16:28:59 +0100, Jason A. Donenfeld wrote:

> This is wonderful news. I'm happy to work with you to make sure this
> comes out perfectly, and maybe when it's finished we can submit it
> upstream to NetworkManager, similar to how systemd-networkd now has
> WireGuard support built-in.

last time i looked, network-manager included a local copy of a big chunk
of systemd code.  so it's possible that a newer version of
network-manager will already have the systemd-networkd code available to
it, and you just need to hook into it correctly from the nm internals.

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTTaP514aqS9uSbmdJsHx7ezFD6UwUCWoSSSAAKCRBsHx7ezFD6
U4qOAP9p2j4rTpqNp2u5zC3iMFRYFOh4yW/Wq3apdHvOU1E0rAD/ZkKPboJWjAI9
uwlFs7YY9SrphjvRWFH/ynTg+OSIxwU=
=fLwt
-----END PGP SIGNATURE-----
--=-=-=--
