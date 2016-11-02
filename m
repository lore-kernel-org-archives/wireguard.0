Return-Path: keruspe@gmail.com
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eda9bc92
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:32:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 68so2306873wmz.2
 for <wireguard@lists.zx2c4.com>; Wed, 02 Nov 2016 03:33:24 -0700 (PDT)
Return-Path: <keruspe@gmail.com>
Received: from Lou.local (252.131.23.93.rev.sfr.net. [93.23.131.252])
 by smtp.gmail.com with ESMTPSA id 130sm35543840wmf.0.2016.11.02.03.33.23
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 03:33:23 -0700 (PDT)
From: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
To: wireguard@lists.zx2c4.com
Date: Wed,  2 Nov 2016 11:31:58 +0100
Message-Id: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
Subject: [WireGuard] [PATCH] tools: allow better build system configuration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Signed-off-by: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
---
 src/tools/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/tools/Makefile b/src/tools/Makefile
index fc0c0f3..92e0528 100644
--- a/src/tools/Makefile
+++ b/src/tools/Makefile
@@ -4,6 +4,8 @@ BINDIR ?= $(PREFIX)/bin
 LIBDIR ?= $(PREFIX)/lib
 MANDIR ?= $(PREFIX)/share/man
 RUNSTATEDIR ?= /var/run
+PKG_CONFIG ?= pkg-config
+INSTALL_STRIP_OPT ?= -s
 
 CFLAGS ?= -O3
 CFLAGS += -std=gnu11
@@ -12,8 +14,8 @@ CFLAGS += -MMD -MP
 CFLAGS += -DRUNSTATEDIR="\"$(RUNSTATEDIR)\""
 LDLIBS += -lresolv
 ifeq ($(shell uname -s),Linux)
-LIBMNL_CFLAGS := $(shell pkg-config --cflags libmnl 2>/dev/null)
-LIBMNL_LDLIBS := $(shell pkg-config --libs libmnl 2>/dev/null || echo -lmnl)
+LIBMNL_CFLAGS := $(shell $(PKG_CONFIG) --cflags libmnl 2>/dev/null)
+LIBMNL_LDLIBS := $(shell $(PKG_CONFIG) --libs libmnl 2>/dev/null || echo -lmnl)
 CFLAGS += $(LIBMNL_CFLAGS)
 LDLIBS += $(LIBMNL_LDLIBS)
 endif
@@ -24,7 +26,7 @@ clean:
 	rm -f wg *.o *.d
 
 install: wg
-	install -v -d "$(DESTDIR)$(BINDIR)" && install -s -m 0755 -v wg "$(DESTDIR)$(BINDIR)/wg"
+	install -v -d "$(DESTDIR)$(BINDIR)" && install $(INSTALL_STRIP_OPT) -m 0755 -v wg "$(DESTDIR)$(BINDIR)/wg"
 	install -v -d "$(DESTDIR)$(MANDIR)/man8" && install -m 0644 -v wg.8 "$(DESTDIR)$(MANDIR)/man8/wg.8"
 
 check: clean
-- 
2.10.1
