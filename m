Return-Path: mail@fholler.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5822efce
 for <wireguard@lists.zx2c4.com>; Sun, 1 Jul 2018 14:20:54 +0000 (UTC)
Received: from wp197.webpack.hosteurope.de (wp197.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:84cc::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d65cbda
 for <wireguard@lists.zx2c4.com>; Sun, 1 Jul 2018 14:20:54 +0000 (UTC)
From: Fabian Holler <mail@fholler.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] wireguard: switch to submodule ref 0.0.20180625
Date: Sun,  1 Jul 2018 22:25:37 +0800
Message-Id: <20180701142538.24339-1-mail@fholler.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Since the commit "Version bump for clat fix" the app/tools/wireguard
submodule referenced an non-existing commit.

This caused that builds for the f-droid were failing
(https://f-droid.org/wiki/page/com.wireguard.android/lastbuild_426).
The newest version in f-droid is 0.0.20180612.

Change the submodule reference to wireguard 0.0.20180625
---
 app/tools/wireguard | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/app/tools/wireguard b/app/tools/wireguard
index e116751..dfd9827 160000
--- a/app/tools/wireguard
+++ b/app/tools/wireguard
@@ -1 +1 @@
-Subproject commit e1167518ff41ae9ee21a3e90c7959be2867c3636
+Subproject commit dfd9827d5b08c506522bb3762cd3b0dbac640bbc
-- 
2.17.1
