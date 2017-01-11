Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce74b9b5
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 23:47:28 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b24448c
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2017 23:47:28 +0000 (UTC)
Date: Thu, 12 Jan 2017 00:57:18 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Will van Gulik <mailing-porcus@porcus.ch>
Subject: Re: Maximum number of interfaces + Debug
Message-ID: <20170111235717.GA19394@tuxmachine.polynome.dn42>
References: <698F0489-3376-4D52-A48E-A4C9F344D817@porcus.ch>
 <9F550D1D-A374-48D6-881E-D626BB250E8F@porcus.ch>
 <20170111095837.GB11399@tuxmachine.polynome.dn42>
 <364A8AFB-28FA-41BB-A6E4-FBB65C4BB069@porcus.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
In-Reply-To: <364A8AFB-28FA-41BB-A6E4-FBB65C4BB069@porcus.ch>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 10:49:26PM +0100, Will van Gulik wrote:
> Hi Baptiste,
>=20
> > On 11 Jan 2017, at 10:58, Baptiste Jonglez <baptiste@bitsofnetworks.org=
> wrote:
> >=20
> > Hi Will,
> >=20
> >=20
> > There have been backwards-incompatible changes recently: can you make s=
ure
> > that you use the exact same wireguard version on all peers?
>=20
> I was using the same version (Debian package 0.0.20161230-1 from
> Unstable). However my bug occured between the package version and the
> compiled version from 0.0.20170105 . So I'll retry with both same kernel
> modules. Because at least for that try, I have a mismatch. But for my
> previous experiments all the version were the same.

Ok then, I don't know what the issue might be.

> Additional question, is it better to use one interface with a big subnet
> and multiple remote peers or an interface by peer with a /30 or a /31 ?

It depends on your use-case.  As far as I remember, you were using OSPF on
top of Wireguard, weren't you?  In that case, you are forced to use one
interface per peer (with AllowedIPs =3D ::/0 on each interface).

Baptiste

> >> Any clue, ideas, else ?
> >>=20
> >> Cheers,
> >>=20
> >> Will
> >>=20
> >>> On 03 Jan 2017, at 09:52, Will van Gulik <mailing-porcus@porcus.ch> w=
rote:
> >>>=20
> >>> Hi,
> >>>=20
> >>> I'm trying to use multiple wireguard tunnel in one VM at the same tim=
e, but it seems that only the first two I configured are working. I'm curre=
ntly trying with 5 interfaces, I see the incoming packet in tcpdump but no =
reaction of the destination host with all the wg interfaces.
> >>>=20
> >>> I'm not sure there is a limitation on that, I could totally have miss=
ed that. Should I use 1 interface with multiple peers rather than multiple =
interface ?
> >>>=20
> >>> I'm testing that on a Debian with 4.8.7-1, running on a KVM host.
> >>>=20
> >>> Any insight ?
> >>>=20
> >>> Kind regards,
> >>>=20
> >>> Will
> >>> _______________________________________________
> >>> WireGuard mailing list
> >>> WireGuard@lists.zx2c4.com
> >>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> >>=20
> >> _______________________________________________
> >> WireGuard mailing list
> >> WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
> >> https://lists.zx2c4.com/mailman/listinfo/wireguard <https://lists.zx2c=
4.com/mailman/listinfo/wireguard>

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlh2xlkACgkQvgHsIqBO
Lka9vA//bAl5OeAIp3Y73/6J/sDn1aUElPpiHpzrGkWpKzLuQHjAFqKBrFMy6nw6
uy2EUZ3bP28lv6uh/b72g8dwpm6148V32rWcxupOMEGygHLncAMyXz3NnehuhNA4
J+nRb1M0ldNz78mXApiKTT/LoUNIPWIVL7ezh9HTuYlL3nuTtwTDSb1b7T6BcdTP
UyLr2+6uYo7RYGkorlbXRtjAaUxQbKN8dVBnuW57SBaP5UHeOcm6o6isvOfxXKZ+
ME4ae3Q9aOev22KqP6fVJPnDV8HpodM6y1/2ZbbJPO+2PSFGC9N7OtuS7LRcJpoO
+M0Xv9dhqcYaUUxnNDjT3qo5/FzehS9B8mOvi1AHkeeVFcXkUBAVT5569DdXlDKj
sB1XuemiGexPziirwQcqzX66NtjxxFJqc37TgZx3oc1Y98zKEZzUqt/r0iGkzWuP
qnShWP8EwmcU1A67Hj7vD9rFjRJ/5gSC9QZU6MhZuGJO7pX4nXrIvpsv/BSXakB5
XkbfsijiO/QdZnEvPWbBmhHcR+6iHNLbMBkxyqkI7cW1FZq9Z7Qrt1xndk1Z0G1q
Gt1rVE+4hTmVrqTdbyRb3QN1Q7S50WDEIFnh7Hlhr0ZWjYcYpoVGARLkgPWaPRpD
jWfVEeWsL4lI9/5ZsBmNbfyUjSf0vz8t0Xm5yz+CCiPNyU/jbP0=
=LiTp
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
