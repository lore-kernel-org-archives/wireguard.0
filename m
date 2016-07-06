Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dfed393
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:08:44 +0000 (UTC)
Date: Wed, 6 Jul 2016 17:08:45 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160706150845.GE2040@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
In-Reply-To: <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2016 at 11:56:28AM +0200, Jason A. Donenfeld wrote:
> On Wed, Jul 6, 2016 at 11:53 AM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
> > One aspect that contributes to the size of the kernel module is that
> > it can't be stripped in the same way a userspace binary can, because
> > it has to be dynamically linked into the kernel.
>=20
> *ALTHOUGH* looking at the binary in the ipk closely, it looks like a
> LOT of those symbols actually could be stripped, since they're not
> exported and aren't external...

Interesting.  I found this script in LEDE:

  https://git.lede-project.org/?p=3Dsource.git;a=3Dblob;f=3Dscripts/strip-k=
mod.sh;hb=3DHEAD

But it's indeed possible that it's not run for kernel modules that are
built outside of the core system.  I will take a closer look.

Can you check that, for instance, the kmod-udptunnel modules are properly
stripped?

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfR74AAoJEL4B7CKgTi5GTrMQAIjxbGfAvgMSypJ19Jcc1Sjb
wYWw1xmAt7uFLG86Oyj5u7VDgKi9beGyyVaboQ9ucNFGz4skIv+QsKrjHTwPwdZb
uY16mMwRGcjS4Qykp5YlQ72cGQl96z9GY+/y+qV25nWJsMrurBGq4+bIabJRosnp
dPGa7lItvYV0+oacLws5pO/3M/3yzc+8U4ukeVrp5ZWGluffuicpywiLZPaUfhvU
kp5SflX4Lk56tf4t6DkCqtpkP5KGbPqgdoiJVx4Pzn6RXv285+RbTmDwJig+O6Q+
JyqU9Oak3l2DIuTSx+g55LyWSSjlxZNpH4Q3QcAxhdudf/fX9l51VWrt/0Ee35lj
s745OZvGk8W8rf/E8vmcC/iwn8IHfBhD7Voq/ey7Fem3qNFGfVvdbH5+/T0Nm54G
xDgEbugOuiy6CsiGZVfzZ2hO6M9YpRynYHMYW+xqQ3cWYKvnT1UG5StSKV5y7JjI
pANWqKI6mNsWH2U+i1vZQcgkc79bhBC2aY6AA4BmXxfmYXeoqTljO19P2XPm4KbC
dxuy8EEVHfBSHd4emFvZR4ZruGSrlqdz1W4gpmxqLnFugukR+U365Pei85mq4Wt/
YojezGaRFZE8sOW2VQDwkRiw5ELO/JDIZMaMyRUXrr9lE9A8SYjoEe8Ciaw/bFCr
MzMPSy2nncJ6UHeiRGE9
=oSLq
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--
