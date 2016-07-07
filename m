Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c62c38ad
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 13:13:17 +0000 (UTC)
Date: Thu, 7 Jul 2016 15:13:24 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Jan De Landtsheer <jan@incubaid.com>
Message-ID: <20160707131324.GA18014@lud.polynome.dn42>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
In-Reply-To: <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 12:53:24PM +0000, Jan De Landtsheer wrote:
>   - about changing ports:
> hmmm. can't really say...
> What I noticed: I could ping yesterday, without doing anything, I couldn't
> this morning. that's when I saw the difference.
> I had something like it yesterday, and thinking I did something wrong, I
> set it in stone in a config file. applied it, had my ping, kept the
> terminal session on the server open (had also an openvpn to the remote).
> This morning, from the remote , there was no ping. Verified why. And then=
 I
> sent this mail ;-)

Could there be a NAT or stateful firewall on your network, messing up the
UDP source port of packets received from the server?

If you manage to reproduce, it would be helpful to have a packet capture
before your wireguard client changes endpoint, with something like:

  client# tcpdump -w wireguard.pcap -i eth0 -s 64 'udp and host xxx.xxx.xxx=
=2E126'

Change the interface if needed, and xxx.xxx.xxx.126 is the public IP of
your server.  The packet trace will only contain the packet headers and
a small bit of encrypted data, but you can send it privately (to me and/or
Jason).

> Note: it's properly up since, so I don't know...
> I'll keep it as it is, will let you know if something switches again.
> Note2: No, no different peers, there is only one client, one server, so
> there wouldn't be any overlap.
>=20
> running arch linux, latest & geatest
>=20
>   - about something else:
> are these pure ip  tunnels, or could I envision to add the interfaces to =
an
> OpenVSwitch bridge and use them as tunnel ports?
>=20
> Thx
> Jan
>=20
>=20
> On Thu, Jul 7, 2016 at 1:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> > Hi Jan,
> >
> > That's very strange. Are you sure there aren't other wireguard peers
> > running thare using the same private key?
> >
> > Does it always change to the *same* wrong port?
> >
> > Jason
> >

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard


--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXflVvAAoJEL4B7CKgTi5GLgEQAJrmNLfux0BHbggPZaYshc5B
DdJ7m6HGERgtqOapVo6F2vK86YagGyVNDfJFYquw4HNbFnUKm6hCIQZYarBqa7gc
hluCdzyAfQjWWqeWfT724Zb16MZaAlomIPDx04+WO4jzk0kF2lL7d6NAJ3VRLmFg
TDLlx7E+M2Ob0UA517xtU+UyGiJCp2qa1vzwSDQKuR4ijqXIyal331JyLnO7NePE
8Vbg3eU35a9UUDO4ZRZL/0Z0X468GCee/ORkPpNa0CCZ+3Tdvx5kIFn5tCsXVR8f
zPkrLvvxxN2Y+X5LlxmemWORS6YBueXRbckyPgwKm8uO+tmfHr4EjbV9jOEsZxjE
sDiFMNxVTMn11z2KUVAR7icQRrSt0VBUXwBQP5WoCtvoCnKU04atF99VpTS4JZdr
FK8zQzO8n0nxEvavwpYZgME2WIgqVH9syzJOfwtwG2sKbumfl6YJ9Er82MsgJcsG
8ovkiicSHumbgjG0yQUeTWe8mCtnRsFdzSYrCOXFuC+B5cRens3pwo2i4kXeTIZe
e/379aHm/9yFAfykYjrhQmz4MJoUkkTs69hqk2Pusw+keIkYp0yYLayizvbOSs4V
ZEHp9wRdvtm6dmR/Owe6ucLyyKXX1KAETMPr9IEOu6ctrYb2Kl/ru52mdx5MwIi2
Ek/3YUb/qt+VfjBB3RtS
=F4/Z
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
