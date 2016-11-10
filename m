Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a0f0076
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 03:05:54 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: openwrt@bitsofnetworks.org, lede-dev@lists.infradead.org,
 wireguard@lists.zx2c4.com
Date: Thu, 10 Nov 2016 04:07:44 +0100
Message-Id: <20161110030744.6402-1-Jason@zx2c4.com>
Subject: [WireGuard] [PATCH] kernel: expose configuration for padata
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The padata API is a powerful framework for doing parallel jobs inside
the kernel, on which various modules in the package feed can depend,
such as WireGuard. There is no item text, so that it does not show up
in menuconfig, as this is only supposed to be an option selected as a
dependency. There as already precedent for this behavior, with
CONFIG_KERNEL_RELAY, on which several packages depend.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 config/Config-kernel.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/config/Config-kernel.in b/config/Config-kernel.in
index d8ca76c..9aca2a0 100644
--- a/config/Config-kernel.in
+++ b/config/Config-kernel.in
@@ -224,6 +224,9 @@ config KERNEL_PROC_PAGE_MONITOR
 config KERNEL_RELAY
 	bool
 
+config KERNEL_CRYPTO_PCRYPT
+	bool
+
 config KERNEL_KEXEC
 	bool "Enable kexec support"
 
-- 
2.10.2
