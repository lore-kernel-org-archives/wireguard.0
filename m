Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b63fb9b
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 03:06:18 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: openwrt@bitsofnetworks.org, lede-dev@lists.infradead.org,
 wireguard@lists.zx2c4.com
Date: Thu, 10 Nov 2016 04:08:15 +0100
Message-Id: <20161110030815.6531-1-Jason@zx2c4.com>
In-Reply-To: <20161110030744.6402-1-Jason@zx2c4.com>
References: <20161110030744.6402-1-Jason@zx2c4.com>
Subject: [WireGuard] [PATCH] wireguard: select parallel encryption engine
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On non SMP systems, this doesn't wind up doing anything or adding any
code at all. On SMP systems, this adds a little bit of code, and makes
encryption use all cores.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 net/wireguard/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireguard/Makefile b/net/wireguard/Makefile
index 7387673..c5c014c 100644
--- a/net/wireguard/Makefile
+++ b/net/wireguard/Makefile
@@ -89,7 +89,7 @@ define KernelPackage/wireguard
   CATEGORY:=Kernel modules
   SUBMENU:=Network Support
   TITLE:=Wireguard kernel module
-  DEPENDS:=@IPV6 +kmod-udptunnel4 +kmod-udptunnel6 +kmod-ipt-hashlimit
+  DEPENDS:=@IPV6 +@KERNEL_CRYPTO_PCRYPT +kmod-udptunnel4 +kmod-udptunnel6 +kmod-ipt-hashlimit
   FILES:= $(PKG_BUILD_DIR)/src/wireguard.$(LINUX_KMOD_SUFFIX)
   AUTOLOAD:=$(call AutoLoad,33,wireguard)
 endef
-- 
2.10.2
