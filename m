Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b995d45
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 13:13:44 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: openwrt@bitsofnetworks.org, lede-dev@lists.infradead.org,
 wireguard@lists.zx2c4.com, Felix Fietkau <nbd@nbd.name>
Date: Mon, 14 Nov 2016 14:16:13 +0100
Message-Id: <20161114131613.7286-1-Jason@zx2c4.com>
In-Reply-To: <5a31f30c-1fe3-8012-18d4-7545fd86d290@nbd.name>
References: <5a31f30c-1fe3-8012-18d4-7545fd86d290@nbd.name>
Subject: [WireGuard] [PATCH] kernel: enable pcrypt
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a powerful API for parallel crypto from which many other modules
can benefit. It only winds up being turned on on SMP systems, which
means this adds 0 bytes to the kernel on tiny machines, while only
adding a small bit to SMP systems for big performance improvements.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 target/linux/generic/config-3.18 | 2 +-
 target/linux/generic/config-4.1  | 2 +-
 target/linux/generic/config-4.4  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/linux/generic/config-3.18 b/target/linux/generic/config-3.18
index 8b70c7d..c61a4b3 100644
--- a/target/linux/generic/config-3.18
+++ b/target/linux/generic/config-3.18
@@ -762,7 +762,7 @@ CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
 # CONFIG_CRYPTO_PCBC is not set
 # CONFIG_CRYPTO_PCOMP is not set
 # CONFIG_CRYPTO_PCOMP2 is not set
-# CONFIG_CRYPTO_PCRYPT is not set
+CONFIG_CRYPTO_PCRYPT=y
 # CONFIG_CRYPTO_RMD128 is not set
 # CONFIG_CRYPTO_RMD160 is not set
 # CONFIG_CRYPTO_RMD256 is not set
diff --git a/target/linux/generic/config-4.1 b/target/linux/generic/config-4.1
index 68bd849..4fae342 100644
--- a/target/linux/generic/config-4.1
+++ b/target/linux/generic/config-4.1
@@ -792,7 +792,7 @@ CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
 # CONFIG_CRYPTO_PCBC is not set
 # CONFIG_CRYPTO_PCOMP is not set
 # CONFIG_CRYPTO_PCOMP2 is not set
-# CONFIG_CRYPTO_PCRYPT is not set
+CONFIG_CRYPTO_PCRYPT=y
 # CONFIG_CRYPTO_RMD128 is not set
 # CONFIG_CRYPTO_RMD160 is not set
 # CONFIG_CRYPTO_RMD256 is not set
diff --git a/target/linux/generic/config-4.4 b/target/linux/generic/config-4.4
index 28e7068..843154d 100644
--- a/target/linux/generic/config-4.4
+++ b/target/linux/generic/config-4.4
@@ -791,7 +791,7 @@ CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
 # CONFIG_CRYPTO_PCBC is not set
 # CONFIG_CRYPTO_PCOMP is not set
 # CONFIG_CRYPTO_PCOMP2 is not set
-# CONFIG_CRYPTO_PCRYPT is not set
+CONFIG_CRYPTO_PCRYPT=y
 # CONFIG_CRYPTO_POLY1305 is not set
 # CONFIG_CRYPTO_RMD128 is not set
 # CONFIG_CRYPTO_RMD160 is not set
-- 
2.10.2
