Return-Path: mail@fholler.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eed7d882
 for <wireguard@lists.zx2c4.com>; Sun, 1 Jul 2018 14:20:58 +0000 (UTC)
Received: from wp197.webpack.hosteurope.de (wp197.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:84cc::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eae4b2fc
 for <wireguard@lists.zx2c4.com>; Sun, 1 Jul 2018 14:20:58 +0000 (UTC)
From: Fabian Holler <mail@fholler.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] Version bump to fix submodule dependency
Date: Sun,  1 Jul 2018 22:25:38 +0800
Message-Id: <20180701142538.24339-2-mail@fholler.de>
In-Reply-To: <20180701142538.24339-1-mail@fholler.de>
References: <20180701142538.24339-1-mail@fholler.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

bump the version to trigger new builds for the f-droid repository
---
 app/build.gradle | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/app/build.gradle b/app/build.gradle
index 1393ec1..6bdee3f 100644
--- a/app/build.gradle
+++ b/app/build.gradle
@@ -16,8 +16,8 @@ android {
         applicationId 'com.wireguard.android'
         minSdkVersion 21
         targetSdkVersion 27
-        versionCode 427
-        versionName '0.0.20180625'
+        versionCode 428
+        versionName '0.0.20180701'
     }
     // If the keystore file exists
     if (keystorePropertiesFile.exists()) {
-- 
2.17.1
