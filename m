Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be291737
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 11:35:30 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f19c68e0
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 11:35:30 +0000 (UTC)
Date: Mon, 1 Jan 2018 12:36:48 +0100
From: Simon Ruderich <simon@ruderich.org>
To: Mathias Hall-Andersen <mathias@hall-andersen.dk>
Subject: Re: [PATCH 7/7] tun_darwin: adapt to TUNDevice interface change
Message-ID: <20180101113648.GA11049@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
 <33cfb3925304d5047a6e9e81eef0900329aad3b5.1514726309.git.simon@ruderich.org>
 <510f63e7-e50a-46a1-b2d8-ea49ae5f2fc8@hall-andersen.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="=_zucker.schokokeks.org-32049-1514806650-0001-2"
In-Reply-To: <510f63e7-e50a-46a1-b2d8-ea49ae5f2fc8@hall-andersen.dk>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_zucker.schokokeks.org-32049-1514806650-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2017 at 08:17:58PM +0100, Mathias Hall-Andersen wrote:
> I am still fixing the interface up / down semantics (stopping / starting
> peer timers and routines not needed when the interface is down).

Regarding this, with d73f960 ("Peer timer teardown", 2017-12-29)
I can't configure wireguard-go via wg anymore. wg just hangs on
any command, everything works fine with 996c7c4 ("Removed
IFF_NO_PI from TUN linux", 2017-12-04).

Any idea what's wrong? Not sure if this is related to the test
suite failure which also occurs since d73f960 (only visible with
my TUN patches or the test suite fails to build).

Regards
Simon
--=20
+ privacy is necessary
+ using gnupg http://gnupg.org
+ public key id: 0x92FEFDB7E44C32F9

--=_zucker.schokokeks.org-32049-1514806650-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO7rfWMMObpFkF3n0kv79t+RMMvkFAlpKHT8ACgkQkv79t+RM
Mvn0fhAAvl78NGCz7zDehe11Z/ocLR55G/UiALuOnP/n9txYX4hhayM2KiBHq7GH
uR6Ej2kPYaMwmO5bnnaZu74+8bPnD9zUYGtxw/w9H3IXJX+YYe3tbswrx/hDy/8G
F8hoK2ydgWIa7A8f0Ql3VV3YjDfOTYAShUy6JMlyFJ0q6i1ecSB9GRYIAN2569yj
PCDZjsRfKtWkUKwAYNyGs67Rs5Gn+d7DJU87ZEC1KxhnJV9ImUxV1suo02qLv+lW
MdQiAwWchwilRO5bvvyTzNmWVpwgKTuFABWjr1cmmvZhqNWWT4B8ylfvDjmrRRAT
u9qgvWaMxZpoDSJi0vmoGej2cEBk2OnirI+H3dO08gZT1dF+x/ax+KNNJu9Cvzeu
YT1LELRZq7PU+97I7D900iwbCs7JSV3q7O7YBaRBr19lqxMueiiP3/tuR1131Ux+
e9EKqkyjF8XlP/XcZCyTf5RPzDLk0QFxIgFLQwRSkoJm83TAVMu3rWfiR1DnlYqT
qsDnexZx+MsGRHbvKB75jZwsnE8flQHobzyjEjwYhdzNETT4ngUzSW2i6aQn1hFQ
gRF9xxLD/39iKyrSh1iPEKIWsHewIjofrHlh1aVvYpIFoyZvG0/wt+Ziwx3MpZbO
FKHfMo+4S6kPkE3hv1TCQCAOPSkEkvklmC5Zz2kB7F/Kyf9hA+s=
=axU6
-----END PGP SIGNATURE-----

--=_zucker.schokokeks.org-32049-1514806650-0001-2--
