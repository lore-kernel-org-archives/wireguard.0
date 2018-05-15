Return-Path: SRS0=xuuA=IC=dvn.me=mail@meshwith.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbd83583
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 20:21:15 +0000 (UTC)
Received: from q.meshwith.me (q.meshwith.me [91.121.161.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 244b3dec
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 20:21:15 +0000 (UTC)
Date: Tue, 15 May 2018 22:21:26 +0200
From: Devan Carpenter <mail@dvn.me>
To: Aaron Jones <aaronmdjones@gmail.com>
Subject: Re: Need for HW-clock independent timestamps
Message-ID: <20180515202126.yw57deh6st5ebnk6@kowloon>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jjb7qrpjg4rbnvoi"
In-Reply-To: <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--jjb7qrpjg4rbnvoi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Aaron Jones transcribed 3.1K bytes:
> On 12/05/18 19:29, Axel Neumann wrote:
> > You want WG to secure your network. So the suggestion can not be to open
> > your network for a pretty insecure deamon in order to get WG working.
> > This would essentially allow attackers to a fake the ntp server and then
> > block WG forever.
>=20
> Someone in a position to fake NTP (which needs bidirectional
> communication) is already in a position to block WG forever (by simply
> refusing to forward its packets).
>=20
> Additionally, there are a few very well-designed and secure NTP daemons
> out there (such as OpenNTPd).
>=20

Using NTP is not a viable solution for a distributed mesh network. What
if the Internet is only accesible via WG, or what if the network is not
connected to the Internet at all? It's not a trivial problem, but I
think it would be benefecial to WireGuard as a project to not depend on
centralized time authority *if there is an option not to*.

-Devan


--jjb7qrpjg4rbnvoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDMARp8PcbrR1Z5vJrAq6MYZqfnYFAlr7QUEACgkQrAq6MYZq
fnbN8RAAtUGIKp/XYZF/BbI9dzW0Xg4utqokB9k4gTui7Eb9xJwW7MXWWsBOfRTM
J44WLUkjfTuafVrAJo2BeDl8UTNOleruDbKpb43J2V/q8qYRQ3QDlcTz0s14twkj
D+u6OJSXEki3YZYvLCUdKmZZnU2Hec29GWwQi0FDj2v+rLI7AgKCrbtYTaoF/EP3
r9Y6XgYHy+99BeHWBq6/C7CEh/xfNVKr52lELb3eUFG3MtKBrBV/CVCNPvMUz0iy
IWPeFvkBfhwze8RQ0b/ae89kTlQPj8jDa/MWgeDpuSDlqskqZcOv4nSn0z9tckul
hqogmFJbppcUYfq8Az7hLUObVRzLnKWZsdEeNHhkOdiAggO4oQdFp3vFnYDz/D9c
rCwX5WmcAhLJGIjJPEqQDSdWqzxtCF54ripECSa2V7G1DuwZ5T+6ZKR4cKLlesTO
x+2ACbjGqRolrdI1caCy+qpXbDU4bOLIMkvSrY6hf7KVN3cK5EURBnIUbD2y6rZG
EdMsGHL0eWvYEw3Ba6b+Vzlq796CYn1MQFN7zfV1oWXwerksdsZJheV7eW4m/fbr
i0X1i1ZXpVh8Hd6OS9dKB7M1+v53URi7LNx82shzOUXqKa2CWv/TCEQsVK4UZ+5h
PTVVVRKs8j4d8JcVJJzMjQa/bRZeSWysJ7JZrz5xBIo5iAnM51M=
=CJ2e
-----END PGP SIGNATURE-----

--jjb7qrpjg4rbnvoi--
