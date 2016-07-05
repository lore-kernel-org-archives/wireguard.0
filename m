Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a201723
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 22:03:41 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bKYRP-0004q9-U2
 for wireguard@lists.zx2c4.com; Wed, 06 Jul 2016 00:03:40 +0200
Date: Wed, 6 Jul 2016 00:03:36 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160705220336.GA18854@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
In-Reply-To: <20160704074837.GA24805@lud.polynome.dn42>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2016 at 09:48:38AM +0200, Baptiste Jonglez wrote:
> Here is the package finally:
>=20
>   https://github.com/openwrt/packages/blob/master/net/wireguard/Makefile
>=20
> The built packages should be available in the snapshots quite soon, e.g.:
>=20
> - wireguard-tools: https://downloads.lede-project.org/snapshots/packages/=
mips_34kc/packages/
> - kmod-wireguard: https://downloads.lede-project.org/snapshots/targets/ar=
71xx/generic/packages/

For reference, here is the size of wireguard and its dependencies for
ar71xx, taken from the snapshots above:

 2.4 KB  kmod-udptunnel6_4.4.14-1_mips_34kc.ipk
 2.7 KB  kmod-udptunnel4_4.4.14-1_mips_34kc.ipk
 6.2 KB  kmod-ipt-hashlimit_4.4.14-1_mips_34kc.ipk
 6.2 KB  libmnl_1.0.3-2_mips_34kc.ipk
  19 KB  wireguard-tools_0.0.20160630-1_mips_34kc.ipk
  59 KB  kmod-wireguard_4.4.14+0.0.20160630-1_mips_34kc.ipk
  95 KB  total

That's really not bad!  It largely fits in any small router with 4 MB of
flash.

As a comparison, here is the size for fastd:

  12 KB  kmod-tun_4.4.14-1_mips_34kc.ipk
  15 KB  libjson-c_0.12-1_mips_34kc.ipk
  53 KB  fastd_18-1_mips_34kc.ipk
  79 KB  total

fastd, which is "optimized on small code size and few dependencies", is
indeed a bit smaller.  Also note that libjson-c is already there by
default on OpenWRT/LEDE, so the real additional size of fastd is only 65 KB.

Openvpn with polarssl takes between 3 and 4 times as much space as wireguar=
d:

  12 KB  kmod-tun_4.4.14-1_mips_34kc.ipk
  33 KB  liblzo_2.09-1_mips_34kc.ipk
 141 KB  libpolarssl_1.3.16-2_mips_34kc.ipk
 138 KB  openvpn-polarssl_2.3.11-2_mips_34kc.ipk
 323 KB  total

Of course, the openssl variant for openvpn is really much bigger:

  12 KB  kmod-tun_4.4.14-1_mips_34kc.ipk
  33 KB  liblzo_2.09-1_mips_34kc.ipk
 719 KB  libopenssl_1.0.2h-1_mips_34kc.ipk
 141 KB  openvpn-openssl_2.3.11-2_mips_34kc.ipk
 904 KB  total

Here is the size for tinc (only available with openssl):

  12 KB  kmod-tun_4.4.14-1_mips_34kc.ipk
  33 KB  liblzo_2.09-1_mips_34kc.ipk
 719 KB  libopenssl_1.0.2h-1_mips_34kc.ipk
  60 KB  tinc_1.0.28-1_mips_34kc.ipk
 823 KB  total


So, now, the remaining question is: what is the performance of wireguard
on such small devices?

> If you are running a recent snapshot version of Lede, this should be
> enough if you have a compatible kernel:
>=20
>   opkg install wireguard-tools kmod-wireguard
>=20
> If you want build it yourself, you need this patch for proper dependency
> handling, it has been included in Lede two days ago:
>=20
>   https://git.lede-project.org/?p=3Dsource.git;a=3Dcommit;h=3D1d15a96b29d=
cd0947690951a7c36aead79a27129
>=20
> One final note: there is no "multi-threaded" support for now, sorry Jason.
> So, if you run this on your super modern 128-cores router, don't expect
> exceptional performance :)  Well, you could always hack your kernel config
> to enable CONFIG_PADATA and CONFIG_SMP before building wireguard.
>=20
> Other than that, feedback on the packages is welcome!
>=20
> Baptiste



> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfC6wAAoJEL4B7CKgTi5GIlgP/ieaYqGdOt4F7A70aRGOzASm
a+UM3n8uah95tP5roeAEdMluN7mIHCeEopt+OgjB8uuy5W2OGXkv630B/vV9M0mS
+y+PpVgzp8WfWFQ0ptZSuykQD290sPjIjeYChAl8/V8ZGF5Ng72BOu8ARTqmflMC
U9NIft+6/agxhyK1i6H0VE271Gj5X4lOg+xjpWX7qAqDxmRATBd5FGph7B61eSWm
/B+LsOXKXqFDu33aMzR9c6y9b7D5YsnH4zbwHJdTdWfymF/9EluZIYwDFHINxbwr
6Y6lMJkslWf3xTanzS+Ccpsv3+gyfKSf4sAtuvk10Ioz7iYSY7cpwEZ3gRH2+4R0
9hU9dVbU1MvTwpNZ0CAEQVFv+9N8DCoaKfrdtF+15g6JAduMNTGj0P/UVOjRw01/
AHJlD9VqVtpHQwghPEMsIpwHStSQzDP3xFOZ3Y/xKjoQ4r1vNoZJc1jfVJh2rgz1
LD3ZuRFRnDzzEW7AQ9Iu2QGmf+Gne0TVIiXJIE9OzL9XvsxSoB9XITHVuioUdILs
W03oQ1fSmNZc944xIEwgsiSeoLm/SJv+EPyeJSUo4phDY8Q15YLBfuuL5GHd8PSK
Ev76ZdTv+4mtCRHdGoy1L6Kv8y1Ww4ghwrgpIDb33VXMKUTbJV5zvFJY0fJx6tZS
H6Z+SLSP1rYJKGwy03Rt
=6YhF
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
