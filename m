Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3174b157
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 11:21:45 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bIDbW-0006QW-AI
 for wireguard@lists.zx2c4.com; Wed, 29 Jun 2016 13:24:26 +0200
Date: Wed, 29 Jun 2016 13:24:23 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160629112423.GC31514@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Subject: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--vni90+aGYgRvsTuO
Content-Type: multipart/mixed; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi there,

I am working on an OpenWRT/LEDE package for wireguard.  It's mostly done,
but I want to test it before pushing it to the repositories.  Hopefully, I
will be able to do that this week-end.

In the meantime, if somebody wants to test the package, the Makefile is
attached to this email.

Baptiste

--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=Makefile
Content-Transfer-Encoding: quoted-printable

#=20
# Copyright (C) 2016 Baptiste Jonglez <openwrt@bitsofnetworks.org>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=3Dwireguard

PKG_RELEASE:=3D1
# Temporary
PKG_VERSION:=3D0.0.0
PKG_RELEASE=3D$(PKG_SOURCE_VERSION)
PKG_LICENSE:=3DGPL-2.0
PKG_LICENSE_FILES:=3DCOPYING
PKG_USE_MIPS16:=3D0

PKG_SOURCE_PROTO:=3Dgit
PKG_SOURCE_URL:=3Dhttps://git.zx2c4.com/WireGuard
PKG_SOURCE_SUBDIR:=3D$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=3Daa8fcc678092aaab4a8f986e45b696d72d2029ce
PKG_SOURCE:=3D$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_PARALLEL:=3D1

# Wireguard's makefile needs this to know where to build the kernel module
export KERNELDIR:=3D$(LINUX_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/wireguard
  SECTION:=3Dnet
  CATEGORY:=3DNetwork
  URL:=3Dhttps://www.wireguard.io
  MAINTAINER:=3DBaptiste Jonglez <openwrt@bitsofnetworks.org>
  TITLE:=3DWireguard userspace control program
  DEPENDS:=3D+libmnl +kmod-wireguard
endef

define Package/wireguard/description
  WireGuard is a novel VPN that runs inside the Linux Kernel and utilizes
  state-of-the-art cryptography. It aims to be faster, simpler, leaner, and
  more useful than IPSec, while avoiding the massive headache. It intends to
  be considerably more performant than OpenVPN.  WireGuard is designed as a
  general purpose VPN for running on embedded interfaces and super computers
  alike, fit for many different circumstances.
  It runs over UDP.

  This package provides the userspace control program for wireguard, wg.
endef

define KernelPackage/wireguard
  SECTION:=3Dkernel
  CATEGORY:=3DKernel modules
  SUBMENU:=3DNetwork Support
  TITLE:=3DWireguard kernel module
  KCONFIG:=3DCONFIG_NET_UDP_TUNNEL CONFIG_IPV6 CONFIG_NETFILTER_XT_MATCH_HA=
SHLIMIT
  DEPENDS:=3D@IPV6 +kmod-udptunnel4 +kmod-udptunnel6 +kmod-ipt-hashlimit
  FILES:=3D $(PKG_BUILD_DIR)/wireguard.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=3D$(call AutoLoad,33,wireguard)
endef

define KernelPackage/wireguard/description
  WireGuard is a novel VPN that runs inside the Linux Kernel and utilizes
  state-of-the-art cryptography. It aims to be faster, simpler, leaner, and
  more useful than IPSec, while avoiding the massive headache. It intends to
  be considerably more performant than OpenVPN.  WireGuard is designed as a
  general purpose VPN for running on embedded interfaces and super computers
  alike, fit for many different circumstances.
  It runs over UDP.

  This package provides the kernel module for wireguard.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/wireguard/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/wg $(1)/usr/bin/
endef

$(eval $(call BuildPackage,wireguard))
$(eval $(call KernelPackage,wireguard))

--Pk6IbRAofICFmK5e--

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXc6/nAAoJEL4B7CKgTi5G2cYP/3coEwjiQANsYwPTuBbspr9i
1+Lc3rGYvikrke1hX5b67MCztSaE1atRDrIAXIqcFXbVHeGlwzJ1GZmMw5aEZ7oJ
szXfH9+uDJsC60Palq2RP1j7ieXPdfoUeWIiM4uL7Scf2OtuOCU33EU5n9Lz+6sQ
Vi60wj/nRb7xAEGwWJETVKpsv2S/eAdOYBb4aZlgeV7AWORZKenEuzYKQM+R0kXt
yn1OiwvqK3O+O7r4HcJ6Detux4a4fOpPPvJdSOk8OGJbp1bfss51/radsLwFIbqt
aSmcW8ArRbXVuOn6gJiuXD2CEnBiHICGGhCRqXG4PM3kRy78XBk0YnJ3w70YRvSl
F+FpiUHqomGVE6HVRJZcM7Mc6NlaLkFspC8Ba7rh9Sub+U3TT21DVbMWb/qLepSU
NUlOcmeTmA1u/x+Sq3CLAuJ6V5cN+n2HRjxupnXfzyq/RJwbfb2cROkueswn1jDS
qeQU10uEQsTeg9aPymWbKK/GOKbUtnpIAs7BDRMBQlSrzfZ1v03rvPqlw9PeHai8
VafuWXkA21nIdDIv4hWfJerRvfJihPLgki14oRvhN37PEe/mnziBYiJ3SI6L+6y5
kTw+CUiocK20sQXrp/35zte0vxxelV6ZvJARQkGlV3eC6n7Ose+ocuLCY4f0GPKc
jKaGIXk1EmLNAfGoh5bS
=OtZO
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
