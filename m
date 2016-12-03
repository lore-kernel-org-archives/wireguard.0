Return-Path: eworm@leda.eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32d58592
 for <wireguard@lists.zx2c4.com>; Sat, 3 Dec 2016 12:37:47 +0000 (UTC)
From: Christian Hesse <list@eworm.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v2 1/1] add dkms configuration file dkms.conf
Date: Sat,  3 Dec 2016 13:42:33 +0100
Message-Id: <20161203124233.27891-1-list@eworm.de>
In-Reply-To: <20161203123044.25848-1-list@eworm.de>
References: <20161203123044.25848-1-list@eworm.de>
Cc: Christian Hesse <mail@eworm.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

From: Christian Hesse <mail@eworm.de>

This add dkms configuration file dkms.conf and target in Makefile to
update the version.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 src/Makefile  | 14 ++++++++++----
 src/dkms.conf | 11 +++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 src/dkms.conf

diff --git a/src/Makefile b/src/Makefile
index 20947ac..f5ab275 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -6,11 +6,17 @@ debug: module-debug tools
 
 version.h:
 	@export GIT_CEILING_DIRECTORIES="$$(readlink -f ../..)" && \
-	ver="#define WIREGUARD_VERSION \"$$(git describe --dirty 2>/dev/null)\"" && \
-	[ "$$(cat version.h 2>/dev/null)" != "$$ver" ] && \
-	echo "$$ver" > version.h && \
+	ver="$$(git describe --dirty 2>/dev/null)" && \
+	[ "$$(cut -d\" -f2 version.h 2>/dev/null)" != "$$ver" ] && \
+	echo "#define WIREGUARD_VERSION \"$$ver\"" > version.h && \
 	git update-index --assume-unchanged version.h || true
 
+dkms.conf:
+	ver="$$(git describe --dirty 2>/dev/null)" && \
+	[ "$$(grep PACKAGE_VERSION dkms.conf | cut -d\" -f2)" != "$$ver" ] && \
+	sed -i "/PACKAGE_VERSION/c PACKAGE_VERSION=\"$$ver\"" dkms.conf && \
+	git update-index --assume-unchanged dkms.conf || true
+
 module: version.h
 	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 
@@ -38,4 +44,4 @@ cloc: clean
 
 include tests/debug.mk
 
-.PHONY: all module module-debug tools install clean core-cloc check version.h
+.PHONY: all module module-debug tools install clean core-cloc check version.h dkms.conf
diff --git a/src/dkms.conf b/src/dkms.conf
new file mode 100644
index 0000000..cef8e6d
--- /dev/null
+++ b/src/dkms.conf
@@ -0,0 +1,11 @@
+#
+# Linux DKMS config script for the WireGuard kernel module
+#
+
+PACKAGE_NAME="wireguard"
+PACKAGE_VERSION="experimental-0.0.20161129-3-g27f0e1e-dirty"
+AUTOINSTALL="yes"
+
+BUILT_MODULE_NAME="wireguard"
+DEST_MODULE_LOCATION="/kernel/net"
+
-- 
2.10.2
