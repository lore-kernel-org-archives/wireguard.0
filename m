Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0aa38c02
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 02:56:04 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8d69e36
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 02:56:04 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard in systemd-networkd
In-Reply-To: <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
Date: Wed, 10 Jan 2018 17:30:00 -0500
Message-ID: <87wp0p1h5j.fsf@fifthhorseman.net>
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

On Wed 2018-01-10 09:50:39 +0100, Matthias Urlichs wrote:
> I would also create a virtual "wireguard" package that directly depends
> on wireguard-dkms and wireguard-tools (and Recommends:
> networkmanager-wireguard, as soon as that exists). Then, simply instruct
> the user to install that.

This is a good idea, thanks!  As an aside, if anyone wants to suggest
packaging improvements like this, a bug report to the debian BTS is
probably the easiest way to go.

As for the dependencies related to systemd-networkd, the discussion here
makes me think we're better off just sticking with the status quo
(option 0), so i'll do that unless i hear a really compelling argument
to do anything else.

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEzicvlOwymaWlnoHjyu+ogyFnUzMFAlpWk+gACgkQyu+ogyFn
UzNGgA//RP45qCLKgnFSCgX3/6n/X2snPjC9ndwKQqAJYFxDtXIvzB40YyrbI4K3
FxILkfskvwZsij+5eMx4QvlBueAArp3DKOVoHoarqvbOn31LtS5tOJL2N/OPbWKN
W0tT1Dwn2EeUJxQM12fh3wjpVC/1Jof7tQn0+g73/InNgCYk21KeyytJokwrPVw/
JCOG3p1JIsweQnbiymI1RGr0U7BUqnsTdDgQlPlHJyo0apCpSzr8K4i0KpdBxObL
LhppOV/V7qDqYkRqcJwf3cnxI31KqFpYeV9UEzm5aiWB0HBQQBjoipC/mIbsyuSL
Bqc5cHY+dk9j6iSKVRRU28lxHf7m41OliiElKD49XL3LS1TaQg6T/vPBuhBLjsBi
771Qt/maYeb2SjQg8d+ZdYlWQsSVWZuX3F83JdRcESpuSE7VyeeM4EPvDenf4dJL
5LxsAoDPzz7II2EvqPu/kgsGahhUqmEjcKFhBYpn2IKnaD4VowAvlipnEGAlP0D4
kHvRU4Zau2IywWiUkXA1pv+5L26qxKYRjy6/CO3aanJ5UYUSCMCKG88ddeqd7J7p
akOlpNpEgSDgAKXB21XXIyuMECqGwTd7FeEhnpgwB20s7NqFtZaB0/VK1BnsxaRj
uKks5cM0YcFlE62kxh3gzh3zp1e+NPEu9SRIC5qKojkZQVeVZ0U=
=RrXC
-----END PGP SIGNATURE-----
--=-=-=--
