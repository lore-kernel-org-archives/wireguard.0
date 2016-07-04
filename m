Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb92bcbd
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 07:45:24 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bJycS-00039N-4H
 for wireguard@lists.zx2c4.com; Mon, 04 Jul 2016 09:48:40 +0200
Date: Mon, 4 Jul 2016 09:48:38 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160704074837.GA24805@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
In-Reply-To: <20160629112423.GC31514@lud.polynome.dn42>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 01:24:23PM +0200, Baptiste Jonglez wrote:
> Hi there,
>=20
> I am working on an OpenWRT/LEDE package for wireguard.  It's mostly done,
> but I want to test it before pushing it to the repositories.  Hopefully, I
> will be able to do that this week-end.

Here is the package finally:

  https://github.com/openwrt/packages/blob/master/net/wireguard/Makefile

The built packages should be available in the snapshots quite soon, e.g.:

- wireguard-tools: https://downloads.lede-project.org/snapshots/packages/mi=
ps_34kc/packages/
- kmod-wireguard: https://downloads.lede-project.org/snapshots/targets/ar71=
xx/generic/packages/

If you are running a recent snapshot version of Lede, this should be
enough if you have a compatible kernel:

  opkg install wireguard-tools kmod-wireguard

If you want build it yourself, you need this patch for proper dependency
handling, it has been included in Lede two days ago:

  https://git.lede-project.org/?p=3Dsource.git;a=3Dcommit;h=3D1d15a96b29dcd=
0947690951a7c36aead79a27129

One final note: there is no "multi-threaded" support for now, sorry Jason.
So, if you run this on your super modern 128-cores router, don't expect
exceptional performance :)  Well, you could always hack your kernel config
to enable CONFIG_PADATA and CONFIG_SMP before building wireguard.

Other than that, feedback on the packages is welcome!

Baptiste

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXehTVAAoJEL4B7CKgTi5GRvIQAIrOiTDdC5U1XHRfUa01M7bo
2AMs6uhCI4ivJqycLNcEnirzhrpPPUrJZ5pTmeEQI9B8ERd6TEMqyHUgLiVRW2/A
Wh8Gf9yMpgTDYQTVX1pflrq0XMl0cMkVBrHdbUlTWrTjhD7FX+gqbhQdBvqWl+GR
V2lX1XgxdADylhsMfTRcZKOZZIDCx7wr6gkRQgf91W0ozJoQbbJsn3FYlvZX7GtD
+t6z93XCk7hCpJhKbaSpgczVi4lNf7XP877Llo6KMHaZ28PsOFsjSDTlvktKLtao
OEqLIoY/GhHAy7ITEuJkNykHEtMgelHsUft0MH5XgwnFFWscUtzt5dtl6AwQiRpm
I0UzAP65dRLT/hZAB3OiL9FZwFz6PPfQ0FHkQRyyAbvX9snLjm/RgkUxEO3arZ/7
eTLYmgyqsrnTHn7VkP9+tPiUrrMmaE70ztJGqxGHsOIIX2rgs9gk1650nKlAy5D9
qRtC4GiF67Cwx+VjWl0XF8gnqJUDyfgcrh/niEUNh2AvW+1rCslARnSdrzTczHha
QbD4Hxy4RgdkG7NObQJPG0cThv3Suy+DkzzyrcU1Lgt74689J+hIsTBnx+alH9NZ
FzfpOZMmeFOIL1nXzevo1tjeE4lbqZF9ojqu+VeH59atEQFyuphYHwMcXOWRctAT
5i5RgxG6+FOJjvIeeOYl
=rKt6
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
