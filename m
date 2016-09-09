Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abeacdc4
 for <wireguard@lists.zx2c4.com>; Fri, 9 Sep 2016 13:44:01 +0000 (UTC)
Date: Fri, 9 Sep 2016 15:52:02 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Message-ID: <20160909135202.GA32666@lud.imag.fr>
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
In-Reply-To: <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nice work!  I had tried to write chacha20_generic_block in MIPS assembly,
but I got confused with endianness issues and the code didn't work in the
end.

Is your code available somewhere?  I'd be happy to test on a variety of
MIPS routers.

On Fri, Sep 09, 2016 at 01:46:11PM +0000, Ren=E9 van Dorst wrote:
> Duo the misaligned data fetching function like poly1305 causes regression=
 on
> the mips.
>=20
> 	h0 +=3D (le32_to_cpuvp(src +  0) >> 0) & 0x3ffffff;
> 		h1 +=3D (le32_to_cpuvp(src +  3) >> 2) & 0x3ffffff;
> 		h2 +=3D (le32_to_cpuvp(src +  6) >> 4) & 0x3ffffff;
> 		h3 +=3D (le32_to_cpuvp(src +  9) >> 6) & 0x3ffffff;
> 		h4 +=3D (le32_to_cpuvp(src + 12) >> 8) | hibit;
>=20
>=20
> Had 26MBit now +42.
>=20
> root@lede:~# iperf3 -c 10.0.0.1 -i 10
> Connecting to host 10.0.0.1, port 5201
> [  4] local 10.0.0.2 port 36216 connected to 10.0.0.1 port 5201
> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> [  4]   0.00-10.08  sec  51.2 MBytes  42.7 Mbits/sec    0    171 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Retr
> [  4]   0.00-10.08  sec  51.2 MBytes  42.7 Mbits/sec    0             sen=
der
> [  4]   0.00-10.08  sec  51.2 MBytes  42.7 Mbits/sec                  rec=
eiver
>=20
> iperf Done.
> root@lede:~# iperf3 -c 10.0.0.1 -u -b 1G -i 10
> Connecting to host 10.0.0.1, port 5201
> [  4] local 10.0.0.2 port 60714 connected to 10.0.0.1 port 5201
> [ ID] Interval           Transfer     Bandwidth       Total Datagrams
> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  7209
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total
> Datagrams
> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  0.034 ms  0/7209 (0=
%)
> [  4] Sent 7209 datagrams
>=20
> iperf Done.
> root@lede:~#
>=20
>=20
> Work is not done yet but a good start.
>=20
> Greats,
>=20
> Ren=E9 van Dorst.
>=20
> Quoting Ren=E9 van Dorst <opensource@vdorst.com>:
>=20
> >I did try to write some MIPS32r2 code.
> >I wrote the chacha20_keysetup, chacha20_generic_block and
> >poly1305_generic_blocks in assembly.
> >Tried to load all needed variables in the registers. Which should reduce
> >the memory overhead.
> >But it is very difficult for me to do code profiling and/or isolate the
> >code and make some benchmark programs like supercop.
> >So testing was simple. Crosscompile the code. Copy and load the module on
> >the target. Run setup script and iperf.
> >
> >#ifdef CONFIG_CPU_MIPS32_R2
> >asmlinkage void chacha20_keysetup(struct chacha20_ctx *ctx, const u8
> >key[static 32], const u8 nonce[static 8]);
> >asmlinkage void chacha20_generic_block(struct chacha20_ctx *ctx);
> >asmlinkage unsigned int poly1305_generic_blocks(struct poly1305_ctx *ctx,
> >const u8 *src, unsigned int srclen, u32 hibit);
> >#endif
> >
> >But the speed is equal or less on my TP WR1043ND device which is a
> >MIPS32r2 24kc big endian.
> >So GCC does a good job. Also 24kc has no special CoProcessors or FPU.
> >
> >Most improvement what I had it to change the buildroot default
> >optimization -Os to -O2.
> >This gives around 1-3% speed improvement.
> >
> >ideas:
> >- remove the little endian parts on the MIPS.
> >  Offcourse do it also on the other side.
> >  On this device I can't switch endian.
> >  But I did not see any improvements. Need 2 instruction for swapping
> >32bit register.
> >  After a quick calculation it could save around 0.4% which is ~0.1MBit/s
> >on this device.
> >
> >Greats,
> >
> >Ren=E9 van Dorst.
> >
> >_______________________________________________
> >WireGuard mailing list
> >WireGuard@lists.zx2c4.com
> >http://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
>=20
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJX0r6CAAoJEL4B7CKgTi5Gy1UP/jXMeU2zpZPFSIoob7GB/Ksm
WyDHxRllUP6hECDiFbqrvyuNXqeMLbum72T9WdsDf93cxAf+YCp1jAhCklxFn82S
K2Q0MMy11DHNbjoWbf4X45RQXA2gwtbtRXjilfRFjDbflx8w01s9/8l32B5kxQ7q
prfW5Tf2GbLgWjluIjbUycW4uekLvxS7eH/qdZKAgpwlZwTdaDFFIswcnmZvm1ZQ
Foo3CrOmsFglaluaMXl/Gt19rQEP4i+wGls2Lytxg5PsrXdGeWKjvfa4CAWsZavs
Tun4MX+jwBSGZjordAC0+sRkqYtvK8UYwdA7vR+sUGyFzxheiUxEdG7ovx0cpA/X
wyAF+rwCZwJiW9M0sNglL8Tuna6YODcmp0pWNZgLDnBqouPq0f+B6+Jdbmk3lyAD
rdVPFp6QMQQH4zD0crzmZlU1+yBG4Tpyz49OBqqu53HhLlBPVsMNPMKvqHxVcBVo
2vKuixEZB0Bzot8qVcOzFKRvcjqtfdJZw71hKwGgCWpIXKwZHIwNJIuO/OOI7mc2
kRpSKQKDAUp3GmUIpjtJSCNhHnWrHZZ1wWl8oZf6OAe7UVuQhKJulHzhAV/nRAbu
/u9sUd/431VhM30lp+IY7cLS2Skm3zx+5tDsGwcCUpVM8JKbJ2iGHDvmEXnMb3f4
F+xw6+qnqPp7kZvPNuEE
=iegy
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
