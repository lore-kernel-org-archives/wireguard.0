Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90d3f74f
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 08:15:28 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b67fe8f
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 08:15:28 +0000 (UTC)
Date: Fri, 17 Feb 2017 09:15:32 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
Message-ID: <20170217081532.GA20080@lud.polynome.dn42>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
 <20170215213153.GC16102@tuxmachine.polynome.dn42>
 <87y3x5h6vc.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
In-Reply-To: <87y3x5h6vc.fsf@alice.fifthhorseman.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 09:46:15PM -0500, Daniel Kahn Gillmor wrote:
> On Wed 2017-02-15 16:31:54 -0500, Baptiste Jonglez wrote:
> > On jessie, it worked exactly the same with the 4.9 kernel from
> > jessie-backports:
> >
> > # cat /etc/apt/sources.list
> > deb http://httpredir.debian.org/debian jessie main
> > deb http://httpredir.debian.org/debian jessie-backports main
> > deb http://httpredir.debian.org/debian unstable main
> > # cat /etc/apt/preferences.d/limit-unstable
> > Package: *
> > Pin: release a=3Dunstable
> > Pin-Priority: 200
> > # apt update
> > # apt install -t jessie-backports linux-image-amd64 linux-base
> > # reboot
> > # apt install wireguard-dkms wireguard-tools
> > # ./client.sh
> > # ping 192.168.4.1
> > PING 192.168.4.1 (192.168.4.1) 56(84) bytes of data.
> > 64 bytes from 192.168.4.1: icmp_seq=3D1 ttl=3D64 time=3D15.1 ms
>=20
> interesting, thanks for testing and reporting back!
>=20
> are you sure that with this installation on jessie, the wireguard
> packages are the only things that got pulled in from unstable?

Yes, it pulled only dkms and menu (from jessie).  Though I probably had
the other dependencies already installed (from jessie or jessie-backports).

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlimsSAACgkQvgHsIqBO
LkZ3/BAAs2rWZ0QbW3XukjoiWfIbFmTxQeLs7N/Vwtv67dX96oZeTeDVLhxIzaB2
lv5jpKKzfGR3jBmBbGBJ2x37K+73S7+EQTl9B6MQcbY70RQxdpqXwHXj1WIkpbeX
OtVSAfKZfWBPduURnkBQHHrRHE15s+W7v2MA9UakjwkpIxLtN/ei8omTyjDyTcS8
0jX2GPAPuzRu02Y1Vo2FqYLXbLl3FFnLSSowL20m7QkTz8bxRHcRWgIGXlhgUn/U
PQny8IyKv9Cn0OrOlSAYSodAYSsXQFjKWVvjrRXT7cjo1G+/nlIjkmpTZR/BdhBw
g7Cr+8Zndqm7li5u+D6mo3aMqMGALa8RMy3ZuR7ACR8XZhe44ZG1lyZ8DsfrQ8ZK
oV9tfOpfx4tslFVF67lQq2ASpJysyU7dtk6R7lXAKKCJZ6MSzB+ht3tTPIy+VJb7
2nR+uBbFt1Dgr9E5FH7WrcKLk2xFT/+sJ/TpZnjzZHLrcbmSdhndF7k9LNYlMfjF
S0CWjunVB33hlcDrWepIltQdgsa6s51ZMxwPSWiic18tLrfng0dSjgaGNmwSJDET
SshNW4BpfJorn1gxNv4WUinw92hjn/8bzz2bWcBUzt3AXrYI+h7pNkRBg5Ld4tRW
E8tyReuf7paNSGYITUT0AzZkNmne6pcR10e2E7ymBMFeOADPc4A=
=vM2Q
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
