Return-Path: eworm@leda.eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ef7beb8
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 19:59:54 +0000 (UTC)
From: list@eworm.de
To: wireguard@lists.zx2c4.com
Date: Tue, 28 Jun 2016 22:02:15 +0200
Message-Id: <20160628200215.14423-1-list@eworm.de>
Cc: Christian Hesse <mail@eworm.de>
Subject: [WireGuard] [PATCH 1/1] add DKMS configuration file
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

From: Christian Hesse <mail@eworm.de>

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 src/dkms.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 src/dkms.conf

diff --git a/src/dkms.conf b/src/dkms.conf
new file mode 100644
index 0000000..8535afd
--- /dev/null
+++ b/src/dkms.conf
@@ -0,0 +1,11 @@
+#
+# Linux DKMS config script for the WireGuard kernel module
+#
+
+PACKAGE_NAME="wireguard"
+PACKAGE_VERSION=0.0.0
+AUTOINSTALL=yes
+
+BUILT_MODULE_NAME="wireguard"
+DEST_MODULE_LOCATION="/kernel/net"
+
-- 
2.9.0
