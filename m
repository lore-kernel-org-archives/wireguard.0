Return-Path: netravnen@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3a9663d
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 13:19:31 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed72cd2b
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 13:19:30 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f4-v6so7783655edq.3
 for <wireguard@lists.zx2c4.com>; Mon, 27 Aug 2018 06:33:03 -0700 (PDT)
Return-Path: <netravnen@gmail.com>
Subject: Re: Getting IPv6 route advertisements to work over WG
To: rm@romanrm.net, wireguard@lists.zx2c4.com
References: <20180827171426.7c4ec614@natsu>
From: netravnen@gmail.com
Message-ID: <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
Date: Mon, 27 Aug 2018 15:32:49 +0200
MIME-Version: 1.0
In-Reply-To: <20180827171426.7c4ec614@natsu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0ZpyvlZlJ2840Yp0jmDgesJIcm68udEbf"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0ZpyvlZlJ2840Yp0jmDgesJIcm68udEbf
Content-Type: multipart/mixed; boundary="KsJnmcCUQNsxEVhw9XPv3xQEjLrIYTqj0";
 protected-headers="v1"
From: netravnen@gmail.com
To: rm@romanrm.net, wireguard@lists.zx2c4.com
Message-ID: <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
Subject: Re: Getting IPv6 route advertisements to work over WG
References: <20180827171426.7c4ec614@natsu>
In-Reply-To: <20180827171426.7c4ec614@natsu>

--KsJnmcCUQNsxEVhw9XPv3xQEjLrIYTqj0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Dear Roman,

When using multicast over WireGuard, would it not be more viable to use
an extra encapsulation layer to run multicast inside of?

I am specifically thinking of running either GRE or L2TPv3 over wgX.

Christoffer

From: Roman Mamedov
Sent: Mon, Aug 27, 2018, 14:14 +0200 (Romance Daylight Time)
Subject: Getting IPv6 route advertisements to work over WG

> Hello,
>=20
> I am trying to get IPv6 link-local IPs and route advertisements to work=
 over
> WG. The reason is not for the usual case of address autoconfiguration, =
but to
> use RA as a dynamic routing protocol of sorts, as it can distribute rou=
tes --
> or in case of WG (where routes need to be static in AllowedIPs), act as=
 a
> keep-alive protocol.
>=20
> Example use: a host can be connected to a network via a number of indep=
endent
> routers (and separate WG tunnel to each); in case one of the routers go=
es
> down, the route entry that it was sending via RA times out, so the host=
 will
> automatically use the other one(s) to reach that network. It would look=

> similar to this:
>=20
> # ip -6 route
> ...
> fd00::/32 via fe80::be:a0ff:fe18:4aac dev wg1 proto ra metric 1024  exp=
ires 30sec pref medium
> fd00::/32 via fe80::e8:4fff:fe94:2d7f dev wg2 proto ra metric 1024  exp=
ires 119sec pref medium
> fd00::/32 via fe80::43:31ff:fec0:da97 dev wg3 proto ra metric 1024  exp=
ires 86360sec pref low
> ...
>=20
> What works:
>=20
>   * manually assigning link-local(LL) IPs on both sides of a WG tunnel
>     (fe80:[somethingrandom]/64 scope link);
>   * any normal communication over these LL IPs (assuming they are also =
present
>     in AllowedIPs);
>   * running RADVD with WG link as one of its interfaces;
>   * explicitly requesting and receiving a RA, via using 'rdisc6' while =
specifying the
>     other side's LL IP;
>=20
> What doesn't:
>=20
>   * it appears multicast not supported, so anything involving
>     multicast, as in automatically requesting RAs on the kernel side, o=
r
>     manually with 'rdisc6' but without specifying peer's LL:
>=20
>       # rdisc6 wg3
>       Soliciting ff02::2 (ff02::2) on wg3...
>       Sending ICMPv6 packet: Required key not available
>=20
> I found discussion[1], but it is unclear what is the outcome. In any ca=
se, I
> would like to add my vote to please add some kind of multicast support,=
 even
> if just as a dumb broadcast for now. It would work just fine for a lot =
of
> cases; don't know about others, but my WG networks tend to include at m=
ost 2-3
> hosts each (but there's a lot of independent networks).
>=20
> [1] https://lists.zx2c4.com/pipermail/wireguard/2017-April/001177.html
>=20


--KsJnmcCUQNsxEVhw9XPv3xQEjLrIYTqj0--

--0ZpyvlZlJ2840Yp0jmDgesJIcm68udEbf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEyLOCqKHNzbdx/rJMxlSUj9qGvs0FAluD/YYACgkQxlSUj9qG
vs221A/8DoIwzFpG5xKokdpm/OuaOuDgFcZe+hfnIpksNSeOK2XG/yAam54RrTYo
gCiqRwukT5IJj4gCzTQq5hNZ5AI5JlXWz7485EIJ8cdtVKMLMsf7G7U80/h5w5Tk
auJuZR8ADMRL+1IbGQ02Mpg4UHq4s+Aj59L3tBINOgHSiVNzcaQgfW+3VIgzONDo
/oMcfA7DyDOtnImeAwBEan6QOpcoJGZd7bZXIyRVnTqKIXBQm5krqOA8uLQ7qdqL
/sZCY32czstmQhXiO7r8pzleWDb2vcA3eEXED/+eTbG7jFiGCN0rhjMW6ribXqIS
6NLaCmc1dSaaVW1ETWwzSajmzYC5LxPv3lFja1eukWr3AYQo83xi15z7twuPmHVs
PawxxeN47u3vfK3gRZ/uiX8mnv1ZPlx+9ZA3tt0m0RIrK8+VvLnnsfyzPeWuHfFu
UCXgl2/yL1J0MRRiVFfkrv9NkWlZOZJDd1e8SdwA0OMIw2+YvBppbZxFtjnfENQQ
bGTbS//eZpcvMHbvHjxj/EuihVm7NGKq6wtu788ulAahja+9r5uvpdT5tHTTNcha
ku+gNnJSK71IV4EaJ0KhA3q70u5kM5h8Hs8U34JAuQtnuQdA77QrWvrA3AVxJwhN
fhdaSaDtPoGiG8MfFg04npLRi6HOAUy9rS2/8hgtBocweNce2Mg=
=idky
-----END PGP SIGNATURE-----

--0ZpyvlZlJ2840Yp0jmDgesJIcm68udEbf--
