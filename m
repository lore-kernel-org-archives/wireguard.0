Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04ddcbb9
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 10:24:55 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bJI9V-00015C-0t
 for wireguard@lists.zx2c4.com; Sat, 02 Jul 2016 12:27:57 +0200
Date: Sat, 2 Jul 2016 12:27:54 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160702102754.GD12181@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
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


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 01:24:23PM +0200, Baptiste Jonglez wrote:
> Hi there,
>=20
> I am working on an OpenWRT/LEDE package for wireguard.  It's mostly done,
> but I want to test it before pushing it to the repositories.  Hopefully, I
> will be able to do that this week-end.

Here is a working version:

  https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Makefile

However, you have to manually select needed kernel symbols in `make
kernel_menuconfig`, which is very annoying.  If you want to give it a try,
look for these symbols:

    +CONFIG_IP6_NF_IPTABLES=3Dm
    +CONFIG_IPV6=3Dy
    +CONFIG_NETFILTER=3Dy
    +CONFIG_NETFILTER_ADVANCED=3Dy
    +CONFIG_NETFILTER_XTABLES=3Dm
    +CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
    +CONFIG_NET_FOU=3Dm
    +CONFIG_NET_IP_TUNNEL=3Dm
    +CONFIG_NET_UDP_TUNNEL=3Dm

I guess that's the price to pay for being out-of-tree.  I will have a look
at how to improve this situation (maybe integrating the kernel module
directly in Lede/OpenWRT?).

Baptiste

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXd5cmAAoJEL4B7CKgTi5G1DQP/i4gpEvLbR2SQ9bxUH30Prws
Ry62gWRUbH4V6+y43Wpx/gSdjURWJ/mpryey3eLGtGFITMH6y/DTqLlMgTwzWcN5
SDC5UdlxIV4S6yxm9BiGzCEIZJhfVwSzzFlZmURI8Ltt7rvXTw/ffMRxQjav7Z8G
IEU2t+LUAfVMDy0dh/7W2ohg3ZgQUVhU79d+MirsSnjVvH2e85/hb9yMdIqVPTVe
zTd0cYdWbD9PdqrtO2H6vM8QjDQXG0NPhKoPD2swc2asnl86uzDaAhOhG6mQO5Ev
aHTPTT2u3d2i4jf9uBsz1YNJcX8QeQSoFRN2P7u51Sd2gbbrWmm1bo/M5Hcyu/l0
wzh/s22+9A602H0TmAdlcjSs3nzjSSQg3MqMXRkxieRG3CWcSYik6JSaiKKMx5Y/
uPT873I/o8nkVTEXHQqrPxFLeUVvgQAXmGnvL4WSjIj5cCH/Pj5ceDuHaVB0Rl94
bcyLO0Mw4lOcRECFNV9dH6WsRhod88uluHj+2SR8td23ladL3hEW2yV8wBB5cMxE
NrXDyABv4Wlj/Q5Pvm4k4VAdn2XkSwo0Y1eevDNeT53jj0thCenm5FEPyuKhZnVC
ot2SURyt3ytmgq/voxJlO8ZHlF0F118nT1amYcbEOXX9bjFnB37NasYOBkyPAGYI
/JcPMHL58Qeif9zP9gHG
=okwv
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
