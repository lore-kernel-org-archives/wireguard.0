Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c373d4c2
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Oct 2017 12:14:18 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 896baced
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Oct 2017 12:14:18 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
In-Reply-To: <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
 <87ineze3x2.fsf@fifthhorseman.net>
 <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
Date: Mon, 30 Oct 2017 13:10:57 +0100
Message-ID: <87lgjsdeem.fsf@fifthhorseman.net>
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

On Sat 2017-10-28 20:57:06 +0200, Jason A. Donenfeld wrote:
> 1) wg-quick isn't a daemon, though openvpn is.

wg-quick could be invoked from a network management daemon.  Part of the
brilliance of wireguard is that the in-kernel stuff *doesn't* try to
integrate fancy configuration/setup policy.  But that does mean that
it's likely that there needs to be some user-space policy agent for
system integration.

> 2) I can think of at least 5 ways to implement a resolvconf binary without
> requiring root, making your argument moot. There's nothing inherent in the
> resolvconf model that would require it.
>
> If you're interested in spending the time implementing this for openresolv,
> I can spec those out in detail for you.

Please report these suggestions to openresolv or any other resolvconf
implementations.  My point is about what exists today, not about what is
theoretically possible.  This argument will be moot when any widely-used
resolvconf implementation doesn't have to be executed as the superuser
by default.  Please, make it moot! :)

> Alternatively, you can just wait for the systemd devs to add a
> resolvconf for controlling systemd-resolved, if that's the horse
> you're betting on.

That'd be fine with me, thanks for pushing on it.

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAln3FtEACgkQFJitxsGS
MjeS+A/+IYyiFqGSpSyvWbbTPAQYqdy7IORqnf9TAS/o+qqVl9UMec0Uxpqg1vA6
uMYGTVMen/PKnODgcn+pB/jNw7n8jjHg1bwZ8B2EN/pIP3Kz3uHNWaafH5wGekWz
cfJchhGA8N/YURLxybWNY7Q49TzpQ3VTXv3roI9WPSzIMaDzzsnjfs8c5ApjtaKd
LN/ezlRZlw3bU4xa3UvL0uh1eui3TdWBQ88u/idjj+in9mEgKDccKT1VgysCqTqB
l9rILrtFcSjdOlBaDGt4nhuUeSvF+8RitsGRiDz/5E+8TG8fz4M2amD9tpvyVUFy
aQKUIvCotDVKELh4mP47LE3eqNJFIHsJ3hy5KGkP8kYrCC6QySkhqyg8qBqgCD76
P/SiZwhTAwUeGtMmaxiFAPIumZ7fWj9oiQ6jcBiBo1sa5SXrLX8wYMCOF8Tz4ACm
KSuQTffm0osyndE1325vwksb2PXObhCcNaRY/oj1DycetBJg0/jZKdJoAbbzoSh2
b17Aut5SixPncKn08roKGqx17OZlExIsIOBt65tbZg3yB4QxuOLKMid/aDWns7iF
jdTKmt/ZYV51IevA7uSiE4IlmqTeaYretDO20bU9HkoFqt8ZkpnlbxrH6v1gTi3y
e7lsLjmacxO6RD5am/BjO7K5hnfJydNrcOcgzyNwB8+qUXVsJBw=
=FnRE
-----END PGP SIGNATURE-----
--=-=-=--
