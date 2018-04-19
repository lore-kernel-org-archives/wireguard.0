Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5906e61b
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 17:28:23 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bced9320
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 17:28:23 +0000 (UTC)
Received: from [172.23.184.97] (helo=tuxmachine.localdomain)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1f9DMD-00020l-IF
 for wireguard@lists.zx2c4.com; Thu, 19 Apr 2018 19:28:29 +0200
Date: Thu, 19 Apr 2018 19:28:28 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Broadcast on wireguard
Message-ID: <20180419172828.GB2001@tuxmachine.localdomain>
References: <CAHLp1Ym8ZaKjJOtuKspFHfgTh4Y4yNU5FFy=ZAfjcg0p9iWhyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
In-Reply-To: <CAHLp1Ym8ZaKjJOtuKspFHfgTh4Y4yNU5FFy=ZAfjcg0p9iWhyw@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On 18-04-18, Christophe-Marie Duquesne wrote:
> Hi list,
>=20
> Maybe the answer is obvious to some of you, but I don't quite
> understand why wireguard does not support broadcasting, and I found no
> clear explanation in the archive. In fact, this [1] seems to indicate
> that implementing it would be doable, so I am wondering why this has
> not been done.

This has been further discussed here:

  https://lists.zx2c4.com/pipermail/wireguard/2017-April/001177.html

As far as I remember, there was no major blocking point, it was more about
making a design/UI decision.

> Could anyone explain - roughly - why this is the case? Is it for
> security reasons? Performance? Complexity of implementation? Lack of
> interest?
>=20
> Another possibility could be that my question is just poorly asked or
> irrelevant, in that case I would also appreciate a hint :-)
>=20
> Best,
> Christophe-Marie
>=20
> [1]: https://lists.zx2c4.com/pipermail/wireguard/2016-December/000813.html
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlrY0bcACgkQvgHsIqBO
LkYkUA//ZwOhuFHWLYIgYON16uR1770G7zAcHJ1nmrJaR9l/QpYV/VyPaqpP2DqG
wThteOcs/mTOcBa7RhYSmNOYzjFXFs/Ww1NuSvq2Gahqf9QSnEUafZoOO6WzR457
BjZdOZA0SSsVEse1NIVXtLj8kAvzygLtg+u0ToiFFrIX9mqddlWfqKTpccMXKmLd
ENoYmfPYX9FPUjPpY0VKLzFY7hwXmtqUW63GRTPnVilVA62opTbPhauEPlObwdYW
J3ShxdIdLVjbOUE6XfP9Fs3thOxddwcnonjTcj1BHOf3zj/ULkVimHYa/a+TIUTv
pzOTmu/yoTtFrDQO/PlqCW8KKfYxrbwwg+Zsas4KekOwjrkB+YIyuwJmMn3ZK1fn
EYfXnccPj8gPzEC+hI+0y8VlT+9dSAqkkVAoNtg9vvV9gG1VNiri+a9GHyYmcR8h
O4JZtcgsD6/6c7gUMxnSTiZZ2UifBHTeFuMsAc7ZDnGrJQAVYVjJTu/aHfscqSbk
97FsIM15+yR3n+iB9fUjULixC4Bl3a0LJ1l4m5R21QxRNyQp4Ve+//4qDZqqrQSv
Q5z4N+L4sGVC/DldTPjWoQsEDpQqTTH/DFQd3OZX2q8wjSde0uVkvu7x8jSIBrrg
j4eEyfhVKEX+MaM3iXvEcowzrG68QhH5gvFHV+29IBDTyxb9RmU=
=ssq5
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
