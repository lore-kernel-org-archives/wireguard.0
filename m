Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a540d50
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 12:13:12 +0000 (UTC)
Date: Thu, 10 Nov 2016 13:15:05 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20161110121505.GA18961@lud.imag.fr>
References: <20161110030744.6402-1-Jason@zx2c4.com>
 <20161110030815.6531-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
In-Reply-To: <20161110030815.6531-1-Jason@zx2c4.com>
Cc: lede-dev@lists.infradead.org, wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [PATCH] wireguard: select parallel encryption engine
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Thanks for the patch.  Wireguard is not part of the core OpenWRT/LEDE
systems, it is managed on https://github.com/openwrt/packages , so you
should have sent a pull request there.

Nevertheless, I will try to test and apply your patch within a few days.

Baptiste

On Thu, Nov 10, 2016 at 04:08:15AM +0100, Jason A. Donenfeld wrote:
> On non SMP systems, this doesn't wind up doing anything or adding any
> code at all. On SMP systems, this adds a little bit of code, and makes
> encryption use all cores.
>=20
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  net/wireguard/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/net/wireguard/Makefile b/net/wireguard/Makefile
> index 7387673..c5c014c 100644
> --- a/net/wireguard/Makefile
> +++ b/net/wireguard/Makefile
> @@ -89,7 +89,7 @@ define KernelPackage/wireguard
>    CATEGORY:=3DKernel modules
>    SUBMENU:=3DNetwork Support
>    TITLE:=3DWireguard kernel module
> -  DEPENDS:=3D@IPV6 +kmod-udptunnel4 +kmod-udptunnel6 +kmod-ipt-hashlimit
> +  DEPENDS:=3D@IPV6 +@KERNEL_CRYPTO_PCRYPT +kmod-udptunnel4 +kmod-udptunn=
el6 +kmod-ipt-hashlimit
>    FILES:=3D $(PKG_BUILD_DIR)/src/wireguard.$(LINUX_KMOD_SUFFIX)
>    AUTOLOAD:=3D$(call AutoLoad,33,wireguard)
>  endef

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYJGTBAAoJEL4B7CKgTi5GwOsP/jHNjCCYfLWS7pIXjoxAXMn2
UZN2JjThEQrAsvxo0SiK0ECliLahmTDIbGm04WMe2MM7Pc7iR+qHwZjAyKw/kSm9
7yI4gtPhs2A9k6ZVnPMYX5Q2gouZ2yZaZ1PjfRGMzx1jizOB0nxspFXXiqO+7FC/
BRg1Pm7UkiTbjSvbQyQsoLy0q6t2M7IG5fRJelyEfZmYRnKuPuhq7G2U1sTUktzt
KGxIP0HTxmxG5J81/FV1PcQcMlZ4u/9iTSskgTtz+Sb0G/1bv0yqapD3B5osiUyj
Hc81PgvSuTWcnLySZFVrVuQ1IaoNsc8jKFGni37MRbA0GQfl4eIZQ+VhM4cCV/cF
7o0O8UPamiBON+Z64mWmHUIipAFWibCR9F3YuuFLZGTIPdSTwE5cQ/FQcUwAEySF
cInFod3B7Z/OmSiC5KMErOU7jp1GDv0IXAD/eG3rrEZcWTZ++79ef6NHfw6gPTri
YFGF1ju1WMTIN9NG5rCbre+qzRqaocFlXbPLnLuvxwdSkbztnKiV5FFuV7R0WK3z
+QPCYU1RsnyP3xeNvC/bVnFmivG3LKneR+x5KZs6bBlA8/ygUSuiJmRaDu1kte3o
CTrOwT1Dqz9prYqcgUdHVEu9cPwWQ/glLr7qi26ESufRghl4nxOQQVStqa4n4sCi
klDRR8J9zK+yfTZRwLVj
=4cJw
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
