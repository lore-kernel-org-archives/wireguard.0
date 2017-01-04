Return-Path: eworm@leda.eworm.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f590a31
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:05:27 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbcff8ba
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:05:27 +0000 (UTC)
From: Christian Hesse <list@eworm.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] tools: remove DESTDIR for autodetection
Date: Wed,  4 Jan 2017 21:14:16 +0100
Message-Id: <20170104201416.25893-1-list@eworm.de>
In-Reply-To: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
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

DESTDIR is always empty, no need to check anything there. Check the main
system instead.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 src/tools/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/tools/Makefile b/src/tools/Makefile
index fe483b9..8160cc9 100644
--- a/src/tools/Makefile
+++ b/src/tools/Makefile
@@ -12,12 +12,12 @@ WITH_WGQUICK ?=
 WITH_SYSTEMDUNITS ?=
 
 ifeq ($(WITH_BASHCOMPLETION),)
-ifneq ($(strip $(wildcard $(DESTDIR)$(BASHCOMPDIR))),)
+ifneq ($(strip $(wildcard $(BASHCOMPDIR))),)
 WITH_BASHCOMPLETION := yes
 endif
 endif
 ifeq ($(WITH_WGQUICK),)
-ifneq ($(strip $(wildcard $(DESTDIR)$(BINDIR)/bash)),)
+ifneq ($(strip $(wildcard $(BINDIR)/bash)),)
 WITH_WGQUICK := yes
 endif
 ifneq ($(strip $(wildcard $(DESTDIR)/bin/bash)),)
@@ -25,7 +25,7 @@ WITH_WGQUICK := yes
 endif
 endif
 ifeq ($(WITH_SYSTEMDUNITS),)
-ifneq ($(strip $(wildcard $(DESTDIR)$(SYSTEMDUNITDIR))),)
+ifneq ($(strip $(wildcard $(SYSTEMDUNITDIR))),)
 WITH_SYSTEMDUNITS := yes
 endif
 endif
-- 
2.11.0
