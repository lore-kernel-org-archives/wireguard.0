Return-Path: eworm@leda.eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 518490d3
 for <wireguard@lists.zx2c4.com>; Sat, 3 Dec 2016 11:48:59 +0000 (UTC)
From: Christian Hesse <list@eworm.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] include tests/debug.mk only if exists
Date: Sat,  3 Dec 2016 12:53:42 +0100
Message-Id: <20161203115342.20950-1-list@eworm.de>
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

DKMS packages do not contain tests/debug.mk, so do not include if it
does not exist.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 src/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/Makefile b/src/Makefile
index 20947ac..370c2ea 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -36,6 +36,8 @@ check:
 cloc: clean
 	cloc $(filter-out compat.h, $(wildcard *.c) $(wildcard *.h))
 
+ifeq ($(wildcard tests/debug.mk),tests/debug.mk)
 include tests/debug.mk
+endif
 
 .PHONY: all module module-debug tools install clean core-cloc check version.h
-- 
2.10.2
